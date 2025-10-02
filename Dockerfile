FROM node:20

# Habilitar Corepack (ya trae Yarn)
RUN corepack enable

WORKDIR /usr/src/app

# Copia solo package.json (si aún no tienes yarn.lock)
COPY package.json ./

# Instalar dependencias con Yarn
RUN yarn install

# Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
