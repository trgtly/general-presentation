<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import Slide1 from './slides/Slide1.vue'
import Slide2 from './slides/Slide2Hero.vue'
import Slide3 from './slides/Slide3.vue'
import Slide4 from './slides/Slide4.vue'
import Slide5 from './slides/Slide5.vue'
import Slide6 from './slides/Slide6.vue'
import Slide7 from './slides/Slide7.vue'
import Slide9 from './slides/Slide9.vue'
import Slide10 from './slides/Slide10.vue'
import Slide11 from './slides/Slide11.vue'
import Slide12 from './slides/Slide12.vue'
import Slide13 from './slides/Slide13.vue'
import Slide14 from './slides/Slide14.vue'
import Slide15 from './slides/Slide15.vue'
import Slide16 from './slides/Slide16.vue'
import Slide17 from './slides/Slide17.vue'
import Slide18 from './slides/Slide18.vue'
import Slide19 from './slides/Slide19.vue'
import Slide20 from './slides/Slide20.vue'
import Slide21 from './slides/Slide21.vue'
import Slide22 from './slides/Slide22.vue'
import Slide23 from './slides/Slide23.vue'
import Slide24 from './slides/Slide24.vue'
import Slide25 from './slides/Slide25.vue'
import Slide26 from './slides/Slide26.vue'
import Slide27 from './slides/Slide27.vue'

const BASE_W = 1280
const BASE_H = 800

const slides = [Slide1, Slide2, Slide3, Slide4, Slide5, Slide6, Slide7, Slide9, Slide10, Slide11, Slide12, Slide13, Slide14, Slide15, Slide16, Slide17, Slide18, Slide19, Slide20, Slide21, Slide22, Slide23, Slide24, Slide25, Slide26, Slide27]
const current = ref(0)
const scale = ref(1)

const currentSlide = computed(() => slides[current.value])

function updateScale() {
  scale.value = Math.min(window.innerWidth / BASE_W, window.innerHeight / BASE_H)
}

function next() {
  if (current.value < slides.length - 1) current.value++
}

function prev() {
  if (current.value > 0) current.value--
}

function onKey(e) {
  if (e.key === 'ArrowRight' || e.key === ' ') next()
  else if (e.key === 'ArrowLeft') prev()
}

onMounted(() => {
  updateScale()
  window.addEventListener('resize', updateScale)
  window.addEventListener('keydown', onKey)
})

onUnmounted(() => {
  window.removeEventListener('resize', updateScale)
  window.removeEventListener('keydown', onKey)
})
</script>

<template>
  <div class="deck">
    <div
      class="stage"
      :style="{
        width: BASE_W + 'px',
        height: BASE_H + 'px',
        transform: `translate(-50%, -50%) scale(${scale})`,
      }"
    >
      <component :is="currentSlide" />
    </div>

    <div class="nav">
      <button class="nav-btn" :disabled="current === 0" @click="prev">‹</button>
      <span class="nav-count">{{ current + 1 }} / {{ slides.length }}</span>
      <button
        class="nav-btn"
        :disabled="current === slides.length - 1"
        @click="next"
      >
        ›
      </button>
    </div>
  </div>
</template>

<style scoped>
.deck {
  position: fixed;
  inset: 0;
  background: #0c0c0e;
  overflow: hidden;
}

.stage {
  position: absolute;
  top: 50%;
  left: 50%;
  transform-origin: center center;
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.5);
  overflow: hidden;
}

.nav {
  position: fixed;
  bottom: 18px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 6px 10px;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.08);
  backdrop-filter: blur(8px);
  color: #fff;
  font: 14px/1 system-ui, sans-serif;
  user-select: none;
}

.nav-btn {
  width: 34px;
  height: 34px;
  border: none;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.12);
  color: #fff;
  font-size: 20px;
  cursor: pointer;
  transition: background 0.2s;
}

.nav-btn:hover:not(:disabled) {
  background: rgba(255, 255, 255, 0.25);
}

.nav-btn:disabled {
  opacity: 0.3;
  cursor: default;
}

.nav-count {
  min-width: 48px;
  text-align: center;
  letter-spacing: 0.5px;
}
</style>
