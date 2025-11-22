<template>
  <Header @open-cart="openCart" />
  <CartDrawer :is-open="isCartOpen" @close="closeCart" />

  <main class="container">
    <router-view />
  </main>
    <AppFooter /> 
</template>

<script setup>
  import { ref, onMounted  } from 'vue';
  import Header from './components/Header.vue';
  import AppFooter from './components/Footer.vue';
  import CartDrawer from './components/CartDrawer.vue';

  import { useCartStore } from './stores/cart';

  const cartStore = useCartStore();
  
  const isCartOpen = ref(false);
  
  const openCart = () => {
    isCartOpen.value = true;
    document.body.style.overflow = 'hidden';
  };
  
  const closeCart = () => {
    isCartOpen.value = false;
    document.body.style.overflow = '';
  };

  onMounted(() => {
    cartStore.fetchAllProducts();
  });
</script>

<style scoped>

</style>