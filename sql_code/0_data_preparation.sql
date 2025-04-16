CREATE TABLE public.company
(
    id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    google_link TEXT,
    thumbnail TEXT
);

CREATE TABLE public.skill
(
    id INT PRIMARY KEY,
    skill_name TEXT,
    type TEXT
);

CREATE TABLE public.job_offer
(
    id INT PRIMARY KEY,
    company_id INT,
    title_short VARCHAR(255),
    title TEXT,
    location TEXT,
    job_via TEXT,
    schedule_type TEXT,
    work_from_home BOOLEAN,
    search_location TEXT,
    posted_date TIMESTAMP,
    no_degree_required BOOLEAN,
    health_insurance_offered BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company (id)
);

CREATE TABLE public.job_has_skill
(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES public.job_offer (id),
    FOREIGN KEY (skill_id) REFERENCES public.skill (id)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.company OWNER to postgres;
ALTER TABLE public.skill OWNER to postgres;
ALTER TABLE public.job_offer OWNER to postgres;
ALTER TABLE public.job_has_skill OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_company_id ON public.job_offer (company_id);
CREATE INDEX idx_job_id ON public.job_has_skill (job_id);
CREATE INDEX idx_skill_id ON public.job_has_skill (skill_id);

-- CSV Data source: https://www.lukebarousse.com/sql

CREATE TABLE job_offer_europe AS
    SELECT *
    FROM
        job_offer
    WHERE
        job_country IN (
        'Germany',
        'United Kingdom',
        'France',
        'Italy',
        'Spain',
        'Ukraine',
        'Poland',
        'Romania',
        'Netherlands',
        'Belgium',
        'Sweden',
        'Czech Republic',
        'Portugal',
        'Greece',
        'Hungary',
        'Austria',
        'Belarus',
        'Switzerland',
        'Bulgaria',
        'Serbia',
        'Denmark',
        'Finland',
        'Norway',
        'Slovakia',
        'Ireland',
        'Croatia',
        'Bosnia and Herzegovina',
        'Moldova',
        'Lithuania',
        'Albania',
        'Slovenia',
        'Latvia',
        'North Macedonia',
        'Estonia',
        'Luxembourg',
        'Montenegro',
        'Malta',
        'Iceland',
        'Andorra',
        'Liechtenstein',
        'Monaco',
        'San Marino',
        'Holy See'
    )