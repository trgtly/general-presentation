<script setup>
import './Slide10.css'

const features = [
  {
    icon: 'pi-table',
    title: 'Dot Plot',
    text: 'Вся картина на одном графике: клики, время на сайте и качество трафика.',
  },
  {
    icon: 'pi-database',
    title: 'Источники данных',
    text: 'Видно, какие data sources дают объём открутки и где алгоритм усиливает закупку.',
  },
]

const yTicks = ['03:00', '02:40', '02:20', '02:00', '01:40', '01:20', '01:00', '00:40']
const xTicks = ['5', '78', '152', '225', '299', '373', '446', '520', '594']

const points = [
  { x: 5, y: 42, tone: 'mid' }, { x: 7, y: 50, tone: 'mid' }, { x: 8, y: 58, tone: 'mid' },
  { x: 10, y: 34, tone: 'mid' }, { x: 12, y: 46, tone: 'mid' }, { x: 13, y: 63, tone: 'mid' },
  { x: 15, y: 54, tone: 'mid' }, { x: 16, y: 38, tone: 'mid' }, { x: 18, y: 48, tone: 'mid' },
  { x: 20, y: 66, tone: 'mid' }, { x: 21, y: 30, tone: 'mid' }, { x: 23, y: 58, tone: 'mid' },
  { x: 25, y: 44, tone: 'mid' }, { x: 27, y: 36, tone: 'mid' }, { x: 29, y: 55, tone: 'mid' },
  { x: 31, y: 49, tone: 'mid' }, { x: 33, y: 62, tone: 'mid' }, { x: 35, y: 42, tone: 'mid' },
  { x: 37, y: 70, tone: 'mid' }, { x: 39, y: 53, tone: 'mid' }, { x: 42, y: 60, tone: 'mid' },
  { x: 45, y: 47, tone: 'mid' }, { x: 48, y: 64, tone: 'mid' }, { x: 51, y: 50, tone: 'mid' },
  { x: 54, y: 56, tone: 'mid' }, { x: 58, y: 44, tone: 'mid' },
  { x: 37, y: 30, tone: 'good' }, { x: 42, y: 38, tone: 'good' }, { x: 45, y: 28, tone: 'good' },
  { x: 49, y: 34, tone: 'good' }, { x: 52, y: 42, tone: 'good' }, { x: 55, y: 36, tone: 'good' },
  { x: 58, y: 26, tone: 'good' }, { x: 62, y: 44, tone: 'good' }, { x: 66, y: 31, tone: 'good' },
  { x: 69, y: 39, tone: 'good' }, { x: 73, y: 47, tone: 'good' }, { x: 78, y: 33, tone: 'good' },
  { x: 84, y: 24, tone: 'good' },
  { x: 36, y: 54, tone: 'risk' }, { x: 39, y: 61, tone: 'risk' }, { x: 43, y: 58, tone: 'risk' },
  { x: 46, y: 67, tone: 'risk' }, { x: 49, y: 55, tone: 'risk' }, { x: 52, y: 62, tone: 'risk' },
  { x: 55, y: 50, tone: 'risk' }, { x: 58, y: 64, tone: 'risk' }, { x: 61, y: 56, tone: 'risk' },
  { x: 65, y: 61, tone: 'risk' }, { x: 70, y: 54, tone: 'risk' }, { x: 75, y: 66, tone: 'risk' },
  { x: 82, y: 60, tone: 'risk' }, { x: 90, y: 63, tone: 'risk' }, { x: 97, y: 52, tone: 'risk' },
]

const dataSources = [
  { name: 'GPT-сервисы', value: '31%', tone: 'lime' },
  { name: 'Соцсети', value: '24%', tone: 'violet' },
  { name: 'Классифайды', value: '18%', tone: 'orange' },
  { name: 'Телеком', value: '17%', tone: 'green' },
  { name: 'CRM / Wi-Fi', value: '10%', tone: 'blue' },
]

const sourceTicks = ['00:00', '06:00', '12:00', '18:00', '24:00']
</script>

<template>
  <section class="slide10">
    <div class="s10-bg" aria-hidden="true">
      <span class="s10-orbit o1" />
      <span class="s10-orbit o2" />
        <span class="s10-pulse p1" style="display: none;" />
        <span class="s10-pulse p2" style="display: none;" />
    </div>

    <div class="s10-wrap">
      <header class="s10-top">
        <span class="s10-brand-tag">Targetly Optimization</span>
        <div class="s10-head-layout">
          <h1>Мощная аналитика в режиме <b>реального времени</b></h1>
          <p>
            Превращаем данные рекламных кабинетов в понятные инсайты:
            где трафик качественный, где есть аномалии и какие кампании требуют внимания.
          </p>
        </div>
      </header>

      <main class="s10-analytics">
        <article class="s10-feature">
          <i :class="['pi', features[0].icon]" />
          <div>
            <b>{{ features[0].title }}</b>
            <span>{{ features[0].text }}</span>
          </div>
        </article>

        <section class="s10-card s10-dotplot">
          <div class="s10-card-head">
            <div>
              <h2>Трафик и качество кампаний</h2>
              <p>Каждая точка — кампания. По горизонтали — клики, по вертикали — время на сайте. Чем правее и выше — тем лучше</p>
            </div>
          </div>

          <div class="s10-plot">
            <div class="s10-y-ticks" aria-hidden="true">
              <span v-for="tick in yTicks" :key="tick">{{ tick }}</span>
            </div>

            <div class="s10-x-ticks" aria-hidden="true">
              <span v-for="tick in xTicks" :key="tick">{{ tick }}</span>
            </div>

            <span
              v-for="(point, index) in points"
              :key="index"
              class="s10-point"
              :class="point.tone"
              :style="{ left: `${point.x}%`, top: `${point.y}%` }"
            />
            <i class="s10-axis x">Клики</i>
            <i class="s10-axis y">Время на сайте</i>
            <em class="s10-threshold vertical"><b>Ср. клики</b></em>
            <em class="s10-threshold horizontal"><b>Ср. время</b></em>
          </div>

          <div class="s10-legend">
            <span class="good">Качественный трафик</span>
            <span class="mid">Средний трафик</span>
            <span class="risk">Много кликов, мало времени</span>
          </div>
        </section>

        <article class="s10-feature">
          <i :class="['pi', features[1].icon]" />
          <div>
            <b>{{ features[1].title }}</b>
            <span>{{ features[1].text }}</span>
          </div>
        </article>

        <section class="s10-card s10-heat">
          <div class="s10-card-head">
            <div>
              <h2>Статистика по источникам данных</h2>
              <p>Какие data sources дают основной объём показов в RTB и как алгоритм перераспределяет закупку.</p>
            </div>
          </div>

          <div class="s10-source-chart">
            <div class="s10-stack" aria-hidden="true">
              <span class="layer l1" />
              <span class="layer l2" />
              <span class="layer l3" />
              <span class="layer l4" />
              <span class="layer l5" />
              <i class="s10-bid-marker m1">bid boost</i>
              <i class="s10-bid-marker m2">limit</i>
            </div>

            <div class="s10-source-ticks">
              <span v-for="tick in sourceTicks" :key="tick">{{ tick }}</span>
            </div>
          </div>

          <div class="s10-source-list">
            <article v-for="source in dataSources" :key="source.name" :class="source.tone">
              <i />
              <b>{{ source.name }}</b>
              <strong>{{ source.value }}</strong>
            </article>
          </div>
        </section>
      </main>
    </div>
  </section>
</template>
