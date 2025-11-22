<script setup>
defineProps({
  results: Array,
  loading: Boolean
});
</script>

<template>
  <div class="search-results">
    <div v-if="loading" class="result-item status-item">Загрузка...</div>

    <div v-else-if="results.length === 0" class="result-item status-item">Ничего не найдено.</div>

    <router-link
      v-else
      v-for="product in results"
      :key="product.id"
      :to="{ name: 'product', params: { id: product.id } }"
      class="result-item"
      target="_blank"
    >

      <img :src="product.image_url" alt="" class="result-img" v-if="product.image_url">
      <div v-else class="img-placeholder"></div>

      <div class="result-info">
        <span class="model-name">{{ product.model_name }}</span>
        <span class="specs">{{ product.storage_gb }} GB, {{ product.color }}</span>
      </div>

      <span class="price">{{ product.price }} BYN</span>
    </router-link>
  </div>
</template>

<style scoped>
.search-results {
  position: absolute;
  top: calc(100% + 5px); 
  left: 0;
  right: 0;
  background: white;
  border: 1px solid #ddd;
  border-radius: 12px;
  max-height: 400px;
  overflow-y: auto;
  box-shadow: 0 10px 20px rgba(0,0,0,0.1);
  z-index: 1001; 
}

.result-item {
  display: flex;
  align-items: center;
  padding: 10px 15px;
  border-bottom: 1px solid #f0f0f0;
  text-decoration: none;
  color: inherit;
  gap: 15px;
  transition: background-color 0.2s;
}

.result-item:last-child {
  border-bottom: none;
}

.result-item:hover {
  background-color: #f9f9f9;
}

.status-item {
  color: #888;
  justify-content: center;
}

.result-img, .img-placeholder {
  width: 40px;
  height: 40px;
  object-fit: contain;
  flex-shrink: 0;
}

.img-placeholder {
  background-color: #f0f0f0;
  border-radius: 4px;
}

.result-info {
  flex-grow: 1;
  min-width: 0;
}

.model-name {
  font-weight: 600;
  display: block;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.specs {
  font-size: 0.8rem;
  color: #888;
}

.price {
  font-weight: 600;
  color: var(--primary-color);
  white-space: nowrap;
}
</style>