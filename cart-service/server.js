const express = require('express');
const app = express();
const PORT = 3004; 

app.get('/', (req, res) => {
  res.send("<h1>User Service is Running</h1>");
});

app.listen(PORT, () => {
  console.log(`Service running on port ${PORT}`);
});