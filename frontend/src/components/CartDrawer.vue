<template>
  <div class="drawer-overlay" :class="{ open: isOpen }" @click="emit('close')"></div>

  <div class="drawer" :class="{ open: isOpen }">
    <div class="drawer-header">
      <h2>Корзина <span v-if="cartStore.totalItems > 0">({{ cartStore.totalItems }})</span></h2>
      <button class="close-btn" @click="emit('close')">✕</button>
    </div>

    <div class="drawer-body">
      <p v-if="cartStore.items.length === 0" class="empty-text">
        Ваша корзина пока пуста
      </p>

      <div v-else class="cart-items">
        <div v-for="item in cartStore.items" :key="item.id" class="cart-item">
          <div class="item-img">
            <img :src="item.image_url || item.images?.[0]" :alt="item.model_name">
          </div>
          
          <div class="item-info">
            <h4>{{ item.model_name }}</h4>
            <p class="item-spec">{{ item.color }}, {{ item.storage_gb }} GB</p>
            <div class="item-price">{{ item.price }} BYN</div>
          </div>

          <div class="item-controls">
            <button @click="cartStore.decreaseQuantity(item.id)">−</button>
            <span>{{ item.quantity }}</span>
            <button 
              @click="cartStore.addToCart(item)"
              :disabled="item.quantity >= item.stock_quantity"
              :class="{ disabled: item.quantity >= item.stock_quantity }"
            >+</button>
          </div>
          
          <button class="remove-btn" @click="cartStore.removeFromCart(item.id)">×</button>
        </div>
      </div>
    </div>

    <div class="drawer-footer" v-if="cartStore.items.length > 0">
      <div class="total">
        <span>Итого:</span>
        <span>{{ cartStore.totalPrice }} BYN</span>
      </div>
      <button class="checkout-btn" @click="goToCheckout">Оформить заказ</button>
    </div>
  </div>
</template>

<script setup>
import { useCartStore } from '../stores/cart';
import { useRouter } from 'vue-router';

const router = useRouter();

const goToCheckout = () => {
  emit('close'); 
  router.push('/checkout'); 
};

defineProps({
  isOpen: Boolean
});

const emit = defineEmits(['close']);
const cartStore = useCartStore(); 

</script>

<style scoped>
.drawer-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 900;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
}

.drawer-overlay.open {
  opacity: 1;
  visibility: visible;
}

.drawer {
  position: fixed;
  top: 0;
  right: -450px; 
  width: 100%;
  max-width: 450px; 
  height: 100%;
  background: white;
  z-index: 1000;
  box-shadow: -5px 0 15px rgba(0,0,0,0.1);
  transition: right 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  display: flex;
  flex-direction: column;
}

.drawer.open {
  right: 0;
}

.drawer-header {
  padding: 20px;
  border-bottom: 1px solid #eee;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.drawer-header h2 {
  margin: 0;
  font-size: 1.5rem;
}

.close-btn {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  color: #666;
}

.drawer-body {
  flex-grow: 1;
  padding: 20px;
  overflow-y: auto;
}

.empty-text {
  text-align: center;
  color: #999;
  margin-top: 50px;
}

.drawer-footer {
  padding: 20px;
  border-top: 1px solid #eee;
  background: #f9f9f9;
}

.total {
  display: flex;
  justify-content: space-between;
  font-weight: bold;
  font-size: 1.2rem;
  margin-bottom: 15px;
}

.checkout-btn {
  width: 100%;
  padding: 15px;
  background: #0071e3;
  color: white;
  border: none;
  border-radius: 10px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
}

.checkout-btn:hover {
  background: #0077ed;
}

.cart-items {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.cart-item {
  display: flex; 
  align-items: center;
  gap: 15px; 
  padding-bottom: 15px;
  border-bottom: 1px solid #f0f0f0;
  position: relative;
}

.item-img {
  width: 80px; 
  height: 80px; 
  background: #f9f9f9;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0; 
  padding: 5px;
}

.item-img img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain; 
  mix-blend-mode: multiply; 
}

.item-info {
  flex-grow: 1; 
  min-width: 0; 
}

.item-info h4 {
  margin: 0 0 5px 0;
  font-size: 0.95rem;
  font-weight: 600;
  line-height: 1.2;
}

.item-spec {
  margin: 0;
  font-size: 0.8rem;
  color: #888;
}

.item-price {
  margin-top: 5px;
  font-weight: 700;
  color: var(--text-main);
  font-size: 0.95rem;
}

.item-controls {
  display: flex;
  align-items: center;
  gap: 8px;
  background: #f5f5f7;
  padding: 4px 8px;
  border-radius: 8px;
  flex-shrink: 0; 
}

.item-controls button {
  background: none;
  border: none;
  font-size: 1.2rem;
  line-height: 1;
  cursor: pointer;
  color: #0071e3;
  padding: 0 4px;
  display: flex;
  align-items: center;
}

.item-controls span {
  font-weight: 600;
  font-size: 0.9rem;
  min-width: 18px;
  text-align: center;
}

.remove-btn {
  background: none;
  border: none;
  color: #ccc;
  font-size: 1.5rem;
  line-height: 1;
  cursor: pointer;
  padding: 0 0 0 5px;
  transition: color 0.2s;
  align-self: flex-start;
  margin-top: -5px;
}

.remove-btn:hover {
  color: #ff3b30;
}

.item-controls button:disabled {
  color: #ccc;
  cursor: not-allowed;
}
</style>