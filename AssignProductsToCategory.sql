declare @c int

set @c = 1
while (@c < 50000)
begin
	declare @pid int
	declare @cid int
	
	select @pid = productid from product order by newid()
	select @cid = categoryid from category order by newid()
	
	if (select count(*) from productcategory where productid = @pid and categoryid = @cid) = 0
	begin
		insert productcategory (productid, categoryid) values(@pid, @cid)
	end
end

