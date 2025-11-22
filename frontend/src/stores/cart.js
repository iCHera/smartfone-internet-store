import { defineStore } from 'pinia';
import { ref, computed, watch } from 'vue'; 

export const useCartStore = defineStore('cart', () => {

  const items = ref([]);
  const itemsFromStorage = localStorage.getItem('cartItems');
  if (itemsFromStorage) {
    items.value = JSON.parse(itemsFromStorage);
  }

  watch(items, (newItems) => {
    localStorage.setItem('cartItems', JSON.stringify(newItems));
  }, { deep: true }); 

  const totalItems = computed(() => {
    return items.value.reduce((sum, item) => sum + item.quantity, 0);
  });

  const totalPrice = computed(() => {
    return items.value.reduce((sum, item) => sum + (item.price * item.quantity), 0);
  });

  const addToCart = (product) => {
    const existingItem = items.value.find(item => item.id === product.id);

    if (existingItem) {
      if (existingItem.quantity < product.stock_quantity) {
        existingItem.quantity++;
      } else {
        alert(`Извините, доступно всего ${product.stock_quantity} шт.`);
      }
    } else {
      if (product.stock_quantity > 0) {
        items.value.push({ ...product, quantity: 1 });
      } else {
        alert('Товара нет в наличии');
      }
    }
  };

  const removeFromCart = (productId) => {
    items.value = items.value.filter(item => item.id !== productId);
  };

  const decreaseQuantity = (productId) => {
    const item = items.value.find(item => item.id === productId);
    if (item) {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        removeFromCart(productId);
      }
    }
  };

  const clearCart = () => {
    items.value = [];
  };

  return {
    items,
    totalItems,
    totalPrice,
    addToCart,
    removeFromCart,
    decreaseQuantity,
    clearCart
  };
});