<script setup>
import './Slide5.css'
import appleIcon from '../../assets/apple_16066067.svg'
import linuxIcon from '../../assets/linux_16066075.svg'

const steps = [
  {
    num: '01',
    title: 'Анализ TCP-соединения',
    text: 'Проверяем технический след входящего визита: не слова браузера, а то, как соединение реально собрано.',
  },
  {
    num: '02',
    title: 'Определяем реальную ОС',
    text: 'По TCP-почерку Targetly понимает, какая среда сформировала пакет.',
  },
  {
    num: '03',
    title: 'Сравниваем с браузером',
    text: 'Если реальная ОС не совпадает с тем, что заявил браузер, визит помечается как подмена.',
  },
]
</script>

<template>
  <section class="slide5">
    <div class="s5-bg" aria-hidden="true" />

    <div class="s5-wrap">
      <header class="s5-top">
        <span>Targetly Anti-Fraud</span>
        <h1>Как Targetly видит подмену устройства</h1>
        <p>Браузер может назвать себя Safari на macOS. TCP-соединение оставляет другой след — и он выдаёт реальную среду.</p>
      </header>

      <main class="s5-flow">
        <section class="s5-step s5-step-a">
          <div class="s5-copy">
            <b>{{ steps[0].num }}</b>
            <div>
              <h2>{{ steps[0].title }}</h2>
              <p>{{ steps[0].text }}</p>
            </div>
          </div>

          <div class="s5-packets" aria-hidden="true">
            <span v-for="i in 28" :key="i" :style="{ '--i': i }" />
            <div class="s5-magnifier">
              <i />
            </div>
          </div>
        </section>

        <i class="s5-arrow s5-arrow-one" aria-hidden="true" />

        <section class="s5-step s5-step-b">
          <div class="s5-copy">
            <b>{{ steps[1].num }}</b>
            <div>
              <h2>{{ steps[1].title }}</h2>
              <p>{{ steps[1].text }}</p>
            </div>
          </div>

          <div class="s5-chip-scene" aria-hidden="true">
            <span v-for="i in 36" :key="i" :style="{ '--i': i }" />
            <div class="s5-chip">
              <strong>OS</strong>
            </div>
          </div>
        </section>

        <i class="s5-arrow s5-arrow-two" aria-hidden="true" />

        <section class="s5-step s5-step-c">
          <div class="s5-copy">
            <b>{{ steps[2].num }}</b>
            <div>
              <h2>{{ steps[2].title }}</h2>
              <p>{{ steps[2].text }}</p>
            </div>
          </div>

          <div class="s5-verdict-stamp" aria-hidden="true">
            <span>Mismatch</span>
            <strong>detected</strong>
          </div>

          <div class="s5-compare" aria-hidden="true">
            <div class="s5-os s5-os-real">
              <span>Реальная ОС</span>
              <img :src="linuxIcon" alt="Linux" />
            </div>
            <em>≠</em>
            <div class="s5-os s5-os-claim">
              <span>Заявлено</span>
              <img :src="appleIcon" alt="macOS" />
            </div>
          </div>
        </section>
      </main>

    </div>
  </section>
</template>
