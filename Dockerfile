FROM oven/bun:1-alpine AS build
WORKDIR /usr/src/app
COPY package.json bun.lock* ./
RUN bun install --frozen-lockfile --production
COPY . .
FROM oven/bun:1-alpine
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/node_modules ./node_module
COPY --from=build /usr/src/app/src ./src
EXPOSE 3000
CMD ["bun", "run", "src/index.ts"]