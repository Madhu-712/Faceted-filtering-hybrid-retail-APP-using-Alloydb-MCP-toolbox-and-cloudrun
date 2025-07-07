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
  embedding vector(768),
  img_embeddings vector(1408),
  additional_specification VARCHAR(100000));


INSERT QUERIES FROM FILE >>

UPDATE apparels SET embedding = embedding('text-embedding-005',content)::vector 
WHERE content IS NOT NULL;

update apparels set img_embeddings = ai.image_embedding(
  model_id => 'multimodalembedding@001',
  image => replace(uri, 'http://assets.myntassets.com/assets/images/40993/2018/3/14/','gs://img_public_test/apparels1/'),
  mimetype => 'image/jpg')       
where uri is not null;

CREATE INDEX idx_category ON apparels (category);
CREATE INDEX idx_sub_category ON apparels (sub_category);
CREATE INDEX idx_color ON apparels (color);
CREATE INDEX idx_gender ON apparels (gender); 

SET scann.enable_inline_filtering = on;

CREATE EXTENSION IF NOT EXISTS alloydb_scann;

CREATE INDEX apparels_index ON apparels 
USING scann (embedding cosine)
WITH (num_leaves=32);

CREATE INDEX apparels_img_index ON apparels 
USING scann (img_embeddings cosine)
WITH (num_leaves=32);



