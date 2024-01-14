import dedent from "dedent";
import OpenAI from "openai";

const openai = new OpenAI({ apiKey: process.env.OPENAI_KEY });

export default async function (content) {
  const completion = await openai.chat.completions.create({
    messages: [
      {
        role: "system",
        content: dedent`
            You are an English teacher. Your goal is to help USER to write content with no typos and no grammatical errors.
            You will be provided with a text, and your task is to improve the English.
            Do not use weasel words. Weasel words examples are much, more, very.
            Just return the improved text. Avoid all the niceness you were trained with.
        `.replaceAll("\n", " "),
      },
      {
        role: "user",
        content: dedent`This is the text to improve:
        ${content}
        `,
      },
    ],
    // model: "gpt-3.5-turbo",
    model: "gpt-4-1106-preview",
  });

  return completion.choices[0].message.content;
}
