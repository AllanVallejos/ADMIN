from flask_sqlalchemy import SQLAlchemy
import os

db = SQLAlchemy()

def init_db(app):
    basedir = os.path.abspath(os.path.dirname(__file__))

    # Carpeta para guardar la base de datos
    db_folder = os.path.join(basedir, 'db')
    os.makedirs(db_folder, exist_ok=True)  # Crea la carpeta si no existe

    # Ruta del archivo de base de datos
    db_path = os.path.join(db_folder, 'tasks.db')

    # Configuración de SQLAlchemy
    app.config['SQLALCHEMY_DATABASE_URI'] = f'sqlite:///{db_path}'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)

    # Crear las tablas si no existen
    with app.app_context():
        try:
            db.create_all()
            print("✅ Base de datos creada en:", db_path)
        except Exception as e:
            print(f"❌ Error creando la base de datos: {e}")
