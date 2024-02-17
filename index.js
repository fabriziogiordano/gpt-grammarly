import "dotenv/config";

import { serve } from "@hono/node-server";
import { Hono } from "hono";
import openai from "./lib.js";

const app = new Hono();

app.post("/", async (c) => {
  const body = await c.req.json();
  const { message } = body;
  const response = await openai(message);
  return c.text(response);
});

serve({ fetch: app.fetch, port: 8787 });
