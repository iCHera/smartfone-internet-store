<template>
  <div class="checkout-page container">
    <h1>Оформление заказа</h1>

    <div v-if="cartStore.items.length === 0" class="empty-cart">
      <p>Ваша корзина пуста.</p>
      <router-link to="/" class="btn-primary">Вернуться в каталог</router-link>
    </div>

    <div v-else class="checkout-grid">

      <div class="form-section">
        <h2>Контактные данные</h2>
        <form @submit.prevent="submitOrder">
          <div class="form-group">
            <label>Имя</label>
            <input v-model="form.name" type="text" required placeholder="Иван Иванов">
          </div>
          
          <div class="form-group">
            <label>Телефон</label>
            <input v-model="form.phone" type="tel" required placeholder="+375 (29) 123-45-67">
          </div>

          <div class="form-group">
            <label>Адрес доставки</label>
            <input v-model="form.address" type="text" required placeholder="г. Минск, ул. Ленина, 1">
          </div>

          <div class="form-group">
            <label>Способ оплаты</label>
            <select v-model="form.paymentMethod">
              <option value="card">Картой онлайн</option>
              <option value="cash">Наличными курьеру</option>
              <option value="halva">Карта Халва</option>
            </select>
          </div>

          <button type="submit" class="btn-primary submit-btn" :disabled="isSubmitting">
            {{ isSubmitting ? 'Оформление...' : 'Подтвердить заказ' }}
          </button>
        </form>
      </div>

      <div class="order-summary">
        <h2>Ваш заказ</h2>
        <div class="summary-items">
          <div v-for="item in cartStore.items" :key="item.id" class="summary-item">
            <div class="item-name">
              {{ item.model_name }} 
              <span class="item-qty">x{{ item.quantity }}</span>
            </div>
            <div class="item-price">{{ item.price * item.quantity }} BYN</div>
          </div>
        </div>
        
        <div class="summary-total">
          <span>Итого к оплате:</span>
          <span class="total-price">{{ cartStore.totalPrice }} BYN</span>
        </div>
      </div>

    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useCartStore } from '../stores/cart';
import { useRouter } from 'vue-router';
import api from '../services/api';

const cartStore = useCartStore();
const router = useRouter();

const form = ref({
  name: '',
  phone: '',
  address: '',
  paymentMethod: 'card'
});

const isSubmitting = ref(false);

const submitOrder = async () => {
  if (cartStore.items.length === 0) return;
  
  isSubmitting.value = true;

  try {
    const orderData = {
      name: form.value.name,
      phone: form.value.phone,
      address: form.value.address,
      paymentMethod: form.value.paymentMethod,
      totalPrice: cartStore.totalPrice,
      items: cartStore.items 
    };

    const response = await api.createOrder(orderData);

    alert(`Ура! Заказ #${response.data.orderId} успешно оформлен! Спасибо, ${form.value.name}.`);
    
    cartStore.clearCart();
    router.push('/');

  } catch (err) {
    console.error(err);
    const errorMessage = err.response?.data?.message || 'Произошла ошибка при оформлении заказа.';
    alert(errorMessage);
  } finally {
    isSubmitting.value = false; 
  }
};
</script>

<style scoped>
.checkout-page {
  padding-top: 40px;
  padding-bottom: 80px;
}

.checkout-grid {
  display: grid;
  grid-template-columns: 1.5fr 1fr;
  gap: 60px;
}

.form-section {
  background: white;
  padding: 30px;
  border-radius: 20px;
  box-shadow: 0 5px 20px rgba(0,0,0,0.05);
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
  color: var(--text-main);
}

input, select {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ddd;
  border-radius: 10px;
  font-size: 1rem;
  font-family: inherit;
  transition: border-color 0.2s;
}

input:focus, select:focus {
  border-color: var(--primary-color);
  outline: none;
}

.submit-btn {
  width: 100%;
  margin-top: 10px;
  padding: 15px;
  font-size: 1.1rem;
}

.submit-btn:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.order-summary {
  background: #f9f9f9;
  padding: 30px;
  border-radius: 20px;
  height: fit-content;
}

.summary-items {
  margin-bottom: 20px;
  border-bottom: 1px solid #eee;
  padding-bottom: 20px;
}

.summary-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  font-size: 0.95rem;
}

.item-qty {
  color: var(--text-secondary);
  margin-left: 5px;
}

.summary-total {
  display: flex;
  justify-content: space-between;
  font-size: 1.3rem;
  font-weight: 700;
  color: var(--text-main);
}

.empty-cart {
  text-align: center;
  padding: 50px;
}

@media (max-width: 768px) {
  .checkout-grid {
    grid-template-columns: 1fr;
    gap: 30px;
  }
  
  .order-summary {
    order: -1; 
  }
}
</style>