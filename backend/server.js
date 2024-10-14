const express = require('express');
const app = express();
const mysql = require('mysql2');
const port = 3000;

app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'lavandería_liliana'
});

db.connect((err) => {
    if(err){
        console.error('Error al conectar a la BD ', err);
    }
    console.log('Conectado a la BD!');
});

app.post('/api/gestionar-usuarios', (req, res) => {
    const {p_opcion, p_id_usuario, p_nombre_usuario, p_password } = req.body;

    let p_valid = 0;
    let p_error = '';
    let p_fecha_sistema = null;

    db.query('CALL sp_gestionar_usuarios(?, ?, ?, ?, ?, ?, ?)',
         [p_opcion, p_id_usuario, p_nombre_usuario, p_password, p_valid, p_error, p_fecha_sistema], 
         (err, result) => {
            if(err){
                return res.status(500).json({error: 'Error al ejecutar el procedimiento almacenado', details: err});
            }
            if (p_opcion == 4){
                res.json(results[0]);
            }else{
                res.json({
                    p_valid: p_valid,
                    p_error: p_error,
                    p_id_usuario: p_id_usuario,
                    p_fecha_sistema: p_fecha_sistema
                 });
            }
        }
    );
});

app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});