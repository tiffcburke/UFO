--UFO Data exploration.


--Sightings lasting longer than average 
select city, state, country, shape, seconds
from sightings..ufo
where seconds > ( select AVG(seconds) from sightings..ufo)

--The number of cities in each state with ufo sightings over where the number of cities is greater than 2K.
select state, count(city) as number_of_cities 
from sightings..ufo
where country = 'US'
group by state
having count(city) > 2000
order by number_of_cities desc

--Number of sightings by state:
select state, count(state) as statecount
from ufo
where country = 'US'
group by state
order by statecount desc

--Number of sightings by city:
select state, city, count(city) as citycount
from ufo
where country = 'US'
group by city, state
order by citycount desc

--Number of comments mentioning the word young or child: 356
select reportdate, city, state, comments
from ufo
where country = 'US'
and lower(comments) like '%young%'
or lower(comments) like'%child%'

select count(comments)
from ufo
where country = 'US'
and lower(comments) like '%young%'
or lower(comments) like'%child%'

--Latitude and Longitude:
select city, state, latitude, longitude
from ufo
where country = 'US'

--Number of sightings per year:
select reportyear, count(reportyear) as countperyear
from ufo
where country = 'US'
group by reportyear
order by reportyear

--Number of sightings per month:
select reportmonth, count(reportmonth) as sightingspermonth
from ufo
where country = 'US'
group by reportmonth
order by sightingspermonth

--UFO shape count:
select shape, count(shape) as shapecount
from ufo
where country = 'US'
group by shape
order by shapecount desc

--Number of people who reported their sighting as scary
select count(comments) as reported_as_scared
from sightings..ufo
where comments like '%scared%'

--Number of people who reported their sighting as exciting
select count(comments) as reported_as_exciting
from sightings..ufo
where comments like '%exciting%'

--Number of people who reported their sighting as sad
select count(comments) as reported_as_sad
from sightings..ufo
where comments like '%sad%'



