DROP DATABASE IF EXISTS avito_small;

CREATE DATABASE avito_small;

\connect avito_small;

CREATE TABLE search_stream(
  search_id NUMERIC,
  ad_id NUMERIC,
  position NUMERIC,
  object_type NUMERIC,
  hist_ctr NUMERIC,
  is_click NUMERIC
);

CREATE TABLE search_info(
  search_id NUMERIC,
  search_date TIMESTAMP,
  ip_id NUMERIC,
  user_id NUMERIC,
  is_user_logged_on NUMERIC,
  search_query TEXT,
  search_location_id NUMERIC,
  search_category_id NUMERIC,
  search_params TEXT
);

CREATE TABLE ads_info(
  ad_id NUMERIC,
  location_id NUMERIC,
  category_id NUMERIC,
  params TEXT,
  price NUMERIC,
  title TEXT,
  is_context NUMERIC
);

CREATE TABLE visits_stream(
  user_id NUMERIC,
  ip_id NUMERIC,
  ad_id NUMERIC,
  view_date TIMESTAMP
);

CREATE TABLE phone_requests_stream(
  user_id NUMERIC,
  ip_id NUMERIC,
  ad_id NUMERIC,
  phone_request_date TIMESTAMP
);

CREATE TABLE category(
  category_id NUMERIC,
  level NUMERIC,
  parent_category NUMERIC,
  subcategory NUMERIC
);

CREATE TABLE location(
  location_id NUMERIC,
  level NUMERIC,
  region_id NUMERIC,
  city_id NUMERIC
);

\copy search_stream FROM 'data/interim/SearchStream.csv' DELIMITER ',' CSV HEADER;
\copy search_info FROM 'data/interim/SearchInfo.csv' DELIMITER ',' CSV HEADER;
\copy ads_info FROM 'data/interim/AdsInfo.csv' DELIMITER ',' CSV HEADER;
\copy visits_stream FROM 'data/interim/VisitsStream.csv' DELIMITER ',' CSV HEADER;
\copy phone_requests_stream FROM 'data/interim/PhoneRequestsStream.csv' DELIMITER ',' CSV HEADER;
\copy category FROM 'data/interim/Category.csv' DELIMITER ',' CSV HEADER;
\copy location FROM 'data/interim/Location.csv' DELIMITER ',' CSV HEADER;