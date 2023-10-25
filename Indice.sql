CREATE TABLE info_pessoais_aluno (
    cpf VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    tel_celular_resp VARCHAR(15) NOT NULL,
    tel_residencial_resp VARCHAR(15),
    email_resp VARCHAR(40) NOT NULL,
    status_info BOOL DEFAULT 1,
    INDEX idx_email_responsavel (email_resp)
);

CREATE TABLE aluno (
    num_matricula_aluno BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_inicio_aluno DATE NOT NULL,
    cpf_aluno VARCHAR(15) UNIQUE NOT NULL,
    email_aluno VARCHAR(40),
    status_aluno BOOL DEFAULT 1,
    CONSTRAINT fk_cpf_aluno FOREIGN KEY (cpf_aluno) REFERENCES info_pessoais_aluno(cpf)
);

CREATE TABLE curso (
    codigo_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(50) NOT NULL,
    duracao_curso INT NOT NULL CHECK (duracao_curso >= 0),
    curso_status BOOL DEFAULT 1
);

CREATE TABLE turma (
    codigo_tur BIGINT AUTO_INCREMENT PRIMARY KEY,
    qtd_alunos_tur INT NOT NULL CHECK (qtd_alunos_tur >= 0),
    periodo_tur VARCHAR(30) NOT NULL,
    semestre_tur VARCHAR(30) NOT NULL,
    status_tur BOOL DEFAULT 1
);

CREATE TABLE professor (
    codigo_prof BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_prof VARCHAR(40) NOT NULL,
    especialidade_prof VARCHAR(50) NOT NULL,
    data_admissao_prof DATE NOT NULL,
    status_prof BOOL DEFAULT 1,
    INDEX idx_especialidade (especialidade_prof)
);

CREATE TABLE disciplina (
    codigo_disc BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_disc VARCHAR(50) NOT NULL,
    ementa_disc TEXT NOT NULL,
    status_disc BOOL DEFAULT 1,
    INDEX idx_nome_disciplina (nome_disc)
);

CREATE TABLE matricula (
    numero_matricula BIGINT AUTO_INCREMENT,
    codigo_curso BIGINT,
    codigo_turma BIGINT,
    matricula_status BOOL DEFAULT 1,
    CONSTRAINT pk_matricula PRIMARY KEY (numero_matricula, codigo_curso, codigo_turma),
    CONSTRAINT fk_curso_matricula FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (numero_matricula) REFERENCES aluno(num_matricula_aluno),
    CONSTRAINT fk_matricula_turma FOREIGN KEY (codigo_turma) REFERENCES turma(codigo_tur)
);


CREATE TABLE aula (
    codigo_aula BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo_professor BIGINT NOT NULL,
    codigo_disciplina BIGINT NOT NULL,
    codigo_turma BIGINT NOT NULL,
    data_aula DATE NOT NULL,
    status_aula BOOL DEFAULT 1,
    CONSTRAINT fk_professor_aula FOREIGN KEY (codigo_professor) REFERENCES professor(codigo_prof),
    CONSTRAINT fk_disciplina_aula FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disc),
    CONSTRAINT fk_turma_aula FOREIGN KEY (codigo_turma) REFERENCES turma(codigo_tur)
);