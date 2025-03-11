select * from loan_data_new;

select count(id ) as total_application
 from loan_data_new;

 select count(id ) as MTD_Total_Application
 from loan_data_new
 where extract(month from issue_date) = 12 and extract(year from issue_date)  = 2021;

 select count(id ) as PEV_MTD_Total_Application
 from loan_data_new
 where extract(month from issue_date) = 11 and extract(year from issue_date)  = 2021;

 select sum(loan_amount) as total_Loan_amount
 from loan_data_new
 where extract(month from issue_date) = 12;

 select sum(loan_amount) as MTD_Total_Funded_Amount
 from loan_data_new
 where extract(month from issue_date) = 12 and extract(year from issue_date)  = 2021;

 select sum(loan_amount ) as PEV_MTD_Total_Funded_Amount
 from loan_data_new
 where extract(month from issue_date) = 11 and extract(year from issue_date)  = 2021;

 select sum(total_payment) as Total_Amount_Received
 from loan_data_new;

select sum(total_payment) as Total_Amount_Received
 from loan_data_new
 where extract(month from issue_date) = 12;

select sum(total_payment) as Total_Amount_Received
 from loan_data_new
 where extract(month from issue_date) = 11;

 select round(avg(int_rate) * 100,2) as Avg_Int_Rate
 from loan_data_new;

 select round(avg(int_rate) * 100,2) as  MTD_Avg_Int_Rate
 from loan_data_new  
  where extract(month from issue_date) = 12;

select round(avg(int_rate) * 100,2) as  MTD_Avg_Int_Rate
 from loan_data_new  
  where extract(month from issue_date) = 11;

select round(avg(dti) * 100,2) as  MTD_Avg_Dti
 from loan_data_new
 where extract(month from issue_date) = 12;

select round(avg(dti) * 100,2) as  PEV_MTD_Avg_Dti
 from loan_data_new
 where extract(month from issue_date) = 11;

select 
count(case when loan_status = 'Fully Paid' or  loan_status = 'Current' then id end ) * 100/
count(id) as Good_Loan_Percentage
from loan_data_new;

select
count(case when loan_status = 'Fully Paid' or  loan_status = 'Current' then 1 end ) as Good_Loan_Applications
from loan_data_new;

select sum(loan_amount) as Good_Loan_Funded_Amount
from loan_data_new
where loan_status = 'Fully Paid' or  loan_status = 'Current';

select sum(total_payment) as Good_Loan_Received_Amount
from loan_data_new
where loan_status = 'Fully Paid' or  loan_status = 'Current';

select 
(count(case when loan_status = 'Charged Off'  then 1 end ) * 100.0)/
count(id) as Bad_Loan_Percentage
from loan_data_new;

select count(application_type) as Bad_Loan_Application
from loan_data_new
where loan_status = 'Charged Off';

select sum(loan_amount) as Bad_Loan_Amount_Received
from loan_data_new
where loan_status = 'Charged Off';

select sum(total_payment) as Bad_Total_Repaid
from loan_data_new
where loan_status = 'Charged Off';

select loan_status,
       count(id) as Total_Loan_Application,
	   sum(total_payment) as Total_Loan_Payment,
	   sum(loan_amount) as Total_Loan_Amount,
	   avg(int_rate*100) as asInterest_rate,
	   avg(dti*100) as DTI
	   from loan_data_new
	 group by loan_status;  
	   
 select loan_status,
	   sum(total_payment) as MTD_Total_Loan_Payment,
	   sum(loan_amount) as MTD_Total_Loan_Amount  
	  from loan_data_new
	  where extract(month from issue_date ) = 12
	  group by loan_status;




 