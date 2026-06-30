<script setup>
const networks = [
  "buzzoola", "MOE VIDEO", "between", "Hyper", "U.M.G.", "Sape",
  "Adriver", "Bidease Exchange", "Yandex OpenRTB", "Toptraffic",
  "Ohmybid", "MyTarget (VK)", "Traffaret", "Mobidriven", "TaurusX",
  "Unity", "ironSource", "Viqeo", "DirectAdvert"
]

// To fill a large grid, we'll organize them into rows for animation
const rows = []
for (let r = 0; r < 8; r++) {
  const row = []
  // We double the number of items per row so that the CSS animation has a full screen worth of items to scroll
  for (let c = 0; c < 24; c++) {
    row.push(networks[(r * 5 + c) % networks.length])
  }
  rows.push(row)
}
</script>

<template>
  <section class="slide">
    <div class="left-pane">
      <div class="content-wrapper">
        <h1 class="title">TARGETLY</h1>
        <p class="subtitle">
          Превращайте пользовательские сигналы в реальные продажи
          <span class="accent">с помощью Deep Learning</span>
        </p>
      </div>
      
      <div class="bottom-meta">
        <div class="meta-item">
          <span class="meta-label">Презентация продукта</span>
          <span class="meta-value">2026</span>
        </div>
        <div class="meta-divider"></div>
        <div class="meta-item">
          <span class="meta-label">Спикер</span>
          <span class="meta-value">Имя Спикера</span>
        </div>
      </div>
    </div>
    
    <div class="right-pane">
      <!-- Grid of logos fading out -->
      <div class="logos-grid-container">
        <div class="logos-rows">
          <div v-for="(row, rIndex) in rows" :key="rIndex" class="logo-row" :class="'row-' + rIndex">
            <div class="logo-track">
              <!-- Double items for seamless infinite scroll -->
              <div v-for="(network, i) in row" :key="'a'+i" class="logo-box">
                {{ network }}
              </div>
              <div v-for="(network, i) in row" :key="'b'+i" class="logo-box">
                {{ network }}
              </div>
            </div>
          </div>
        </div>
        <!-- Gradient overlay to fade edges from left -->
        <div class="grid-mask"></div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.slide {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: #051a10; /* Dark green background based on the screenshot */
  font-family: 'Inter', system-ui, 'Segoe UI', sans-serif;
  color: #fff;
  display: flex;
}

/* LEFT PANE */
.left-pane {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding-left: 80px;
  position: relative;
  z-index: 2;
}

.content-wrapper {
  max-width: 680px;
  position: relative;
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
  max-width: 600px;
  font-size: 26px;
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

.bottom-meta {
  position: absolute;
  bottom: 80px;
  left: 80px;
  display: flex;
  align-items: center;
  gap: 24px;
  padding-top: 20px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  min-width: 400px;
}

.meta-item {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.meta-label {
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 1px;
  color: rgba(255, 255, 255, 0.4);
  font-weight: 600;
}

.meta-value {
  font-size: 16px;
  color: rgba(255, 255, 255, 0.9);
  font-weight: 500;
}

.meta-divider {
  width: 1px;
  height: 24px;
  background: rgba(255, 255, 255, 0.1);
}

/* RIGHT PANE */
.right-pane {
  flex: 1.2;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1;
}

.logos-grid-container {
  position: absolute;
  /* Extend grid further left to cover rotation bounds */
  inset: -100px -100px -100px -300px; 
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  z-index: 0;
  /* Force a clean cut on the left side of the right pane */
  -webkit-mask-image: linear-gradient(to right, transparent 0%, black 15%, black 100%);
  mask-image: linear-gradient(to right, transparent 0%, black 15%, black 100%);
}

.logos-rows {
  display: flex;
  flex-direction: column;
  gap: 16px;
  opacity: 0.8;
  transform: rotate(-3deg) scale(1.1) translateX(15%);
  width: max-content;
}

.logo-row {
  display: flex;
}

.logo-track {
  display: flex;
  gap: 16px;
  width: max-content;
}

/* Animations for tracks */
@keyframes scrollLeft {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}

@keyframes scrollRight {
  0% { transform: translateX(-50%); }
  100% { transform: translateX(0); }
}

.row-0 .logo-track { animation: scrollLeft 40s linear infinite; }
.row-1 .logo-track { animation: scrollRight 35s linear infinite; }
.row-2 .logo-track { animation: scrollLeft 45s linear infinite; }
.row-3 .logo-track { animation: scrollRight 50s linear infinite; }
.row-4 .logo-track { animation: scrollLeft 38s linear infinite; }
.row-5 .logo-track { animation: scrollRight 42s linear infinite; }
.row-6 .logo-track { animation: scrollLeft 48s linear infinite; }
.row-7 .logo-track { animation: scrollRight 44s linear infinite; }

.logo-box {
  width: 90px;
  height: 90px;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: 8px;
  font-size: 11px;
  font-weight: 600;
  color: rgba(255, 255, 255, 0.4);
  box-shadow: inset 0 2px 10px rgba(255, 255, 255, 0.03), 0 4px 15px rgba(0, 0, 0, 0.2);
  line-height: 1.3;
  transition: all 0.3s ease;
  flex-shrink: 0;
}

.grid-mask {
  position: absolute;
  inset: 0;
  /* Deep fade from left to right so logos emerge smoothly out of the dark */
  background: linear-gradient(to right, 
    rgba(5, 26, 16, 1) 0%, 
    rgba(5, 26, 16, 1) 15%,
    rgba(5, 26, 16, 0.95) 25%, 
    rgba(5, 26, 16, 0.4) 55%, 
    rgba(5, 26, 16, 0) 80%
  );
  pointer-events: none;
}


.defs {
  position: absolute;
  width: 0;
  height: 0;
}
</style>
