<script setup>
import './Slide1.css'
</script>

<template>
  <section class="slide1">
    <!-- Background -->
    <div class="s1-bg" aria-hidden="true">
      <div class="s1-grid"></div>
      <div class="s1-glow glow-1"></div>
      <div class="s1-glow glow-2"></div>
      <div class="s1-glow glow-3"></div>
    </div>

    <div class="s1-wrap">
      
      <!-- Decorative Corners -->
      <div class="corner corner-tl"></div>
      <div class="corner corner-tr"></div>
      <div class="corner corner-bl"></div>
      <div class="corner corner-br"></div>

      <!-- Main Content -->
      <div class="s1-content">
        <div class="s1-badge">DEEP LEARNING PLATFORM</div>
        
        <h1 class="s1-title">TARGETLY</h1>
        
        <p class="s1-subtitle">
          Превращайте пользовательские сигналы в реальные продажи 
          с помощью <span>AI-технологий</span>
        </p>

        <!-- Graphic Element: Neural Network / Target Concept -->
        <div class="s1-graphic">
          <div class="orb-core"></div>
          <div class="ring ring-1"></div>
          <div class="ring ring-2"></div>
          <div class="ring ring-3"></div>
          
          <!-- Floating elements -->
          <div class="float-item f-1"><i class="pi pi-bolt"></i></div>
          <div class="float-item f-2"><i class="pi pi-chart-line"></i></div>
          <div class="float-item f-3"><i class="pi pi-bullseye"></i></div>
          
          <div class="scan-line"></div>
        </div>

      </div>
    </div>
  </section>
</template>
