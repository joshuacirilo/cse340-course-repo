-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organizations (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organizations (
    name,
    description,
    contact_email,
    logo_filename
)
VALUES
(
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
),
(
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
),
(
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
);


CREATE TABLE service_projects (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    date DATE NOT NULL,

    CONSTRAINT fk_service_projects_organizations
        FOREIGN KEY (organization_id)
        REFERENCES organizations(organization_id)
);


INSERT INTO service_projects 
(organization_id, title, description, location, date)
VALUES
-- Projects for organization 1
(1, 'Community Food Drive', 'Collect and distribute food to families in need.', 'Guatemala City', '2026-06-01'),
(1, 'Neighborhood Cleanup', 'Clean streets, parks, and public spaces with volunteers.', 'Zone 1, Guatemala City', '2026-06-08'),
(1, 'Clothing Donation Campaign', 'Collect clothes and distribute them to low-income families.', 'Mixco', '2026-06-15'),
(1, 'School Supplies Drive', 'Collect notebooks, pencils, and backpacks for students.', 'Villa Nueva', '2026-06-22'),
(1, 'Senior Citizen Support Day', 'Provide food, company, and basic support to senior citizens.', 'San Miguel Petapa', '2026-06-29'),

-- Projects for organization 2
(2, 'Tree Planting Project', 'Plant trees to improve green areas in the community.', 'Antigua Guatemala', '2026-07-03'),
(2, 'River Cleanup Activity', 'Remove trash and plastic from local river areas.', 'Amatitlán', '2026-07-10'),
(2, 'Recycling Awareness Workshop', 'Teach community members about recycling and waste reduction.', 'Guatemala City', '2026-07-17'),
(2, 'Community Garden Setup', 'Create a small garden to grow vegetables for the community.', 'Villa Canales', '2026-07-24'),
(2, 'Environmental Education Day', 'Provide talks and activities about protecting the environment.', 'Santa Catarina Pinula', '2026-07-31'),

-- Projects for organization 3
(3, 'Free Technology Workshop', 'Teach basic computer skills to young students.', 'Guatemala City', '2026-08-05'),
(3, 'English Practice Club', 'Help students practice basic English conversation skills.', 'Mixco', '2026-08-12'),
(3, 'Math Tutoring Program', 'Provide tutoring sessions for students who need academic support.', 'Villa Nueva', '2026-08-19'),
(3, 'Resume Building Workshop', 'Help young adults create professional resumes.', 'Guatemala City', '2026-08-26'),
(3, 'Career Orientation Day', 'Give career guidance and professional advice to students.', 'San José Pinula', '2026-09-02');


-- ========================================
-- Service Project Categories
-- ========================================
CREATE TABLE IF NOT EXISTS categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS service_project_categories (
    project_id INT NOT NULL,
    category_id INT NOT NULL,

    CONSTRAINT pk_service_project_categories
        PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_service_project_categories_projects
        FOREIGN KEY (project_id)
        REFERENCES service_projects(project_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_service_project_categories_categories
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE CASCADE
);


--Insert data in categories
INSERT INTO categories (name)
VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness')
ON CONFLICT (name) DO NOTHING;


-- connecting projects to categories
INSERT INTO service_project_categories (project_id, category_id)
VALUES
-- BrightFuture Builders projects
(1, 3), -- Community Food Drive: Community Service
(2, 3), -- Neighborhood Cleanup: Community Service
(2, 1), -- Neighborhood Cleanup: Environmental
(3, 3), -- Clothing Donation Campaign: Community Service
(4, 2), -- School Supplies Drive: Educational
(5, 4), -- Senior Citizen Support Day: Health and Wellness

-- GreenHarvest Growers projects
(6, 1), -- Tree Planting Project: Environmental
(7, 1), -- River Cleanup Activity: Environmental
(8, 1), -- Recycling Awareness Workshop: Environmental
(8, 2), -- Recycling Awareness Workshop: Educational
(9, 1), -- Community Garden Setup: Environmental
(9, 3), -- Community Garden Setup: Community Service
(10, 1), -- Environmental Education Day: Environmental
(10, 2), -- Environmental Education Day: Educational

-- UnityServe Volunteers projects
(11, 2), -- Free Technology Workshop: Educational
(12, 2), -- English Practice Club: Educational
(13, 2), -- Math Tutoring Program: Educational
(14, 2), -- Resume Building Workshop: Educational
(15, 2)  -- Career Orientation Day: Educational
ON CONFLICT (project_id, category_id) DO NOTHING;





-- tests

SELECT * FROM organizations;

SELECT 
    sp.project_id,
    sp.title,
    sp.description,
    sp.location,
    sp.date,
    o.name AS organization_name
FROM service_projects sp
JOIN organizations o
    ON sp.organization_id = o.organization_id
ORDER BY sp.organization_id, sp.date;


SELECT * FROM categories;

