<script setup>
function rng(seed) {
  let s = seed % 2147483647
  if (s <= 0) s += 2147483646
  return () => (s = (s * 16807) % 2147483647) / 2147483647
}

// ---- Клеточный heatmap: блоки строго по сетке ----
const LANES = 6

// Ручные домены — точная трассировка референсов (сетка 96 колонок, снято попиксельно)
// g=зелёный, r=красный, o=оранжевый
const MANUAL_COLS = 96
const cw1 = 100 / MANUAL_COLS
const MANUAL_GAP = 0.14 // доля клетки на зазор

function manualBand(defs) {
  const typeMap = { g: 'green', r: 'red', o: 'orange' }
  return defs.map((lane) =>
    lane.map(([c, len, t]) => ({
      left: (c + MANUAL_GAP) * cw1,
      width: (len - MANUAL_GAP * 2) * cw1,
      t: typeMap[t],
    })),
  )
}

// Домен1 — точная трассировка референса (сетка 96×6, снято попиксельно со скрина):
// зелёный бар + красный «якорь» слева, оранжевые вкрапления, плотные красные кластеры
const band1Defs = [
  [[1, 2, 'g'], [8, 3, 'r'], [11, 2, 'g'], [18, 7, 'r'], [28, 7, 'r'], [38, 2, 'r'], [42, 2, 'r'], [55, 2, 'r'], [60, 5, 'r'], [67, 4, 'r'], [71, 2, 'g'], [77, 7, 'r'], [87, 3, 'g'], [91, 1, 'g']],
  [[8, 5, 'r'], [20, 3, 'r'], [29, 8, 'r'], [43, 1, 'g'], [60, 2, 'r'], [63, 1, 'r'], [68, 4, 'r'], [77, 5, 'r'], [83, 1, 'r']],
  [[9, 1, 'r'], [10, 9, 'g'], [21, 2, 'r'], [29, 5, 'r'], [60, 4, 'r'], [69, 3, 'r'], [77, 1, 'o'], [78, 2, 'r'], [81, 3, 'r']],
  [[10, 1, 'r'], [11, 1, 'o'], [12, 1, 'r'], [21, 2, 'r'], [24, 1, 'r'], [30, 4, 'r'], [60, 2, 'r'], [64, 1, 'g'], [69, 1, 'r'], [71, 1, 'r'], [78, 6, 'r']],
  [[12, 1, 'r']],
  [[12, 1, 'r']],
]

// Домен2 — преимущественно легитимный трафик: две полосы зелёного, редкий красный
const band2Defs = [
  [[2, 3, 'g'], [7, 1, 'r'], [10, 1, 'g'], [30, 7, 'g'], [45, 1, 'g'], [50, 2, 'g'], [64, 1, 'g'], [67, 6, 'g'], [75, 2, 'g']],
  [[2, 3, 'g'], [6, 1, 'g'], [7, 1, 'r'], [8, 1, 'g'], [10, 1, 'g'], [28, 9, 'g'], [42, 1, 'g'], [45, 1, 'g'], [50, 2, 'g'], [61, 1, 'g'], [63, 2, 'g'], [66, 12, 'g'], [87, 1, 'r'], [90, 1, 'g']],
  [],
  [],
  [[7, 1, 'g'], [10, 1, 'g'], [16, 1, 'g'], [20, 1, 'g'], [22, 1, 'g'], [33, 2, 'g'], [43, 1, 'g'], [65, 10, 'g'], [77, 1, 'r'], [86, 7, 'g']],
  [[20, 1, 'g'], [88, 4, 'g']],
]

// Домены 3–4 — процедурный разброс в том же ключе, что и ручные домены:
// зелёный-доминантный трафик, блоки разной длины, естественные пропуски, редкий красный
function laneSpread(r, redBias) {
  const segs = []
  let c = 3 + Math.floor(r() * 8)
  while (c < MANUAL_COLS) {
    // часть позиций пропускаем — меньше сессий, больше «воздуха»
    if (r() < 0.4) {
      c += 4 + Math.floor(r() * 8)
      continue
    }
    const isRed = r() < redBias
    let len
    if (isRed) {
      len = 1 + (r() < 0.3 ? 1 : 0)
    } else {
      const roll = r()
      len = roll < 0.2 ? 5 + Math.floor(r() * 6) : roll < 0.55 ? 2 + Math.floor(r() * 3) : 1
    }
    const L = Math.min(len, MANUAL_COLS - c)
    segs.push({
      left: (c + MANUAL_GAP) * cw1,
      width: (L - MANUAL_GAP * 2) * cw1,
      t: isRed ? 'red' : 'green',
    })
    c += L + 3 + Math.floor(r() * 7)
  }
  return segs
}

function bandSpread(seed, redBias, sparseLanes = []) {
  const r = rng(seed)
  const lanes = []
  for (let l = 0; l < LANES; l++) {
    if (sparseLanes.includes(l)) {
      // редкая дорожка — лишь пара одиночных блоков
      const sparse = []
      let c = 4 + Math.floor(r() * 8)
      while (c < MANUAL_COLS) {
        const isRed = r() < redBias
        sparse.push({ left: (c + MANUAL_GAP) * cw1, width: (1 - MANUAL_GAP * 2) * cw1, t: isRed ? 'red' : 'green' })
        c += 10 + Math.floor(r() * 22)
      }
      lanes.push(sparse)
      continue
    }
    lanes.push(laneSpread(r, redBias))
  }
  return lanes
}

const domains = [
  { name: 'Домен1.ru', lanes: manualBand(band1Defs) },
  { name: 'Домен2.ru', lanes: manualBand(band2Defs) },
  { name: 'Домен3.ru', lanes: bandSpread(47, 0.14, [1, 4]) },
  { name: 'Домен4.ru', lanes: bandSpread(83, 0.08, [0, 3, 5]) },
]

const insights = [
  {
    n: 1,
    icon: 'pi-users',
    accent: 'lime',
    hi: true,
    title: 'Концентрация подменных IP',
    desc: 'на Домен1.ru — множество красных сессий в верхней части графика.',
  },
  {
    n: 2,
    icon: 'pi-clock',
    accent: 'violet',
    title: 'Одинаковая длина сессий',
    desc: 'красные сессии имеют схожую длину, что характерно для автоматизированного трафика.',
  },
  {
    n: 3,
    icon: 'pi-eye-slash',
    accent: 'violet',
    title: 'Признак фрода',
    desc: 'централизованный источник, использование VPN/Proxy-сетей.',
  },
]

// Декоративные «волны» в нижних углах фона
function hwave(base, amp, freq, phase, W = 360, step = 9) {
  let d = ''
  for (let x = 0; x <= W; x += step) {
    const py = base + Math.sin(x * freq + phase) * amp
    d += (x === 0 ? 'M' : 'L') + x + ',' + py.toFixed(1) + ' '
  }
  return d
}
const wavesL = [0, 1, 2, 3, 4, 5].map((i) => hwave(190 - i * 9, 10 + (i % 3) * 4, 0.03, i * 0.8))
const waveColors = ['#b4e019', '#31c95a', '#7be0a0', '#a98bff', '#6fb6ff', '#b4e019']
</script>

<template>
  <section class="slide4">
    <div class="bg" aria-hidden="true">
      <div class="aurora" />
      <div class="tex" />
      <div class="glow-lime" />
      <div class="glow-red" />
      <div class="vignette" />
    </div>

    <div class="wrap">
      <!-- Шапка -->
      <div class="head">
        <span class="brand-tag">TARGETLY ANTI-FRAUD</span>
        
        <div class="head-layout">
          <h1 class="headline">Как Targetly видит автоматизацию трафика</h1>
          <p class="sub">
            Анализируя паттерны распределения IP-адресов и время сессий, мы 
            находим скрытые кластеры ботов и выявляем централизованные источники 
            подозрительного трафика.
          </p>
        </div>
      </div>

      <!-- Контент -->
      <div class="cols">
        <!-- Левая колонка: отчёт -->
        <div class="col-left">
          <div class="sec-head">
            <i class="pi pi-arrow-up-right" />
            <span>Анализ IP адреса</span>
          </div>

          <div class="report">
            <div class="chart">
              <div v-for="(d, di) in domains" :key="di" class="band">
                <div class="band-label">
                  <span class="band-name">{{ d.name }}</span>
                  <span class="band-tick" />
                </div>
                <div class="lanes">
                  <div class="lanes-grid" />

                  <div v-for="(lane, li) in d.lanes" :key="li" class="lane">
                    <span
                      v-for="(s, si) in lane"
                      :key="si"
                      class="seg"
                      :class="s.t"
                      :style="{ left: s.left + '%', width: s.width + '%' }"
                    />
                  </div>
                </div>
              </div>
            </div>

            <div class="report-foot">
              <div class="legend">
                <span class="lg"><i class="sw green" />Настоящий IP</span>
                <span class="lg"><i class="sw red" />Подменный IP</span>
              </div>
              <span class="x-label">Время →</span>
            </div>
          </div>
        </div>

        <!-- Правая колонка: что видно -->
        <div class="col-right">
          <div class="sec-head">
            <i class="pi pi-search" />
            <span>Что видно на графике</span>
          </div>

          <div class="findings">
            <div v-for="(c, i) in insights" :key="i" class="finding">
              <span class="f-num">{{ '0' + c.n }}</span>
              <span class="f-ic" :class="c.hi ? 'hi' : ''"><i :class="['pi', c.icon]" /></span>
              <div class="f-body">
                <div class="f-title">{{ c.title }}</div>
                <p class="f-desc">{{ c.desc }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.slide4 {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  color: #f4f6f8;
  font-family: 'Inter', system-ui, sans-serif;
  background: #0a0a0c; /* единый темный фон презентации */
}

/* ---------- Фон ---------- */
.bg { position: absolute; inset: 0; z-index: 0; }

.aurora {
  position: absolute;
  inset: -10%;
  background:
    radial-gradient(40% 50% at 20% 10%, rgba(180, 224, 25, 0.08), transparent 60%),
    radial-gradient(40% 50% at 80% 90%, rgba(255, 77, 79, 0.05), transparent 60%);
  filter: blur(20px);
}

.tex {
  position: absolute;
  inset: 0;
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.03) 1px, transparent 1px);
  background-size: 24px 24px;
  opacity: 0.6;
}

.glow-lime { position: absolute; inset: 0; background: radial-gradient(40% 30% at 50% -10%, rgba(180, 224, 25, 0.15), transparent 70%); }
.glow-red { position: absolute; inset: 0; background: radial-gradient(40% 30% at 100% 100%, rgba(255, 77, 79, 0.08), transparent 65%); }

.vignette { position: absolute; inset: 0; background: radial-gradient(120% 120% at 50% 50%, transparent 40%, rgba(0, 0, 0, 0.8)); }

/* ---------- Обёртка / шапка ---------- */
.wrap { position: relative; z-index: 1; height: 100%; padding: 40px 60px 0; display: flex; flex-direction: column; }

.head { 
  position: relative; 
  text-align: left;
  margin-bottom: 30px; 
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 10px;
}

.brand-tag {
  font-size: 11px;
  font-weight: 900;
  letter-spacing: 1.2px;
  color: #9aa2a8;
  text-transform: uppercase;
}

.head-layout {
  display: grid;
  grid-template-columns: minmax(0, 650px) minmax(360px, 1fr);
  column-gap: 58px;
  align-items: start;
  width: 100%;
}

.headline {
  position: relative;
  z-index: 2;
  margin: 0;
  font-family: 'Unbounded', 'Inter', system-ui, sans-serif;
  font-size: 36px;
  font-weight: 800;
  line-height: 1.06;
  letter-spacing: -1.35px;
  color: #f7f8f0;
}

.lime { color: #b4e019; text-shadow: 0 0 30px rgba(180, 224, 25, 0.4); }

.sub { 
  margin: 0; 
  font-size: 16px; 
  font-weight: 600; 
  line-height: 1.38; 
  color: #b9c1c7; 
  position: relative; 
  z-index: 2;
  max-width: 560px;
}

/* ---------- Колонки ---------- */
.cols { flex: 1; min-height: 0; margin-top: 10px; padding-bottom: 40px; display: flex; gap: 40px; }
.col-left { flex: 1.5; min-width: 0; display: flex; flex-direction: column; }
.col-right { flex: 1; min-width: 0; display: flex; flex-direction: column; }

.sec-head { display: flex; align-items: center; gap: 12px; margin-bottom: 16px; font-size: 18px; font-weight: 700; color: #ffffff; }
.sec-head .pi { color: #b4e019; font-size: 20px; }

/* ---------- Панель отчёта (Сочная и Glassmorphism) ---------- */
.report {
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
  padding: 24px 30px;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.02);
  backdrop-filter: blur(16px);
  border: 1px solid rgba(180, 224, 25, 0.15);
  box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6), inset 0 0 30px rgba(180, 224, 25, 0.03);
}

.chart { flex: 1; min-height: 0; display: flex; flex-direction: column; gap: 14px; }
.band { flex: 1; min-height: 0; display: flex; align-items: stretch; gap: 16px; }
.band-label { flex: none; width: 90px; align-self: center; text-align: right; }
.band-name { font-size: 13px; font-weight: 600; color: rgba(255, 255, 255, 0.6); }
.band-tick { display: block; width: 100%; height: 2px; margin-top: 8px; border-radius: 2px; background: linear-gradient(90deg, transparent, rgba(180, 224, 25, 0.3)); }

.lanes { position: relative; flex: 1; min-width: 0; align-self: stretch; display: flex; flex-direction: column; }

.lanes-grid {
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(90deg, rgba(255, 255, 255, 0.05) 1px, transparent 1px),
    linear-gradient(rgba(255, 255, 255, 0.05) 1px, transparent 1px);
  background-size: calc(100% / 32) 100%, 100% calc(100% / 6);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 4px;
}

.lane { position: relative; flex: 1; min-height: 0; }

.seg { position: absolute; top: 12%; height: 76%; border-radius: 2px; z-index: 3; }

.seg.green {
  background: linear-gradient(180deg, #b4e019 0%, #7ca106 100%);
  box-shadow: 0 0 10px rgba(180, 224, 25, 0.4);
  opacity: 0.9;
}

.seg.red {
  background: linear-gradient(180deg, #ff4d4f 0%, #b32b28 100%);
  box-shadow: 0 0 12px rgba(255, 77, 79, 0.6);
  z-index: 4;
}

.seg.orange {
  background: linear-gradient(180deg, #faad14 0%, #c06a1c 100%);
  box-shadow: 0 0 8px rgba(250, 173, 20, 0.5);
  z-index: 3;
}

.report-foot { flex: none; display: flex; align-items: center; justify-content: space-between; margin-top: 20px; padding-top: 16px; border-top: 1px solid rgba(255, 255, 255, 0.08); padding-left: 106px; }
.legend { display: flex; gap: 24px; }
.lg { display: flex; align-items: center; gap: 10px; font-size: 14px; font-weight: 600; color: rgba(255, 255, 255, 0.7); }
.sw { width: 14px; height: 14px; border-radius: 50%; }
.sw.green { background: #b4e019; box-shadow: 0 0 8px rgba(180, 224, 25, 0.5); }
.sw.red { background: #ff4d4f; box-shadow: 0 0 8px rgba(255, 77, 79, 0.5); }
.x-label { font-size: 13px; font-weight: 600; color: rgba(255, 255, 255, 0.4); text-transform: uppercase; letter-spacing: 1px; }

/* ---------- Правая часть: находки (Сочные карточки) ---------- */
.findings { flex: 1; min-height: 0; display: flex; flex-direction: column; gap: 20px; }

.finding {
  flex: 1;
  position: relative;
  display: flex;
  align-items: flex-start;
  gap: 16px;
  padding: 24px;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.03);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.08);
  box-shadow: 0 16px 36px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  transition: transform 0.3s, border-color 0.3s;
}

.finding:hover {
  border-color: rgba(180, 224, 25, 0.3);
  transform: translateY(-2px);
}

.finding::after {
  content: '';
  position: absolute;
  inset: 0;
  pointer-events: none;
  background: radial-gradient(80% 100% at 100% 0%, rgba(255, 255, 255, 0.05), transparent 60%);
}

.f-num {
  position: absolute;
  right: 12px;
  bottom: -16px;
  font-family: 'Unbounded', 'Inter', sans-serif;
  font-size: 100px;
  font-weight: 800;
  line-height: 1;
  color: transparent;
  -webkit-text-stroke: 2px rgba(255, 255, 255, 0.05);
  pointer-events: none;
}

.f-ic {
  flex: none;
  position: relative;
  width: 48px;
  height: 48px;
  border-radius: 14px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: inset 0 2px 10px rgba(255, 255, 255, 0.05), 0 8px 16px rgba(0, 0, 0, 0.2);
}

.f-ic.hi {
  background: rgba(180, 224, 25, 0.15);
  border-color: rgba(180, 224, 25, 0.4);
  box-shadow: inset 0 2px 10px rgba(180, 224, 25, 0.2), 0 8px 20px rgba(180, 224, 25, 0.15);
}

.f-ic .pi {
  font-size: 20px;
  color: rgba(255, 255, 255, 0.8);
}

.f-ic.hi .pi {
  color: #b4e019;
  filter: drop-shadow(0 0 6px rgba(180, 224, 25, 0.6));
}

.f-body { position: relative; min-width: 0; z-index: 1; display: flex; flex-direction: column; gap: 8px; }

.f-title {
  font-size: 18px;
  font-weight: 700;
  color: #ffffff;
}

.f-desc { margin: 0; font-size: 15px; line-height: 1.5; color: rgba(255, 255, 255, 0.6); max-width: 95%; }
</style>
