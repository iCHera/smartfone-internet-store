<template>
  <Header @open-cart="openCart" />
  <CartDrawer :is-open="isCartOpen" @close="closeCart" />

  <main class="container">
    <router-view />
  </main>
    <AppFooter /> 
</template>

<script setup>
  import { ref } from 'vue';
  import Header from './components/Header.vue';
  import AppFooter from './components/Footer.vue';
  import CartDrawer from './components/CartDrawer.vue';
  
  const isCartOpen = ref(false);
  
  const openCart = () => {
    isCartOpen.value = true;
    document.body.style.overflow = 'hidden';
  };
  
  const closeCart = () => {
    isCartOpen.value = false;
    document.body.style.overflow = '';
  };
</script>

<style scoped>

</style>