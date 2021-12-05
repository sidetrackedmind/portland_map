create table stage.portland_hexgrid_res9 as
with geom_as_bytes as (
select 
hex_id, geometry_wkb::bytea geometry_wkb
from raw.portland_hexgrid_res9 
)
select
geom_as_bytes.hex_id,
ST_GeomFromWKB(geometry_wkb,4326) geom 
from geom_as_bytes
;

CREATE INDEX hexgrid_res9_idx
  ON stage.portland_hexgrid_res9
  USING GIST (geom);

create table stage.portland_hexgrid_res8 as
with geom_as_bytes as (
select 
hex_id, geometry_wkb::bytea geometry_wkb
from raw.portland_hexgrid_res8
)
select
geom_as_bytes.hex_id,
ST_GeomFromWKB(geometry_wkb,4326) geom 
from geom_as_bytes
;

CREATE INDEX hexgrid_res8_idx
  ON stage.portland_hexgrid_res8
  USING GIST (geom);

create table stage.portland_hexgrid_res7 as
with geom_as_bytes as (
select 
hex_id, geometry_wkb::bytea geometry_wkb
from raw.portland_hexgrid_res7
)
select
geom_as_bytes.hex_id,
ST_GeomFromWKB(geometry_wkb,4326) geom 
from geom_as_bytes
;

CREATE INDEX hexgrid_res7_idx
  ON stage.portland_hexgrid_res7
  USING GIST (geom);