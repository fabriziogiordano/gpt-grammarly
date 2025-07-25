import openai from "./openai.ts"

const PORT = 8787;

console.log("Starting Grammarly Server");

Bun.serve({
  port: PORT,
  routes: {
    // Per-HTTP method handlers
    "/": {
      GET: () => new Response("List posts"),
      POST: async req => {
        const { message } = await req.json();
        console.log(message);
        const response = await openai(message);
        console.log(response);
        return new Response(response);
      },
    },
  },
  fetch(req) {
    console.log("Not Found: 404 Error");
    return new Response("Not Found: 404", { status: 404 });
  },
});