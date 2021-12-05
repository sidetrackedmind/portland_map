drop table if exists stage.addresses;
create table stage.addresses as
with address_xy_floats as (
select 
objectid, address_id, address_number, address_number_char,
address_number_char2, leading_zero, street_prefix_direction,
street_name, street_type_code, street_post_direction,
street_name_full, unit, unit_type, address_full, mail_city,
state, state_abbreviation, zip_code, zip4, jurisdiction_name,
jurisdiction_abbreviation, county, status, address_type,
building_id, property_id, state_id, tlid,
x::float, y::float 
from raw.addresses 
-- limit 100
)
select 
-- transforming from oregon state plane to WGS 84
	address_xy_floats.*,
	ST_MakeValid(ST_Transform(ST_SetSRID(ST_MakePoint(x, y),2269),4326)) as geom
from address_xy_floats
;

CREATE INDEX address_idx
  ON stage.addresses
  USING GIST (geom);