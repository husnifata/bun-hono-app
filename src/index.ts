import { Hono } from "hono";

const app = new Hono();

app.get("/", (c) => {
  return c.text("Haloooooo, Ini adalah aplikasi Bun + Hono saya.");
});

export default {
  port: 3000,
  fetch: app.fetch,
};
