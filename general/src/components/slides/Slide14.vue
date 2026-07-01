<script setup>
import './Slide14.css'

const signals = [
  { icon: 'pi-globe', label: 'Контекст сайта' },
  { icon: 'pi-mobile', label: 'Устройство' },
  { icon: 'pi-shopping-cart', label: 'Поведение' },
  { icon: 'pi-heart', label: 'Интересы' },
  { icon: 'pi-map-marker', label: 'Геолокация' },
  { icon: 'pi-clock', label: 'Время и день' },
]

const explainers = [
  {
    class: 'context',
    icon: 'pi-file',
    title: 'Понимает контекст',
    items: ['сайт', 'формат', 'позиция', 'устройство'],
  },
  {
    class: 'interest',
    icon: 'pi-user',
    title: 'Анализирует интересы',
    items: ['поведение', 'внимание', 'намерение'],
  },
  {
    class: 'position',
    icon: 'pi-table',
    title: 'Оценивает позицию',
    items: ['visibility', 'position bias', 'аудитория позиции'],
  },
]

const sites = [
  { rank: 1, site: 'Сайт A', place: '2-й экран', ctr: '2.43%', trend: 'up', slot: 'native' },
  { rank: 2, site: 'Сайт B', place: 'сайдбар', ctr: '1.89%', trend: 'up', slot: 'sidebar' },
  { rank: 3, site: 'Сайт C', place: '3-й экран', ctr: '1.67%', trend: 'up', slot: 'native' },
  { rank: 4, site: 'Сайт D', place: '1-й экран', ctr: '0.92%', trend: 'down', slot: 'native' },
  { rank: 5, site: 'Сайт E', place: 'сайдбар', ctr: '0.41%', trend: 'down', slot: 'sidebar' },
]
</script>

<template>
  <section class="slide14">
    <div class="s14-bg" aria-hidden="true">
      <span class="s14-grid" />
      <span class="s14-glow g1" />
      <span class="s14-glow g2" />
    </div>

    <div class="s14-wrap">
      <header class="s14-top">
        <span class="s14-brand-tag">Targetly Optimization</span>
        <div class="s14-head-layout">
          <h1>
            AI-модель выбирает сайты и позиции
            с <b>максимальной вероятностью клика</b>
          </h1>
          <p>
            Так как закупка идет по CPM, модель сокращает показы,
            которые с высокой вероятностью не приведут к клику.
          </p>
        </div>
      </header>

      <main class="s14-stage">
        <aside class="s14-signals">
          <span>Входные сигналы</span>
          <article v-for="signal in signals" :key="signal.label">
            <i :class="['pi', signal.icon]" />
            <b>{{ signal.label }}</b>
          </article>
        </aside>

        <section class="s14-model">
          <svg class="s14-streams" viewBox="0 0 650 390" aria-hidden="true">
            <defs>
              <linearGradient id="s14Stream" x1="0" x2="1">
                <stop stop-color="#b4e019" stop-opacity="0" />
                <stop offset="0.42" stop-color="#b4e019" stop-opacity="0.78" />
                <stop offset="1" stop-color="#eaff8b" stop-opacity="0.92" />
              </linearGradient>
              <filter id="s14Glow">
                <feGaussianBlur stdDeviation="3" result="blur" />
                <feMerge>
                  <feMergeNode in="blur" />
                  <feMergeNode in="SourceGraphic" />
                </feMerge>
              </filter>
            </defs>

            <g class="left" filter="url(#s14Glow)">
              <path d="M0 62 C92 58 126 106 236 154" />
              <path d="M0 108 C92 104 132 132 236 172" />
              <path d="M0 154 C102 154 138 166 236 190" />
              <path d="M0 200 C100 198 138 214 236 208" />
              <path d="M0 246 C100 250 134 228 236 226" />
              <path d="M0 292 C94 296 126 256 236 244" />
            </g>

            <g class="right" filter="url(#s14Glow)">
              <path d="M392 164 C474 138 538 124 650 94" />
              <path d="M392 178 C488 160 548 154 650 148" />
              <path d="M392 194 C494 194 556 196 650 204" />
              <path d="M392 212 C486 234 544 250 650 286" />
            </g>
          </svg>

          <div class="s14-orbit" aria-hidden="true">
            <video autoplay muted loop playsinline preload="metadata">
              <source src="/2143303_Energy_Orb_3840x2160.mp4" type="video/mp4" />
            </video>
            <span class="s14-video-overlay" />
          </div>

          <article v-for="item in explainers" :key="item.title" :class="['s14-note', item.class]">
            <i :class="['pi', item.icon]" />
            <div>
              <strong>{{ item.title }}</strong>
              <span v-for="point in item.items" :key="point">{{ point }}</span>
            </div>
          </article>
        </section>

        <aside class="s14-predictor">
          <div class="s14-panel-head">
            <span>Предиктор CTR</span>
            <b>для каждой позиции</b>
          </div>

          <article v-for="site in sites" :key="site.site" :class="['s14-site', site.trend]">
            <em>{{ site.rank }}</em>
            <div :class="['s14-thumb', site.slot]">
              <span />
              <span />
              <span />
            </div>
            <div class="s14-site-copy">
              <strong>{{ site.site }}</strong>
              <small>Позиция: {{ site.place }}</small>
              <b>CTR прогноз: {{ site.ctr }}</b>
            </div>
            <i :class="['pi', site.trend === 'up' ? 'pi-arrow-up' : 'pi-arrow-down']" />
          </article>
        </aside>
      </main>

    </div>
  </section>
</template>
