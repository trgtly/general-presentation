<script setup>
import './Slide25.css'

const aiFeatures = [
  'Рассчитывает индивидуальную вероятность интереса пользователя к конкретному продукту',
  'Сопоставляет пользователя с объектами из фида клиента',
  'Автоматически формируем сегменты высокой вероятности отклика',
  'Обновляет модель в режиме реального времени'
]

const benefits = [
  { icon: 'pi-shield', text: 'Отсечение бота и фрода' },
  { icon: 'pi-bullseye', text: 'Вычисление тех, кому интересно' },
  { icon: 'pi-users', text: 'Сбор сегмента Similarity по любому сегменту или цели' }
]

const cars = [
  { brand: 'Haval', badge: 'Выгодный кредит', price: '3 229 000 руб.' },
  { brand: 'Haval', badge: 'Выгодный кредит', price: '3 800 000 руб.' },
  { brand: 'TENET', badge: 'Выгодный кредит', price: '1 914 500 руб.' },
  { brand: 'Haval', badge: 'Выгодный кредит', price: '3 800 000 руб.' }
]
</script>

<template>
  <section class="slide25">
    <div class="s25-bg" aria-hidden="true">
      <div class="s25-glow glow-1"></div>
      <div class="s25-glow glow-2"></div>
      <div class="s25-grid"></div>
    </div>

    <div class="s25-wrap">
      <div class="s25-main">
        
        <!-- LEFT: TEXT -->
        <div class="s25-left">
          <header class="s25-header">
            <h1>Динамическая<br>реклама</h1>
            <p>Анализируем поведенческие сигналы пользователей и определяем вероятность интереса к конкретному продукту или сервису</p>
          </header>

          <div class="s25-ai-block">
            <h3>Для оценки используется <span>WideDeepFM</span>, которая:</h3>
            <ul class="s25-ai-list">
              <li v-for="(item, i) in aiFeatures" :key="i">
                <i class="pi pi-check"></i>
                <span>{{ item }}</span>
              </li>
            </ul>
          </div>

          <div class="s25-benefits-block">
            <h3>Преимущества</h3>
            <div class="s25-b-list">
              <div class="s25-b-item" v-for="(b, i) in benefits" :key="i">
                <div class="b-icon"><i :class="['pi', b.icon]"></i></div>
                <div class="b-text">{{ b.text }}</div>
              </div>
            </div>
          </div>
        </div>

        <!-- RIGHT: AD FORMAT MOCKUP -->
        <div class="s25-right">
          <div class="s25-mockup-wrap">
            <div class="s25-mockup">
              <!-- Browser Header -->
              <div class="m-head">
                <div class="dots"><span></span><span></span><span></span></div>
                <div class="m-nav">
                  <div class="m-nav-line"></div>
                </div>
              </div>
              
              <!-- Browser Body -->
              <div class="m-body">
                <!-- Fake Travel Site Content -->
                <div class="m-site-content">
                   <div class="m-ticket" v-for="n in 3" :key="'t'+n">
                     <div class="t-top-icons">
                       <i class="pi pi-sync"></i>
                       <i class="pi pi-heart"></i>
                     </div>
                     <div class="t-mid">
                       <div class="t-lines">
                         <div class="t-line w-100"></div>
                         <div class="t-line w-60"></div>
                       </div>
                       <div class="t-flight">
                         <i class="pi pi-send" style="transform: rotate(45deg);"></i>
                       </div>
                       <div class="t-time-info">
                         <div class="time">00:35</div>
                         <div class="city">Москва</div>
                         <div class="date">6 мар, пт</div>
                       </div>
                     </div>
                   </div>
                </div>

                <!-- Dynamic Ad Sidebar -->
                <div class="m-ad-sidebar">
                  <div class="ad-header">
                    <span class="ad-tag">РЕКЛАМА</span>
                    <span class="ad-domain">domain.ru</span>
                    <i class="pi pi-ellipsis-h"></i>
                  </div>
                  
                  <div class="ad-grid">
                    <div class="ad-card" v-for="(car, i) in cars" :key="'c'+i">
                      <div class="ad-brand">— {{ car.brand }}</div>
                      <div class="ad-badge">{{ car.badge }}</div>
                      <div class="ad-img"><i class="pi pi-car"></i></div>
                      <div class="ad-desc">
                        Стоимость с максимальной скидкой в кредит составляет<br>
                        <strong>{{ car.price }}</strong>
                      </div>
                      <div class="ad-foot">
                        <i class="pi pi-lock"></i> Осталось 1 авто
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
</template>
