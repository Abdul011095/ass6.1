d = load '/user/acadgild/daily.txt' using PigStorage(',') AS (year:chararray,occupation:chararray,date:chararray,group:chararray,guestlist:chararray);


 
fe1 = foreach d generate occupation,date;


fe2 = foreach fe1 generate occupation,ToDate(date,'mm/dd/yy') as date;

fe3 = filter fe2 by ((date> ToDate('1/11/99','mm/dd/yy')) and (date<ToDate('6/11/99','mm/dd/yy')));

fe4 = group fe3 by occupation;

fe5 = foreach fe4 generate group,COUNT(fe3) as c;

fe6 = order fe5 by c DESC;

fe7 = limit fe6 5;

dump fe7;

