declare @email nvarchar(max) 
declare @firstName nvarchar(max) 
declare @lastName nvarchar(max) 
set @email = 'you@youremail.com'
set @firstName = 'Test'
set @lastName = 'User'

IF NOT EXISTS(select * from Customer where Email = @email) 
	begin
		print 'Creating'
		insert into customer ([Email],[Password],[SaltKey],[FirstName],[LastName],[Phone],[OkToEmail],[IsAdmin],[IsRegistered],[LockedUntil],[PwdChanged],[Active],[PwdChangeRequired]) 
		values (@email, 'Y0urP4$$w0rd',-1, @firstName, @lastName, '1234567890', 0,3,1,null,'1/1/2099',1,0)
	end
else
	begin
		print 'Updating'
		update Customer set IsAdmin = 3, PwdChanged = '1/1/2099', LockedUntil = null where Email = @email
	end

select * from Customer where Email = @email