# Estágio 1: Build da aplicação
FROM node:24.14.1-alpine AS builder

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY package.json pnpm-lock.yaml ./

# Evita hooks de git durante o build do container
ENV HUSKY=0

# Instala pnpm e dependências de forma determinística
RUN corepack enable && corepack prepare pnpm@10.33.0 --activate && pnpm install --frozen-lockfile

# Copia o código fonte
COPY . .

# Faz o build da aplicação
RUN pnpm run build

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
