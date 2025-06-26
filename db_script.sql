CREATE TABLE apparels ( 
  id BIGINT, 
  category VARCHAR(100), 
  sub_category VARCHAR(50), 
  uri VARCHAR(200), 
  image VARCHAR(100), 
  content VARCHAR(2000), 
  pdt_desc VARCHAR(5000), 
  color VARCHAR(2000),
  gender VARCHAR(200),
  embedding vector(768) );

INSERT QUERIES FROM FILE >>

UPDATE apparels SET embedding = embedding('text-embedding-005',content)::vector 
WHERE content IS NOT NULL;

CREATE INDEX idx_category ON apparels (category);
CREATE INDEX idx_sub_category ON apparels (sub_category);
CREATE INDEX idx_color ON apparels (color);
CREATE INDEX idx_gender ON apparels (gender); 

SET scann.enable_inline_filtering = on;

CREATE EXTENSION IF NOT EXISTS alloydb_scann;

CREATE INDEX apparels_index ON apparels 
USING scann (embedding cosine)
WITH (num_leaves=32);





