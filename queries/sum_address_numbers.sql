create table stage.sum_address_numbers as 
select
ad_hex.hex_id
,sum(ad.address_number::float) total_address_numbers
from
stage.addresses ad
join
stage.addresses_w_hexid ad_hex
on
ad.property_id = ad_hex.property_id
group by ad_hex.hex_id