<script setup>
import './Slide15.css'

const before = [
  { label: 'Цена ДДУ', value: '701 279 ₽' },
  { label: 'Бюджет', value: '6 311 511 ₽' },
]

const after = [
  { label: 'Цена ДДУ', value: '329 360 ₽' },
  { label: 'Бюджет', value: '8 234 012 ₽' },
]

const rows = [
  { phase: 'before', cells: ['Апрель 2025', '6', '1', '2', '1 469 160 ₽', '734 580 ₽'] },
  { phase: 'before', cells: ['Май 2025', '3', '1', '2', '1 614 117 ₽', '807 058 ₽'] },
  { phase: 'before', cells: ['Июнь 2025', '3', '2', '3', '1 614 117 ₽', '538 039 ₽'] },
  { phase: 'before', cells: ['Июль 2025', '3', '3', '2', '1 614 117 ₽', '807 058 ₽'] },
  { phase: 'divider', label: 'Август 2025 - внедрение AI-модели' },
  { phase: 'after', cells: ['Август 2025', '1', '3', '6', '1 614 117 ₽', '269 019 ₽'] },
  { phase: 'after', cells: ['Сентябрь 2025', '3', '4', '5', '1 614 117 ₽', '322 823 ₽'] },
  { phase: 'after', cells: ['Октябрь 2025', '3', '2', '2', '1 654 470 ₽', '827 235 ₽'] },
  { phase: 'after', cells: ['Ноябрь 2025', '0', '0', '3', '807 058 ₽', '269 019 ₽'] },
  { phase: 'after', cells: ['Декабрь 2025', '4', '3', '3', '698 105 ₽', '232 701 ₽'] },
  { phase: 'after', cells: ['Январь 2026', '5', '2', '3', '820 509 ₽', '273 503 ₽'] },
  { phase: 'after', cells: ['Февраль 2026', '2', '4', '3', '1 025 636 ₽', '341 879 ₽'] },
]

const results = [
  { icon: 'pi-users', value: '500', label: 'аудиторий тестируется ежемесячно' },
  { icon: 'pi-bolt', value: '10', label: 'кликов хватает для оценки качества' },
  { icon: 'pi-globe', value: 'Контекст', label: 'учитывает окружение размещения' },
]
</script>

<template>
  <section class="slide15">
    <div class="s15-bg" aria-hidden="true">
      <span class="s15-glow" />
    </div>

    <div class="s15-wrap">
      <header class="s15-top">
        <span class="s15-brand-tag">Targetly Optimization</span>
        <div class="s15-head-layout">
          <h1>
            Кейс: Снижение CPA <b>на 54%</b>
          </h1>
          <p>
            WIDE-DEEPFM находит аудиторию, готовую к сделке, и не тратит бюджет на остальных. Цена ДДУ падает более чем вдвое.
          </p>
        </div>
      </header>

      <main class="s15-bento">
        <div class="s15-left-col">
          <div class="s15-kpi-card before">
            <div class="s15-kpi-head">До внедрения AI</div>
            <div class="s15-kpi-metrics">
              <div v-for="item in before" :key="item.label" class="s15-metric">
                <span class="s15-metric-val">{{ item.value }}</span>
                <span class="s15-metric-lbl">{{ item.label }}</span>
              </div>
            </div>
          </div>

          <div class="s15-kpi-card after">
            <div class="s15-kpi-head">После внедрения WIDE-DEEPFM</div>
            <div class="s15-kpi-metrics">
              <div v-for="item in after" :key="item.label" class="s15-metric">
                <span class="s15-metric-val">{{ item.value }}</span>
                <span class="s15-metric-lbl">{{ item.label }}</span>
              </div>
            </div>
          </div>

          <div class="s15-ai-card">
            <h3>За счет чего результат?</h3>
            <ul class="s15-ai-list">
              <li v-for="item in results" :key="item.label">
                <i :class="['pi', item.icon]" />
                <div>
                  <strong>{{ item.value }}</strong>
                  <span>{{ item.label }}</span>
                </div>
              </li>
            </ul>
            <div class="s15-ai-conclusion">
              Слабые аудитории отключаются быстрее. Бюджет остается на сегментах, готовых к сделке.
            </div>
          </div>
        </div>

        <div class="s15-right-col">
          <div class="s15-table-wrapper">
            <div class="s15-table-header">
              <h2>Новостройка бизнес-класса</h2>
              <span>Аналитика по месяцам</span>
            </div>
            <div class="s15-table-scroll">
              <table class="s15-data-table">
                <thead>
                  <tr>
                    <th>Месяц</th>
                    <th>Звонки</th>
                    <th>Встречи</th>
                    <th>ДДУ</th>
                    <th>Бюджет</th>
                    <th style="text-align: right;">Стоимость ДДУ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(row, index) in rows" :key="index" :class="row.phase">
                    <td v-if="row.phase === 'divider'" colspan="6" class="s15-divider">
                      <i class="pi pi-bolt" /> {{ row.label }}
                    </td>
                    <template v-else>
                      <td v-for="(cell, cellIdx) in row.cells" :key="cellIdx">{{ cell }}</td>
                    </template>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>
    </div>
  </section>
</template>
