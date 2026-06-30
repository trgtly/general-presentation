<script setup>
import { ref } from 'vue'
import './Slide13.css'
import portalImage from '../../assets/wide-deepfm-portal.png'

const activeModel = ref(null)

const signals = [
  { icon: 'pi-user', label: 'Интересы', tone: 'blue' },
  { icon: 'pi-shopping-cart', label: 'Поведение', tone: 'lime' },
  { icon: 'pi-map-marker', label: 'Геолокация', tone: 'violet' },
  { icon: 'pi-mobile', label: 'Устройства', tone: 'blue' },
  { icon: 'pi-clock', label: 'Контекст', tone: 'lime' },
]

const modelBlocks = [
  {
    title: 'WIDE',
    subtitle: 'Что мы знаем точно',
    tone: 'blue',
    visual: 'grid',
    points: ['Явные правила', 'Стабильные закономерности', 'Быстрые решения'],
    tags: ['Открывают PDF с планировками'],
  },
  {
    title: 'FM',
    subtitle: 'Что скрыто между строк',
    tone: 'lime',
    visual: 'fm',
    points: ['Неочевидные связи', 'Микросегменты', 'Скрытые зависимости'],
    tags: ['Привязан к локации эмоционально'],
  },
  {
    title: 'DEEP',
    subtitle: 'Что будет дальше',
    tone: 'violet',
    visual: 'deep',
    points: ['Долгосрочные тренды', 'Намерения пользователя', 'Нелинейные паттерны'],
    tags: ['Расширение жилплощади(Рождение ребенка)'],
  },
]
</script>

<template>
  <section class="slide13">
    <div class="s13-bg" aria-hidden="true">
      <span class="s13-grid" />
      <span class="s13-glow g1" />
      <span class="s13-glow g2" />
    </div>

    <div class="s13-wrap">
      <header class="s13-top">
        <span class="s13-brand-tag">Targetly Optimization</span>
        <div class="s13-head-layout">
          <h1>WIDE-DEEPFM</h1>
          <p>
            AI-модель, собранная из лучших open-source подходов Google и AdWords,
            доработанная нами для максимальной эффективности маркетинга.
          </p>
        </div>
      </header>

      <main class="s13-flow">
        <aside class="s13-signals">
          <span>Входные сигналы</span>
          <article v-for="signal in signals" :key="signal.label" :class="signal.tone">
            <i :class="['pi', signal.icon]" />
            <b>{{ signal.label }}</b>
          </article>
        </aside>

        <section class="s13-model">
          <svg class="s13-lines" viewBox="0 0 770 310" aria-hidden="true">
            <defs>
              <linearGradient id="s13LineBlue" x1="0" x2="1">
                <stop stop-color="#b4e019" stop-opacity="0" />
                <stop offset="0.45" stop-color="#b4e019" stop-opacity="0.72" />
                <stop offset="1" stop-color="#ffffff" />
              </linearGradient>
              <linearGradient id="s13LineLime" x1="0" x2="1">
                <stop stop-color="#b4e019" stop-opacity="0" />
                <stop offset="0.5" stop-color="#b4e019" />
                <stop offset="1" stop-color="#ffffff" />
              </linearGradient>
              <linearGradient id="s13LineViolet" x1="0" x2="1">
                <stop stop-color="#b4e019" stop-opacity="0" />
                <stop offset="0.55" stop-color="#b4e019" stop-opacity="0.5" />
                <stop offset="1" stop-color="#ffffff" />
              </linearGradient>
            </defs>
            <path class="blue" d="M0 62 C92 52 92 112 185 114 S320 112 390 144 S514 176 770 155" />
            <path class="lime" d="M0 128 C90 118 100 154 184 154 S310 148 390 156 S536 162 770 154" />
            <path class="violet" d="M0 202 C92 212 102 170 185 176 S322 194 390 166 S530 120 770 154" />
          </svg>

          <article v-for="block in modelBlocks" :key="block.title" :class="['s13-block', block.tone]" @mouseenter="activeModel = block.title" @mouseleave="activeModel = null">
            <h2>{{ block.title }}</h2>
            <p>{{ block.subtitle }}</p>
            <div v-if="block.visual === 'grid'" class="s13-visual grid" aria-hidden="true">
              <span v-for="i in 16" :key="i" />
            </div>

            <svg v-else-if="block.visual === 'fm'" class="s13-visual network fm" viewBox="0 0 180 132" aria-hidden="true">
              <g class="edges">
                <path d="M36 78 L62 44 L94 66 L128 34 L148 78 L112 104 L70 98 Z" />
                <path d="M62 44 L112 104 M36 78 L128 34 M70 98 L148 78 M94 66 L112 104 M94 66 L62 44" />
              </g>
              <g class="nodes">
                <circle cx="36" cy="78" r="7" />
                <circle cx="62" cy="44" r="7" />
                <circle cx="94" cy="66" r="8" />
                <circle cx="128" cy="34" r="7" />
                <circle cx="148" cy="78" r="7" />
                <circle cx="112" cy="104" r="7" />
                <circle cx="70" cy="98" r="6" />
              </g>
              <path class="base" d="M34 108 L90 124 L150 108" />
            </svg>

            <svg v-else class="s13-visual network deep" viewBox="0 0 180 132" aria-hidden="true">
              <g class="edges">
                <path d="M34 38 L68 24 L104 38 L142 24" />
                <path d="M34 66 L68 52 L104 66 L142 52" />
                <path d="M34 94 L68 80 L104 94 L142 80" />
                <path d="M34 38 L68 52 L104 38 L142 52" />
                <path d="M34 66 L68 24 L104 66 L142 24" />
                <path d="M34 94 L68 80 L104 66 L142 80" />
                <path d="M68 24 L68 52 L68 80 M104 38 L104 66 L104 94 M142 24 L142 52 L142 80" />
              </g>
              <g class="nodes">
                <circle cx="34" cy="38" r="6" /><circle cx="34" cy="66" r="6" /><circle cx="34" cy="94" r="6" />
                <circle cx="68" cy="24" r="7" /><circle cx="68" cy="52" r="7" /><circle cx="68" cy="80" r="7" />
                <circle cx="104" cy="38" r="7" /><circle cx="104" cy="66" r="8" /><circle cx="104" cy="94" r="7" />
                <circle cx="142" cy="24" r="6" /><circle cx="142" cy="52" r="6" /><circle cx="142" cy="80" r="6" />
              </g>
              <path class="base" d="M32 110 L92 126 L150 110" />
            </svg>
            <ul>
              <li v-for="point in block.points" :key="point">{{ point }}</li>
            </ul>
          </article>

          <div class="s13-model-examples">
            <div v-for="block in modelBlocks" :key="'ex-'+block.title" class="s13-example-group" :class="[block.tone, { active: activeModel === block.title }]">
              <span v-for="(tag, i) in block.tags" :key="tag" :style="{ transitionDelay: `${i * 0.05}s` }">{{ tag }}</span>
            </div>
          </div>
        </section>

        <aside class="s13-result">
          <img class="s13-portal-img" :src="portalImage" alt="" aria-hidden="true" />
          <h2>Находит аудитории, которые <b>не видят обычные алгоритмы</b></h2>
          <p>
            Комбинирует три подхода для поиска
            ценных пользователей на разных уровнях
            сложности данных.
          </p>
        </aside>
      </main>
    </div>
  </section>
</template>
