<script setup>
import './Slide6.css'

const depths = Array.from({ length: 11 }, (_, i) => i)

const sessions = [
  { id: '22105783', clicks: 64, type: 'normal', values: [100, 78, 64, 48, 34, 26, 19, 15, 11, 8, 4] },
  { id: '22095702', clicks: 118, type: 'suspect', values: [100, 82, 74, 66, 61, 55, 49, 43, 37, 31, 25] },
  { id: '22098846', clicks: 73, type: 'normal', values: [100, 76, 58, 43, 31, 23, 16, 12, 8, 5, 2] },
  { id: '22098798', clicks: 91, type: 'normal', values: [100, 73, 55, 40, 29, 21, 15, 10, 7, 4, 1] },
  { id: '22084724', clicks: 143, type: 'suspect', values: [100, 85, 78, 70, 64, 57, 49, 41, 34, 28, 20] },
  { id: '22368481', clicks: 176, type: 'anomaly', values: [100, 92, 89, 86, 84, 82, 80, 78, 76, 73, 69] },
  { id: '22091567', clicks: 52, type: 'normal', values: [100, 61, 42, 27, 17, 9, 5, 2, 1, 0, 0] },
  { id: '22168490', clicks: 84, type: 'normal', values: [100, 68, 50, 35, 24, 17, 11, 7, 4, 2, 0] },
]

function heatColor(value) {
  if (value >= 92) return '#de2e2a'
  if (value >= 82) return '#f04b16'
  if (value >= 70) return '#f07b00'
  if (value >= 58) return '#d69200'
  if (value >= 45) return '#77951f'
  if (value >= 32) return '#1d8b45'
  if (value >= 22) return '#129082'
  if (value >= 12) return '#1189a9'
  if (value >= 5) return '#1769b1'
  return '#233fba'
}

function segmentStyle(value) {
  return {
    '--heat': heatColor(value),
    '--alpha': Math.max(0.58, value / 100),
  }
}
</script>

<template>
  <section class="slide6">
    <div class="s6-bg" aria-hidden="true" />

    <div class="s6-wrap">
      <header class="s6-top">
        <span>Targetly Behavioral Analytics</span>
        <h1>Рисковые кампании выдают себя поведением прокрутки</h1>
        <p>
          Каждая колонка — кампания. Сверху указаны ID кампании и клики.
          Главный сигнал: тёплый цвет не должен держаться до нижних экранов.
        </p>
      </header>

      <main class="s6-main">
        <section class="s6-chart">
          <div class="s6-chart-head">
            <div>
              <span>Depth index</span>
              <b>0 → 10</b>
            </div>
            <strong>ID кампании сверху · клики под номером</strong>
          </div>

          <div class="s6-plot">
            <div class="s6-depth">
              <span v-for="d in depths" :key="d">{{ d }}</span>
            </div>

            <div class="s6-columns">
              <div v-for="session in sessions" :key="session.id" class="s6-column" :class="session.type">
                <span class="s6-col-label">
                  <b>{{ session.id }}</b>
                  <small>{{ session.clicks }} кликов</small>
                </span>
                <div class="s6-bar">
                  <i
                    v-for="(value, i) in session.values"
                    :key="i"
                    :style="segmentStyle(value)"
                    :title="`${value}%`"
                  />
                </div>
                <span v-if="session.type === 'anomaly' || session.type === 'suspect'" class="s6-focus">риск</span>
              </div>
            </div>
          </div>
        </section>

        <aside class="s6-insight">
          <div class="s6-note">
            <span>Норма</span>
            <b>Цвет быстро уходит в холодный</b>
            <p>Пользователи читают верх страницы активнее, а дальше внимание плавно снижается.</p>
          </div>

          <div class="s6-note s6-alert">
            <span>Ключевой акцент</span>
            <b>Кампания 22368481 · 176 кликов</b>
            <p>Тёплый цвет держится почти до глубины 10. Это выглядит как автоматическая прокрутка.</p>
          </div>

          <div class="s6-scale" aria-hidden="true">
            <span>100%</span>
            <i />
            <span>0%</span>
          </div>
        </aside>
      </main>
    </div>
  </section>
</template>
