select xmlpackage, count(*) as total, min(categoryid) as firstentityid from category 
group by xmlpackage