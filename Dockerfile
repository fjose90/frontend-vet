# Estágio 1: Build da aplicação
FROM node:24.14.1-alpine AS builder

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY package*.json ./

# Instala as dependências
RUN npm ci

# Copia o código fonte
COPY . .

# Faz o build da aplicação
RUN npm run build

# Estágio 2: Servidor de produção com caddy
FROM caddy:2-alpine

# Copia os arquivos buildados do estágio anterior
COPY --from=builder /app/dist /usr/share/caddy

# Copia a configuração personalizada do caddy
COPY Caddyfile /etc/caddy/Caddyfile

# Expõe a porta 80
EXPOSE 80

# Comando para rodar o caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
