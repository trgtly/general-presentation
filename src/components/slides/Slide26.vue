<script setup>
import './Slide26.css'

const aiFeatures = [
  { icon: 'pi-share-alt', title: 'Сложные нелинейные связи', text: 'Анализ нестандартных паттернов поведения пользователей' },
  { icon: 'pi-chart-line', title: 'Долгосрочные тренды', text: 'Учет редких, но важных событий в истории пользователя' },
  { icon: 'pi-link', title: 'Невидимые связи', text: 'Поиск неочевидных зависимостей между интересами и товарами' }
]

const products = [
  { name: 'Дрель\nаккумуляторная', price: '8 990 ₽', active: true, image: '/952003c7-85b7-4279-a4ae-97b7de95a8e7.png' },
  { name: 'Садовое\nкресло', price: '4 590 ₽', active: false, image: '/image 185.png' },
  { name: 'Кашпо для\nрастений', price: '1 290 ₽', active: false, image: '/image28.png' },
  { name: 'Набор\nинструментов', price: '3 490 ₽', active: false, icon: 'pi-wrench' }
]

const results = [
  { icon: 'pi-check-circle', title: 'Высокая окупаемость', text: 'Кампания показала высокую окупаемость вложений' },
  { icon: 'pi-chart-bar', title: 'Возврат инвестиций', text: 'Каждый рубль принес прибыль сверх затрат' },
  { icon: 'pi-shopping-cart', title: 'Рост конверсии', text: 'AI-подбор товаров увеличил вовлечённость' },
  { icon: 'pi-bolt', title: 'Real-time адаптация', text: 'Реклама подстраивалась под интересы в реальном времени' }
]
</script>

<template>
  <section class="slide26">
    <div class="s26-bg" aria-hidden="true">
      <div class="s26-grid"></div>
      <div class="s26-glow glow-1"></div>
      <div class="s26-glow glow-2"></div>
    </div>

    <div class="s26-wrap">
      
      <!-- LEFT COLUMN: Content & Visuals -->
      <div class="s26-left">
        
        <header class="s26-header">
          <h1>Динамическая реклама<br>для <span>строительного<br>интернет-магазина</span></h1>
          <div class="h-line"></div>
          <p>Комплексное продвижение с фокусом на получение целевых покупок. AI-модель DeepFM находит скрытые взаимосвязи и автоматически подбирает товары.</p>
        </header>

        <!-- VISUALIZATION -->
        <div class="s26-visual-wrapper">
          <div class="s26-banner-mockup">
            <div class="banner-title">Возможно, вам будет интересно:</div>
            
            <!-- Products -->
            <div class="carousel-wrap">
              <div class="products-row">
                <div v-for="(p, i) in products" :key="i" :class="['p-card', { active: p.active }]">
                  <div class="p-img">
                    <img v-if="p.image" :src="p.image" alt="" />
                    <i v-else :class="['pi', p.icon]"></i>
                  </div>
                  <div class="p-info">
                     <div class="p-name" v-html="p.name.replace('\n', '<br>')"></div>
                     <div class="p-price">{{ p.price }}</div>
                  </div>
                  <div class="p-btn">Купить</div>
                </div>
              </div>
            </div>

            <div class="c-pagination">
              <span class="c-dot active"></span>
              <span class="c-dot"></span>
              <span class="c-dot"></span>
              <span class="c-dot"></span>
            </div>
          </div>
        </div>

      </div>

      <!-- RIGHT COLUMN: Stats & Tech -->
      <div class="s26-right">
        
        <!-- Top Metrics Area -->
        <div class="r-top-area">
          <div class="r-top-title">КЛЮЧЕВЫЕ РЕЗУЛЬТАТЫ</div>
          <div class="r-big-metric">
            <div class="r-val">283<span>%</span></div>
          </div>
          <div class="r-big-sub">
            <svg width="40" height="12" viewBox="0 0 40 12" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M0 6H38M38 6L33 1M38 6L33 11" stroke="#b4e019" stroke-width="1.5" stroke-dasharray="2 2"/>
            </svg>
            ROMI: плановый показатель превышен в 2 раза
          </div>

          <div class="r-metrics-row">
            <div class="rm-item">
              <div class="rm-icon"><i class="pi pi-send"></i></div>
              <div class="rm-info">
                <div class="rm-val">3 000</div>
                <div class="rm-lbl">Кликов</div>
              </div>
            </div>
            <div class="rm-item">
              <div class="rm-icon"><i class="pi pi-chart-line"></i></div>
              <div class="rm-info">
                <div class="rm-val">~250 000 ₽</div>
                <div class="rm-lbl">Бюджет</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Section: Technologies -->
        <div class="r-section">
          <div class="rs-header">
            <div class="rs-title">Наша AI-модель DeepFM</div>
            <div class="rs-line">
              <div class="rs-dot"></div>
            </div>
          </div>
          
          <div class="rs-grid">
            <div class="rs-item" v-for="(item, i) in aiFeatures" :key="i">
              <div class="rs-icon"><i :class="['pi', item.icon]"></i></div>
              <div class="rs-text">
                <div class="rs-item-title">{{ item.title }}</div>
                <div class="rs-item-desc">{{ item.text }}</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Section: Results list -->
        <div class="r-section">
          <div class="rs-header">
            <div class="rs-title">Эффективность кампании</div>
            <div class="rs-line">
              <div class="rs-dot"></div>
            </div>
          </div>
          
          <div class="rs-grid">
            <div class="rs-item" v-for="(item, i) in results" :key="i">
              <div class="rs-icon"><i :class="['pi', item.icon]"></i></div>
              <div class="rs-text">
                <div class="rs-item-title">{{ item.title }}</div>
                <div class="rs-item-desc">{{ item.text }}</div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
  </section>
</template>
