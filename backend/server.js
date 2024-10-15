const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'lavandería_liliana'
});

db.connect((err) => {
    if (err) {
        console.error('Error al conectar a la BD ', err);
        return;
    }
    console.log('Conectado a la BD!');
});

app.post('/api/gestionar-usuarios', (req, res) => {
    const { p_opcion, p_nombre_usuario, p_password } = req.body;

    // Declarar variables de salida para el procedimiento
    let p_valid = 0; // Inicializamos como 0
    let p_error = '';
    let p_fecha_sistema = null;

    // Llamar al procedimiento almacenado
    db.query('CALL gestionar_usuarios(?, @p_valid, @p_error, NULL, ?, ?, @p_fecha_sistema)', 
        [p_opcion, p_nombre_usuario, p_password], 
        (err) => {
            if (err) {
                console.error('Error al ejecutar el procedimiento almacenado', err);
                return res.status(500).json({ error: 'Error interno del servidor', details: err });
            }

            // Recuperar los valores de los parámetros de salida
            db.query('SELECT @p_valid AS p_valid, @p_error AS p_error, @p_fecha_sistema AS p_fecha_sistema', (err, output) => {
                if (err) {
                    console.error('Error al recuperar parámetros de salida', err);
                    return res.status(500).json({ error: 'Error interno del servidor', details: err });
                }
                res.json({
                    p_valid: output[0].p_valid,
                    p_error: output[0].p_error,
                    p_fecha_sistema: output[0].p_fecha_sistema
                });
            });
        }
    );
});

app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
