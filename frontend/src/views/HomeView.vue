
<template>
  <div class="home-page">

    <section id="about" class="section-about">
      <AboutSection />
    </section>

    <section id="catalog" class="section-catalog container">
      <h2>Каталог товаров</h2>
      <ProductList />
    </section>

  </div>
</template>

<script setup>
  import ProductList from '../components/ProductList.vue';
  import AboutSection from '../components/AboutSection.vue'
</script>

<style scoped>
section {
  padding: 10px 0;
}

.hero-section {
  height: 80vh;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  display: flex;
  align-items: center;
  text-align: center;
}

.hero-section h1 {
  font-size: 3.5rem;
  margin-bottom: 20px;
  background: -webkit-linear-gradient(#333, #0071e3);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.hero-section p {
  font-size: 1.5rem;
  color: #666;
  margin-bottom: 40px;
}
</style>