insert productcategory (categoryid, productid)

select distinct c.parentcategoryid, productid from productcategory pc
join category c on pc.categoryid = c.categoryid
where convert(varchar(10), c.parentcategoryid) + '-' + convert(varchar(10), pc.productid) not in 
(
	select distinct convert(varchar(10), categoryid) + '-' + convert(varchar(10), productid) from productcategory
)