<script setup>
import './Slide22.css'

const features = [
  { icon: 'pi-eye', title: 'Видимый контакт', text: 'Реклама появляется\nв момент внимания пользователя' },
  { icon: 'pi-arrows-alt', title: 'Без прерывания контента', text: 'Видео идет параллельно\nпросмотру, а не вместо него' },
  { icon: 'pi-wallet', title: 'Дешевле instream', text: 'Ниже конкуренция\nи стоимость контакта' }
]

const partners = ['Forbes', 'sports.ru', 'vc.ru', 'и другие']
</script>

<template>
  <section class="slide22">
    <div class="s22-bg" aria-hidden="true">
      <div class="s22-glow glow-1"></div>
      <div class="s22-glow glow-2"></div>
      <div class="s22-glow glow-3"></div>
      <div class="s22-grid"></div>
      <div class="s22-waves"></div>
    </div>

    <div class="s22-wrap">
      
      <!-- MAIN ROW -->
      <div class="s22-main">
        <!-- LEFT: TEXT -->
        <div class="s22-left">
          <header class="s22-header">
            <h1>OutStream <i class="pi pi-play" /></h1>
            <p>видеореклама,<br>которую смотрят,<br><span>а не пропускают</span></p>
          </header>

          <div class="s22-features">
            <div class="s22-f-line"></div>
            <div class="s22-feature" v-for="(f, i) in features" :key="i">
              <div class="s22-f-dot"></div>
              <div class="s22-f-icon-wrap"><i :class="['pi', f.icon]" /></div>
              <div class="s22-f-text">
                <h3>{{ f.title }}</h3>
                <p v-html="f.text.replace('\n', '<br>')"></p>
              </div>
            </div>
          </div>
        </div>

        <!-- RIGHT: MOCKUP -->
        <div class="s22-right">
          <div class="s22-mockup-wrap">
            <div class="s22-mockup">
              <!-- Mockup Header -->
              <div class="m-head">
                <div class="m-logo">
                  <div class="m-logo-icon"></div>
                  НОВОСТИ
                </div>
                <nav class="m-nav">
                  <span>Телеканал</span>
                  <span>Газета</span>
                  <span>Журнал</span>
                  <span>Инвестиции</span>
                  <span>Авто</span>
                  <span>Спорт</span>
                  <span>Недвижимость</span>
                </nav>
                <div class="m-actions">
                  <span class="dots">...</span>
                  <i class="pi pi-search" />
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
                    <h5>Лента новостей</h5>
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
      <div class="s22-footer">
        <div class="s22-foot-text">
          Размещаемся там,<br>
          <span>где внимание вашей аудитории</span><br>
          максимально
        </div>
        
        <div class="s22-foot-logos">
          <!-- Fake Logos -->
          <div class="p-logo rbc">
            <img src="/rbc.png" alt="РБК" class="rbc-img" />
          </div>
          <div class="p-logo">
            <img src="/forbes.png" alt="Forbes" class="forbes-img" />
          </div>
          <div class="p-logo">
            <img src="/autoru.png" alt="Auto.ru" class="autoru-img" />
          </div>
          <div class="p-logo">
            <img src="/sports.png" alt="Sports.ru" class="sports-img" />
          </div>
          <div class="p-logo">vc.ru</div>
          <div class="p-logo">
            <img src="/dzen.png" alt="Дзен" class="dzen-img" />
          </div>
          <div class="p-logo more">и другие</div>
        </div>
      </div>

    </div>
  </section>
</template>
