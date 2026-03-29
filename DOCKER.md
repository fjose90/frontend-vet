# 🐳 Deploy com Docker - Frontend VET

## 📁 Arquivos criados:

1. **`.nvmrc`** - Especifica a versão do Node.js (24.14.1)
2. **`Dockerfile`** - Configuração multi-stage para build otimizado
3. **`.dockerignore`** - Arquivos ignorados no build do Docker
4. **`docker-compose.yml`** - Orquestração simplificada
5. **`nginx.conf`** - Configuração do servidor web com otimizações

---

## 🚀 Como usar:

### Opção 1: Com Docker Compose (Recomendado)

```bash
# 1. Build e inicia o container
docker-compose up -d --build

# 2. Acesse no navegador:
http://localhost:3000

# 3. Ver logs
docker-compose logs -f

# 4. Parar o container
docker-compose down
```

### Opção 2: Com Docker direto

```bash
# 1. Build da imagem
docker build -t frontend-vet:latest .

# 2. Rodar o container
docker run -d -p 3000:80 --name frontend-vet frontend-vet:latest

# 3. Acesse no navegador:
http://localhost:3000

# 4. Ver logs
docker logs frontend-vet

# 5. Parar e remover
docker stop frontend-vet
docker rm frontend-vet
```

---

## 📦 O que cada arquivo faz:

### Dockerfile
- **Estágio 1 (builder)**: Compila a aplicação TypeScript/Vite
- **Estágio 2 (nginx)**: Serve os arquivos estáticos com nginx
- Resultado: Imagem pequena e otimizada (~25MB)

### nginx.conf
- Compressão gzip para melhor performance
- Cache de assets estáticos (1 ano)
- Suporte para SPA (Single Page Application)
- Headers de segurança

### .dockerignore
- Exclui node_modules e arquivos desnecessários
- Reduz o tamanho do contexto de build
- Build mais rápido

---

## 🔧 Comandos úteis:

```bash
# Rebuild (após mudanças no código)
docker-compose up -d --build

# Entrar no container
docker exec -it frontend-vet sh

# Ver tamanho da imagem
docker images frontend-vet

# Limpar imagens antigas
docker image prune -a
```

---

## 🌍 Deploy em produção:

Para produção, você pode:
1. Fazer push da imagem para um registry (Docker Hub, AWS ECR, etc.)
2. Deploy em serviços como: AWS ECS, Google Cloud Run, DigitalOcean, etc.
3. Ou usar em um servidor VPS com docker-compose

```bash
# Exemplo: Push para Docker Hub
docker tag frontend-vet:latest seu-usuario/frontend-vet:latest
docker push seu-usuario/frontend-vet:latest
```
