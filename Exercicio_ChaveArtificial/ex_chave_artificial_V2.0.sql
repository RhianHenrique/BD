
create table info_pessoais_aluno (
cpf varchar(15) primary key,
nome varchar(100) not null,
tel_respon varchar(50) not null,
tel_residen varchar(50),
email_respon varchar(100) not null,
status_info bool default 1
);

create table aluno (
num_matricula bigint auto_increment primary key,
data_inicio date not null,
cpf_aluno varchar(15) unique not null,
emai_educacional varchar(50) not null,
status_aluno bool default 1,
constraint fk_cpf_aluno foreign key (cpf_aluno) REFERENCES info_pessoais_aluno(cpf)
);

create table curso (
codigo_curso bigint auto_increment primary key,
nome_curso varchar(80) not null,
carga_horaria int not null check(carga_horaria >= 0),
curso_status bool default 1
);

create table turma (
codigo_tur bigint auto_increment primary key,
quantidade_alunos int not null check(quantidade_alunos >= 0),
periodo varchar(40) not null,
semestre varchar(40) not null,
status_tur bool default 1
);

create table professor (
codigo_prof bigint auto_increment primary key,
nome_prof varchar(40) not null,
especialidade_prof varchar(50) not null,
data_admissao_prof date not null,
status_professor bool default 1
);

create table disciplina (
codigo_disc bigint auto_increment primary key,
nome_prof varchar(40) not null,
especialidade_prof varchar(50) not null,
data_admissao_prof date not null,
status_prof bool default 1
);

create table matricula (
numero_matricula bigint auto_increment,
codigo_curso bigint,
codigo_turma bigint,
matricula_status bool default 1,
CONSTRAINT pk_matricula PRIMARY KEY (numero_matricula, codigo_curso, codigo_turma),
constraint fk_matricula_turma foreign key (codigo_turma) REFERENCES turma(codigo_tur),
constraint fk_curso_matricula foreign key (codigo_curso) REFERENCES curso(codigo_curso),
constraint fk_matricula_aluno foreign key (numero_matricula) REFERENCES aluno(num_matricula)
);

create table aula (
codigo_aula bigint auto_increment primary key,
codigo_professor bigint not null,
codigo_disciplina bigint not null,
codigo_turma bigint not null,
data_aula date not null,
status_aula bool default 1,
constraint fk_professor_aula foreign key (codigo_professor) references professor (codigo_prof),
constraint fk_disciplina_aula foreign key (codigo_disciplina) references disciplina (codigo_disc),
constraint fk_turma_aula foreign key (codigo_turma) references turma (codigo_tur)
);

-- INSERTS

INSERT INTO info_pessoais_aluno (cpf, nome, tel_respon, email_respon)
VALUES
	('123.456.789-01', 'Fernando Pereira', '016995678901', 'fernando@email.com'),
	('987.654.321-02', 'Juliana Santos Silva', '016995432102', 'juliana@email.com'),
	('456.789.123-03', 'Mariana Silva Almeida', '016998912303', 'mariana@email.com'),
	('789.123.456-04', 'Marcelo Mendes', '016997891234', 'marcelo@email.com'),
	('234.567.890-05', 'Luana Oliveira', '016992345678', 'luana@email.com');

INSERT INTO aluno (data_inicio, cpf_aluno, emai_educacional)
VALUES
	('2022-01-10', '123.456.789-01', 'fernando1@emaileduc.com'),
	('2022-06-01', '987.654.321-02', 'juliana22@emaileduc.com'),
	('2021-01-15', '456.789.123-03', 'mariana32@emaileduc.com'),
	('2023-01-10', '789.123.456-04', 'marcelo11@emaileduc.com'),
	('2023-06-01', '234.567.890-05', 'luana123@emaileduc.com');


INSERT INTO professor (nome_prof, especialidade_prof, data_admissao_prof)
VALUES
    ('Eduardo Nascimento', 'Tecnologia da Informação', '2023-01-15'),
    ('Matheus Michilino', 'Mecatrônica e Interfaces Robóticas', '2020-01-01'),
    ('Rafael Selvagio', 'Tecnologia da Informação', '2023-06-01'),
    ('Rafael Rizzi', 'Eng. Elétrica', '2022-01-01');

INSERT INTO curso (nome_curso, carga_horaria)
VALUES
    ('Técnico em Analise de Desenvolvimento de Sistemas', 18),
    ('Técnico em Mecatrônica', 24),
    ('Técnico em Eletrônica', 24),
    ('Técnico em Administração', 18),
    ('Técnico em Mecânica', 20);


INSERT INTO turma (quantidade_alunos, periodo, semestre)
VALUES
    (35, 'Manhã', '2 Semestre'),
    (35, 'Tarde', '2 Semestre'),
    (18, 'Manhã', '2 Semestre'),
    (20, 'Tarde', '4 Semestre'),
    (20, 'Tarde', '1 Semestre'),
    (36, 'Tarde', '2 Semestre');

INSERT INTO aula (codigo_professor, codigo_disciplina, codigo_turma, data_aula)
VALUES
    (3, 1, 1, '2023-10-10'),
    (1, 2, 2, '2023-10-11'),
    (2, 3, 1, '2023-10-12'),
    (1, 2, 1, '2023-10-13'),
    (2, 3, 2, '2023-10-15'),
    (3, 1, 2, '2023-10-16');
    
INSERT INTO matricula (codigo_curso, codigo_turma)
VALUES
	(1, 1),	
	(1, 2);

-- EXERCICIOS DE CONSULTA 

-- 1 



-- 2 


