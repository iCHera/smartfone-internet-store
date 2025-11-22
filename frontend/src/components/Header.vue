<template>
  <header>
    <div class="container header-content">
      <router-link :to="{ name: 'home', hash: '#hero' }" class="logo">📱 iStore</router-link>
      
      <div class="search-container" v-click-outside="closeSearch">
        <input 
          type="text" 
          class="search-input" 
          placeholder="Найти iPhone..."
          v-model="searchTerm"
          @focus="isSearchVisible = true"
        />
        
        <SearchResults 
          v-if="isSearchVisible && searchTerm.length > 1"
          :results="searchResults"
          :loading="cartStore.productsLoading"
          @click="closeSearch"
        />
      </div>

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

  import { ref, computed } from 'vue';
  import { useCartStore } from '../stores/cart';
  import SearchResults from './SearchResults.vue';

  const cartStore = useCartStore();

  const searchTerm = ref('');
  const isSearchVisible = ref(false);

  const searchResults = computed(() => {
    if (searchTerm.value.length < 2) {
      return []; 
    }
    const query = searchTerm.value.toLowerCase();
  
    return cartStore.allProducts.filter(product => 
      product.model_name.toLowerCase().includes(query)
    ).slice(0, 10); 
  });

  const closeSearch = () => { isSearchVisible.value = false; searchTerm.value = ''; };

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

.search-container {
  position: relative;
  flex-grow: 1; 
  max-width: 500px; 
}

.search-input {
  width: 100%;
  height: 40px;
  padding: 0 40px 0 20px;
  border-radius: 20px;
  border: 1px solid transparent; 
  background-color: #e8e8ed; 
  font-size: 0.95rem;
  font-family: var(--font-main);
  color: var(--text-main);
  transition: all 0.3s ease;
  margin-left: 20px;
}

.search-input::placeholder {
  color: #86868b;
}

.search-input:focus {
  outline: none;
  background-color: white; 
  border-color: var(--primary-color);
  box-shadow: 0 0 0 4px rgba(0, 113, 227, 0.15); 
}
</style>