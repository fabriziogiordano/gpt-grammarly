# GPT Grammarly

Example text:
I was thinking ti make this importand decision but i need your support


Some usefull commands:
```
curl -X POST -H "Content-Type: application/json" -d '{ "message": "I was thinking ti make this importand decision but i need your support" }' http://localhost:8787

npm install pm2 -g
pm2 start index.js --name gpt-grammarly --watch
```