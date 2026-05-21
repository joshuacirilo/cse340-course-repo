import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';


// Define the the application environment
const nodeEnv = process.env.NODE_ENV?.toLowerCase() || 'production';
const currentFile = fileURLToPath(import.meta.url);
const currentDir = path.dirname(currentFile);
const app = express();

// Define the port number the server will listen on
const port = process.env.PORT || 3000;

/**
  * Configure Express middleware
  */

// Serve static files from the public directory
app.use(express.static(path.join(currentDir, 'public')));

// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Tell Express where to find your templates
app.set('views', path.join(currentDir, 'src/views'));

/**
 * Routes
 */
app.get('/', async (req, res) => {
    const title = 'Home';
    res.render('home', { title });
});

app.get('/organizations', async (req, res) => {
    const title = 'Our Partner Organizations';
    res.render('organizations', { title });
});

app.get('/projects', async (req, res) => {
    const title = 'Service Projects';
    res.render('projects', { title });
});

app.get('/categories', async (req, res) => {
    const title = 'Service Project Categories';
    res.render('categories', { title });
});


app.listen(port, () => {
  console.log(`Server is running at http://127.0.0.1:${port}`);
  console.log(`Environment: ${nodeEnv}`);
});
