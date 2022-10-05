SELECT * from project..data

-- total episodes

select max(epno) total_episodes 
from project..data

select count(distinct epno) total_episodes		-- both query will show the same results
from project..data

-- pitches

select count(distinct brand) no_of_pitches
from project..data

-- pitches converted which got a funding

select round(cast(sum(a.converted_not_converted) as float) / cast(count(*) as float),3) got_funding_ratio 
from (
select AmountInvestedlakhs,
case when AmountInvestedlakhs > 0 then 1 else 0 end as converted_not_converted from project..data) a

-- total male

select sum(male) male_contestants
from project..data

-- total female

select sum(female) female_contestants
from project..data

-- gender ratio

select round(sum(male)/sum(female),3) gender_ratio
from project..data

-- total invested amount

select sum(amountinvestedlakhs) total_amount_invested_lakhs
from project..data

-- avg equity taken

select (avg(a.equitytakenpercent)) avg_equity 
from
	(select * from project..data where equitytakenpercent > 0) a

-- highest deal taken

select max(amountinvestedlakhs) max_amount_lakhs
from project..data
 
-- highest equity taken

select max(equitytakenpercent) max_equity_percent
from project..data

-- startups having at least 1 women

select sum(a.Female_count) startups_having_at_least_one_women from (
select Female, case when Female > 0 then 1 else 0 end as Female_count from project..data) a

-- pitches converted having atleast one women

select * from project..data


select sum(b.Female_count) pitches_converted_having_at_least_one_women from(

select case when a.Female > 0 then 1 else 0 end as Female_count, a.* from (
(select * from project..data where deal!='No Deal')) a)b

-- avg team members

select round(avg(teammembers),0) avg_team_members
from project..data

-- amount invested per deal

select round(avg(a.amountinvestedlakhs),2) amount_invested_per_deal from
(select * from project..data where deal!='No Deal')a 

-- total amount asked

select sum(a.amountasked) total_amt_asked from
(select * from project..data where AmountAsked > 0)a

-- avg equity asked percent > 0

select avg(a.equityaskedpercent) avg_equity_asked from
(select * from project..data where EquityAskedPercent > 0)a

-- ratio of equity taken % by asked %

select sum(a.equitytakenpercent)/sum(a.equityaskedpercent) equity_ratio from
	(select * from project..data where EquityTakenPercent > 0 and EquityAskedPercent > 0)a

-- avg age group of contestants

select avgage,count(avgage) cnt 
from project..data
group by avgage
order by cnt desc
													
-- location group of contestants

select location,count(location) cnt
from project..data
group by location
order by cnt desc

-- sector group of contestants

select sector,count(sector) cnt
from project..data
group by sector
order by cnt desc

--partner deals

select partners,count(partners) cnt
from project..data
where partners!='-' 
group by partners
order by cnt desc

-- making the matrix of ASHNEER

select * from project..data

select 'Ashneer' as keyy,count(ashneeramountinvested) no_of_deals_present from project..data 
where ashneeramountinvested is not null


select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_invested from project..data 
where ashneeramountinvested is not null AND ashneeramountinvested!=0


SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED) amount_invested_lakhs,AVG(C.ASHNEEREQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE ASHNEEREQUITYTAKENPERCENT!=0 AND ASHNEEREQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_present from project..data 
where ashneeramountinvested is not null) a


inner join (

select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals from project..data 
where ashneeramountinvested is not null AND ashneeramountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED) total_amount_invested,
AVG(C.ASHNEEREQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE ASHNEEREQUITYTAKENPERCENT!=0 AND ASHNEEREQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy


-- making the matrix of NAMITA

select * from project..data

select 'Namita' as keyy,count(namitaamountinvested) no_of_deals_present from project..data 
where namitaamountinvested is not null


select 'Namita' as keyy,count(namitaamountinvested) total_deals_invested from project..data 
where namitaamountinvested is not null AND Namitaamountinvested!=0


SELECT 'Namita' as keyy,SUM(C.NAMITAAMOUNTINVESTED) amount_invested_lakhs,AVG(C.NAMITAEQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE NAMITAEQUITYTAKENPERCENT!=0 AND NAMITAEQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Namita' as keyy,count(Namitaamountinvested) total_deals_present from project..data 
where Namitaamountinvested is not null) a


inner join (

select 'Namita' as keyy,count(Namitaamountinvested) total_deals from project..data 
where Namitaamountinvested is not null AND Namitaamountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Namita' as keyy,SUM(C.NAMITAAMOUNTINVESTED) total_amount_invested,
AVG(C.NAMITAEQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE NAMITAEQUITYTAKENPERCENT!=0 AND NAMITAEQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy

-- making the matrix of ANUPAM

select * from project..data

select 'Anupam' as keyy,count(Anupamamountinvested) no_of_deals_present from project..data 
where Anupamamountinvested is not null


select 'Anupam' as keyy,count(Anupamamountinvested) total_deals_invested from project..data 
where Anupamamountinvested is not null AND Anupamamountinvested!=0


SELECT 'Anupam' as keyy,SUM(C.ANUPAMAMOUNTINVESTED) amount_invested_lakhs,AVG(C.ANUPAMEQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE ANUPAMEQUITYTAKENPERCENT!=0 AND ANUPAMEQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Anupam' as keyy,count(Anupamamountinvested) total_deals_present from project..data 
where Anupamamountinvested is not null) a


inner join (

select 'Anupam' as keyy,count(Anupamamountinvested) total_deals from project..data 
where Anupamamountinvested is not null AND Anupamamountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Anupam' as keyy,SUM(C.ANUPAMAMOUNTINVESTED) total_amount_invested,
AVG(C.ANUPAMEQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE ANUPAMEQUITYTAKENPERCENT!=0 AND ANUPAMEQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy

-- making the matrix of VINEETA

select * from project..data

select 'Vineeta' as keyy,count(Vineetaamountinvested) no_of_deals_present from project..data 
where Vineetaamountinvested is not null


select 'Vineeta' as keyy,count(Vineetaamountinvested) total_deals_invested from project..data 
where Vineetaamountinvested is not null AND Vineetaamountinvested!=0


SELECT 'Vineeta' as keyy,SUM(C.VINEETAAMOUNTINVESTED) amount_invested_lakhs,AVG(C.VINEETAEQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE VINEETAEQUITYTAKENPERCENT!=0 AND VINEETAEQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Vineeta' as keyy,count(Vineetaamountinvested) total_deals_present from project..data 
where Vineetaamountinvested is not null) a


inner join (

select 'Vineeta' as keyy,count(Vineetaamountinvested) total_deals from project..data 
where Vineetaamountinvested is not null AND Vineetaamountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Vineeta' as keyy,SUM(C.VINEETAAMOUNTINVESTED) total_amount_invested,
AVG(C.VINEETAEQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE VINEETAEQUITYTAKENPERCENT!=0 AND VINEETAEQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy

-- making the matrix of AMAN

select * from project..data

select 'Aman' as keyy,count(Amanamountinvested) no_of_deals_present from project..data 
where Amanamountinvested is not null


select 'Aman' as keyy,count(Amanamountinvested) total_deals_invested from project..data 
where Amanamountinvested is not null AND Amanamountinvested!=0


SELECT 'Aman' as keyy,SUM(C.AMANAMOUNTINVESTED) amount_invested_lakhs,AVG(C.AMANEQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE AMANEQUITYTAKENPERCENT!=0 AND AMANEQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Aman' as keyy,count(Amanamountinvested) total_deals_present from project..data 
where Amanamountinvested is not null) a


inner join (

select 'Aman' as keyy,count(Amanamountinvested) total_deals from project..data 
where Amanamountinvested is not null AND Amanamountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Aman' as keyy,SUM(C.AMANAMOUNTINVESTED) total_amount_invested,
AVG(C.AMANEQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE AMANEQUITYTAKENPERCENT!=0 AND AMANEQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy

-- making the matrix of PEYUSH

select * from project..data

/*  update project..data
    set GhazalEquityTakenPercent = try_convert(float, GhazalEquityTakenPercent);

    alter table project..data alter column ghazalequitytakenpercent float; */


select 'Peyush' as keyy,count(Peyushamountinvested) no_of_deals_present from project..data 
where Peyushamountinvested is not null


select 'Peyush' as keyy,count(Peyushamountinvested) total_deals_invested from project..data 
where Peyushamountinvested is not null AND Peyushamountinvested !=0


SELECT 'Peyush' as keyy,SUM(C.PEYUSHAMOUNTINVESTED) amount_invested_lakhs,AVG(C.PEYUSHEQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE PEYUSHEQUITYTAKENPERCENT!=0 AND PEYUSHEQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Peyush' as keyy,count(Peyushamountinvested) total_deals_present from project..data 
where Peyushamountinvested is not null) a


inner join (

select 'Peyush' as keyy,count(Peyushamountinvested) total_deals from project..data 
where Peyushamountinvested is not null AND Peyushamountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Peyush' as keyy,SUM(C.PEYUSHAMOUNTINVESTED) total_amount_invested,
AVG(C.PEYUSHEQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE PEYUSHEQUITYTAKENPERCENT!=0 AND PEYUSHEQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy

-- making the matrix of GHAZAL

select * from project..data


select 'Ghazal' as keyy,count(Ghazalamountinvested) no_of_deals_present from project..data 
where Ghazalamountinvested is not null


select 'Ghazal' as keyy,count(Ghazalamountinvested) total_deals_invested from project..data 
where Ghazalamountinvested is not null AND Ghazalamountinvested !=0


SELECT 'Ghazal' as keyy,SUM(C.GHAZALAMOUNTINVESTED) amount_invested_lakhs,AVG(C.GHAZALEQUITYTAKENPERCENT) avg_equity_taken 
FROM (SELECT * FROM PROJECT..DATA  WHERE GHAZALEQUITYTAKENPERCENT!=0 AND GHAZALEQUITYTAKENPERCENT IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Ghazal' as keyy,count(Ghazalamountinvested) total_deals_present from project..data 
where Ghazalamountinvested is not null) a


inner join (

select 'Ghazal' as keyy,count(Ghazalamountinvested) total_deals from project..data 
where Ghazalamountinvested is not null AND Ghazalamountinvested!=0) b 

on a.keyy=b.keyy) m


inner join 

(SELECT 'Ghazal' as keyy,SUM(C.GHAZALAMOUNTINVESTED) total_amount_invested,
AVG(C.GHAZALEQUITYTAKENPERCENT) avg_equity_taken
FROM (SELECT * FROM PROJECT..DATA  WHERE GHAZALEQUITYTAKENPERCENT!=0 AND GHAZALEQUITYTAKENPERCENT IS NOT NULL) C) n

on m.keyy=n.keyy



-- which is the startup in which the highest amount has been invested in each domain/sector


select c.* from 
(select brand,sector,amountinvestedlakhs,rank() over(partition by sector order by amountinvestedlakhs desc) rankk 

from project..data) c

where c.rankk=1
