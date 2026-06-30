<script setup>
import { onMounted } from 'vue'
import './Slide27.css'
import QrcodeVue from 'qrcode.vue'
</script>

<template>
  <section class="slide27">
    <!-- Background -->
    <div class="s27-bg" aria-hidden="true">
      <div class="s27-grid"></div>
      <div class="s27-glow glow-top"></div>
      <div class="s27-glow glow-bottom"></div>
    </div>

    <div class="s27-wrap">
      
      <!-- LEFT: Title & CTA -->
      <div class="s27-left">
        <div class="s27-badge">TARGETLY</div>
        <h1 class="s27-title">
          Готовы начать<br>работать вместе?
        </h1>
        <p class="s27-desc">
          Свяжитесь с нами, чтобы обсудить ваш проект и запустить эффективные рекламные кампании на базе AI-технологий.
        </p>
        <div class="s27-logo">TARGETLY</div>
      </div>

      <!-- RIGHT: Contacts -->
      <div class="s27-right">
        <div class="contact-board">
          
          <!-- QR Code Area -->
          <div class="qr-col">
            <div class="qr-frame">
              <qrcode-vue value="https://t.me/targetly" :size="130" level="H" />
              <div class="qr-scanner"></div>
            </div>
            <div class="qr-text">Наведите камеру<br>для перехода в Telegram</div>
          </div>

          <!-- Contact Info Area -->
          <div class="info-col">
            <div class="i-block">
              <div class="i-lbl">Telegram</div>
              <div class="i-val">@targetly</div>
            </div>
            <div class="i-block">
              <div class="i-lbl">Email</div>
              <div class="i-val">hello@targetly.ru</div>
            </div>
            <div class="i-block">
              <div class="i-lbl">Телефон</div>
              <div class="i-val">+7 (495) 000-00-00</div>
            </div>
          </div>

        </div>
      </div>

    </div>
  </section>
</template>
