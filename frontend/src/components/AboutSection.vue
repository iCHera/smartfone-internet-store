<template>
  <section id="about" class="about-section">
    <div class="container">

      <div class="section-header">
        <h2>Почему выбирают iStore?</h2>
        <p class="subtitle">Мы не просто продаем технику, мы дарим эмоции и комфорт.</p>
      </div>

      <div class="content-grid">
        <div class="text-block">
          <h3>Наша миссия</h3>
          <p>
            С 2010 года iStore является надежным проводником в мир высоких технологий в Беларуси. 
            Мы начинали как маленький магазинчик для энтузиастов, а выросли в крупнейшую сеть, 
            которой доверяют тысячи клиентов.
          </p>
          <p>
            Мы верим, что техника должна облегчать жизнь, а не усложнять её. Поэтому мы не просто 
            продаем коробку с телефоном, мы помогаем настроить, перенести данные и учим пользоваться 
            всеми функциями вашего нового гаджета.
          </p>
        </div>

        <div class="stats-grid">
          <div class="stat-card">
            <span class="stat-number">13+</span>
            <span class="stat-label">Лет на рынке</span>
          </div>
          <div class="stat-card">
            <span class="stat-number">50k+</span>
            <span class="stat-label">Довольных клиентов</span>
          </div>
          <div class="stat-card">
            <span class="stat-number">100%</span>
            <span class="stat-label">Оригинальная техника</span>
          </div>
          <div class="stat-card">
            <span class="stat-number">24/7</span>
            <span class="stat-label">Поддержка</span>
          </div>
        </div>
      </div>

      <div class="features-grid">
        <div class="feature-card">
          <div class="icon">🚀</div>
          <h4>Экспресс-доставка</h4>
          <p>Бесплатно доставим по Минску в течение 2-х часов. По всей Беларуси — курьером до двери за 1-2 дня.</p>
        </div>

        <div class="feature-card">
          <div class="icon">🛡️</div>
          <h4>Честная гарантия</h4>
          <p>Мы предоставляем полную официальную гарантию 12 месяцев. В случае брака — меняем устройство на новое без лишних вопросов.</p>
        </div>

        <div class="feature-card">
          <div class="icon">💳</div>
          <h4>Удобная оплата</h4>
          <p>Наличные, карты, карты рассрочки. Кредит и лизинг оформляем онлайн за 15 минут.</p>
        </div>

        <div class="feature-card">
          <div class="icon">🔄</div>
          <h4>Trade-In</h4>
          <p>Принесите свой старый iPhone или Samsung, и мы вычтем его стоимость из цены нового устройства. Честная оценка.</p>
        </div>
      </div>

    </div>
  </section>
</template>

<style scoped>

.section-header {
  text-align: center;
  margin-bottom: 60px;
}

.section-header h2 {
  font-size: 2.5rem;
  margin-bottom: 10px;
  color: var(--text-main);
}

.subtitle {
  font-size: 1.2rem;
  color: var(--text-secondary);
  max-width: 600px;
  margin: 0 auto;
}

.content-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: center;
  margin-bottom: 20px;
}

.text-block h3 {
  font-size: 1.8rem;
  margin-bottom: 20px;
  color: var(--primary-color);
}

.text-block p {
  font-size: 1.1rem;
  line-height: 1.6;
  color: #555;
  margin-bottom: 20px;
}

.stats-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

.stat-card {
  background: #f9f9f9;
  padding: 30px;
  border-radius: 16px;
  text-align: center;
  transition: transform 0.3s ease;
}

.stat-card:hover {
  transform: translateY(-5px);
  background: #f0f4ff;
}

.stat-number {
  display: block;
  font-size: 2.5rem;
  font-weight: 800;
  color: var(--primary-color);
  margin-bottom: 5px;
}

.stat-label {
  font-size: 0.9rem;
  color: var(--text-secondary);
  font-weight: 500;
}

/* Преимущества */
.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
}

.feature-card {
  padding: 30px;
  border: 1px solid #eee;
  border-radius: 20px;
  transition: all 0.3s ease;
  background: #fff;
}

.feature-card:hover {
  box-shadow: 0 10px 30px rgba(0,0,0,0.08);
  border-color: transparent;
}

.icon {
  font-size: 3rem;
  margin-bottom: 20px;
}

.feature-card h4 {
  font-size: 1.3rem;
  margin-bottom: 10px;
}

.feature-card p {
  color: var(--text-secondary);
  line-height: 1.5;
}

@media (max-width: 768px) {
  .content-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  
  .section-header h2 {
    font-size: 2rem;
  }
}
</style>