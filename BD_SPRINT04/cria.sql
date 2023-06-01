-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2022-09-08 20:33:25 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE t_ibm_candidato (
    id_candidato           NUMBER NOT NULL,
    nome_candidat         VARCHAR2(200) NOT NULL,
    cpf_candidato          NUMBER NOT NULL,
    rg_candidato           VARCHAR2(20) NOT NULL,
    rne_candidato          NUMBER,
    estado_civil           VARCHAR2(30) NOT NULL,
    tel_candidato          NUMBER NOT NULL,
    email_candidato        VARCHAR2(100) NOT NULL,
    senha                  VARCHAR2(20) NOT NULL,
    data_nascimento        DATE NOT NULL,
    genero_candidato       CHAR(1) NOT NULL,
    st_telefone_candidato  CHAR(1) NOT NULL,
    st_email_candidato     CHAR(1) NOT NULL
);

ALTER TABLE t_ibm_candidato
    ADD CONSTRAINT ck_genero_candidato CHECK ( genero_candidato IN (
        'F',
        'M'
    ) );

ALTER TABLE t_ibm_candidato
    ADD CONSTRAINT ck_st_telefone_candidato CHECK ( st_telefone_candidato IN (
        'A',
        'I'
    ) );

ALTER TABLE t_ibm_candidato
    ADD CONSTRAINT ck_st_email_candidato CHECK ( st_email_candidato IN (
        'A',
        'I'
    ) );

COMMENT ON COLUMN t_ibm_candidato.id_candidato IS
    'CHAVE PRIMÁRIA DO CANDIDADATO.';

COMMENT ON COLUMN t_ibm_candidato.nome_candidato IS
    'NOME CANDIDADO NO SISTEMA.';

COMMENT ON COLUMN t_ibm_candidato.cpf_candidato IS
    'CPF DO CANDIDATO DO SISTEMA.';

COMMENT ON COLUMN t_ibm_candidato.rg_candidato IS
    'RG DO CANDIDADATO, PREVENDO VARIAÇÕES COM LETRAS.';

COMMENT ON COLUMN t_ibm_candidato.rne_candidato IS
    'RNE CANDIDADO, CASO SEJA ESTRANGEIRO. NÃO OBRIGATÓRIO.';

COMMENT ON COLUMN t_ibm_candidato.estado_civil IS
    'ESTADO CIVIL DO CANDIDATO.';

COMMENT ON COLUMN t_ibm_candidato.tel_candidato IS
    'TELEFONE DO CANDIDATO.';

COMMENT ON COLUMN t_ibm_candidato.email_candidato IS
    'EMAIL DO CANDIDATO.';

COMMENT ON COLUMN t_ibm_candidato.senha IS
    'SENHA DO CANDIDADO CRIPTOGRAFADA.';

COMMENT ON COLUMN t_ibm_candidato.data_nascimento IS
    'DATA DE NASCIMENTO CANDIDATO.';

COMMENT ON COLUMN t_ibm_candidato.genero_candidato IS
    'GÊNERO DO CANDIDATO.Este atributo indica o SEXO  do candidato. Campo Obrigatoio e informativo de que (F) i feminino e  (M)masculino.';

COMMENT ON COLUMN t_ibm_candidato.st_telefone_candidato IS
    'Este atributo indica o status do telefone do candidato. Campo Obrigatoio e informativo de que (A) ATIVO e (I) de inoperante.';

COMMENT ON COLUMN t_ibm_candidato.st_email_candidato IS
    'Este atributo indica o status de EMAIL  do candidato. Campo Obrigatoio e informativo de que (A) ATIVO e (I) de inoperante.';

ALTER TABLE t_ibm_candidato ADD CONSTRAINT t_ibm_candidato_pk PRIMARY KEY ( id_candidato );

ALTER TABLE t_ibm_candidato ADD CONSTRAINT uk_t_ibm_cpf_candidato UNIQUE ( cpf_candidato );

ALTER TABLE t_ibm_candidato ADD CONSTRAINT uk_t_ibm_rg_candidato UNIQUE ( rg_candidato );

CREATE TABLE t_ibm_colaborador_empresa (
    id_colaborador     NUMBER NOT NULL,
    id_empresa         NUMBER NOT NULL,
    nome_colaborador   VARCHAR2(200) NOT NULL,
    email_colaborador  VARCHAR2(100) NOT NULL,
    senha              VARCHAR2(20) NOT NULL,
    cargo_colaborador  VARCHAR2(50) NOT NULL,
    cpf_colaborador    NUMBER(12) NOT NULL,
    nv_colaborador     VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN t_ibm_colaborador_empresa.id_colaborador IS
    'CHAVE PRIMÁRIA DO COLABORADOR.';

COMMENT ON COLUMN t_ibm_colaborador_empresa.nome_colaborador IS
    'NOME COLABORADOR NO SISTEMA.';

COMMENT ON COLUMN t_ibm_colaborador_empresa.email_colaborador IS
    'EMAIL COLABORADOR EMPRESA.';

COMMENT ON COLUMN t_ibm_colaborador_empresa.senha IS
    'SENHA COLABORADOR EMPRESA CRIPTOGRAFADA.';

COMMENT ON COLUMN t_ibm_colaborador_empresa.cargo_colaborador IS
    'CARGO DO COLABORADOR DA EMPRESA.';

COMMENT ON COLUMN t_ibm_colaborador_empresa.cpf_colaborador IS
    'CPF DO COLABORADOR NO SISTEMA.';

COMMENT ON COLUMN t_ibm_colaborador_empresa.nv_colaborador IS
    'NÍVEL DO COLABORADOR, PARA ESTABELECER PRIVILÉGIOS DENTRO DO SISTEMA.';

ALTER TABLE t_ibm_colaborador_empresa ADD CONSTRAINT t_ibm_colaborador_pk PRIMARY KEY ( id_colaborador );

ALTER TABLE t_ibm_colaborador_empresa ADD CONSTRAINT uk_t_ibm_cpf_colaborador UNIQUE ( cpf_colaborador );

CREATE TABLE t_ibm_curriculo (
    id_curriculo          NUMBER NOT NULL,
    id_candidato          NUMBER NOT NULL,
    id_formacao           NUMBER NOT NULL,
    id_skill              NUMBER NOT NULL,
    apresentacao_pessoal  VARCHAR2(1000) NOT NULL
);

COMMENT ON COLUMN t_ibm_curriculo.id_curriculo IS
    'CHAVE PRIMÁRIA DO CURRÍCULO DO CANDIDATO.';

COMMENT ON COLUMN t_ibm_curriculo.apresentacao_pessoal IS
    'APRESENTAÇÃO PESSOAL DO CANDIDADATO COM AS PRÓPRIAS PALAVRAS.';

CREATE UNIQUE INDEX t_ibm_curriculo__idx ON
    t_ibm_curriculo (
        id_candidato
    ASC );

ALTER TABLE t_ibm_curriculo ADD CONSTRAINT t_ibm_curriculo_pk PRIMARY KEY ( id_curriculo );

CREATE TABLE t_ibm_empresa (
    id_empresa     NUMBER NOT NULL,
    cnpj_empresa   NUMBER(20) NOT NULL,
    razao_social   VARCHAR2(200) NOT NULL,
    nome_fantasia  VARCHAR2(100),
    endereco       VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN t_ibm_empresa.id_empresa IS
    'CHAVE PRIMÁRIA EMPRESA. NO CASO DO CHALLENGE, É A IBM, PORÉM PREVEMOS QUE OUTRAS EMPRESAS PODEM SER CADASTRADAS FUTURAMENTE.';

COMMENT ON COLUMN t_ibm_empresa.cnpj_empresa IS
    'CNPJ DA EMPRESA NO SISTEMA.';

COMMENT ON COLUMN t_ibm_empresa.razao_social IS
    'RAZÃO SOCIAL DA EMPRESA NO SISTEMA.';

COMMENT ON COLUMN t_ibm_empresa.nome_fantasia IS
    'NOME FANTASIA EMPRESA, NÃO OBRIGATÓRIO.';

COMMENT ON COLUMN t_ibm_empresa.endereco IS
    'ENDEREÇO DA EMPRESA.';

ALTER TABLE t_ibm_empresa ADD CONSTRAINT t_ibm_empresa_pk PRIMARY KEY ( id_empresa );



CREATE TABLE t_ibm_end_candidato (
    id_endereco       NUMBER NOT NULL,
    id_candidato      NUMBER NOT NULL,
    logradouro        VARCHAR2(100) NOT NULL,
    uf                VARCHAR2(2) NOT NULL,
    ponto_referencia  VARCHAR2(50) NOT NULL,
    dt_inicio         DATE NOT NULL,
    dt_fim            DATE,
    nm_logradouro     VARCHAR2(100) NOT NULL,
    bairro            VARCHAR2(80),
    cep               NUMBER(8) NOT NULL,
    cidade            VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN t_ibm_end_candidato.id_endereco IS
    'CHAVE PRIMÁRIA ENDEREÇO CANDIDATO.';

COMMENT ON COLUMN t_ibm_end_candidato.logradouro IS
    'LOGRADOURO CANDIDATO.';

COMMENT ON COLUMN t_ibm_end_candidato.uf IS
    'UF DO LOGRADOURO.';

COMMENT ON COLUMN t_ibm_end_candidato.ponto_referencia IS
    'ponro descriçao do local ';

COMMENT ON COLUMN t_ibm_end_candidato.dt_inicio IS
    'este atributo irá receber a data inicio do candidato associado ao endereço LOGRADOURO.';

COMMENT ON COLUMN t_ibm_end_candidato.dt_fim IS
    'este atributo irá receber a data fim do candidato associado ao endereço LOGRADOURO.
Seu conteudo é obrigatorio.';

COMMENT ON COLUMN t_ibm_end_candidato.bairro IS
    'esse atributo armazena a informação  do bairro ';

COMMENT ON COLUMN t_ibm_end_candidato.cep IS
    'Este atributo é obrigatorio e armazena o valor do cep';

COMMENT ON COLUMN t_ibm_end_candidato.cidade IS
    'esse atributo recebe o valor do nome cidade';

ALTER TABLE t_ibm_end_candidato ADD CONSTRAINT t_ibm_end_candidato_pkv1 PRIMARY KEY ( id_endereco );



CREATE TABLE t_ibm_end_empresa (
    id_endereco_ibm  NUMBER NOT NULL,
    id_empresa       NUMBER NOT NULL,
    nm_logradouro    VARCHAR2(100) NOT NULL,
    logradouro       VARCHAR2(80) NOT NULL,
    bairro           VARCHAR2(80),
    cep               NUMBER(8) NOT NULL,
    uf                VARCHAR2(2) NOT NULL,
    ponto_referencia  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_ibm_end_empresa.id_endereco_ibm IS
    'este atributo é o de identificação primary key';

ALTER TABLE t_ibm_end_empresa ADD CONSTRAINT t_ibm_end_empresa_pk PRIMARY KEY ( id_endereco_ibm );



CREATE TABLE t_ibm_feedback (
    id_feedback     NUMBER NOT NULL,
    id_colaborador  NUMBER NOT NULL,
    tipo_feedback   VARCHAR2(20),
    desc_feedback   VARCHAR2(100) NOT NULL,
    data_feedback   DATE NOT NULL
);

COMMENT ON COLUMN t_ibm_feedback.id_feedback IS
    'ID FEEDBACK PARA O CANDIDATO.';

COMMENT ON COLUMN t_ibm_feedback.tipo_feedback IS
    'SE É POSITIVO OU NEGATIVO, IMPACTANDO NO CÁLCULO DO SCORE.';

COMMENT ON COLUMN t_ibm_feedback.desc_feedback IS
    'DESCRIÇÃO DO FEEDBACK';

COMMENT ON COLUMN t_ibm_feedback.data_feedback IS
    'DATA DO FEEDBACK NO SISTEMA.';

ALTER TABLE t_ibm_feedback ADD CONSTRAINT t_ibm_softskill_pk PRIMARY KEY ( id_feedback );

CREATE TABLE t_ibm_formacao_academica (
    id_formacao     NUMBER NOT NULL,
    nivel_formacao  VARCHAR2(100) NOT NULL,
    instituicao     VARCHAR2(100) NOT NULL,
    data_inicio     DATE NOT NULL,
    data_fim        DATE NOT NULL,
    status          VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_ibm_formacao_academica.id_formacao IS
    'ID DA FORMACAO CADASTRADA NO SISTEMA.';

COMMENT ON COLUMN t_ibm_formacao_academica.nivel_formacao IS
    'ESTABELECER SE É ENSINO MÉDIO, SUPERIOR, PÓS GRADUAÇÃO, MBA...';

COMMENT ON COLUMN t_ibm_formacao_academica.instituicao IS
    'INFORMAR A INSTITUIÇÃO QUE ESTÁ CURSANDO OU CURSOU.';

COMMENT ON COLUMN t_ibm_formacao_academica.data_inicio IS
    'DATA INÍCIO FORMAÇÃO.';

COMMENT ON COLUMN t_ibm_formacao_academica.data_fim IS
    'DATA FIM FORMAÇÃO.';

COMMENT ON COLUMN t_ibm_formacao_academica.status IS
    'INFORMAR SE ESTÁ COMPLETO, INCOMPLETO OU CURSANDO.';

ALTER TABLE t_ibm_formacao_academica ADD CONSTRAINT t_ibm_formacao_academica_pk PRIMARY KEY ( id_formacao );

CREATE TABLE t_ibm_processo_seletivo (
    id_processo_seletivo  NUMBER NOT NULL,
    id_vaga               NUMBER NOT NULL,
    id_curriculo          NUMBER NOT NULL,
    data_inicio           DATE NOT NULL,
    data_fim              DATE,
    id_feedback           NUMBER NOT NULL
);

COMMENT ON COLUMN t_ibm_processo_seletivo.id_processo_seletivo IS
    'ID PROCESSO SELETIVO.';

COMMENT ON COLUMN t_ibm_processo_seletivo.data_inicio IS
    'DATA INÍCIO PROCESSO SELETIVO.';

COMMENT ON COLUMN t_ibm_processo_seletivo.data_fim IS
    'DATA FIM PROCESSO SELETIVO.';

CREATE UNIQUE INDEX t_ibm_processo_seletivo__idx ON
    t_ibm_processo_seletivo (
        id_feedback
    ASC );

ALTER TABLE t_ibm_processo_seletivo ADD CONSTRAINT t_ibm_formacao_academica_pkv1 PRIMARY KEY ( id_processo_seletivo );

CREATE TABLE t_ibm_score (
    id_score      NUMBER NOT NULL,
    id_candidato  NUMBER NOT NULL,
    score         NUMBER NOT NULL,
    data_score    DATE NOT NULL
);

COMMENT ON COLUMN t_ibm_score.id_score IS
    'ID DO SCORE DO CANDIDATO.';

COMMENT ON COLUMN t_ibm_score.score IS
    'SCORE ATUAL DO CANDIDATO.';

COMMENT ON COLUMN t_ibm_score.data_score IS
    'DATA QUE O SCORE FOI GERADO.';

CREATE UNIQUE INDEX t_ibm_score__idx ON
    t_ibm_score (
        id_candidato
    ASC );

ALTER TABLE t_ibm_score ADD CONSTRAINT t_ibm_score_pk PRIMARY KEY ( id_score );

CREATE TABLE t_ibm_skills (
    id_skill     NUMBER NOT NULL,
    nome_skill   VARCHAR2(50) NOT NULL,
    tipo_skill   VARCHAR2(20) NOT NULL,
    nivel_skill  VARCHAR2(100)
);

COMMENT ON COLUMN t_ibm_skills.id_skill IS
    'ID DA SKILL CADASTRADA NO SISTEMA.';

COMMENT ON COLUMN t_ibm_skills.nome_skill IS
    'NOME DA SKILL.';

COMMENT ON COLUMN t_ibm_skills.tipo_skill IS
    'DISCRIMINAR SE É UMA HARDSKILL OU SOFTSKILL';

COMMENT ON COLUMN t_ibm_skills.nivel_skill IS
    'DEPENDENDO DA SOFTSKILL OU HARDSKILL, OPICIONAL COLOCAR O NÍVEL (EX. INGLÊS PODE SER BÁSICO, INTERMEDIÁRIO OU AVANÇADO)';

ALTER TABLE t_ibm_skills ADD CONSTRAINT t_ibm_softskill_pkv1 PRIMARY KEY ( id_skill );

CREATE TABLE t_ibm_vaga (
    id_vaga                    NUMBER NOT NULL,
    descricao_vaga             VARCHAR2(300) NOT NULL,
    id_empresa                 NUMBER NOT NULL,
    id_skill                   NUMBER NOT NULL,
    id_feedback                NUMBER NOT NULL,
    requisito_nivel_academico  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_ibm_vaga.id_vaga IS
    'CHAVE PRIMÁRIA VAGA DISPONÍVEL.';

COMMENT ON COLUMN t_ibm_vaga.descricao_vaga IS
    'DESCRITIVO DA VAGA OFERTADA.';

COMMENT ON COLUMN t_ibm_vaga.requisito_nivel_academico IS
    'ONDE SERÁ INDICADO SE A VAGA É NÍVEL MÉDIO, SUPERIOR CURSANDO, SUPERIOR COMPLETO, ENTRE OUTROS.';

ALTER TABLE t_ibm_vaga ADD CONSTRAINT t_ibm_empresa_pkv1 PRIMARY KEY ( id_vaga );

ALTER TABLE t_ibm_curriculo
    ADD CONSTRAINT candidato_curriculo FOREIGN KEY ( id_candidato )
        REFERENCES t_ibm_candidato ( id_candidato );

ALTER TABLE t_ibm_score
    ADD CONSTRAINT candidato_score FOREIGN KEY ( id_candidato )
        REFERENCES t_ibm_candidato ( id_candidato );

ALTER TABLE t_ibm_processo_seletivo
    ADD CONSTRAINT curriculo_processo_seletivo FOREIGN KEY ( id_curriculo )
        REFERENCES t_ibm_curriculo ( id_curriculo );

ALTER TABLE t_ibm_colaborador_empresa
    ADD CONSTRAINT empresa_colaborador FOREIGN KEY ( id_empresa )
        REFERENCES t_ibm_empresa ( id_empresa );

ALTER TABLE t_ibm_vaga
    ADD CONSTRAINT empresa_vaga FOREIGN KEY ( id_empresa )
        REFERENCES t_ibm_empresa ( id_empresa );


ALTER TABLE t_ibm_processo_seletivo
    ADD CONSTRAINT fk_feedback_processo_seletivo FOREIGN KEY ( id_feedback )
        REFERENCES t_ibm_feedback ( id_feedback );

ALTER TABLE t_ibm_curriculo
    ADD CONSTRAINT formacao_curriculo FOREIGN KEY ( id_formacao )
        REFERENCES t_ibm_formacao_academica ( id_formacao );

ALTER TABLE t_ibm_end_candidato
    ADD CONSTRAINT id_candidato FOREIGN KEY ( id_candidato )
        REFERENCES t_ibm_candidato ( id_candidato );

ALTER TABLE t_ibm_end_empresa
    ADD CONSTRAINT pk_ibm_empresa FOREIGN KEY ( id_empresa )
        REFERENCES t_ibm_empresa ( id_empresa );


ALTER TABLE t_ibm_vaga
    ADD CONSTRAINT relation_15 FOREIGN KEY ( id_feedback )
        REFERENCES t_ibm_feedback ( id_feedback );

ALTER TABLE t_ibm_feedback
    ADD CONSTRAINT relation_16 FOREIGN KEY ( id_colaborador )
        REFERENCES t_ibm_colaborador_empresa ( id_colaborador );

ALTER TABLE t_ibm_curriculo
    ADD CONSTRAINT skill_curriculo FOREIGN KEY ( id_skill )
        REFERENCES t_ibm_skills ( id_skill );

ALTER TABLE t_ibm_vaga
    ADD CONSTRAINT skill_vagas FOREIGN KEY ( id_skill )
        REFERENCES t_ibm_skills ( id_skill );

ALTER TABLE t_ibm_processo_seletivo
    ADD CONSTRAINT vaga_processo_seletivo FOREIGN KEY ( id_vaga )
        REFERENCES t_ibm_vaga ( id_vaga );

CREATE SEQUENCE sq_ibm_candidato START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_candidato BEFORE
    INSERT ON t_ibm_candidato
    FOR EACH ROW
    WHEN ( new.id_candidato IS NULL )
BEGIN
    :new.id_candidato := sq_ibm_candidato.nextval;
END;
/

CREATE SEQUENCE sq_ibm_colaborador_empresa START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_colaborador_empresa BEFORE
    INSERT ON t_ibm_colaborador_empresa
    FOR EACH ROW
    WHEN ( new.id_colaborador IS NULL )
BEGIN
    :new.id_colaborador := sq_ibm_colaborador_empresa.nextval;
END;
/

CREATE SEQUENCE sq_ibm_curriculo START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_curriculo BEFORE
    INSERT ON t_ibm_curriculo
    FOR EACH ROW
    WHEN ( new.id_curriculo IS NULL )
BEGIN
    :new.id_curriculo := sq_ibm_curriculo.nextval;
END;
/

CREATE SEQUENCE sq_ibm_empresa START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_empresa BEFORE
    INSERT ON t_ibm_empresa
    FOR EACH ROW
    WHEN ( new.id_empresa IS NULL )
BEGIN
    :new.id_empresa := sq_ibm_empresa.nextval;
END;
/


CREATE SEQUENCE sq_ibm_end_candidato START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_end_candidato BEFORE
    INSERT ON t_ibm_end_candidato
    FOR EACH ROW
    WHEN ( new.id_endereco IS NULL )
BEGIN
    :new.id_endereco := sq_ibm_end_candidato.nextval;
END;
/





CREATE SEQUENCE sq_ibm_feedback START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_feedback BEFORE
    INSERT ON t_ibm_feedback
    FOR EACH ROW
    WHEN ( new.id_feedback IS NULL )
BEGIN
    :new.id_feedback := sq_ibm_feedback.nextval;
END;
/

CREATE SEQUENCE sq_ibm_formacao_academica START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_formacao_academica BEFORE
    INSERT ON t_ibm_formacao_academica
    FOR EACH ROW
    WHEN ( new.id_formacao IS NULL )
BEGIN
    :new.id_formacao := sq_ibm_formacao_academica.nextval;
END;
/

CREATE SEQUENCE sq_ibm_processo_seletivo START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_processo_seletivo BEFORE
    INSERT ON t_ibm_processo_seletivo
    FOR EACH ROW
    WHEN ( new.id_processo_seletivo IS NULL )
BEGIN
    :new.id_processo_seletivo := sq_ibm_processo_seletivo.nextval;
END;
/

CREATE SEQUENCE sq_ibm_end_score START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_end_score BEFORE
    INSERT ON t_ibm_score
    FOR EACH ROW
    WHEN ( new.id_score IS NULL )
BEGIN
    :new.id_score := sq_ibm_end_score.nextval;
END;
/

CREATE SEQUENCE sq_ibm_skills START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_skills BEFORE
    INSERT ON t_ibm_skills
    FOR EACH ROW
    WHEN ( new.id_skill IS NULL )
BEGIN
    :new.id_skill := sq_ibm_skills.nextval;
END;
/

CREATE SEQUENCE sq_ibm_vaga START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tr_ibm_vaga BEFORE
    INSERT ON t_ibm_vaga
    FOR EACH ROW
    WHEN ( new.id_feedback IS NULL )
BEGIN
    :new.id_feedback := sq_ibm_vaga.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             3
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          15
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         15
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
