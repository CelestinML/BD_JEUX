SELECT 
	constraint_name as NOM, 
	decode(constraint_type, 'C', 'check', 'P', 'PK ', 'U', 'UNIQUE', 'R', 'FK') as TYPE, 
	table_name as TABLE_, search_condition as CONDITION_ 
FROM 	USER_CONSTRAINTS 
WHERE	table_name=UPPER('&1');
