<template>
  <div class="product-page container">
    <div v-if="loading" class="loading">Загрузка...</div>
    <div v-else-if="error" class="error">{{ error }}</div>

    <div v-else class="product-details">
      <div class="gallery">
        <div class="main-image">
          <img 
            v-if="product.images.length > 0" 
            :src="product.images[currentImageIndex]" 
            :alt="product.model_name" 
          />
          <div v-else class="no-image">Нет фото</div>
        </div>

        <div class="thumbnails" v-if="product.images.length > 1">
          <img 
            v-for="(img, index) in product.images" 
            :key="index" 
            :src="img" 
            :class="{ active: index === currentImageIndex }"
            @click="currentImageIndex = index"
          />
        </div>
      </div>

      <div class="info">
        <h1>{{ product.model_name }}</h1>
        <p class="color-desc">{{ product.color_description }}</p>

        <div class="specs-box">
          <div class="spec">
            <span class="label">Память:</span>
            <span class="value">{{ product.storage_gb }} GB</span>
          </div>
          <div class="spec">
            <span class="label">Цвет:</span>
            <span class="value">{{ product.color }}</span>
          </div>
          <div class="spec">
            <span class="label">Процессор:</span>
            <span class="value">{{ product.processor_name }}</span>
          </div>
          <div class="spec">
            <span class="label">Экран:</span>
            <span class="value">{{ product.display_size_in }}"</span>
          </div>
        </div>

        <div class="price-block">
          <div class="price">{{ product.price }} BYN</div>
          <div class="stock" v-if="product.stock_quantity > 0">В наличии</div>
          <div class="stock out" v-else>Нет в наличии</div>
        </div>

        <button
          class="btn-primary buy-btn"
          @click="cartStore.addToCart(product)"
          :disabled="!canAddToCart"
         >{{ !canAddToCart && product.stock_quantity > 0 ? 'Больше нет в наличии' : (product.stock_quantity > 0 ? 'Добавить в корзину' : 'Нет в наличии') }}</button>

        <div class="description">
          <h3>Описание</h3>
          <p>{{ product.model_description }}</p>
        </div>
      </div>

    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { useRoute } from 'vue-router';
import api from '../services/api';
import { useCartStore } from '../stores/cart';

const cartStore = useCartStore();

const route = useRoute();
const product = ref(null);
const loading = ref(true);
const error = ref(null);
const currentImageIndex = ref(0); 

const fetchProduct = async () => {
  try {
    const id = route.params.id;
    const response = await api.getProductById(id);
    product.value = response.data;
  } catch (err) {
    console.error(err);
    error.value = 'Не удалось загрузить информацию о товаре.';
  } finally {
    loading.value = false;
  }
};

const quantityInCart = computed(() => {
  if (!product.value) return 0;
  const item = cartStore.items.find(i => i.id === product.value.id);
  return item ? item.quantity : 0;
});

const canAddToCart = computed(() => {
  if (!product.value) return false;
  return product.value.stock_quantity > quantityInCart.value;
});

onMounted(() => {
  fetchProduct();
});
</script>

<style scoped>
.product-page {
  padding-top: 40px;
  padding-bottom: 80px;
}

.product-details {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: start;
}

.main-image {
  background: white;
  border-radius: 20px;
  padding: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 500px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.05);
  margin-bottom: 20px;
}

.main-image img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

.thumbnails {
  display: flex;
  gap: 15px;
  justify-content: center;
}

.thumbnails img {
  width: 80px;
  height: 80px;
  object-fit: contain;
  border: 2px solid transparent;
  border-radius: 12px;
  background: white;
  cursor: pointer;
  padding: 5px;
  transition: all 0.2s;
}

.thumbnails img.active {
  border-color: var(--primary-color);
}

h1 {
  font-size: 2.5rem;
  margin-bottom: 10px;
}

.color-desc {
  color: var(--text-secondary);
  font-size: 1.1rem;
  margin-bottom: 30px;
}

.specs-box {
  background: #fff;
  padding: 20px;
  border-radius: 16px;
  margin-bottom: 30px;
  border: 1px solid var(--border-color);
}

.spec {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid #eee;
}

.spec:last-child {
  border-bottom: none;
}

.spec .label {
  color: var(--text-secondary);
}

.spec .value {
  font-weight: 600;
}

.price-block {
  display: flex;
  align-items: center;
  gap: 20px;
  margin-bottom: 30px;
}

.price {
  font-size: 2.5rem;
  font-weight: 800;
  color: var(--text-main);
}

.stock {
  background: #e6f4ea;
  color: #1e8e3e;
  padding: 5px 12px;
  border-radius: 20px;
  font-weight: 600;
  font-size: 0.9rem;
}

.stock.out {
  background: #fce8e6;
  color: #d93025;
}

.buy-btn {
  width: 100%;
  padding: 18px;
  font-size: 1.2rem;
  margin-bottom: 40px;
}

.description h3 {
  font-size: 1.5rem;
  margin-bottom: 15px;
}

.description p {
  line-height: 1.8;
  color: #444;
}

button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
  transform: none;
}

@media (max-width: 900px) {
  .product-details {
    grid-template-columns: 1fr;
    gap: 30px;
  }
  
  .main-image {
    height: 350px;
  }
}
</style>