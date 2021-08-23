#lab

select * ,amount - payments balance from loan;

SELECT loan_id, account_id, duration, status, (amount - payments)/1000 AS "Balance in thousands" FROM bank.loan;

SELECT distinct A2 FROM bank.district
WHERE  A2 IN ("Benesov","Beroun") OR A4 < 75000
LIMIT 10;

Select* From bank.loan WHERE status NOT IN ("B","b") AND amount > 100000;
#pandas: df[(!df["status"].isin["B", "b"])) & 

select status, avg(amount) from bank.loan
group by status;

select avg(amount) as Average, status from bank.loan
group by status
order by Average asc;

select distinct A2 from bank.district where A2 in ("Benesov","Beroun") or A4 < 75000 order by A2 limit 10;

select *, length(k_symbol) as "symbol_length" from bank.order; 
# here is a 1 because in k symobl is a leerzeichen

SELECT *, CONCAT(order_id,account_id) AS ‘concat’ FROM bank.order;
 