<script setup>
import './Slide7.css'

const insightTags = [
  { icon: 'pi-shield', main: 'VPN / Proxy / GEO', sub: 'скрытые сети' },
  { icon: 'pi-mobile', main: 'Эмуляторы', sub: 'и фермы' },
  { icon: 'pi-sitemap', main: 'Поведенческие', sub: 'аномалии' },
  { icon: 'pi-id-card', main: 'Уникальный', sub: 'device fingerprint' },
  { icon: 'pi-share-alt', main: 'Связи между', sub: 'пользователями' },
  { icon: 'pi-clone', main: 'User-Agent', sub: 'spoofing' },
  { icon: 'pi-search', main: 'Фрод-паттерны', sub: 'и сигнатуры' },
  { icon: 'pi-globe', main: 'Сетевые', sub: 'аномалии' },
  { icon: 'pi-user', main: 'Поведенческий', sub: 'отпечаток' },
  { icon: 'pi-link', main: 'Скрытые', sub: 'связи' },
]

const demoAccess = {
  url: 'demo.targetly.ru',
  login: 'demo@targetly.ru',
  password: '000000',
}
</script>

<template>
  <section class="slide7">
    <div class="s7-bg" aria-hidden="true" />

    <div class="s7-wrap">
      <header class="s7-top">
        <span class="s7-brand-tag">Live Demo Transition</span>
        <div class="s7-head-layout">
          <h1>Демо-кабинет Targetly</h1>
          <p>В кабинете доступны дополнительные отчёты по поведению пользователей и качеству трафика.</p>
        </div>
      </header>

      <main class="s7-bento">
        <section class="s7-card s7-access">
          <div class="s7-mark">G</div>
          <span>Ссылка на кабинет</span>
          <a :href="`https://${demoAccess.url}`" target="_blank" rel="noreferrer">
            {{ demoAccess.url }}
            <i class="pi pi-arrow-up-right" />
          </a>

          <div class="s7-credentials">
            <div>
              <b>Логин</b>
              <strong>{{ demoAccess.login }}</strong>
            </div>
            <div>
              <b>Пароль</b>
              <strong>{{ demoAccess.password }}</strong>
            </div>
          </div>
        </section>

        <section class="s7-card s7-list">
          <span>Что можно увидеть</span>
          <div class="s7-tag-list">
            <article v-for="tag in insightTags" :key="`${tag.main}-${tag.sub}`" class="s7-tag">
              <i :class="['pi', tag.icon]" />
              <b>{{ tag.main }}</b>
              <em>{{ tag.sub }}</em>
            </article>
          </div>
        </section>
      </main>
    </div>
  </section>
</template>
