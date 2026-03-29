import './style.css';

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div class="container">
    <div class="content">
      <div class="icon">
        <svg width="80" height="80" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 2C10.8954 2 10 2.89543 10 4C10 5.10457 10.8954 6 12 6C13.1046 6 14 5.10457 14 4C14 2.89543 13.1046 2 12 2Z" fill="currentColor"/>
          <path d="M12 8C9.79086 8 8 9.79086 8 12V16C8 18.2091 9.79086 20 12 20C14.2091 20 16 18.2091 16 16V12C16 9.79086 14.2091 8 12 8Z" fill="currentColor"/>
          <path d="M7 11C7 10.4477 6.55228 10 6 10C5.44772 10 5 10.4477 5 11V14C5 14.5523 5.44772 15 6 15C6.55228 15 7 14.5523 7 14V11Z" fill="currentColor"/>
          <path d="M18 10C18.5523 10 19 10.4477 19 11V14C19 14.5523 18.5523 15 18 15C17.4477 15 17 14.5523 17 14V11C17 10.4477 17.4477 10 18 10Z" fill="currentColor"/>
        </svg>
      </div>
      <h1>Sistema Veterinário</h1>
      <p class="subtitle">Gestão completa para clínicas veterinárias</p>
      <div class="status">
        <span class="status-dot"></span>
        <span>Sistema em desenvolvimento</span>
      </div>
    </div>
  </div>
`;
