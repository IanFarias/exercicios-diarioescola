/*
    1) Escreva comandos SQL para inserir os dados abaixo conforme o diagrama
    apresentado.
    a) Pablo é Pai de Lucas
    b) Brenda é Mãe de Lucas
*/

INSERT INTO aluno (id, nome) VALUES (1, 'Lucas');

INSERT INTO responsavel (id, nome) VALUES (1, 'Pablo');
INSERT INTO responsavel (id, nome) VALUES (2, 'Brenda');

INSERT INTO parentesco (idResponsavel, idAluno, parentesco) VALUES (1,1, 'Pablo', 'Pai');
INSERT INTO parentesco (idResponsavel, idAluno, parentesco) VALUES (2,1, 'Brenda', 'mãe');



/*
    2) Escreva uma consulta SQL para retornar dados únicos conforme tabela abaixo.
    Caso o aluno tenha mais de dois responsáveis, traga apenas os dois primeiros
    responsáveis encontrados na tabela
*/

SELECT a.nome as Aluno from aluno a 
INNER JOIN parentesco p 
    ON a.id = p.idAluno 
INNER JOIN responsavel r 
    ON r.id = p.idResponsavel


SELECT 
    a.nome as aluno,
    SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT r.nome ORDER BY r.id), ',', 1) as responsavel,
    SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT p.parentesco ORDER BY r.id), ',', 1) as parentesco,
    CASE WHEN COUNT(r.id) > 1 
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT r.nome ORDER BY r.id), ',', 2), ',', -1)
        ELSE NULL
    END as responsavel,
    CASE WHEN COUNT(r.id) > 1 
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT p.parentesco ORDER BY r.id), ',', 2), ',', -1)
        ELSE NULL
    END as parentesco
FROM aluno a
LEFT JOIN parentesco p ON a.id = p.idAluno
LEFT JOIN responsavel r ON p.idResponsavel = r.id
GROUP BY a.nome;

