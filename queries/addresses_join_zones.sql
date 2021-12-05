select
addresses.address_full
,addresses.mail_city
,addresses.state_abbreviation
,addresses.zip_code
,addresses.property_id
,zoning.zone
,zoning.objectid
,addresses.geom geom
-- ,zoning.geom zoning_geom
from
stage.addresses addresses
left join
stage.zoning zoning
on
ST_Within(addresses.geom, zoning.geom)
;

-- Successfully run. Total query runtime: 13 secs 438 msec.
-- 828037 rows affected.
-- first time it took 23 seconds but that was returning zoning geometry..