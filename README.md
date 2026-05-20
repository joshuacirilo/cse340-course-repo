# CSE 340 Course Repo

Proyecto de practica para CSE 340 usando Node.js y Express.

## Requisitos

Antes de ejecutar el proyecto, instala:

- [Node.js](https://nodejs.org/) version 20 o superior
- npm, que se instala junto con Node.js

Puedes verificar la instalacion con:

```bash
node --version
npm --version
```

## Instalacion

Desde la raiz del repositorio, entra a la carpeta del proyecto de la semana 1:

```bash
cd week1
```

Instala las dependencias:

```bash
npm install
```

Esto instalara:

- `express`: framework para crear el servidor web
- `nodemon`: herramienta de desarrollo para reiniciar el servidor automaticamente

## Variables de entorno

El proyecto usa un archivo `.env` local. Este archivo no se sube a Git.

Crea un archivo llamado `.env` dentro de `week1`:

```bash
PORT=3000
NODE_ENV=development
```

## Ejecutar el proyecto

Para desarrollo:

```bash
npm run dev
```

Para ejecutar sin nodemon:

```bash
npm start
```

Luego abre:

```text
http://127.0.0.1:3000
```

## Archivos que no se suben

El repositorio incluye un `.gitignore` para evitar subir archivos generados o locales, como:

- `node_modules/`
- `.env`
- archivos de logs
- carpetas de cache o build
