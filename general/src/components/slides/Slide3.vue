<script setup>
const chips = [
  { icon: 'pi-shield', main: 'VPN / Proxy / GEO', sub: 'скрытые сети' },
  { icon: 'pi-mobile', main: 'Эмуляторы', sub: 'и фермы' },
  { icon: 'pi-sitemap', main: 'Поведенческие', sub: 'аномалии' },
  { icon: 'pi-id-card', main: 'Уникальный', sub: 'device fingerprint' },
  { icon: 'pi-share-alt', main: 'Связи между', sub: 'пользователями' },
  { icon: 'pi-clone', main: 'User-Agent', sub: 'spoofing' },
  { icon: 'pi-search', main: 'Фрод-паттерны', sub: 'и сигнатуры' },
  { icon: 'pi-globe', main: 'Сетевые', sub: 'аномалии' },
  { icon: 'pi-user', main: 'Поведенческий', sub: 'отпечаток' },
  { icon: 'pi-chart-line', main: 'Анализ сетевых', sub: 'аномалий' },
  { icon: 'pi-link', main: 'Скрытые', sub: 'связи' },
  { icon: 'pi-eye', main: 'Мониторинг', sub: 'в реальном времени' },
]

const cols = ['IP-адрес', 'Домен', 'Tag ID', 'Постклик', 'Причина фрода']

const rows = [
  { fraud: true, ip: '13.251.220.222', domain: 'bmwclub.ru', tag: 'VD-2094', post: '0s · закрытие', reason: 'Cookie stuffing' },
  { fraud: false, ip: '163.254.170.226', domain: 'kp.ru', tag: 'VD-1304', post: '32s · 2 страницы', reason: '—' },
  { fraud: true, ip: '139.69.11.54', domain: 'eg.ru', tag: 'TG-7865', post: '0.3s · 0 страниц', reason: 'TOR exit node' },
  { fraud: false, ip: '172.180.10.71', domain: 'fincalculator.ru', tag: 'AF-5949', post: '32s · 2 страницы', reason: '—' },
  { fraud: false, ip: '190.91.21.144', domain: 'esquire.ru', tag: 'VD-3197', post: '58s · корзина', reason: '—' },
  { fraud: true, ip: '45.131.7.88', domain: 'auto.ru', tag: 'TG-1180', post: '0s · закрытие', reason: 'Bot signature' },
  { fraud: false, ip: '88.210.34.9', domain: 'lenta.ru', tag: 'VD-7741', post: '47s · 3 страницы', reason: '—' },
  { fraud: true, ip: '23.129.64.215', domain: 'market.ru', tag: 'TG-5520', post: '0.1s · 0 страниц', reason: 'Datacenter IP' },
  { fraud: false, ip: '95.108.213.50', domain: 'rbc.ru', tag: 'AF-2096', post: '1m 12s · корзина', reason: '—' },
]

// Дублируем строки для бесшовной авто-прокрутки
const feed = [...rows, ...rows]
</script>

<template>
  <section class="slide3">
    <div class="bg" aria-hidden="true">
      <div class="grid" />
      <div class="glow" />
    </div>

    <div class="wrap">
      <!-- Заголовок -->
      <div class="head">
        <h1 class="headline">АНТИ<span class="lime">ФРОД</span></h1>
        <p class="sub">
          Автоматически выявляем и блокируем<br />
          фродовый трафик <span class="lime-soft">до списания бюджета</span>
        </p>
      </div>

      <!-- Сетка возможностей -->
      <div class="chips">
        <div v-for="(c, i) in chips" :key="i" class="chip">
          <span class="chip-ic"><i :class="['pi', c.icon]" /></span>
          <span class="chip-text">
            <span class="chip-main">{{ c.main }}</span>
            <span class="chip-sub">{{ c.sub }}</span>
          </span>
        </div>
      </div>

      <!-- Лог детекции -->
      <div class="log">
        <div class="log-bar">
          <span class="dots">
            <i style="background: #ff5f57" />
            <i style="background: #febc2e" />
            <i style="background: #28c840" />
          </span>
          <span class="log-title">
            <i class="pi pi-shield" />
            Targetly Anti-Fraud — Fraud Detection Log
          </span>
          <span class="live"><span class="live-dot" />Live</span>
        </div>

        <div class="log-head row">
          <span>{{ cols[0] }}</span>
          <span>{{ cols[1] }}</span>
          <span>{{ cols[2] }}</span>
          <span>{{ cols[3] }}</span>
          <span>{{ cols[4] }}</span>
        </div>

        <div class="log-body">
          <div class="log-track">
            <div v-for="(r, i) in feed" :key="i" class="log-row row" :class="{ fraud: r.fraud }">
              <span class="c-ip">
                <i :class="['pi', r.fraud ? 'pi-ban' : 'pi-check-circle']" />
                {{ r.ip }}
              </span>
              <span class="mono">{{ r.domain }}</span>
              <span class="mono dim">{{ r.tag }}</span>
              <span class="mono">{{ r.post }}</span>
              <span>
                <span v-if="r.fraud" class="reason">{{ r.reason }}</span>
                <span v-else class="dash">—</span>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.slide3 {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  color: #f4f6f8;
  font-family: 'Inter', system-ui, sans-serif;
  background: #08090b;
}

.bg {
  position: absolute;
  inset: 0;
  z-index: 0;
}

.grid {
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(rgba(255, 255, 255, 0.022) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.022) 1px, transparent 1px);
  background-size: 48px 48px;
  -webkit-mask-image: radial-gradient(ellipse 90% 70% at 50% 0%, #000 30%, transparent 80%);
  mask-image: radial-gradient(ellipse 90% 70% at 50% 0%, #000 30%, transparent 80%);
}

.glow {
  position: absolute;
  inset: 0;
  background: radial-gradient(46% 36% at 50% -6%, rgba(180, 224, 25, 0.16), transparent 70%);
}

.wrap {
  position: relative;
  z-index: 1;
  height: 100%;
  padding: 34px 48px 0;
  display: flex;
  flex-direction: column;
}

/* ---------- Заголовок ---------- */
.head {
  text-align: center;
}

.headline {
  margin: 0;
  font-family: 'Unbounded', 'Inter', system-ui, sans-serif;
  font-size: 128px;
  font-weight: 800;
  line-height: 1;
  letter-spacing: -3px;
  color: #f7f9fb;
}

.lime {
  color: #b4e019;
  text-shadow: 0 0 36px rgba(180, 224, 25, 0.4);
}

.sub {
  margin: 14px 0 0;
  font-size: 27px;
  font-weight: 600;
  line-height: 1.32;
  color: #c4cbd2;
}

.lime-soft {
  color: #cde85a;
}

/* ---------- Сетка чипов ---------- */
.chips {
  margin-top: 26px;
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  gap: 12px;
}

.chip {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 14px 20px;
  position: relative;
  border-radius: 26px;
  border: 1px solid transparent;
  background:
    linear-gradient(#08090b, #08090b) padding-box,
    conic-gradient(
        from 0deg at 50% 50%,
        rgba(255, 255, 255, 0.26) 0deg,
        rgba(255, 255, 255, 0.03) 90deg,
        rgba(255, 255, 255, 0.26) 180deg,
        rgba(255, 255, 255, 0.03) 270deg,
        rgba(255, 255, 255, 0.26) 360deg
      )
      border-box;
}

.chip-ic {
  flex: none;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #b4e019;
  font-size: 25px;
  filter: drop-shadow(0 0 8px rgba(180, 224, 25, 0.45));
}

.chip-text {
  display: flex;
  flex-direction: column;
  min-width: 0;
}

.chip-main {
  font-size: 13.5px;
  font-weight: 700;
  letter-spacing: -0.2px;
  color: #eef1f4;
  white-space: nowrap;
}

.chip-sub {
  font-size: 12.5px;
  color: #828b95;
  white-space: nowrap;
}

/* ---------- Лог ---------- */
.log {
  flex: 1;
  min-height: 0;
  margin-top: 44px;
  display: flex;
  flex-direction: column;
  border: 1px solid rgba(255, 255, 255, 0.09);
  border-bottom: none;
  border-radius: 14px 14px 0 0;
  background: rgba(12, 13, 17, 0.92);
  overflow: hidden;
}

.log-bar {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 13px 18px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.07);
}

.dots {
  display: flex;
  gap: 7px;
}
.dots i {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}

.log-title {
  display: flex;
  align-items: center;
  gap: 9px;
  font-size: 13px;
  font-weight: 500;
  color: #aeb6bf;
}
.log-title .pi {
  color: #b4e019;
  font-size: 14px;
}

.live {
  margin-left: auto;
  display: flex;
  align-items: center;
  gap: 7px;
  font-size: 12.5px;
  font-weight: 600;
  color: #46d35a;
}
.live-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #46d35a;
  box-shadow: 0 0 0 0 rgba(70, 211, 90, 0.7);
}

.row {
  display: grid;
  grid-template-columns: 1.6fr 1.5fr 0.9fr 1.4fr 1.25fr;
  align-items: center;
  gap: 16px;
  padding: 0 22px;
}

.log-head {
  height: 42px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.06);
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 1px;
  text-transform: uppercase;
  color: #6b747e;
}

.log-body {
  flex: 1;
  min-height: 0;
  overflow: hidden;
}

.log-track {
  display: flex;
  flex-direction: column;
}

.log-track:hover {
  animation-play-state: paused;
}

.log-row {
  flex: none;
  height: 50px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.045);
  font-size: 15px;
  color: #c9cfd5;
}

.mono {
  font-family: ui-monospace, 'SF Mono', Consolas, monospace;
  font-size: 14px;
}

.dim {
  color: #828b95;
}

.c-ip {
  display: flex;
  align-items: center;
  gap: 10px;
  font-family: ui-monospace, 'SF Mono', Consolas, monospace;
  font-size: 14px;
  color: #d6dbe0;
}
.c-ip .pi {
  font-size: 16px;
  color: #46d35a;
}

.log-row.fraud .c-ip,
.log-row.fraud .mono {
  color: #ff4d4d;
}
.log-row.fraud .c-ip .pi {
  color: #ff3b3b;
}

.reason {
  display: inline-block;
  padding: 4px 11px;
  border-radius: 7px;
  font-size: 13px;
  font-weight: 600;
  color: #ff6a6a;
  background: rgba(255, 59, 59, 0.12);
  border: 1px solid rgba(255, 59, 59, 0.3);
}

.dash {
  color: #4b535c;
}

/* ---------- Анимации ---------- */
@media (prefers-reduced-motion: no-preference) {
  .headline,
  .sub,
  .chip,
  .log {
    opacity: 0;
    animation: rise 0.6s cubic-bezier(0.22, 1, 0.36, 1) forwards;
  }
  .headline {
    animation-delay: 0.05s;
  }
  .sub {
    animation-delay: 0.14s;
  }
  .chip {
    animation-delay: calc(0.2s + var(--i, 0) * 0.03s);
  }
  .chip:nth-child(1) { --i: 0; }
  .chip:nth-child(2) { --i: 1; }
  .chip:nth-child(3) { --i: 2; }
  .chip:nth-child(4) { --i: 3; }
  .chip:nth-child(5) { --i: 4; }
  .chip:nth-child(6) { --i: 5; }
  .chip:nth-child(7) { --i: 6; }
  .chip:nth-child(8) { --i: 7; }
  .chip:nth-child(9) { --i: 8; }
  .chip:nth-child(10) { --i: 9; }
  .chip:nth-child(11) { --i: 10; }
  .chip:nth-child(12) { --i: 11; }
  .log {
    animation-delay: 0.6s;
  }

  .log-track {
    animation: scrollFeed 32s linear infinite;
    animation-delay: 1s;
  }

  .live-dot {
    animation: pulse 2s ease-out infinite;
  }
}

@keyframes scrollFeed {
  from {
    transform: translateY(0);
  }
  to {
    transform: translateY(-50%);
  }
}

@keyframes rise {
  from {
    opacity: 0;
    transform: translateY(18px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 rgba(70, 211, 90, 0.7);
  }
  70% {
    box-shadow: 0 0 0 8px rgba(70, 211, 90, 0);
  }
  100% {
    box-shadow: 0 0 0 0 rgba(70, 211, 90, 0);
  }
}
</style>
