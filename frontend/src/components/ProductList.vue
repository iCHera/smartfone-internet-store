<template>
  <div class="product-grid">
    <div v-if="loading" class="status">Загрузка товаров...</div>
    <div v-else-if="error" class="status error">{{ error }}</div>

    <div v-else v-for="product in products" :key="product.id" class="product-card">
      <router-link :to="{ name: 'product', params: { id: product.id } }" target="_blank" class="image-link">
        <div class="image-wrapper">
          <img 
            v-if="product.image_url" 
            :src="product.image_url" 
            :alt="product.model_name" 
          />
          <div v-else class="no-image">Нет фото</div>
        </div>
      </router-link>

      <div class="info">
        <h3>{{ product.model_name }}</h3>
        <div class="specs">
          <span class="badge">{{ product.color }}</span>
          <span class="badge">{{ product.storage_gb }} GB</span>
        </div>
        <div class="price">{{ product.price }} BYN</div>
        <button
         class="buy-btn"
         @click.prevent="cartStore.addToCart(product)"
         >В корзину</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import api from '../services/api'; 
import { useCartStore } from '../stores/cart'; 

const cartStore = useCartStore();

const products = ref([]);
const error = ref(null);
const loading = ref(true);

const fetchProducts = async () => {
  try {
    const response = await api.getProducts();
    products.value = response.data;
  } catch (err) {
    console.error('Ошибка:', err);
    error.value = 'Ошибка загрузки каталога.';
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
  fetchProducts();
});
</script>

<style scoped>
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
  gap: 24px;
  padding: 20px 0;
}

.product-card {
  background: white;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
  transition: transform 0.2s, box-shadow 0.2s;
  display: flex;
  flex-direction: column;
}

.product-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}

.image-wrapper {
  height: 220px;
  padding: 20px;
  background: #f8f9fa;
  display: flex;
  align-items: center;
  justify-content: center;
}

img {
  max-height: 100%;
  max-width: 100%;
  object-fit: contain;
  mix-blend-mode: multiply;
}

.info {
  padding: 20px;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}

h3 {
  font-size: 1.1rem;
  margin: 0 0 10px 0;
  color: #1a1a1a;
}

.specs {
  display: flex;
  gap: 8px;
  margin-bottom: 15px;
}

.badge {
  font-size: 0.8rem;
  padding: 4px 8px;
  background: #f0f0f0;
  border-radius: 6px;
  color: #666;
}

.price {
  font-size: 1.4rem;
  font-weight: 700;
  color: #2c3e50;
  margin-top: auto;
  margin-bottom: 15px;
}

.buy-btn {
  width: 100%;
  padding: 12px;
  background: #0071e3;
  color: white;
  border: none;
  border-radius: 10px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s;
}

.buy-btn:hover {
  background: #0077ed;
}

.status {
  grid-column: 1 / -1;
  text-align: center;
  padding: 40px;
  font-size: 1.2rem;
  color: #666;
}

.error {
  color: #dc3545;
}
</style>