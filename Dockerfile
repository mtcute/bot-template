FROM node:18-alpine

RUN corepack enable && corepack prepare pnpm@7.11.0 --activate

WORKDIR /app

COPY package*.json pnpm*.yaml tsconfig.json .npmrc ./
RUN pnpm install --frozen-lockfile

COPY src /app/src
RUN pnpm run build

CMD [ "node", "/app/dist/index.js" ]
