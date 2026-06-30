<script setup>
import './Slide28.css'

const metrics = [
  { icon: 'pi-eye', value: '3 223 483', label: 'Показы' },
  { icon: 'pi-arrow-up-right', value: '11 074', label: 'Клики' },
  { icon: 'pi-list', value: '34', label: 'Заявок' },
  { icon: 'pi-car', value: '15', label: 'Тест-драйвов' }
]

const technologies = [
  { icon: 'pi-microchip-ai', title: 'WideDeepFM', text: 'Нейросеть позволяющая оценить по каждому пользователю вероятность интереса к продукту' },
  { icon: 'pi-cog', title: 'Микротестирование', text: 'Технология оценивает post-click сегмента на 5–8 кликах и делает вердикт о качестве' },
  { icon: 'pi-shield', title: 'Антифрод', text: 'Сервис выявляет ботов, накрутки паблишеров и некачественный трафик не расходуя бюджет' },
  { icon: 'pi-search', title: 'Slop', text: 'Сервис выявляет страницы и сайты, созданные LLM сервисами и AI-генераторами' }
]

const audiences = [
  { icon: 'pi-flag', title: 'Интерес к китайским авто', text: 'Пользователи, изучающие китайские автомобили и предложения дилеров' },
  { icon: 'pi-car', title: 'Автомобильные классифайды', text: 'Пользователи Auto.ru, Avito Авто, Drom и других площадок по продаже автомобилей' },
  { icon: 'pi-history', title: 'Владельцы авто старше 5 лет', text: 'Пользователи с высокой вероятностью обновления автомобиля в ближайшее время' },
  { icon: 'pi-barcode', title: 'Поиск по VIN и проверка авто', text: 'Аудитория, проверяющая автомобили перед покупкой' },
  { icon: 'pi-credit-card', title: 'Автокредитование', text: 'Пользователи, изучающие условия автокредитов и финансовых программ' },
  { icon: 'pi-sparkles', title: 'GPT Targeting', text: 'Аудитория, сформированная на основе тематики контента, который пользователь читает сейчас' }
]
</script>

<template>
  <section class="slide28">
    <div class="s28-bg" aria-hidden="true">
      <div class="s28-grid"></div>
      <div class="s28-glow glow-1"></div>
      <div class="s28-glow glow-2"></div>
    </div>

    <div class="s28-wrap">
      
      <!-- LEFT COLUMN: Content & Visuals -->
      <div class="s28-left">
        
        <header class="s28-header">
          <h1>Кейс по продвижению<br>автодилера из Китая</h1>
          <div class="h-line"></div>
          <p>Комплексное продвижение с фокусом на получение целевых заявок на тест-драйв</p>
        </header>

        <!-- VISUALIZATION -->
        <div class="s28-visual-wrapper">
          <img src="/car_from_web.png" alt="Автомобиль" class="car-image" />
        </div>

      </div>

      <!-- RIGHT COLUMN: Stats & Tech -->
      <div class="s28-right">
        
        <!-- Top Metrics Area -->
        <div class="r-top-area">
          <div class="r-top-title">СТОИМОСТЬ ЗАЯВКИ НА ТЕСТ-ДРАЙВ</div>
          <div class="r-big-metric">
            <div class="r-val">24 643<span>₽</span></div>
          </div>
          <div class="r-big-sub">
            <svg width="40" height="12" viewBox="0 0 40 12" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M0 6H38M38 6L33 1M38 6L33 11" stroke="#b4e019" stroke-width="1.5" stroke-dasharray="2 2"/>
            </svg>
            на 42% ниже среднего у бренда
          </div>

          <div class="r-metrics-row">
            <div class="rm-item" v-for="(m, i) in metrics" :key="i">
              <div class="rm-icon"><i :class="['pi', m.icon]"></i></div>
              <div class="rm-info">
                <div class="rm-val">{{ m.value }}</div>
                <div class="rm-lbl">{{ m.label }}</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Section: Technologies -->
        <div class="r-section">
          <div class="rs-header">
            <div class="rs-title">Используемые технологии</div>
            <div class="rs-line">
              <div class="rs-dot"></div>
            </div>
          </div>
          
          <div class="rs-grid tech-grid">
            <div class="rs-item" v-for="(item, i) in technologies" :key="i">
              <div class="rs-icon"><i :class="['pi', item.icon]"></i></div>
              <div class="rs-text">
                <div class="rs-item-title">{{ item.title }}</div>
                <div class="rs-item-desc">{{ item.text }}</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Section: Audiences -->
        <div class="r-section">
          <div class="rs-header">
            <div class="rs-title">Используемые аудитории</div>
            <div class="rs-line">
              <div class="rs-dot"></div>
            </div>
          </div>
          
          <div class="rs-grid aud-grid">
            <div class="rs-item" v-for="(item, i) in audiences" :key="i">
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
