DECLARE @categoryId int, @parentCategoryId int, @productId int

DECLARE productCategories INSENSITIVE CURSOR FOR 
select c.categoryid, pc.productid from productcategory pc join category c on pc.categoryid = c.categoryid order by pc.categoryid

OPEN productCategories

FETCH NEXT FROM productCategories 
INTO @categoryId, @productId

WHILE @@FETCH_STATUS = 0
BEGIN

    SELECT @parentCategoryId = ParentCategoryID From dbo.category with (nolock) where CategoryID = @categoryId 
    WHILE @@rowcount > 0 and @parentCategoryId <> 0 BEGIN
        if (select count(productid) from productcategory where productid = @productId and categoryId = @parentCategoryId) = 0
        begin
			insert productcategory (productid, categoryid) values(@productid, @parentCategoryId)
        end
        SELECT @parentCategoryId = ParentCategoryID From dbo.category with (nolock) where CategoryID = @parentCategoryId 
    END

    FETCH NEXT FROM productCategories 
    INTO @categoryId, @productId
    
END 
CLOSE productCategories
DEALLOCATE productCategories