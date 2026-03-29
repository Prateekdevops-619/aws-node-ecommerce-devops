const express = require('express');
const app = express();
const PORT = 3003; // Change this for each folder!

app.get('/', (req, res) => {
  res.send("<h1>User Service is Running</h1>");
});

app.listen(PORT, () => {
  console.log(`Service running on port ${PORT}`);
});