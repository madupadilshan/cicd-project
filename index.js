const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Wow! My CI/CD Pipeline is Working! V1.0');
});

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});