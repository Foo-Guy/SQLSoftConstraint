-- File: composite_keys_irregular_naming.sql

CREATE TABLE team (
    team_id INTEGER PRIMARY KEY,
    team_name TEXT
);

CREATE TABLE project (
    project_id INTEGER PRIMARY KEY,
    project_name TEXT
);

CREATE TABLE team_project (
    team_project_id INTEGER PRIMARY KEY,
    teamid INTEGER, -- Unconventional naming, suggests relationship to team.team_id
    projectid INTEGER, -- Unconventional naming, suggests relationship to project.project_id
    role TEXT
);

CREATE TABLE task (
    task_id INTEGER PRIMARY KEY,
    proj_id INTEGER, -- Suggests relationship to project.project_id
    task_detail TEXT,
    due_date DATE
);

-- Insert sample data to establish detectable patterns

INSERT INTO team (team_id, team_name) VALUES
(1, 'Development'),
(2, 'Marketing');

INSERT INTO project (project_id, project_name) VALUES
(1, 'Website Redesign'),
(2, 'New Product Launch');

INSERT INTO team_project (team_project_id, teamid, projectid, role) VALUES
(1, 1, 1, 'Developer'),
(2, 2, 2, 'Marketer');

INSERT INTO task (task_id, proj_id, task_detail, due_date) VALUES
(1, 1, 'Design Homepage', '2023-06-01'),
(2, 1, 'Develop Backend', '2023-06-15');
