<template>
  <header>
    <div class="container header-content">
      <router-link :to="{ name: 'home', hash: '#hero' }" class="logo">📱 iStore</router-link>
      
      <nav>
        <router-link :to="{ name: 'home', hash: '#about' }">О нас</router-link>
        <router-link :to="{ name: 'home', hash: '#catalog' }">Каталог</router-link>
        
        <button class="cart-btn" @click="$emit('open-cart')">
          🛒 Корзина
          <span v-if="cartStore.totalItems > 0" class="cart-badge">
            {{ cartStore.totalItems }}
          </span>
        </button>
      </nav>
    </div>
  </header>
</template>

<script setup>
import { useCartStore } from '../stores/cart';
const emit = defineEmits(['open-cart']);
const cartStore = useCartStore();
</script>

<style scoped>
header {
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(20px);
  position: sticky;
  top: 0;
  z-index: 100;
  border-bottom: 1px solid rgba(0,0,0,0.1);
}

.header-content {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  font-weight: 700;
  font-size: 1.5rem;
  text-decoration: none;
}

nav {
  display: flex;
  align-items: center;
}

nav a {
  margin-left: 20px;
  text-decoration: none;
  color: #424245;
  font-size: 0.9rem;
  transition: color 0.2s;
}

nav a:hover {
  color: #0071e3;
}

.router-link-active {
  font-weight: 500;
}

.cart-btn {
  margin-left: 20px;
  background: none;
  border: 1px solid #ddd;
  padding: 8px 15px;
  border-radius: 20px;
  cursor: pointer;
  font-size: 0.9rem;
  transition: all 0.2s;
  color: #333;
}

.cart-btn:hover {
  background: #f5f5f7;
  border-color: #bbb;
}
</style>