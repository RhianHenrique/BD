
DELIMITER //
CREATE FUNCTION ClassificarDuracaoProjeto (codigo_p BIGINT)
RETURNS VARCHAR (30) deterministic
BEGIN 
	DECLARE classificacao VARCHAR(30);
    DECLARE duracao INT;
    
    SELECT duracao_horas_projeto INTO duracao FROM projeto WHERE codigo_projeto = codigo_p;
    
	IF duracao < 50 THEN
		SET classificacao = 'Curto';
	ELSEIF duracao >= 50 AND duracao <= 100 THEN
		SET classificacao = 'Médio';
	ELSE -- duracao_horas_projeto >= 100 THEN
		SET classificacao = 'Longo';
        
	END IF;
    RETURN classificacao;

END 
// DELIMITER ;

SELECT ClassificarDuracaoProjeto(1);
