####################### RAW month and day level transaction information #########################################################################
 
select * from (select  customerkey,customertransactiontypecategory,transactioncreditamount,transactiondebitamount,
datediff(month,createdate,CURRENT_DATE) as months,datediff(day,createdate,CURRENT_DATE) as days 
from fixed_odds_adhoc.luxbet_custtransaction_attributes) order by 1,2,5,6 limit 100;

######################################### Day level Aggregation of transaction information #########################################################

select customerkey,customertransactiontypecategory,sum(transactioncreditamount),sum(transactiondebitamount),months,days
from (select  customerkey,customertransactiontypecategory,transactioncreditamount,transactiondebitamount,
datediff(month,createdate,CURRENT_DATE) as months,datediff(day,createdate,CURRENT_DATE) as days 
from fixed_odds_adhoc.luxbet_custtransaction_attributes) group by 1,2,5,6 order by 1,2,5,6 limit 100;

################################### month level Aggregation of transaction information ############################################################

select customerkey,customertransactiontypecategory,sum(transactioncreditamount),sum(transactiondebitamount),months
from (select  customerkey,customertransactiontypecategory,transactioncreditamount,transactiondebitamount,
datediff(month,createdate,CURRENT_DATE) as months,datediff(day,createdate,CURRENT_DATE) as days 
from fixed_odds_adhoc.luxbet_custtransaction_attributes) group by 1,2,5 order by 1,2,5 limit 100;

#####################################################################################################################################################