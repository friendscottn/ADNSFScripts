select * from AppConfig where name like '%recently%'


update appconfig set ConfigValue = 'false' where name = 'RecentlyViewedProducts.Enabled'