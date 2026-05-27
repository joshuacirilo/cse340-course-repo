import db from './db.js';

const getAllProjects = async () => {
    const query = `
        SELECT
            sp.project_id,
            sp.organization_id,
            sp.title,
            sp.description,
            sp.location,
            sp.date,
            o.name AS organization_name
        FROM public.service_projects sp
        JOIN public.organizations o
            ON sp.organization_id = o.organization_id
        ORDER BY sp.date;
    `;

      const queryParams = [organizationId];
      const result = await db.query(query, queryParams);

      return result.rows;
};

export { getAllProjects };


// Export the model functions
export { getAllProjects, getProjectsByOrganizationId };