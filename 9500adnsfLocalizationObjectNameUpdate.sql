-- Use the triggers to populate the localized names table
print 'Populating LocalizedObjectName table from existing objects'
declare @localeUpdateChunkSize int = 1000,
		@localeUpdateIndex int,
		@localeUpdateCount int

set nocount on

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Product
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Products ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			ProductId Id,
			row_number() over (order by ProductID) Ordinal
		from Product )
	update Product
	set Name = Name
	from CountedRows
		inner join Product on CountedRows.Id = Product.ProductID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from ProductVariant
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Variants ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			VariantID Id,
			row_number() over (order by VariantID) Ordinal
		from ProductVariant )
	update ProductVariant
	set Name = Name
	from CountedRows
		inner join ProductVariant on CountedRows.Id = ProductVariant.VariantID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Category
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Categories ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			CategoryId Id,
			row_number() over (order by CategoryID) Ordinal
		from Category )
	update Category
	set Name = Name
	from CountedRows
		inner join Category on CountedRows.Id = Category.CategoryID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Manufacturer
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Manufacturers ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			ManufacturerId Id,
			row_number() over (order by ManufacturerID) Ordinal
		from Manufacturer )
	update Manufacturer
	set Name = Name
	from CountedRows
		inner join Manufacturer on CountedRows.Id = Manufacturer.ManufacturerID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Distributor
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Distributors ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			DistributorId Id,
			row_number() over (order by DistributorID) Ordinal
		from Distributor )
	update Distributor
	set Name = Name
	from CountedRows
		inner join Distributor on CountedRows.Id = Distributor.DistributorID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Section
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Sections ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			SectionId Id,
			row_number() over (order by SectionID) Ordinal
		from Section )
	update Section
	set Name = Name
	from CountedRows
		inner join Section on CountedRows.Id = Section.SectionID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Genre
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Genres ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			GenreId Id,
			row_number() over (order by GenreID) Ordinal
		from Genre )
	update Genre
	set Name = Name
	from CountedRows
		inner join Genre on CountedRows.Id = Genre.GenreID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

select @localeUpdateCount = count(*), @localeUpdateIndex = 1 from Vector
while @localeUpdateIndex  < @localeUpdateCount
begin
	print '    Updating Vectors ' + convert(nvarchar(max), @localeUpdateIndex) + ' to ' + convert(nvarchar(max), @localeUpdateIndex + @localeUpdateChunkSize - 1) + ' of ' + convert(nvarchar(max), @localeUpdateCount)
	;with CountedRows as (
		select 
			VectorId Id,
			row_number() over (order by VectorID) Ordinal
		from Vector )
	update Vector
	set Name = Name
	from CountedRows
		inner join Vector on CountedRows.Id = Vector.VectorID
	where CountedRows.Ordinal between @localeUpdateIndex and (@localeUpdateIndex + @localeUpdateChunkSize - 1)

	set @localeUpdateIndex = @localeUpdateIndex + @localeUpdateChunkSize
end

print 'LocalizedObjectName creation and population complete'
set nocount off

go