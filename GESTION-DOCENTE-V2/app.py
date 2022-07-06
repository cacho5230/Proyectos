from flask import Flask, render_template, redirect, request, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)

# Conexion a la DB
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'autogestiondocente'
mysql = MySQL(app)

# Clave de sesion
app.secret_key = 'claveDeSesion'


@app.route('/')
def Inicio():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM PERSONA')
    data = cur.fetchall()
    return render_template('index.html', persona=data)


@app.route('/add_persona', methods=['POST'])
def Add_persona():
    if request.method == 'POST':
        cuil = request.form['cuil']
        apellidos = request.form['apellidos']
        nombres = request.form['nombres']
        fechanac = request.form['fechanac']
        domicilio = request.form['domicilio']
        ciudad = request.form['ciudad']
        titulo = request.form['titulo']
        fechainicio = request.form['fechainicio']
        telefono = request.form['telefono']
        estado = request.form['estado']
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO persona (cuil,apellido,nombres,fechaNac,Domicilio,Ciudad,Titulo,FechInicioDoc,TelefonoDoc,EstadoDoc) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
                    (cuil, apellidos, nombres, fechanac, domicilio, ciudad, titulo, fechainicio, telefono, estado))
        mysql.connection.commit()
        flash('Datos cargados correctamente !')
        return redirect(url_for('Inicio'))


@app.route('/edit_persona/<id>' , methods=['POST', 'GET'])
def Edit_datos_sec(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM persona WHERE idPersonal = %s',(id,))
    data = cur.fetchall()
    cur.close()
    return render_template('edit_datos_sec.html', p=data[0])


@app.route('/update/<id>', methods=['POST'])
def update_datos(id):
    if request.method == 'POST':
        cuil = request.form['cuil']
        apellidos = request.form['apellidos']
        nombres = request.form['nombres']
        fechanac = request.form['fechanac']
        domicilio = request.form['domicilio']
        ciudad = request.form['ciudad']
        titulo = request.form['titulo']
        fechainicio = request.form['fechainicio']
        telefono = request.form['telefono']
        estado = request.form['estado']
        cur = mysql.connection.cursor()
        cur.execute('UPDATE persona SET cuil = %s, apellido = %s, nombres = %s,fechaNac = %s, Domicilio = %s, Ciudad = %s, Titulo = %s, FechInicioDoc = %s,TelefonoDoc = %s,EstadoDoc = %s WHERE idPersonal = %s', (cuil, apellidos, nombres, fechanac, domicilio, ciudad, titulo, fechainicio, telefono, estado,id))
        mysql.connection.commit()
        flash('datos actualizado correctamente')
        return redirect(url_for('Inicio'))


@app.route('/baja_persona/<string:id>' , methods=['POST', 'GET'])
def Baja_persona(id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM persona WHERE idPersonal = {0}'.format(id))
    mysql.connection.commit()
    flash('Persona inhabilitada correctamente !')
    return redirect(url_for('Inicio'))


if __name__ == '__main__':
    app.run(port=5000, debug=True)
