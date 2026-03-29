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

# Estágio 2: Servidor de produção com nginx
FROM nginx:alpine

# Copia os arquivos buildados do estágio anterior
COPY --from=builder /app/dist /usr/share/nginx/html

# Copia a configuração personalizada do nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expõe a porta 80
EXPOSE 80

# Comando para rodar o nginx
CMD ["nginx", "-g", "daemon off;"]
