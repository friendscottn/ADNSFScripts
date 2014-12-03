select xmlpackage, count(*) as total, min(ProductID) as firstproductid from Product 
group by xmlpackage