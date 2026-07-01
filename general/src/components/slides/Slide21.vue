<script setup>
import './Slide21.css'

const funnel = [
  { value: '800k', label: 'показов', top: '' },
  { value: '2000', label: 'кликов', top: '' },
  { value: '4', label: 'визита в офис', top: '' },
  { value: '2', label: 'сделки', top: '', accent: true },
]

const mechanics = [
  { 
    id: 'focus',
    icon: 'pi-filter', 
    title: 'Предиктивный таргетинг: отсекли 70% нецелевого охвата', 
    text: 'Оставили только тех, кто активно изучал многокомнатные квартиры бизнес-класса в последние 14 дней. Мы не покупали показы ради "красивых" отчетов.' 
  },
  { 
    id: 'segments',
    icon: 'pi-users', 
    title: '327 протестированных сегментов', 
    text: 'Аудитории собирались из: First-party data (36%), GPT Targeting (17%), звонков конкурентам (16%), GPT сервисов (12%), классифайдов (10%) и СМС от конкурентов (9%).' 
  },
  { 
    id: 'fraud',
    icon: 'pi-shield', 
    title: 'Сберегли ~30% бюджета', 
    text: 'Жесткая Anti-fraud фильтрация на лету и сборка индивидуальных white-листов исключили скликивание конкурентами и бот-трафик.' 
  },
]
</script>

<template>
  <section class="slide21">
    <div class="s21-bg" aria-hidden="true">
      <span class="s21-grid" />
      <span class="s21-glow" />
    </div>

    <div class="s21-wrap">
      
      <!-- ВЕРХНЯЯ ЧАСТЬ: ИСТОРИЯ + ВОРОНКА -->
      <div class="s21-top">
        <aside class="s21-story">
          <div class="s21-tags">
            <span>Кейс</span>
            <span>Недвижимость</span>
          </div>
          
          <h1><em class="glow">2 сделки</em><br>при узком спросе</h1>
          
          <p>
            Сданный жилой комплекс бизнес-класса. 
            Вместо широкого охвата кампания сфокусировалась на поиске аудитории с реальным намерением покупки.
          </p>
        </aside>

        <main class="s21-funnel">
          <div class="s21-fhead">
            <span class="s21-flabel">Воронка конверсии</span>
            <div class="s21-budget">
              <i class="pi pi-wallet" />
              <span>Бюджет <strong>450k ₽</strong></span>
            </div>
          </div>
          
          <div class="s21-funnel-elegant">
            <svg class="s21-funnel-bg" viewBox="0 0 1000 240" preserveAspectRatio="none">
              <defs>
                <linearGradient id="innerGrad" x1="0" y1="0" x2="1" y2="0">
                   <stop offset="0%" stop-color="rgba(180,224,25,0.15)" />
                   <stop offset="100%" stop-color="rgba(180,224,25,0.8)" />
                </linearGradient>
              </defs>
              <!-- Outer -->
              <path d="M 0,10 L 200,10 C 250,10 250,50 300,50 L 450,50 C 500,50 500,75 550,75 L 700,75 C 750,75 750,90 800,90 L 1000,90 L 1000,150 C 750,150 750,165 700,165 L 550,165 C 500,165 500,190 450,190 L 300,190 C 250,190 250,230 200,230 L 0,230 Z" fill="rgba(180,224,25,0.03)" />
              <!-- Middle -->
              <path d="M 0,35 L 200,35 C 250,35 250,65 300,65 L 450,65 C 500,65 500,83 550,83 L 700,83 C 750,83 750,94 800,94 L 1000,94 L 1000,146 C 750,146 750,157 700,157 L 550,157 C 500,157 500,175 450,175 L 300,175 C 250,175 250,205 200,205 L 0,205 Z" fill="rgba(180,224,25,0.06)" />
              <!-- Inner -->
              <path d="M 0,60 L 200,60 C 250,60 250,80 300,80 L 450,80 C 500,80 500,91 550,91 L 700,91 C 750,91 750,98 800,98 L 1000,98 L 1000,142 C 750,142 750,149 700,149 L 550,149 C 500,149 500,160 450,160 L 300,160 C 250,160 250,180 200,180 L 0,180 Z" fill="url(#innerGrad)" />
            </svg>

            <div class="s21-fcols">
              <div v-for="(step, i) in funnel" :key="i" class="s21-fcol">
                <div class="s21-fline"></div>
                <div v-if="step.top" class="s21-ftop">{{ step.top }}</div>
                <div :class="['s21-fpill', { accent: step.accent }]">{{ step.value }}</div>
                <div class="s21-fbot">{{ step.label }}</div>
              </div>
            </div>
          </div>
        </main>
      </div>

      <!-- НИЖНЯЯ ЧАСТЬ: МЕХАНИКИ -->
      <div class="s21-bottom">
         <h3 class="s21-btitle">За счет чего достигнут результат</h3>
         <div class="s21-mechanics">
           <article v-for="(m, i) in mechanics" :key="i" :class="['s21-mcard', m.id]">
             
             <div class="s21-mheader">
               <div class="icon-wrap"><i :class="['pi', m.icon]" /></div>
               <h4 v-if="m.id === 'focus'">{{ m.title }}</h4>
             </div>
             <div class="text-wrap">
               <h4 v-if="m.id !== 'focus'">{{ m.title }}</h4>
               <p>{{ m.text }}</p>
             </div>

           </article>
         </div>
      </div>

    </div>
  </section>
</template>
