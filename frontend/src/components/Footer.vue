<template>
  <footer class="app-footer">
    <div class="container">
      
      <div class="footer-grid">
        <div class="footer-col">
          <router-link :to="{ name: 'home', hash: '#hero' }" class="footer-logo">📱 iStore</router-link>
          <p class="footer-desc">
            Ваш надежный партнер в мире технологий. 
            Только оригинальная техника и премиальный сервис.
          </p>
        </div>

        <div class="footer-col">
          <h4>Покупателям</h4>
          <ul>
            <li><router-link :to="{ hash: '#catalog' }">Каталог товаров</router-link></li>
            <li><router-link :to="{ hash: '#about' }">О компании</router-link></li>
            <li><a href="#">Доставка и оплата</a></li>
            <li><a href="#">Гарантия и возврат</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h4>Контакты</h4>
          <ul class="contacts-list">
            <li><a href="tel:+375291234567">+375 (29) 123-45-67</a></li>
            <li><a href="mailto:info@istore.by">info@istore.by</a></li>
            <li>г. Минск, пр. Победителей, 9, офис 101</li>
            <li>Пн-Вс: 10:00 - 21:00</li>
          </ul>
        </div>

        <div class="footer-col legal-info">
          <h4>Реквизиты</h4>
          <p>ООО "АйСтор Трейд"</p>
          <p>УНП: 193456789</p>
          <p class="small-text">
            Свидетельство о гос. регистрации №193456789 от 15.05.2018, 
            выдано Минским горисполкомом.
          </p>
          <p class="small-text">
            Регистрация в Торговом реестре РБ: №456123 от 20.06.2018.
          </p>
        </div>
      </div>

      <div class="footer-bottom">
        <p>&copy; 2010–2025 iStore. Все права защищены.</p>
        <div class="payment-icons">
          <span>VISA</span> • <span>MasterCard</span> • <span>Белкарт</span>
        </div>
      </div>

    </div>
  </footer>
</template>

<style scoped>
.app-footer {
  background-color: #1d1d1f;
  color: #f5f5f7; 
  padding: 60px 0 20px;
  margin-top: 80px; 
}

.footer-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 40px;
  margin-bottom: 40px;
}

.footer-logo {
  font-family: var(--font-heading);
  font-size: 1.5rem;
  font-weight: 700;
  color: white;
  display: inline-block;
  margin-bottom: 15px;
}

.footer-desc {
  color: #a1a1a6;
  font-size: 0.9rem;
  line-height: 1.5;
}

h4 {
  font-family: var(--font-heading);
  font-size: 1rem;
  margin-bottom: 20px;
  color: white;
}

ul {
  padding: 0;
  margin: 0;
  list-style: none;
}

li {
  margin-bottom: 10px;
}

a {
  color: #a1a1a6;
  font-size: 0.9rem;
  transition: color 0.2s;
}

a:hover {
  color: var(--primary-color);
}

.legal-info p {
  color: #a1a1a6;
  font-size: 0.9rem;
  margin-bottom: 8px;
}

.legal-info .small-text {
  font-size: 0.75rem;
  color: #6e6e73;
  line-height: 1.4;
  margin-top: 10px;
}

.footer-bottom {
  border-top: 1px solid #424245;
  padding-top: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 15px;
  color: #6e6e73;
  font-size: 0.8rem;
}

.payment-icons span {
  font-weight: 600;
  color: #a1a1a6;
}

@media (max-width: 768px) {
  .footer-grid {
    grid-template-columns: 1fr; 
    gap: 30px;
  }
  
  .footer-bottom {
    flex-direction: column;
    text-align: center;
  }
}
</style>