CREATE OR REPLACE TRIGGER Genre_TRG
    AFTER UPDATE
    ON JEU
    FOR EACH ROW
BEGIN
    if :OLD.CODEGENRE <> :NEW.CODEGENRE then
    delete from sous_genre_jeu where idjeu = :NEW.idjeu;
    end if;
    
END;