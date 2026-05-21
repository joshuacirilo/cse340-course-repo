import pg from 'pg';

const { Pool } = pg;

const pool = new Pool({
    connectionString: process.env.DB_URL,
    connectionTimeoutMillis: 5000,
    ssl: {
        rejectUnauthorized: false,
    },
});

const query = async (sql, params) => {
    const result = await pool.query(sql, params);
    return result;
};

const testConnection = async () => {
    await pool.query('SELECT NOW()');
    console.log('Database connection successful');
};

export { pool, query, testConnection };
