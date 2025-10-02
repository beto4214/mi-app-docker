FROM node:20(last pushed 19 hours ago)

# Habilitar Corepack para Yarn
RUN corepack enable && corepack prepare yarn@stable --activate

WORKDIR /usr/src/app

# Copiar archivos de configuración
COPY package.json yarn.lock .yarnrc.yml ./

# Instalar dependencias con Yarn (esto creará node_modules)
RUN yarn install --immutable

# Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
