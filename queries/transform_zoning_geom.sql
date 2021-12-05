with geom_as_bytes as (
select 
objectid, zone, cmp, 
shape_length, shape_area, zone_desc, cmp_desc,
ovrly_desc, pldist_desc,
maplabel, geometry_wkb::bytea geometry_wkb
from raw.zoning 
)
select
geom_as_bytes.*,
ST_GeomFromWKB(geometry_wkb,4326) geom 
from geom_as_bytes
;

CREATE INDEX zoning_idx
  ON stage.zoning
  USING GIST (geom);