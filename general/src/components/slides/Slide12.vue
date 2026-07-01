<script setup>
import './Slide12.css'
</script>

<template>
  <section class="slide12">
    <div class="s12-bg" aria-hidden="true">
      <span class="s12-vignette" />
      <span class="s12-stars" />
    </div>

    <div class="s12-wrap">
      <aside class="s12-copy">
        <h1>Нейросети<br /><b>для роста</b><br />эффективности</h1>
        <p>
          Подбираем не просто пользователей.<br />
          Подбираем пользователей и площадки,<br />
          где реклама работает лучше.
        </p>

        <div class="s12-benefits">
          <article>
            <i class="pi pi-users" />
            <div>
              <b>Подбор аудиторий</b>
              <span>Показываем тем, кому это интересно</span>
            </div>
          </article>

          <article>
            <i class="pi pi-map-marker" />
            <div>
              <b>Подбор площадок</b>
              <span>Показываем там, где это эффективно</span>
            </div>
          </article>
        </div>
      </aside>

      <main class="s12-scene">
        <section class="s12-motion">
          <video
            autoplay
            muted
            loop
            playsinline
            preload="metadata"
          >
            <source src="/GettyImages-1148673707.mp4" type="video/mp4" />
          </video>
          <div class="s12-motion-overlay" aria-hidden="true" />
        </section>
      </main>
    </div>
  </section>
</template>
