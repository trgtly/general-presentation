<script setup>
// Высоты колонок-«эквалайзера»: U-образная долина (выше по краям,
// ниже к центру) с лёгким джиттером для живости.
const bars = [0.88, 0.74, 0.6, 0.53, 0.47, 0.46, 0.48, 0.52, 0.62, 0.73, 0.87]
</script>

<template>
  <section class="slide">
    <div class="bars">
      <span
        v-for="(h, i) in bars"
        :key="i"
        class="bar"
        :class="{ alt: i % 2 === 1 }"
        :style="{ height: h * 100 + '%' }"
      />
    </div>

    <div class="content">
      <h1 class="title">TARGETLY</h1>

      <p class="subtitle">
        От фильтрации мусорного трафика до точных продаж
        <span class="accent">с помощью Deep Learning</span>
      </p>

      <div class="detector">
        <span class="badge">
          <span class="dot" />
          <span class="badge-text">Anomaly<br />Detected</span>
        </span>
        <span class="corner tl" />
        <span class="corner tr" />
        <span class="corner bl" />
        <span class="corner br" />
        <span class="score">98.7%</span>
        <div class="heatmap" />
      </div>
    </div>

    <!--
      Тепловая карта: поле плотности (две альфа-радиалки) → лёгкое искажение →
      перенос альфы в яркость → постеризация в контурные полосы + тёплый colormap.
    -->
    <svg class="defs" width="0" height="0" aria-hidden="true">
      <filter
        id="heatColor"
        color-interpolation-filters="sRGB"
        x="-25%"
        y="-25%"
        width="150%"
        height="150%"
      >
        <feTurbulence
          type="fractalNoise"
          baseFrequency="0.011"
          numOctaves="2"
          seed="7"
          result="noise"
        />
        <feDisplacementMap
          in="SourceGraphic"
          in2="noise"
          scale="9"
          xChannelSelector="R"
          yChannelSelector="G"
          result="disp"
        />
        <feColorMatrix
          in="disp"
          type="matrix"
          values="0 0 0 1 0  0 0 0 1 0  0 0 0 1 0  0 0 0 1 0"
          result="gray"
        />
        <feComponentTransfer in="gray">
          <feFuncR
            type="discrete"
            tableValues="0.84 0.76 0.66 0.80 0.88 0.96 0.98 0.98 0.97 0.95 0.91 0.86"
          />
          <feFuncG
            type="discrete"
            tableValues="0.91 0.88 0.85 0.86 0.85 0.84 0.80 0.72 0.60 0.48 0.34 0.22"
          />
          <feFuncB
            type="discrete"
            tableValues="0.63 0.48 0.29 0.20 0.16 0.13 0.13 0.15 0.16 0.15 0.13 0.13"
          />
          <feFuncA type="table" tableValues="0 0.25 0.7 1 1" />
        </feComponentTransfer>
      </filter>
    </svg>
  </section>
</template>

<style scoped>
.slide {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: #0a0a0c;
  font-family: 'Inter', system-ui, 'Segoe UI', sans-serif;
  color: #fff;
}

/* Зелёный «эквалайзер» — вертикальные колонки вплотную друг к другу */
.bars {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: flex-end;
  gap: 0;
  filter: blur(1px);
  pointer-events: none;
}

.bar {
  flex: 1 1 0;
  background: linear-gradient(
    to top,
    rgba(176, 224, 38, 0.96) 0%,
    rgba(176, 224, 38, 0.82) 30%,
    rgba(190, 230, 90, 0.35) 64%,
    rgba(255, 255, 255, 0) 100%
  );
}

.bar.alt {
  background: linear-gradient(
    to top,
    rgba(158, 208, 16, 0.98) 0%,
    rgba(158, 208, 16, 0.85) 30%,
    rgba(176, 220, 60, 0.4) 64%,
    rgba(255, 255, 255, 0) 100%
  );
}

.content {
  position: relative;
  z-index: 1;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 132px;
  text-align: center;
}

.title {
  margin: 0;
  font-family: 'Unbounded', 'Inter', system-ui, sans-serif;
  font-size: 140px;
  font-weight: 800;
  letter-spacing: -2px;
  line-height: 0.95;
  color: #ffffff;
  text-shadow: 0 10px 40px rgba(0,0,0,0.8);
}

.subtitle {
  margin: 20px 0 0;
  max-width: 720px;
  font-size: 30px;
  font-weight: 600;
  line-height: 1.3;
  letter-spacing: -0.2px;
  text-wrap: balance;
  color: rgba(255, 255, 255, 0.8);
}

.accent {
  color: #b4e019;
  font-weight: 600;
}

/* Anomaly detection box */
.detector {
  position: relative;
  width: 270px;
  height: 290px;
  margin-top: 54px;
  border: 1px solid rgba(180, 224, 25, 0.2);
  background: rgba(255, 255, 255, 0.02);
  backdrop-filter: blur(10px);
  border-radius: 12px;
  box-shadow: 0 20px 40px rgba(0,0,0,0.4), inset 0 0 20px rgba(180, 224, 25, 0.05);
}

.badge {
  position: absolute;
  top: 10px;
  left: 10px;
  display: flex;
  align-items: center;
  gap: 7px;
  padding: 7px 11px;
  background: rgba(180, 224, 25, 0.1);
  border: 1px solid rgba(180, 224, 25, 0.3);
  color: #b4e019;
  font-size: 11px;
  font-weight: 800;
  line-height: 1.15;
  letter-spacing: 0.6px;
  text-transform: uppercase;
  text-align: left;
  border-radius: 7px;
  box-shadow: 0 4px 12px rgba(180, 224, 25, 0.15);
  z-index: 2;
}

.dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #b4e019;
  box-shadow: 0 0 10px #b4e019;
}

.badge-text {
  white-space: nowrap;
}

/* L-образные уголки видоискателя */
.corner {
  position: absolute;
  width: 20px;
  height: 20px;
  border: 2px solid rgba(180, 224, 25, 0.6);
}

.corner.tl {
  top: -2px;
  left: -2px;
  border-right: none;
  border-bottom: none;
  border-top-left-radius: 12px;
}
.corner.tr {
  top: -2px;
  right: -2px;
  border-left: none;
  border-bottom: none;
  border-top-right-radius: 12px;
}
.corner.bl {
  bottom: -2px;
  left: -2px;
  border-right: none;
  border-top: none;
  border-bottom-left-radius: 12px;
}
.corner.br {
  bottom: -2px;
  right: -2px;
  border-left: none;
  border-top: none;
  border-bottom-right-radius: 12px;
}

/* Чип уверенности модели */
.score {
  position: absolute;
  right: 10px;
  bottom: 10px;
  padding: 4px 8px;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: 0.3px;
  color: #fff;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 6px;
  backdrop-filter: blur(4px);
  font-variant-numeric: tabular-nums;
  z-index: 2;
}

.heatmap {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 252px;
  height: 236px;
  transform: translate(-50%, -50%);
  filter: url(#heatColor);
  /*
    Поле плотности (по альфе): большое пятно сверху-справа, меньшее снизу-слева
    и «перемычка» между ними — фильтр превращает это в контурную тепловую карту.
  */
  background:
    radial-gradient(
      44% 50% at 62% 39%,
      rgba(0, 0, 0, 0.98) 0%,
      rgba(0, 0, 0, 0.72) 30%,
      rgba(0, 0, 0, 0.4) 56%,
      rgba(0, 0, 0, 0.16) 80%,
      rgba(0, 0, 0, 0) 100%
    ),
    radial-gradient(
      34% 40% at 35% 68%,
      rgba(0, 0, 0, 0.92) 0%,
      rgba(0, 0, 0, 0.6) 33%,
      rgba(0, 0, 0, 0.3) 60%,
      rgba(0, 0, 0, 0.12) 82%,
      rgba(0, 0, 0, 0) 100%
    ),
    radial-gradient(
      27% 23% at 49% 53%,
      rgba(0, 0, 0, 0.8) 0%,
      rgba(0, 0, 0, 0.45) 45%,
      rgba(0, 0, 0, 0.15) 75%,
      rgba(0, 0, 0, 0) 100%
    );
}

.defs {
  position: absolute;
}
</style>
