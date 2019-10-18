CREATE OR REPLACE FUNCTION VALIDERGENRE(code_du_genre IN CHAR) RETURN CHAR AS 

	est_un_sous_genre BOOLEAN;
	code_actuel CHAR(3);
	code_parent CHAR(3);
    
BEGIN 
	
	est_un_sous_genre := TRUE;
	code_actuel := code_du_genre;
	WHILE est_un_sous_genre LOOP
		SELECT CODEGENREPARENT
		INTO code_parent
		FROM GENRE
		WHERE CODE = code_actuel;
		IF code_parent = NULL THEN
			est_un_sous_genre := FALSE;
		ELSE
			code_actuel := code_parent;
		END IF;
	END LOOP;
	
	RETURN code_actuel;
    
END VALIDERGENRE;