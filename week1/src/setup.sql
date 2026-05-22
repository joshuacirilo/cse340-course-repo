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

