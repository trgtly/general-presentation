<script setup>
import './Slide18.css'

const methods = [
  {
    icon: 'pi-code',
    title: 'JS-тег',
    text: 'Устанавливается в креатив для отслеживания показов и взаимодействий.',
  },
  {
    icon: 'pixel',
    title: 'Пиксель',
    text: 'Встраивается в креатив и передает данные о показе рекламного объявления.',
  },
]

const systems = [
  'Adriver',
  'Weborama',
  'Smartis',
]
</script>

<template>
  <section class="slide18">
    <div class="s18-bg" aria-hidden="true">
      <span class="s18-grid" />
      <span class="s18-glow g1" />
      <span class="s18-glow g2" />
    </div>

    <div class="s18-wrap">
      <main class="s18-copy">
        <h1>Трек системы</h1>
        <p>
          Клиент может независимо аудитировать размещение рекламы
          и качество трафика через ведущие трек-системы рынка.
        </p>

        <section class="s18-methods">
          <article v-for="method in methods" :key="method.title">
            <span v-if="method.icon === 'pixel'" class="s18-pixel-icon" aria-hidden="true">
              <svg viewBox="0 0 96 96" role="img">
                <rect x="22" y="22" width="52" height="52" rx="6" />
              </svg>
            </span>
            <i v-else :class="['pi', method.icon]" />
            <h2>{{ method.title }}</h2>
            <p>{{ method.text }}</p>
          </article>
          <em>или</em>
        </section>
      </main>

      <aside class="s18-systems">
        <article v-for="system in systems" :key="system">
          <b>{{ system }}</b>
        </article>
        <article class="more">
          <strong>+7</strong>
          <b>систем</b>
        </article>
      </aside>
    </div>
  </section>
</template>
