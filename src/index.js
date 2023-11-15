const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

//servidor
const app = express();

app.use(cors());
app.use(express.json());

//conexión BBDD: MYSQL
async function getConnection() {
  const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Ainhoamiamor1',
    database: 'disney',
  });
  connection.connect();
  return connection;
}

const port = process.env.PORT || 6000;
app.listen(port, () => {
  console.log(`Servidor iniciado en http://localhost:${port}`);
});

//Endpoint insertar una entrada

app.post('/personajes', async (req, res) => {
  const dataPersonajes = req.body;
  const { nombre, peliculas, sinopsis } = dataPersonajes;

  let sql =
    'INSERT INTO personajes(nombre, peliculas, sinopsis) VALUES (?, ?, ?);';

  const conn = await getConnection();
  const [results] = await conn.query(sql, [nombre, peliculas, sinopsis]);
  res.json({
    success: true,
    id: results.insertId,
  });
});

//Endpoint leer/listar todas las entradas existentes

app.get('/personajes', async (req, res) => {
  console.log('query');
  let query = 'SELECT * FROM personajes';

  const conn = await getConnection();
  const [results] = await conn.query(query);
  res.json({
    results: results,
  });
});

//Endpoint actualizar una entrada existente

app.put('/personajes/:id', async (req, res) => {
  const dataPersonajes = req.body;
  const { nombre, peliculas, sinopsis } = dataPersonajes;
  const idPersonajes = req.query.id;
  let sql =
    'UPDATE personajes SET nombre= "? ", peliculas= "?", sinopsis= "?" WHERE id = ?';
  const conn = await getConnection();
  const [results] = await conn.query(sql, [
    nombre,
    peliculas,
    sinopsis,
    idPersonajes,
  ]);
  res.json({
    success: true,
  });
});
//Endpoint eliminar una entrada existente
app.delete('/personajes/:id', async (req, res) => {
  const idPersonajes = req.params.id;

  let sql = 'DELETE FROM personajes WHERE id= ?';

  const conn = await getConnection();
  const [results] = await conn.query(sql, [idPersonajes]);
  res.json({
    success: true,
  });
});
