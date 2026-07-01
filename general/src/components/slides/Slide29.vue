<script setup>
import { computed } from 'vue'
import './Slide29.css'

const chartData = [
  { label: 'Янв', budget: 1500000, visits: 0.2, calls: 4.5 },
  { label: 'Фев', budget: 1000000, visits: 1.8, calls: 2.0 },
  { label: 'Мар', budget: 0, visits: 1.3, calls: 0.6 },
  { label: 'Апр', budget: 0, visits: 1.6, calls: 0.3 },
  { label: 'Май', budget: 0, visits: 1.5, calls: 0.2 },
  { label: 'Июн', budget: 0, visits: 0.9, calls: 0.2 },
  { label: 'Июл', budget: 0, visits: 1.0, calls: 0.2 },
  { label: 'Авг', budget: 0, visits: 0.5, calls: 0.2 },
  { label: 'Сен', budget: 0, visits: 0.2, calls: 0.2 }
]

const totalVisits = computed(() => {
  const sum = chartData.reduce((acc, d) => acc + d.visits, 0)
  return sum.toFixed(1).replace('.', ',')
})

const costPerVisit = '282 608'

const width = 500
const height = 300
const padX = 20
const padY = 20

const getX = (i) => padX + (i / (chartData.length - 1)) * (width - 2 * padX)

const visitsPath = computed(() => {
  return chartData.map((d, i) => {
    const x = getX(i)
    const y = padY + height - (d.visits / 2.0) * height
    return `${i === 0 ? 'M' : 'L'} ${x} ${y}`
  }).join(' ')
})

const callsPath = computed(() => {
  return chartData.map((d, i) => {
    const x = getX(i)
    const y = padY + height - (d.calls / 8.0) * height
    return `${i === 0 ? 'M' : 'L'} ${x} ${y}`
  }).join(' ')
})
</script>

<template>
  <section class="slide29">
    <div class="s29-bg" aria-hidden="true">
      <div class="s29-glow" />
    </div>

    <div class="s29-wrap">
      
      <!-- TOP HEADER -->
      <div class="s29-top">
        <span class="s29-brand-tag">Кейс Targetly</span>
        <div class="s29-head-layout">
          <h1>OLV реклама, которая приводит к <b>сделкам</b>, а не к просмотрам</h1>
          <div>
            <p>Видео-реклама для премиального жилого комплекса</p>
            <div class="s29-mediaplan">
              <div class="s29-mp-item">
                <b>2 600 000 ₽</b>
                <span>Бюджет ЖК (Янв-Фев)</span>
              </div>
              <div class="s29-mp-item">
                <b>1 560 000</b>
                <span>Просмотров видео</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- MAIN BENTO GRID -->
      <div class="s29-bento">
        
        <!-- LEFT COLUMN: KPIs & AI -->
        <div class="s29-left-col">
          
          <!-- BEFORE -->
          <div class="s29-kpi-card">
            <div class="s29-kpi-head">ПРОБЛЕМА КЛИЕНТА (ДО НАС)</div>
            <div class="s29-kpi-metrics">
              <div class="s29-metric">
                <span class="s29-metric-val" style="color: #ff4d4f;">4</span>
                <span class="s29-metric-lbl">площадки не<br>дали результата</span>
              </div>
              <div class="s29-metric">
                <span class="s29-metric-val" style="color: #ff4d4f;">Высокий</span>
                <span class="s29-metric-lbl">уровень фрода<br>в видео</span>
              </div>
            </div>
          </div>

          <!-- AFTER -->
          <div class="s29-kpi-card after">
            <div class="s29-kpi-head">РЕЗУЛЬТАТ ТАРГЕТИНГА</div>
            <div class="s29-kpi-metrics">
              <div class="s29-metric">
                <span class="s29-metric-val">9,2</span>
                <span class="s29-metric-lbl">визитов в офис<br>(Post-View)</span>
              </div>
              <div class="s29-metric">
                <span class="s29-metric-val">282 608</span>
                <span class="s29-metric-lbl">цена одного<br>визита в офис</span>
              </div>
              <div class="s29-metric">
                <span class="s29-metric-val">6 мес.</span>
                <span class="s29-metric-lbl">сохранялся эффект<br>без бюджета</span>
              </div>
            </div>
          </div>

          <!-- APPROACH -->
          <div class="s29-ai-card">
            <h3>Наш подход</h3>
            <ul class="s29-ai-list">
              <li>
                <i class="pi pi-shield"></i>
                <div class="s29-ai-list-text">
                  <strong>Антифрод</strong>
                  <span>Собственная система фильтрации трафика</span>
                </div>
              </li>
              <li>
                <i class="pi pi-eye"></i>
                <div class="s29-ai-list-text">
                  <strong>Анализ зрителей</strong>
                  <span>Оценка досмотров и взаимодействий</span>
                </div>
              </li>
              <li>
                <i class="pi pi-bullseye"></i>
                <div class="s29-ai-list-text">
                  <strong>Точный подбор</strong>
                  <span>Сегменты с покупательским потенциалом</span>
                </div>
              </li>
              <li>
                <i class="pi pi-chart-line"></i>
                <div class="s29-ai-list-text">
                  <strong>Оптимизация</strong>
                  <span>На Post-View и долгий цикл решения</span>
                </div>
              </li>
            </ul>
          </div>

        </div>

        <!-- RIGHT COLUMN: Chart -->
        <div class="s29-right-col">
          <div class="s29-chart-wrapper">
            
            <div class="s29-chart-header">
              <h2>Динамика визитов и звонков (Post-View эффект)</h2>
              <span>Янв 2025 – Сен 2025</span>
            </div>

            <div class="s29-chart-body">
              <div class="chart-layout">
                <!-- Y Axis Left (Budget) -->
                <div class="y-axis left">
                  <span>Бюджет, ₽</span>
                  <div class="ticks">
                    <span>1,500,000</span>
                    <span>1,000,000</span>
                    <span>500,000</span>
                    <span>0</span>
                  </div>
                </div>

                <!-- Chart Core -->
                <div class="chart-core">
                  <svg width="100%" height="100%" viewBox="0 0 540 340" preserveAspectRatio="none" class="chart-svg">
                    <!-- Grid Lines -->
                    <line x1="20" y1="20" x2="520" y2="20" stroke="rgba(255,255,255,0.05)" />
                    <line x1="20" y1="120" x2="520" y2="120" stroke="rgba(255,255,255,0.05)" />
                    <line x1="20" y1="220" x2="520" y2="220" stroke="rgba(255,255,255,0.05)" />
                    <line x1="20" y1="320" x2="520" y2="320" stroke="rgba(255,255,255,0.1)" />

                    <!-- Divider Line -->
                    <line x1="145" y1="0" x2="145" y2="340" stroke="rgba(255,255,255,0.2)" stroke-dasharray="4 4" />

                    <!-- Budget Bars -->
                    <rect :x="getX(0) - 15" :y="padY + height - (1500000/1500000)*height" width="30" :height="(1500000/1500000)*height" fill="rgba(255,255,255,0.15)" />
                    <rect :x="getX(1) - 15" :y="padY + height - (1000000/1500000)*height" width="30" :height="(1000000/1500000)*height" fill="rgba(255,255,255,0.15)" />

                    <!-- Paths -->
                    <path :d="callsPath" fill="none" stroke="#b4e019" stroke-width="2.5" />
                    <path :d="visitsPath" fill="none" stroke="#ff4d4f" stroke-width="2.5" />

                    <!-- Points -->
                    <circle v-for="(d, i) in chartData" :key="'c'+i" :cx="getX(i)" :cy="padY + height - (d.calls / 8.0) * height" r="5" fill="#0e1216" stroke="#b4e019" stroke-width="2" />
                    <circle v-for="(d, i) in chartData" :key="'v'+i" :cx="getX(i)" :cy="padY + height - (d.visits / 2.0) * height" r="5" fill="#0e1216" stroke="#ff4d4f" stroke-width="2" />
                  </svg>

                  <!-- X Axis -->
                  <div class="x-axis">
                    <span v-for="(d, i) in chartData" :key="i" :style="{ left: ((padX + (i / (chartData.length - 1)) * (width - 2 * padX)) / width * 100) + '%' }">{{ d.label }}</span>
                  </div>
                </div>

                <!-- Y Axis Right (Visits/Calls) -->
                <div class="y-axis right">
                  <span class="ry-lbl red">Визиты</span>
                  <span class="ry-lbl green">Звонки</span>
                  <div class="ticks">
                    <span class="tr"><b>2</b><b>8</b></span>
                    <span class="tr"><b>1</b><b>4</b></span>
                    <span class="tr"><b>0</b><b>0</b></span>
                  </div>
                </div>
              </div>
            </div>

            <div class="sc-legend">
              <span><i class="box"></i> Бюджет ЖК</span>
              <span><i class="line red"></i> Визиты в офис (Post-View)</span>
              <span><i class="line green"></i> Обращения (LastClick)</span>
            </div>

          </div>
        </div>

      </div>
    </div>
  </section>
</template>
