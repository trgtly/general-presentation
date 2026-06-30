<script setup>
import './Slide2Hero.css'

const stats = [
  { value: '72%', label: 'бюджета уходит на фрод в среднем по рынку' },
  { value: '100%', label: 'уверенность в каждом клике с Targetly' },
]
</script>

<template>
  <section class="slide2-new">
    <div class="s2-background"></div>
    
    <div class="s2-content-container">
      <main class="s2-main-text">
        <h1 class="s2-headline">
          Почему я должен платить<br />
          за <span class="s2-highlight">ФРОД?<svg class="s2-skull" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2C7.58 2 4 5.58 4 10C4 12.3 5.08 14.35 6.78 15.65L6.15 19.46C5.97 20.53 6.8 21.5 7.89 21.5H16.11C17.2 21.5 18.03 20.53 17.85 19.46L17.22 15.65C18.92 14.35 20 12.3 20 10C20 5.58 16.42 2 12 2ZM9 12C7.9 12 7 11.1 7 10C7 8.9 7.9 8 9 8C10.1 8 11 8.9 11 10C11 11.1 10.1 12 9 12ZM15 12C13.9 12 13 11.1 13 10C13 8.9 13.9 8 15 8C16.1 8 17 8.9 17 10C17 11.1 16.1 12 15 12ZM13 16H11V14H13V16ZM16 16H14.5V14H16V16ZM9.5 16H8V14H9.5V16Z" /></svg></span>
        </h1>
        <p class="s2-subtext">
          Рекламный бюджет должен работать на реальных пользователей, а не на ботов, прокси и эмуляторы.
        </p>
      </main>

      <div class="s2-stats-row">
        <div v-for="stat in stats" :key="stat.value" :class="['s2-stat-card', { 's2-stat-alert': stat.value === '72%' }]">
          <div class="s2-stat-value">{{ stat.value }}</div>
          <div class="s2-stat-label">{{ stat.label }}</div>
        </div>
      </div>
      
      <div class="s2-solution-bar">
        <i class="pi pi-shield"></i>
        <span><b>Targetly Anti-Fraud</b> отсекает невалидный трафик до того, как за него спишут деньги</span>
      </div>
    </div>
  </section>
</template>
