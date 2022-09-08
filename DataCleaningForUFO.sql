--Data cleaning 

--Separating date and time into separate columns:
select
convert(varchar(10), dates, 101) as reportdate,
convert(varchar(12), dates, 108) as reportsecond
from ufo

--Adding a new column into table for report date:
alter table ufo
add reportdate varchar(10);
update ufo
set reportdate = convert(varchar(10), dates, 101)

--Adding a new column into table for report time:
alter table ufo
add reportsecond varchar(12)
update ufo
set reportsecond = convert(varchar(12), dates, 108)

--Separating year from the "dates" column and adding it to the table:
select datepart(year, dates) as reportyear
from ufo

alter table ufo
add reportyear varchar(4)
update ufo
set reportyear = datepart(year, dates)


--Separating month from the "dates" column and adding to the table:
select datepart(month, dates) as reportmonth
from ufo

alter table ufo
add reportmonth varchar(2)
update ufo
set reportmonth = datepart(month, dates)

--Capitalizing the first letter of the city column:
update ufo
set city = upper(left(city,1))+ lower(substring(city,2,len(city)))

--Removing everything after the parenthesis in the city column. The description in parathesis is not necessary and created duplicates:
update ufo
set city = substring(city, 1, 
			case when charindex('(',city) >0
				then charindex('(', city)-1
			else len(city)
			end)

--Capitalize the state & country abbreviations:
update ufo
set state = upper(state)

update ufo
set country = upper(country)



