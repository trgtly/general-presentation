<script setup>
import './Slide2.css'

const threats = [
  { pos: 'tl', icon: 'pi-android', title: 'BOT TRAFFIC', text: 'не реальные пользователи' },
  { pos: 'tr', icon: 'pi-globe', title: 'PROXY / VPN', text: 'скрытое подключение' },
  { pos: 'bl', icon: 'pi-mobile', title: 'EMULATOR', text: 'эмуляция устройств' },
  { pos: 'br', icon: 'pi-eye-slash', title: 'INVALID TRAFFIC', text: 'недействительный трафик' },
]
</script>

<template>
  <section class="slide2">
    <div class="s2-bg" aria-hidden="true" />

    <div class="s2-wrap">
      <div class="s2-brand">Targetly Anti-Fraud</div>

      <div v-for="threat in threats" :key="threat.title" class="s2-threat" :class="threat.pos">
        <i :class="['pi', threat.icon]" />
        <div>
          <b>{{ threat.title }}</b>
          <span>{{ threat.text }}</span>
        </div>
      </div>

      <main class="s2-center">
        <span class="s2-chip">media budget leak</span>
        <h1>Почему я должен<br />платить за <strong>ФРОД?</strong></h1>
        <p>
          Рекламный бюджет должен работать на <b>реальных пользователей</b>,
          а не на ботов, прокси и эмуляторы.
        </p>
      </main>

      <aside class="s2-result">
        <i class="pi pi-shield" />
        <span>Targetly проверяет трафик до того, как он становится оплаченной статистикой</span>
      </aside>
    </div>
  </section>
</template>
