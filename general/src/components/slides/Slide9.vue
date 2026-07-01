<script setup>
import './Slide9.css'

const steps = [
  { number: '1', title: 'Анализируем', text: 'метрики из сетей' },
  { number: '2', title: 'Прогоняем', text: 'через 40+ паттернов' },
  { number: '3', title: 'Менеджер', text: 'закрывает задачи' },
]

const tasks = [
  {
    id: '20912508',
    title: 'cpm / Звонки конкурентов/ Десктоп / PC',
    source: 'VK Реклама',
    metrics: ['Показы: 1 474', 'Клики: 18', 'CPC: 9,42 ₽', 'Расход: 169,57 ₽'],
    reasons: [
      'CTR очень высокий (1.22%)',
      'Происходит скликивание, нужно остановить кампанию или оптимизировать',
      'CPC: 9.42₽ < 10₽ — скликивание или некорректно подобрана аудитория',
    ],
  },
  {
    id: '20913395',
    title: 'cpm / СМС конкуренты - радиус 10 км / Десктоп / PC',
    source: 'VK Реклама',
    metrics: ['Показы: 1 516', 'Клики: 18', 'CPC: 9,57 ₽', 'Расход: 172,26 ₽'],
    reasons: [
      'CTR очень высокий (1.19%)',
      'Аномально низкий CPC относительно группы',
      'Поведение похоже на некачественный трафик',
    ],
  },
]
</script>

<template>
  <section class="slide9">
    <div class="s9-bg" aria-hidden="true">
      <span class="s9-glow g1" />
      <span class="s9-glow g2" />
    </div>

    <div class="s9-wrap">
      <header class="s9-head">
        <span>Targetly Optimization</span>
        <h1>Оптимизация кампаний</h1>
      </header>

      <section class="s9-steps" aria-label="Optimization flow">
        <article v-for="step in steps" :key="step.number" class="s9-step">
          <strong>{{ step.number }}.</strong>
          <div>
            <b>{{ step.title }}</b>
            <span>{{ step.text }}</span>
          </div>
        </article>
      </section>

      <main class="s9-console">
        <div class="s9-browser-bar" aria-hidden="true">
          <span class="s9-dots"><i /><i /><i /></span>
          <div class="s9-address">
            <i class="pi pi-lock" />
            targetly.app/optimization
          </div>
          <span class="s9-live"><i />Live</span>
        </div>

        <div class="s9-page">
          <div class="s9-console-top">
            <h2>Задачи по оптимизации</h2>
            <button type="button">
              <i class="pi pi-eye-slash" />
              Показать выполненные
            </button>
          </div>

          <section class="s9-board">
            <div class="s9-group">
              <span><i class="pi pi-angle-down" /><i class="pi pi-user" /><b>Алина</b></span>
              <em>18 задач</em>
            </div>

            <div class="s9-project">
              <span><i class="pi pi-angle-down" /><b>ЖК Демо</b></span>
              <em>10</em>
            </div>

            <article v-for="task in tasks" :key="task.id" class="s9-task">
              <div class="s9-task-check" />

              <div class="s9-task-body">
                <div class="s9-task-title">
                  <code>{{ task.id }}</code>
                  <b>{{ task.title }}</b>
                  <span>{{ task.source }}</span>
                </div>

                <div class="s9-metrics">
                  <em v-for="metric in task.metrics" :key="metric">{{ metric }}</em>
                </div>

                <div class="s9-reasons">
                  <mark v-for="reason in task.reasons" :key="reason">{{ reason }}</mark>
                </div>

                <button type="button" class="s9-comment">+ Комментарий</button>
              </div>

              <i class="pi pi-flag" />
            </article>
          </section>
        </div>
      </main>
    </div>
  </section>
</template>
