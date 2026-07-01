<script setup>
import './Slide23.css'

const features = [
  { icon: 'pi-eye', title: 'Запоминаемость', text: 'выше на 47%' },
  { icon: 'pi-chart-line', title: 'Рост интереса', text: 'к бренду' },
  { icon: 'pi-users', title: 'Качественная', text: 'аудитория' }
]

const partners = ['Forbes', 'sports.ru', 'vc.ru', 'и другие']
</script>

<template>
  <section class="slide23">
    <div class="s23-bg" aria-hidden="true">
      <div class="s23-glow glow-1"></div>
      <div class="s23-glow glow-2"></div>
      <div class="s23-glow glow-3"></div>
      <div class="s23-grid"></div>
      <div class="s23-waves"></div>
    </div>

    <div class="s23-wrap">
      
      <!-- MAIN ROW -->
      <div class="s23-main">
        <!-- LEFT: TEXT -->
        <div class="s23-left">
          <header class="s23-header">
            <h1>Instream</h1>
            <p>это не просто охват.<br><span>Это управляемое<br>внимание</span></p>
            <div class="desc">
              Видеообъявления, которые смотрят.<br>Аудитория, которая запоминает.
            </div>
          </header>

          <div class="s23-features">
            <div class="s23-f-line"></div>
            <div class="s23-features-title">Видимый результат<br>для бренда</div>
            <div class="s23-feature" v-for="(f, i) in features" :key="i">
              <div class="s23-f-dot"></div>
              <div class="s23-f-icon-wrap"><i :class="['pi', f.icon]" /></div>
              <div class="s23-f-text">
                <h3>{{ f.title }}</h3>
                <p v-html="f.text.replace('\n', '<br>')"></p>
              </div>
            </div>
          </div>
        </div>

        <!-- RIGHT: MOCKUP -->
        <div class="s23-right">
          <div class="s23-mockup-wrap">
            <div class="s23-mockup">
              <!-- Mockup Header -->
              <div class="m-head">
                <div class="m-logo">
                  Видеохостинг
                </div>
                <div class="m-search">
                  <div class="m-search-bar"></div>
                </div>
                <div class="m-actions">
                  <span class="dots">...</span>
                  <i class="pi pi-bell" />
                  <i class="pi pi-user" />
                </div>
              </div>
              
              <!-- Mockup Body -->
              <div class="m-body">
                <div class="m-top-lines">
                  <div class="m-line l-long"></div>
                  <div class="m-line l-mid"></div>
                  <div class="m-line l-short"></div>
                </div>

                <div class="m-grid">
                  <!-- Main Content (Video Ad) -->
                  <div class="m-main-col">
                    <div class="m-ad-card">
                      
                      <div class="m-ad-video">
                        <div class="m-ad-badge">РЕКЛАМА</div>
                        <video 
                          src="/GettyImages-1148673707.mp4" 
                          autoplay muted loop playsinline
                        ></video>
                        <div class="m-ad-play">
                          <i class="pi pi-play" />
                        </div>

                        <!-- Skip Ad -->
                        <div class="m-ad-skip">
                          Пропустить <i class="pi pi-step-forward" />
                        </div>

                        <!-- Ad overlay text -->
                        <div class="m-ad-overlay-text">
                          Реклама в нужный момент.<br>В нужном контексте.
                        </div>

                        <div class="m-ad-progress">
                          <div class="m-ad-progress-loaded"></div>
                          <div class="m-ad-progress-bar"></div>
                        </div>
                      </div>

                      <div class="m-ad-info">
                        <div class="m-ad-text">
                          <h4>Квартиры бизнес-класса</h4>
                          <p>Живи с комфортом и удовольствием</p>
                          <button>Узнать больше</button>
                        </div>
                        <div class="m-ad-controls">
                          <i class="pi pi-volume-off" />
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Side Content (News Feed) -->
                  <aside class="m-side-col">
                    <h5>Рекомендации</h5>
                    <div class="m-news-item" v-for="n in 4" :key="n">
                      <div class="m-n-img"></div>
                      <div class="m-n-lines">
                        <div class="m-n-line w-100"></div>
                        <div class="m-n-line w-80"></div>
                      </div>
                    </div>
                  </aside>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- BOTTOM ROW: FOOTER PARTNERS -->
      <div class="s23-footer">
        <div class="s23-foot-text">
          Размещаемся на площадках,<br>
          <span>которым доверяет ваша аудитория</span>
        </div>
        
        <div class="s23-foot-logos">
          <!-- Fake Logos -->
          <div class="p-logo vk">
            <img src="/vkvideo.png" alt="VK Видео" class="vk-img" />
          </div>
          <div class="p-logo kp">
            <img src="/kinopoisk.png" alt="Кинопоиск" class="kp-img" />
          </div>
          <div class="p-logo rutube" style="font-family: 'Unbounded', sans-serif; font-weight: 800;">
            RUTUBE
          </div>
          <div class="p-logo avito">
            <img src="/avito.png" alt="Avito" class="avito-img" />
          </div>
          <div class="p-logo dzen">
            <img src="/dzen.png" alt="Дзен" class="dzen-img" />
          </div>
          <div class="p-logo yndx">
            <img src="/yandex_video.png" alt="Яндекс Видео" class="yndx-img" />
          </div>
          <div class="p-logo more">и другие</div>
        </div>
      </div>

    </div>
  </section>
</template>
