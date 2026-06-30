<script setup>
import './Slide20.css'

const formats = [
  {
    number: '01',
    title: 'ТГБ',
    size: '',
    text: 'Адаптивный мультиформат',
    preview: 'top',
  },
  {
    number: '02',
    title: 'ATF',
    size: '970×250',
    text: 'Максимальный охват и заметность',
    preview: 'wide',
  },
  {
    number: '03',
    title: 'Универсальный',
    size: '300×250',
    text: 'Оптимален для любого контента',
    preview: 'box',
  },
  {
    number: '04',
    title: 'Rich Media',
    size: 'Мультиформат',
    text: 'Интерактивные форматы с высокой вовлеченностью',
    preview: 'rich',
  },
]

const allFormats = [
  '160×600', '240×400', '240×600', '300×250', '300×300', 
  '300×500', '300×600', '320×50', '320×100', '320×480', 
  '336×280', '480×320', '728×90', '1000×120'
]

const benefits = [
  { icon: 'pi-eye', title: 'Высокая видимость', text: 'Сообщение там, где ваша аудитория.' },
  { icon: 'pi-arrows-alt', title: 'Нативное встраивание', text: 'Баннер органично вписан в контент.' },
  { icon: 'pi-objects-column', title: 'Любые задачи', text: 'От охвата до лидов и KPI.' },
  { icon: 'pi-crown', title: 'Premium площадки', text: 'Проверенные медиа и качественные ресурсы.' },
]
</script>

<template>
  <section class="slide20">
    <div class="s20-bg" aria-hidden="true">
      <span class="s20-grid" />
      <span class="s20-glow g1" />
      <span class="s20-glow g2" />
    </div>

    <div class="s20-wrap">
      <header class="s20-top">
        <span class="s20-brand-tag">Targetly Optimization</span>
        <div class="s20-head-layout">
          <h1>Баннерные <b>форматы</b></h1>
          <p>Максимальная видимость на крупнейших площадках с поддержкой всех популярных размеров.</p>
        </div>
      </header>

      <div class="s20-layout">
        <!-- ЛЕВАЯ КОЛОНКА: ФОРМАТЫ -->
        <aside class="s20-formats">
          <article
            v-for="format in formats"
            :key="format.number"
            class="s20-fcard"
          >
            <div class="s20-fcard-num">{{ format.number }}</div>
            <div class="s20-fcard-content">
              <h3>{{ format.title }} <span v-if="format.size">{{ format.size }}</span></h3>
              <p>{{ format.text }}</p>
            </div>
          </article>

          <div class="s20-all-formats">
            <span>Доступные форматы</span>
            <div class="s20-formats-tags">
              <span v-for="size in allFormats" :key="size">{{ size }}</span>
            </div>
          </div>
        </aside>

        <!-- ЦЕНТРАЛЬНАЯ КОЛОНКА: БРАУЗЕР -->
        <main class="s20-browser-wrap">
          <div class="s20-browser">
            <div class="s20-bhead">
              <span class="dot"></span>
              <span class="dot"></span>
              <span class="dot"></span>
              <div class="s20-bsearch">
                <i class="pi pi-lock" />
                <span>targetly.ru/formats</span>
              </div>
            </div>
            <div class="s20-bcontent">
              
              <div class="s20-page-content">
                <!-- Top Ad Slot -->
                <div class="s20-ad-slot top-slot">
                  <span class="s20-ad-label">970×250</span>
                  <img src="/banners/970x250.png" alt="" />
                </div>

                <div class="s20-content-grid">
                  <div class="s20-main-col">
                    <div class="s20-skeleton-title"></div>
                    <div class="s20-skeleton-text"></div>
                    <div class="s20-skeleton-text short"></div>
                    
                    <div class="s20-ad-slot mid-slot native-slot">
                      <span class="s20-ad-label badge">Адаптивный</span>
                      <div class="s20-native-layout">
                        <img src="/native.png" alt="" />
                        <div class="s20-native-text">
                          <div class="s20-nt-title"></div>
                          <div class="s20-nt-desc"></div>
                          <div class="s20-nt-desc short"></div>
                          <div class="s20-nt-btn"></div>
                        </div>
                      </div>
                    </div>

                    <div class="s20-skeleton-text"></div>
                    <div class="s20-skeleton-text"></div>
                    <div class="s20-skeleton-text"></div>
                  </div>

                  <div class="s20-side-col">
                    <div class="s20-ad-slot side-slot">
                      <span class="s20-ad-label">300×250</span>
                      <img src="/banners/300x250.png" alt="" />
                    </div>
                    <div class="s20-skeleton-rect"></div>
                    <div class="s20-skeleton-text"></div>
                    <div class="s20-skeleton-text short"></div>
                  </div>
                </div>

                <!-- Rich Media zone -->
                <div class="s20-ad-slot rich-slot">
                  <span class="s20-ad-label">Rich Media</span>
                  <i class="pi pi-play" />
                </div>
              </div>

            </div>
          </div>
        </main>

        <!-- ПРАВАЯ КОЛОНКА: БЕНЕФИТЫ -->
        <aside class="s20-benefits">
          <article v-for="item in benefits" :key="item.title" class="s20-bcard">
            <div class="s20-bicon">
              <i :class="['pi', item.icon]" />
            </div>
            <div class="s20-btext">
              <h4>{{ item.title }}</h4>
              <p>{{ item.text }}</p>
            </div>
          </article>
        </aside>
      </div>
    </div>
  </section>
</template>
