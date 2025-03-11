select * from loan_data_new;

select extract(month from issue_date)  as Month_number,
       to_char(issue_date,'month') as months_name,
       count(id) as Total_Loan_Applications,
       sum(loan_amount) as total_funded_amount,
       sum(total_payment) as total_Payment_amount
from loan_data_new
group by extract(month from issue_date),to_char(issue_date,'month') 
order by 1 ;


select address_state,
       count(id) as Total_Loan_Applications,
       sum(loan_amount) as total_funded_amount,
       sum(total_payment) as total_Payment_amount
from loan_data_new
group by address_state
order by 2 desc ;


select emp_length,
       count(id) as Total_Loan_Applications,
       sum(loan_amount) as total_funded_amount,
       sum(total_payment) as total_Payment_amount
from loan_data_new
group by emp_length
order by 1  ;


 select term,
       count(id) as Total_Loan_Applications,
       sum(loan_amount) as total_funded_amount,
       sum(total_payment) as total_Payment_amount
from loan_data_new
group by term
order by 1 desc ;


select purpose,
       count(id) as Total_Loan_Applications,
       sum(loan_amount) as total_funded_amount,
       sum(total_payment) as total_Payment_amount
from loan_data_new
group by purpose
order by 1 ;


select home_ownership,
       count(id) as Total_Loan_Applications,
       sum(loan_amount) as total_funded_amount,
       sum(total_payment) as total_Payment_amount
from loan_data_new
group by home_ownership
order by 1 desc ;