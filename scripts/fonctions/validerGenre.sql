CREATE OR REPLACE FUNCTION VALIDERGENRE(code_du_genre IN CHAR) RETURN CHAR AS 

	code_parent GENRE.CODE%TYPE;
    code_a_retourner code_parent%TYPE;
    
BEGIN 
	
	SELECT CODEGENREPARENT
	INTO code_parent
    FROM GENRE
    WHERE CODE = code_du_genre;
    IF code_parent = code_du_genre THEN
        code_a_retourner := code_du_genre;
    ELSE
        code_a_retourner := code_parent;
    END IF;
	
    --Si le genre est un genre parent, alors son code parent est lui-meme, donc on pourrait 
    --retourner directement le code parent, mais ce code suit precisement la consigne.
    
	RETURN code_a_retourner;
    
END VALIDERGENRE;