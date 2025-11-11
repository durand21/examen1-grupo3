import express from 'express';

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.json({ mensaje: "API funcionando", db: process.env.DB_HOST || "desconocido" });
});

app.get('/salud', (req, res) => {
  res.json({ status: "ok" });
});

app.listen(PORT, () => {
  console.log(`API escuchando en puerto ${PORT}`);
});
