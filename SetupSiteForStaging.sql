
--change all the live emails to staging_ so that we don't accidentally email them.
update customer set email = 'staging_' + email where isadmin = 0 and email != ''
update orders set email = 'staging_' + email where customerid not in(select customerid from customer where isadmin > 0)
update distributor set email = 'staging_' + email

-- setup email appconfigs
declare @email varchar(200);
set @email = 'user@somewhere.com'
declare @mailServerUrl varchar(200);
set @mailServerUrl = 'mail.somewhere.com'

update appconfig set configvalue = @email where name = 'GotOrderEMailFrom'
update appconfig set configvalue = @email where name = 'GotOrderEMailTo'
update appconfig set configvalue = @email where name = 'MailMe_FromAddress'
update appconfig set configvalue = @email where name = 'MailMe_ToAddress'
update appconfig set configvalue = @email where name = 'ReceiptEMailFrom'

update appconfig set configvalue = @mailServerUrl where name = 'MailMe_Server'
update appconfig set configvalue = '' where name = 'MailMe_Pwd'
update appconfig set configvalue = 'false' where name = 'MailMe_UseSSL'

--other settings you'll often want to change for staging
update appconfig set configvalue = 'false' where name = 'redirectlivetowww' --disable redirects
update appconfig set configvalue = 'false' where name = 'usessl' --disable https
update appconfig set configvalue = 'false' where name = 'UseLiveTransactions' --turn gateway test modes to true and turn off analytics
update appconfig set configvalue = 'MANUAL' where name = 'paymentgateway' --turn off the gateway
update appconfig set configvalue = '' where name = 'Dispatch_ToPhoneNumber' --sms messages
