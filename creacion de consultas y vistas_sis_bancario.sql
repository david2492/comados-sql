select * from account_types 
select * from accounts
select * from clients 
select * from transactions
select * from transactions_types


--1)


select clients.id, clients.first_name , clients.last_name , clients.email , accounts.account_no , accounts.balance 
from accounts right join clients on clients.id = accounts.client_id ;


--2)

select accounts.account_no , accounts.client_id  , account_types.name  
from account_types right join accounts on accounts.type = account_types.id;

--3

select transactions.id, transactions.amount, transactions_types.name  
from transactions inner join transactions_types on transactions.transaction_type  = transactions_types.id 

--4
select transactions.id, transactions.amount , transactions_types.name  
from  transactions_types left join transactions on transactions.transaction_type  = transactions_types.id;




--5)
create view view_clients_accounts as select 
clients.id as client_id, 
clients.first_name as client_first_name, 
clients.last_name as client_last_name, 
clients.email as client_email, 
accounts.account_no, 
accounts.balance
from  accounts right join clients on clients.id = accounts.client_id ;

select * from view_clients_accounts as select 


--6
create view accounts_types as select
accounts.account_no as account_account_no,
accounts.client_id as account_client_id,
account_types.name
from account_types right join accounts on accounts.type = account_types.id;

select * from accounts_types

--7
create view transactions_detail as select
transactions.id as transactions_id,
transactions.amount as transactions_amount,
transactions_types.name as transactions_types_name
from transactions inner join transactions_types on transactions.transaction_type  = transactions_types.id ;

select * from transactions_detail

--8
create view transations_types_detail as select
transactions.id,
transactions.amount ,
transactions_types.name as transactions_types_name
from  transactions_types left join transactions on transactions.transaction_type  = transactions_types.id;

select * from transations_types_detail
