<script setup>
import './Slide16.css'

const segments = [
  { title: 'Соцсети', source: 'интересы, подписки и активность', volume: '85M', size: 'mega', tone: 'lime', icon: 'pi-users' },
  { title: 'Атол', source: 'чеки и покупательские категории', volume: '61M', size: 'mega', tone: 'green', icon: 'pi-receipt' },
  { title: 'Посещали домены', source: 'визиты на сайты и продуктовые страницы', volume: '44.3M', size: 'xl', tone: 'olive', icon: 'pi-globe' },
  { title: 'Метапоисковики', source: 'сравнение предложений и намерение купить', volume: '13M', size: 'xl', tone: 'green', icon: 'pi-search' },
  { title: 'Классифайды', source: 'объявления, просмотры и избранное', volume: '3.7M', size: 'lg', tone: 'lime', icon: 'pi-list' },
  { title: 'GPT Targeting', source: 'AI-сегменты по смыслу запроса', volume: '638K', size: 'lg', tone: 'green', icon: 'pi-sparkles' },
  { title: 'GPT сервисы', source: 'интенты и формулировки запросов', volume: '455K', size: 'md', tone: 'lime', icon: 'pi-comments' },
  { title: 'First-Party Data', source: 'собственные CRM и события клиента', volume: '340K', size: 'md', tone: 'green', icon: 'pi-database' },
  { title: 'Получатели SMS', source: 'сообщения от юр. лиц и сервисов', volume: '325K', size: 'sm', tone: 'olive', icon: 'pi-envelope' },
  { title: 'Звонили конкурентам', source: 'контакт с похожими офферами', volume: '120K', size: 'sm', tone: 'lime', icon: 'pi-phone' },
]

</script>

<template>
  <section class="slide16">
    <div class="s16-bg" aria-hidden="true">
      <span class="s16-grid" />
      <span class="s16-glow g1" />
      <span class="s16-glow g2" />
    </div>

    <div class="s16-wrap">
      <header class="s16-head">
        <h1>Емкость сегментов для <b>точного таргетинга</b></h1>
        <p>Высокоуровневый отчет показывает, какие типы данных доступны для построения аудиторий и какой объем сегментов можно использовать.</p>
      </header>

      <main class="s16-board">
        <section class="s16-capacity">
          <div class="s16-capacity-head">
            <span>Segment capacity report</span>
            <b>Типы данных и емкость аудиторий</b>
          </div>

          <div class="s16-treemap">
            <article
              v-for="segment in segments"
              :key="segment.title"
              :class="['s16-segment', segment.size, segment.tone]"
            >
              <i :class="['pi', segment.icon]" />
              <strong>{{ segment.volume }}</strong>
              <b>{{ segment.title }}</b>
              <span>{{ segment.source }}</span>
            </article>
          </div>
        </section>
      </main>
    </div>
  </section>
</template>
