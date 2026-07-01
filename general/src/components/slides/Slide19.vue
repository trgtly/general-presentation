<script setup>
import './Slide19.css'

const formats = [
  {
    type: 'site',
    title: 'Баннер на сайте',
    meta: '728×90',
    text: 'Новая коллекция\nуже в продаже',
  },
  {
    type: 'native',
    title: 'Нативный блок',
    meta: 'В ленте контента',
    text: '5 способов создать\nуют в доме с растениями',
  },
  {
    type: 'video',
    title: 'Видеообъявление',
    meta: 'In-stream / Out-stream',
    text: 'Создайте пространство\nдля вдохновения',
  },
  {
    type: 'mobile',
    title: 'Мобильный баннер',
    meta: '320×50',
    text: 'Комфорт в каждой\nдетали',
  },
  {
    type: 'rich',
    title: 'Интерактивный формат',
    meta: 'HTML5 / Rich Media',
    text: 'Выберите свой\nидеальный стиль',
  },
  {
    type: 'feed',
    title: 'Дин. рем. рекламный блок',
    meta: 'Фидовое объявление',
    text: 'Специальное\nпредложение для вас',
  },
]

const feedProducts = [
  { name: 'Haval Jolion', price: 'от 2,4 млн' },
  { name: 'Haval Dargo', price: 'от 3,1 млн' },
  { name: 'Haval H9', price: 'от 4,2 млн' },
]
</script>

<template>
  <section class="slide19">
    <div class="s19-bg" aria-hidden="true">
      <span class="s19-grid" />
      <span class="s19-glow g1" />
      <span class="s19-glow g2" />
    </div>

    <div class="s19-wrap">
      <header class="s19-head">
        <h1>Рекламные<br>форматы</h1>
        <p>Выбирайте подходящий формат для ваших задач</p>
      </header>

      <main class="s19-board">
        <article
          v-for="format in formats"
          :key="format.title"
          class="s19-card"
        >
          <div class="s19-card-head">
            <h2>{{ format.title }}</h2>
            <span>{{ format.meta }}</span>
          </div>

          <div class="s19-preview">
            <!-- 1. Site Banner -->
            <div v-if="format.type === 'site'" class="s19-mockup mockup-browser">
              <div class="m-header">
                <i class="m-line w-30" />
                <i class="m-line w-60" />
                <i class="m-line w-40 ml-auto" />
              </div>
              <div class="m-body">
                <i class="m-line w-50" />
                <i class="m-line w-30" />
              </div>
              <div class="s19-banner-green">
                <strong v-html="format.text.replace('\n', '<br>')"></strong>
                <div class="btn pi pi-arrow-right" />
              </div>
              <div class="m-footer">
                <div class="m-col"><i class="m-box"/><i class="m-line w-80"/></div>
                <div class="m-col"><i class="m-box"/><i class="m-line w-60"/></div>
              </div>
            </div>

            <!-- 2. Native -->
            <div v-if="format.type === 'native'" class="s19-mockup mockup-native">
              <i class="m-line w-80" />
              <i class="m-line w-60" />
              <div class="s19-banner-green">
                <strong v-html="format.text.replace('\n', '<br>')"></strong>
                <span class="link">Подробнее →</span>
              </div>
              <i class="m-line w-40" />
              <i class="m-line w-30" />
            </div>

            <!-- 3. Video -->
            <div v-if="format.type === 'video'" class="s19-mockup mockup-video">
              <strong class="v-text" v-html="format.text.replace('\n', '<br>')"></strong>
              <div class="play-btn pi pi-play" />
              <div class="v-controls">
                <i class="pi pi-play" />
                <div class="v-track"><div class="v-fill"></div></div>
                <span>0:05 / 0:15</span>
              </div>
            </div>

            <!-- 4. Mobile -->
            <div v-if="format.type === 'mobile'" class="mockup-mobile">
              <div class="m-notch" />
              <i class="m-line w-80 mt-4" />
              <i class="m-line w-100" />
              <i class="m-box large" />
              <i class="m-line w-60" />
              <div class="s19-banner-green">
                <strong v-html="format.text.replace('\n', '<br>')"></strong>
                <div class="btn pi pi-arrow-right" />
              </div>
            </div>

            <!-- 5. Rich -->
            <div v-if="format.type === 'rich'" class="s19-mockup mockup-rich">
              <strong v-html="format.text.replace('\n', '<br>')"></strong>
              <div class="arrows">
                <i class="pi pi-chevron-left" />
                <i class="pi pi-chevron-right" />
              </div>
              <div class="dots">
                <i class="active"/><i/><i/><i/><i/>
              </div>
            </div>

            <!-- 6. Feed Ad -->
            <div v-if="format.type === 'feed'" class="s19-mockup mockup-feed">
              <i class="m-line w-40" />
              <i class="m-line w-70" />
              <div class="feed-grid">
                <div class="feed-item" v-for="prod in feedProducts" :key="prod.name">
                  <div class="f-img" />
                  <strong>{{ prod.name }}</strong>
                  <span>{{ prod.price }}</span>
                </div>
              </div>
            </div>
          </div>
        </article>
      </main>
    </div>
  </section>
</template>