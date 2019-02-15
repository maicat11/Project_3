DROP DATABASE IF EXISTS avito;

CREATE DATABASE avito;

\connect avito;

CREATE TABLE train_search_stream(
  search_id NUMERIC,
  ad_id NUMERIC,
  position NUMERIC,
  object_type NUMERIC,
  hist_ctr NUMERIC,
  is_click NUMERIC
);

CREATE TABLE test_search_stream(
  test_id NUMERIC,
  search_id NUMERIC,
  ad_id NUMERIC,
  position NUMERIC,
  object_type NUMERIC,
  hist_ctr NUMERIC
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

CREATE TABLE user_info(
  user_id NUMERIC,
  user_agent_id NUMERIC,
  user_agent_family_id NUMERIC,
  user_agent_os_id NUMERIC,
  user_device_id NUMERIC
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

\copy train_search_stream FROM 'data/raw/trainSearchStream.csv' DELIMITER ',' CSV HEADER;
\copy test_search_stream FROM 'data/raw/testSearchStream.csv' DELIMITER ',' CSV HEADER;
\copy search_info FROM 'data/raw/SearchInfo.csv' DELIMITER ',' CSV HEADER;
\copy ads_info FROM 'data/raw/AdsInfo.csv' DELIMITER ',' CSV HEADER;
\copy user_info FROM 'data/raw/UserInfo.csv' DELIMITER ',' CSV HEADER;
\copy visits_stream FROM 'data/raw/VisitsStream.csv' DELIMITER ',' CSV HEADER;
\copy phone_requests_stream FROM 'data/raw/PhoneRequestsStream.csv' DELIMITER ',' CSV HEADER;
\copy category FROM 'data/raw/Category.csv' DELIMITER ',' CSV HEADER;
\copy location FROM 'data/raw/Location.csv' DELIMITER ',' CSV HEADER;
