#Query 1 Get the id values of the first 5 clients from district_id with a value equals to 1.
select client_id from client where district_id = 1 order by client_id asc limit 5;

#Q2: 
select client_id from client where district_id=72 order by client_id DESC Limit 1;

# Q3: Get the 3 lowest amounts in the loan table
select amount from loan order by amount asc limit 3;

# Q4:What are the possible values for status, ordered alphabetically in ascending order in the loan table?

select distinct status from loan order by status asc;

#Q5 What is the loan_id of the highest payment received in the loan table?

select payments, loand_id from loan order by payments;
 
 #Q6 What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount

select distinct(account_id) as id, amount from loan order by id asc limit 5;

#Q7 What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?

select account_id, amount from loan where duration = 60 order by amount asc limit 5;

#Q8 hat are the unique values of k_symbol in the order table?

select distinct k_symbol from `order`;

#Q9 In the order table, what are the order_ids of the client with the account_id 34?

select order_id from `order` where account_id =34;

#Q10 the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?

select distinct account_id from `order` where order_id between 29540 and 29560;

#Q11 In the order table, what are the individual amounts that were sent to (account_to) id 30067122?

select amount from `order` where account_to = 30067122;

#Q12 In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.

select trans_id, `date`, `type`, amount from trans where account_id = 793 order by date asc limit 10;

#Q13 
# In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.

select Count(client_id), district_id from client where district_id < 10 Group by district_id order by district_id;

# Q14 In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.

SELECT DISTINCT COUNT(card_id), type FROM card GROUP BY type;

# Q 15 Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.

select account_id, amount from loan group by amount, account_id order by amount desc limit 10;

#Q16 In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

select count(loan_id), date from loan where date < 930907 group by date order by date desc;

# Q17
select distinct duration, count(duration), date from loan where date between 971201 and 971230 group by date, duration order by date desc, duration desc;

#Q18
select account_id, type, sum(amount) as total_amount from trans where account_id = 396 group by type,account_id order by type;

#Q19

