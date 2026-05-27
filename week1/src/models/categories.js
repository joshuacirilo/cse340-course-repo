import db from './db.js';

const getAllCategories = async () => {
    const query = `
        SELECT category_id, name
        FROM public.categories
        ORDER BY name;
    `;

    const result = await db.query(query);

    return result.rows;
};

const getCategoryDetails = async (categoryId) => {
    const query = `
        SELECT category_id, name
        FROM public.categories
        WHERE category_id = $1;
    `;
    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows.length > 0 ? result.rows[0] : null;
};

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT
            c.category_id,
            c.name
        FROM public.categories c
        JOIN public.service_project_categories spc
            ON c.category_id = spc.category_id
        WHERE spc.project_id = $1
        ORDER BY c.name;
    `;
    const queryParams = [projectId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

export { getAllCategories, getCategoryDetails, getCategoriesByProjectId };
