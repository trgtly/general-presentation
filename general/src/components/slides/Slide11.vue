<script setup>
import './Slide11.css'

const features = [
  {
    icon: 'pi-chart-bar',
    title: 'Запускаем кампании каждый день',
    text: 'Видно, сколько новых кампаний запускается ежедневно и какой объём размещений мы обеспечиваем.',
  },
  {
    icon: 'pi-arrow-up-right',
    title: 'Поддерживаем равномерную активность',
    text: 'Следим за активными кампаниями каждый день, чтобы обеспечивать стабильный поток трафика.',
  },
  {
    icon: 'pi-chart-pie',
    title: 'Обеспечиваем масштаб',
    text: 'Процессы и технологии позволяют работать с большим объёмом кампаний без потери качества.',
  },
]

const launchDays = ['02.02', '03.02', '04.02', '05.02', '06.02', '10.02', '11.02', '12.02', '13.02', '14.02', '18.02', '19.02', '20.02', '21.02', '22.02', '26.02', '27.02', '28.02']
const launchBars = [9, 9, 9, 9, 8, 7, 7, 7, 5, 5, 5, 5, 4, 4, 3, 2, 2, 1]

const activityDays = ['03.03', '04.03', '05.03', '06.03', '07.03', '08.03', '09.03', '10.03', '11.03', '12.03', '13.03', '14.03', '15.03', '17.03', '18.03', '19.03', '20.03', '21.03', '22.03', '23.03', '24.03', '25.03', '26.03', '27.03', '28.03', '29.03', '30.03', '31.03']
const activity = [10, 20, 30, 37, 40, 36, 35, 38, 45, 48, 50, 51, 52, 38, 32, 29, 29, 28, 29, 24, 22, 19, 18, 18, 11, 9, 9, 7]

const linePoints = activity
  .map((value, index) => {
    const x = (index / (activity.length - 1)) * 100
    const y = 100 - (value / 55) * 100
    return `${x},${y}`
  })
  .join(' ')
</script>

<template>
  <section class="slide11">
    <div class="s11-bg" aria-hidden="true">
      <span class="s11-orbit o1" />
      <span class="s11-orbit o2" />
        <span class="s11-pulse p1" style="display: none;" />
        <span class="s11-pulse p2" style="display: none;" />
    </div>

    <div class="s11-wrap">
      <header class="s11-top">
        <span class="s11-brand-tag">Targetly Optimization</span>
        <div class="s11-head-layout">
          <h1>Видите реальный <b>объём работы</b> нашей платформы</h1>
          <p>
            Наглядные графики показывают, сколько кампаний запускаем
            и как распределяем активность каждый день.
          </p>
        </div>
      </header>

      <main class="s11-analytics">
        <article class="s11-feature">
          <i :class="['pi', features[0].icon]" />
          <div>
            <b>{{ features[0].title }}</b>
            <span>{{ features[0].text }}</span>
          </div>
        </article>

        <section class="s11-card s11-bars">
          <div class="s11-card-head">
            <h2>Новые кампании по дням</h2>
            <p>Сколько новых кампаний запускается каждый день</p>
          </div>

          <div class="s11-bar-chart">
            <div class="s11-y-axis">
              <span>10</span>
              <span>8</span>
              <span>6</span>
              <span>4</span>
              <span>2</span>
              <span>0</span>
            </div>
            <div class="s11-bars-grid">
              <article v-for="(value, index) in launchBars" :key="`${launchDays[index]}-${value}`">
                <i :style="{ height: `${value * 13}px` }" />
                <span>{{ launchDays[index] }}</span>
              </article>
            </div>
          </div>
        </section>

        <article class="s11-feature">
          <i :class="['pi', features[1].icon]" />
          <div>
            <b>{{ features[1].title }}</b>
            <span>{{ features[1].text }}</span>
          </div>
        </article>

        <section class="s11-card s11-line">
          <div class="s11-card-head">
            <h2>Активные кампании по дням</h2>
            <p>Как распределяется активность кампаний в течение месяца</p>
          </div>

          <div class="s11-line-chart">
            <div class="s11-line-y">
              <span>50</span>
              <span>40</span>
              <span>30</span>
              <span>20</span>
              <span>10</span>
              <span>0</span>
            </div>
            <svg viewBox="0 0 100 100" preserveAspectRatio="none" aria-hidden="true">
              <defs>
                <linearGradient id="s11LineFill" x1="0" x2="0" y1="0" y2="1">
                  <stop stop-color="#5aade6" stop-opacity="0.26" />
                  <stop offset="1" stop-color="#5aade6" stop-opacity="0" />
                </linearGradient>
              </defs>
              <polygon :points="`0,100 ${linePoints} 100,100`" class="s11-area" />
              <polyline :points="linePoints" class="s11-line-path" />
            </svg>
            <div class="s11-line-points">
              <i
                v-for="(value, index) in activity"
                :key="`${activityDays[index]}-${value}`"
                :style="{ left: `${(index / (activity.length - 1)) * 100}%`, top: `${100 - (value / 55) * 100}%` }"
              />
            </div>
            <div class="s11-line-x">
              <span v-for="day in activityDays.filter((_, index) => index % 3 === 0)" :key="day">{{ day }}</span>
            </div>
          </div>
        </section>
      </main>
    </div>
  </section>
</template>
