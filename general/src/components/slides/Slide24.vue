<script setup>
import './Slide24.css'

const features = [
  { icon: 'pi-bolt', title: 'Взаимодействие в момент просмотра', text: 'пользователь может сразу изучить\nпланировки' },
  { icon: 'pi-check-circle', title: 'Без лишних шагов и переходов', text: 'вся информация прямо в ролике —\nбыстро и удобно' }
]

const plans = [
  { rooms: '2-комнатная', area: '59,3 м²', price: '18 650 000 ₽', active: true },
  { rooms: '3-комнатная', area: '78,1 м²', price: '24 100 000 ₽', active: false },
  { rooms: '1-комнатная', area: '45,0 м²', price: '14 300 000 ₽', active: false }
]

    const steps = [
  { icon: 'pi-play', text: 'Пользователь\nсмотрит видеоролик' },
  { img: '/layout_5505998.svg', text: 'Выбирает интересующую\nпланировку прямо в видео' },
  { icon: 'pi-info-circle', text: 'Быстро узнает детали:\nпланировка, площадь,\nцена' },
  { icon: 'pi-arrow-up-right', text: 'Если планировка\nпонравилась — переходит\nна сайт ЖК для более\nдетального изучения' }
]

const benefits = [
  { icon: 'pi-clock', text: '<b>Экономия времени</b> — вся информация<br>о планировке сразу в видео' },
  { icon: 'pi-search', text: '<b>Удобный выбор</b> — не нужно искать планировки<br>на сайте' },
  { icon: 'pi-bullseye', text: '<b>Уверенное решение</b> — пользователь уже знает,<br>что его интересует' }
]
</script>

<template>
  <section class="slide24">
    <div class="s24-bg" aria-hidden="true">
      <div class="s24-glow glow-1"></div>
      <div class="s24-glow glow-2"></div>
      <div class="s24-glow glow-3"></div>
      <div class="s24-grid"></div>
      <div class="s24-waves"></div>
    </div>

    <div class="s24-wrap">
      
      <!-- MAIN ROW -->
      <div class="s24-main">
        <!-- LEFT: TEXT -->
        <div class="s24-left">
          <header class="s24-header">
            <h1>Shoppable<br><span>Ads</span></h1>
            <p>Интерактивная видео-реклама<br>для премиального жилого комплекса</p>
          </header>

          <div class="s24-features">
            <div class="s24-feature" v-for="(f, i) in features" :key="i">
              <div class="s24-f-icon-wrap"><i :class="['pi', f.icon]" /></div>
              <div class="s24-f-text">
                <h3>{{ f.title }}</h3>
                <p v-html="f.text.replace('\n', '<br>')"></p>
              </div>
            </div>
          </div>
        </div>

        <!-- RIGHT: MOCKUP -->
        <div class="s24-right">
          <div class="s24-mockup-wrap">
            <div class="s24-mockup">
               <div class="s24-tablet">
                  <video src="/GettyImages-1148673707.mp4" autoplay muted loop playsinline></video>
                  <div class="t-overlay">
                    <div class="t-label">РЕКЛАМА</div>
                    <div class="t-cards">
                      <div v-for="(plan, i) in plans" :key="i" :class="['t-card', { active: plan.active }]">
                        <div class="t-card-img">
                           <svg v-if="i===0" viewBox="0 0 100 100" class="plan-svg"><path d="M10 10 h40 v30 h-10 v50 h-30 z M60 10 h30 v40 h-10 v-10 h-20 z" fill="#ccc"/></svg>
                           <svg v-if="i===1" viewBox="0 0 100 100" class="plan-svg"><path d="M10 10 h30 v40 h-30 z M50 10 h40 v30 h-10 v30 h-30 z" fill="#ccc"/></svg>
                           <svg v-if="i===2" viewBox="0 0 100 100" class="plan-svg"><path d="M20 20 h60 v60 h-60 z" fill="#ccc"/></svg>
                           <i v-if="plan.active" class="pi pi-sparkles star-badge"></i>
                        </div>
                        <div class="t-card-info">
                          <div class="t-rooms">{{ plan.rooms }}</div>
                          <div class="t-area">{{ plan.area }}</div>
                          <div class="t-price">{{ plan.price }}</div>
                          <button class="t-btn">Подробнее</button>
                          <svg v-if="plan.active" class="t-hand" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.5 4.5V11M10.5 11V14.5L7.866 13.183C7.294 12.897 6.593 13.123 6.273 13.692C5.954 14.261 6.126 14.975 6.667 15.311L11.5 18.5V20.5H16.5L17.756 12.964C17.915 12.01 17.272 11.134 16.3 10.972L12.5 10.339V11" fill="#fff" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M11.5 3.5C10.948 3.5 10.5 3.948 10.5 4.5V11H12.5V4.5C12.5 3.948 12.052 3.5 11.5 3.5Z" fill="#fff" stroke="#000" stroke-width="1.5"/>
                          </svg>
                        </div>
                        <div class="t-card-dots">
                          <span class="active"></span><span></span><span></span><span></span>
                        </div>
                      </div>
                    </div>
                    <div class="t-progress-row">
                      <div class="t-time">00:15</div>
                      <div class="t-progress-bar"><div class="fill"></div><div class="thumb"></div></div>
                      <div class="t-time">00:45</div>
                      <i class="pi pi-expand" style="margin-left: 12px; font-size: 14px"></i>
                    </div>
                  </div>
               </div>
            </div>
          </div>
        </div>
      </div>

      <!-- BOTTOM ROW -->
      <div class="s24-bottom">
         <div class="s24-steps">
           <div class="s24-steps-title">
             Механика взаимодействия
             <div class="s24-steps-line"></div>
           </div>
           
           <div class="steps-row">
             <template v-for="(step, i) in steps" :key="i">
               <div class="step">
                  <div class="step-num">0{{ i + 1 }}</div>
                  <div class="step-content">
                    <div class="step-icon">
                      <i v-if="step.icon" :class="['pi', step.icon]"></i>
                      <img v-else :src="step.img" class="step-svg-icon" alt="" />
                    </div>
                    <div class="step-text" v-html="step.text.replace(/\n/g, '<br>')"></div>
                  </div>
               </div>
               <div v-if="i < steps.length - 1" class="step-divider"></div>
             </template>
           </div>
         </div>
      </div>

    </div>
  </section>
</template>
