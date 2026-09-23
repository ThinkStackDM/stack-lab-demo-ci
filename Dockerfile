# Layer ordering demonstrates build-once: dependency layers only invalidate
# when package*.json changes; the source layer is copied last so editing
# src/ never busts the (expensive) npm ci layer above it.
FROM node:20-slim AS deps
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

FROM node:20-slim AS runtime
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY package.json package-lock.json ./
COPY src ./src
CMD ["node", "src/index.js"]
