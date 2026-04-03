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

# Evita erro "operation not permitted" em runtimes com no_new_privs
# removendo file capabilities do binário ao recopiá-lo.
USER root
RUN cp /usr/bin/caddy /usr/bin/caddy.bin && mv /usr/bin/caddy.bin /usr/bin/caddy

# Copia os arquivos buildados do estágio anterior
COPY --from=builder /app/dist /usr/share/caddy

# Copia a configuração personalizada do caddy
COPY Caddyfile /etc/caddy/Caddyfile

# Expõe a porta padrão local (Render injeta PORT em runtime)
EXPOSE 8080

# Comando para rodar o caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
