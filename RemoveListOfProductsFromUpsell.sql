begin transaction 

DECLARE @productId nvarchar(8)

DECLARE productsToRemoveFromUpsellLists INSENSITIVE CURSOR FOR 
select productid from product where productid in('3193','3001','2486','2487','2852','2853') -- put your list of product ids here

OPEN productsToRemoveFromUpsellLists

FETCH NEXT FROM productsToRemoveFromUpsellLists 
INTO @productId

WHILE @@FETCH_STATUS = 0
BEGIN

	--remove all spaces from the upsell items to simplify the script below
	update product set UpsellProducts = replace(convert(nvarchar(max), UpsellProducts), ' ', '')

	--starts with the productid
	update product set UpsellProducts = replace(convert(nvarchar(max), UpsellProducts), (@productid + ','), '') where convert(nvarchar(max), UpsellProducts) like (@productid + ',%')

	--ends with the productid
	update product set UpsellProducts = replace(convert(nvarchar(max), UpsellProducts), (',' + @productid), '') where convert(nvarchar(max), UpsellProducts) like ('%,' + @productid)

	--productid in the middle
	update product set UpsellProducts = replace(convert(nvarchar(max), UpsellProducts), (',' + @productid + ','), ',') where convert(nvarchar(max), UpsellProducts) like ('%,' + @productid + ',%')

	--product is only upsell item
	update product set UpsellProducts = '' where convert(nvarchar(max), UpsellProducts) = @productid

	FETCH NEXT FROM productsToRemoveFromUpsellLists 
	INTO @productId
		
END 
CLOSE productsToRemoveFromUpsellLists
DEALLOCATE productsToRemoveFromUpsellLists

commit transaction

