dd = load '/user/acadgild/daily.txt' using PigStorage(',') AS (year:chararray,occupation:chararray,date:chararray,grop:chararray,guestlist:chararray);

d1 = foreach dd generate occupation,grop;
 
d2 = group d1 by grop;

d3 = foreach d2 generate group,COUNT(d1) as c;

d4 = order d3 by c DESC;

dump d4;



