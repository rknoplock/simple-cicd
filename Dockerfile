# Use a imagem oficial do Nginx como base
FROM nginx:alpine

# Copiar o arquivo HTML da pasta src para o diretório do Nginx
COPY src/index.html /usr/share/nginx/html/index.html

# Exponha a porta 80
EXPOSE 80

# Comando padrão para rodar o Nginx
CMD ["nginx", "-g", "daemon off;"]

