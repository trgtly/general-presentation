<script setup>
import './Slide17.css'

const stats = [
  { value: '99%', label: 'покрытие рунета', type: 'coverage' },
  { value: '50 тыс.+', label: 'проверенных сайтов', type: 'sites' },
  { value: '72', label: 'рекламных формата', type: 'formats' },
  { value: 'Direct Deals', label: 'прямые закупки', type: 'deals' },
]

const domains = [
  'forbes.ru', 'esquire.ru', 'vc.ru', 'dzen.ru', 'market.yandex.ru', 'rbc.ru', 'profinance.ru', 'mk.ru', 'ria.ru', 'tass.ru',
  'regnum.ru', 'aif.ru', 'eg.ru', 'iz.ru', 'svpressa.ru', 'vesti.ru', 'win.mail.ru', 'disk.yandex.ru', 'pogoda.yandex.ru',
  'yandex market', 'ya.ru', 'mail.yandex.ru', 'mail.rambler.ru', 'rambler.ru', 'livejournal.com', 'go.mail.ru', 'gazeta.ru',
  'tennis-open.ru', 'kp.ru', 'f1news.ru', 'news.ru', 'news.mail.ru', 'sports.ru', 'habr.com', 'finance.mail.ru', 'maps.yandex.ru',
  'fincalculator.ru', 'hh.ru', 'bmwclub.ru', 'list-org.com', 'auto.mail.ru', 'quote.rbc.ru', 'kinopoisk.ru', 'gpt-chatbot.ru',
  'trychatgpt.ru', 'matchtv.ru', 'vkvideo.ru', 'deti.mail.ru', 'rutube.ru', 'vedomosti.ru', 'pro.rbc.ru', 'afisha.yandex.ru',
  'glavkniga.ru', 'pravoved.ru', 'science.mail.ru', '100realt.ru', 'avito.ru', 'besposrednika.ru', 'dom.mirkvartir.ru', 'domkad.ru',
  'dvizhka.ru', 'forumhouse.ru', 'inmyroom.ru', 'kvartblog.ru', 'maxrealt.ru', 'mirkvartir.ru', 'mitula.ru', 'nedvizhimost.mitula.ru',
  'restate.ru', 'tvoyadres.ru', 'ВК', 'Одноклассники', 'Телеграмм', 'rusprofile.ru', 'konkurent.ru', 'business.ru', 'expert.ru',
  'pronedra.ru', 'afanasy.biz', 'glavbukh.ru', 'smart-lab.ru', 'sbankin.com', '1prime.ru', 'sberometer.ru', 'audit-it.ru', 'mfd.ru',
  'capitalgains.ru', 'budgetnik.ru', '1000bankov.ru', 'topbanki.ru', 'top-rf.ru', 'bankiros.ru', 'investfuture.ru', 'banki.ru',
  'fd.ru', 'lenta.ru', 'klerk.ru', 'beregifiguru.ru', 'kosmetista.ru', 'cosmo.ru', 'ellegirl.ru', 'gismeteo.ru', 'femmie.ru',
  'graziamagazine.ru', 'kleo.ru', 'ladywomans.ru', 'lisa.ru', 'marieclaire.ru', 'mycharm.ru', 'neolove.ru', 'peopletalk.ru',
  'woman.ru', 'womanadvice.ru', 'womanhit.ru', '101hotels.com', '2btraveler.ru', 'aeroport.website.ru', 'allrivers.info', 'avia.pro',
  'aviasales.ru', 'aviawiki.com', 'avtodispetcher.ru', 'bilettutu.ru', 'biletyplus.ru', 'cruiseinform.ru', 'eurotraveler.ru',
  'ezdili-znaem.com', 'frequentflyers.ru', 'geektrips.ru', 'germanexpert.ru', 'gotonature.ru', 'katalogturbaz.ru', 'kids-in-trips.ru',
  'kray-zemli.com', 'kuda-spb.ru', 'kudamoscow.ru', 'life-trip.ru', 'make-trip.ru', 'mirturbaz.ru', 'mishka.travel', 'moscow-airports.com',
  'moscowmap.ru', 'moya-planeta.ru', 'nashaplaneta.net', 'ru.flightaware.com', 'russo-travel.ru', 'sanatoria.ru', 'seatemperature.ru',
  'set-travel.com', 'swedeninfo.ru', 'taxuber.ru', 'tourister.ru', 'tourprom.ru', 'trave-l.ru', 'travelask.ru', 'traveloo.ru',
  'travelq.ru', 'trip-advice.ru', 'tripadvisor.com', 'tur-ray.ru', 'turist.im', 'turisticum.ru', 'turizm.ru', 'turproezdka.ru',
  'turtella.ru', 'tutu.ru', 'tutu.travel', 'visasam.ru', 'vokrugsveta.ru', 'votpusk.ru', 'waterparkworld.ru', 'baby.ru', 'babyblog.ru',
  'bebeshka.info', 'childage.ru', 'detion.ru', 'kukuzya.ru', 'mam4.ru', 'mama-likes.ru', 'mamamozhetvse.ru', 'maminsite.ru', 'mamsila.ru',
  'molodaja-semja.ru', 'o-krohe.ru', 'ourbaby.ru', 'parents.ru', 'sadikionline.ru', 'championat.com', 'stranamam.ru', 'u-mama.ru',
  'zr.ru', 'autotonkosti.ru', 'kolesa.ru', 'drive2.com', 'avtovzglyad.ru', 'avtozam.com', 'wroom.ru', 'drive.ru', 'auto.ru',
  'motor.ru', 'polomkiauto.ru', 'naavtotrasse.ru', 'autovsalone.ru', 'autonews.ru', 'allcarz.ru', 'avtomarket.ru', 'avto-russia.ru',
  'carexpert.ru', 'avtonovostidnya.ru', 'audi-club.ru', 'gt-news.ru', 'autodmir.ru', 'partreview.ru', 'ironhorse.ru', 'otoba.ru',
  'vsepredohraniteli.ru', 'avtoblokrele.ru', 'rating-avto.ru'
]

const row1 = domains.slice(0, 48)
const row2 = domains.slice(48, 96)
const row3 = domains.slice(96, 144)
const row4 = domains.slice(144)
</script>

<template>
  <section class="slide17">
    <div class="s17-bg" aria-hidden="true">
      <span class="s17-grid" />
      <span class="s17-glow g1" />
      <span class="s17-glow g2" />
    </div>

    <div class="s17-wrap">
      <header class="s17-top">
        <span class="s17-brand-tag">Targetly Optimization</span>
        <div class="s17-head-layout">
          <h1>Доступ ко всем рыночным <b>SSP</b></h1>
          <p>
            Размещаем рекламу на лучших площадках, подтвержденных OCR-проверкой,
            и защищаем бренд на всех этапах показа.
          </p>
        </div>
      </header>

      <main class="s17-stats">
        <article v-for="stat in stats" :key="stat.label" :class="['s17-stat', stat.type]">
          <div class="s17-card-visual" aria-hidden="true">
            <template v-if="stat.type === 'coverage'">
              <span class="planet"><i class="pi pi-globe" /></span>
            </template>
            <template v-else-if="stat.type === 'sites'">
              <span v-for="i in 7" :key="`bar-${i}`" />
            </template>
            <template v-else-if="stat.type === 'formats'">
              <div class="s17-ad-format">
                <span class="img"></span>
                <div class="lines">
                  <span />
                  <span />
                </div>
              </div>
            </template>
            <template v-else>
              <i class="pi pi-handshake" />
            </template>
          </div>
          <strong>{{ stat.value }}</strong>
          <p>{{ stat.label }}</p>
        </article>
      </main>

      <section class="s17-domains">
        <div class="s17-marquee left">
          <div class="s17-marquee-track">
            <span v-for="domain in row1" :key="'r1-'+domain">{{ domain }}</span>
            <span v-for="domain in row1" :key="'r1-dup-'+domain">{{ domain }}</span>
          </div>
        </div>
        <div class="s17-marquee right">
          <div class="s17-marquee-track">
            <span v-for="domain in row2" :key="'r2-'+domain">{{ domain }}</span>
            <span v-for="domain in row2" :key="'r2-dup-'+domain">{{ domain }}</span>
          </div>
        </div>
        <div class="s17-marquee left">
          <div class="s17-marquee-track">
            <span v-for="domain in row3" :key="'r3-'+domain">{{ domain }}</span>
            <span v-for="domain in row3" :key="'r3-dup-'+domain">{{ domain }}</span>
          </div>
        </div>
        <div class="s17-marquee right">
          <div class="s17-marquee-track">
            <span v-for="domain in row4" :key="'r4-'+domain">{{ domain }}</span>
            <span v-for="domain in row4" :key="'r4-dup-'+domain">{{ domain }}</span>
          </div>
        </div>
      </section>
    </div>
  </section>
</template>
