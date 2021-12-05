create table stage.addresses_w_hexid as
select
addresses.property_id
,hexbin.hex_id
from
stage.addresses addresses
left join
stage.portland_hexgrid_res9 hexbin
on
ST_Within(addresses.geom, hexbin.geom)
;