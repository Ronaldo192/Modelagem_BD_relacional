--SCRIPT do Sistema de Gerenviamento de Videos



--                       Comandos para SEQUENCES

--Exclusão das SEQUENCES criadas
/*
    DROP SEQUENCE SQ_CD_PRODUTO;
    DROP SEQUENCE SQ_CD_CATEG_PD;
    DROP SEQUENCE SQ_NUM_CHAMADO;
    DROP SEQUENCE SQ_CD_CLIENTE;
    DROP SEQUENCE SQ_CD_GUEST;
    DROP SEQUENCE SQ_CD_ACESSO;
    DROP SEQUENCE SQ_CD_VIDEO;
    DROP SEQUENCE SQ_NVL_CLIENTE;
    DROP SEQUENCE SQ_CD_VIDEO_CATEG;
    DROP SEQUENCE SQ_CD_FUNC;
    DROP SEQUENCE SQ_CD_DEPTO;
    DROP SEQUENCE SQ_CD_TIPO_FONE;

    

--Selecionar proximo valor (esse comando armazena um número e pode provocar GAPs)

    SELECT NomeDaSequence.NEXTVAL FROM DUAL;

--Selecionar valor atual da SEQUENCE

    SELECT NomeDaSequence.CURRVAL FROM DUAL;
    
--Recuperando informações sobre SEQUENCES

    SELECT SEQUENCE_NAME,
        INCREMENT_BY,
        MAX_VALUE,
        LAST_NUMBER
    FROM USER_SEQUENCES 
    WHERE SEQUENCE_NAME='COLUNA';
    */

--                         Criação de SEQUENCES

--SEQUENCE criada para a chave primária cd_produto from T_SGV_PRODUTO
    CREATE SEQUENCE SQ_CD_PRODUTO
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 99999999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;

--SEQUENCE criada para a chave primária cd_categ from T_SGV_CATEGORIA_PD
    CREATE SEQUENCE SQ_CD_CATEG_PD
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
--SEQUENCE criada para a chave primária num_chamado from T_SGV_CHAMADO
     CREATE SEQUENCE SQ_NUM_CHAMADO
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 999999999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
--SEQUENCE criada para a chave primária cd_cliente from T_SGV_CLIENTE
     CREATE SEQUENCE SQ_CD_CLIENTE
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 9999999999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
     
 --SEQUENCE criada para a chave primária cd_guest from T_SGV_GUEST
     CREATE SEQUENCE SQ_CD_GUEST
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 9999999999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
--SEQUENCE criada para a chave primária cd_acesso from T_SGV_SENHA
     CREATE SEQUENCE SQ_CD_ACESSO
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 9999999999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
--SEQUENCE criada para a chave primária cd_video from T_SGV_VIDEO
     CREATE SEQUENCE SQ_CD_VIDEO
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 999999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
         
--SEQUENCE criada para a chave primária nvl_cliente from T_SGV_NIVEL_CLIENTE
     CREATE SEQUENCE SQ_NVL_CLIENTE
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 5
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
 --SEQUENCE criada para a chave primária cd_categ from T_SGV_VIDEO_CATEG
     CREATE SEQUENCE SQ_CD_VIDEO_CATEG
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 9999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
 --SEQUENCE criada para a chave primária cd_func from T_SGV_FUNCIONARIO
     CREATE SEQUENCE SQ_CD_FUNC
        START WITH 1
        INCREMENT BY 1 
        MAXVALUE 999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
 --SEQUENCE criada para a chave primária cd_depto from T_SGV_DEPARTAMENTO
     CREATE SEQUENCE SQ_CD_DEPTO
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 9999
        NOCYCLE 
        NOCACHE 
        ORDER ;
 
 --SEQUENCE criada para a chave primária cd_tipo_fone from T_SGV_TIPO_FONE
     CREATE SEQUENCE SQ_CD_TIPO_FONE
        START WITH 1 
        INCREMENT BY 1 
        MAXVALUE 9999999999
        NOCYCLE 
        NOCACHE 
        ORDER ;

--Recuperando informações sobre SEQUENCES

/*SELECT SEQUENCE_NAME,
    INCREMENT_BY,
    MAX_VALUE,
    LAST_NUMBER
FROM USER_SEQUENCES 
WHERE SEQUENCE_NAME='COLUNA';*/

--Criação de tabelas

CREATE TABLE t_sgv_beneficio (
    cd_beneficio   NUMBER(2) NOT NULL,
    qtd_desconto   VARCHAR2(5),
    frete_gratis   CHAR(1),
    desconto_frete NUMBER(3, 2)
);

COMMENT ON COLUMN t_sgv_beneficio.cd_beneficio IS
    'Aqui é armazenado o codigo do beneficio';

COMMENT ON COLUMN t_sgv_beneficio.qtd_desconto IS
    'Percentual de desconto que o usuario ganhar ao realizar uma compra.';

COMMENT ON COLUMN t_sgv_beneficio.frete_gratis IS
    'Será marcado como S ou N pelo sistema dependendo do nivel, pois o user pode ou não ter o beneficio.
Apenas usuarios N5 possuiram o benefício.';

COMMENT ON COLUMN t_sgv_beneficio.desconto_frete IS
    'Usuario N4 terão desconto de 75% no frete
Usuario N3 terão desconto de 50% no frete
Usuarios N2 terão desconto de 25% no frete';

ALTER TABLE t_sgv_beneficio
    ADD CONSTRAINT ck_sgv_beneficio_fretegratis CHECK ( frete_gratis IN ( 'S', 'N' ) );

ALTER TABLE t_sgv_beneficio ADD CONSTRAINT t_sgv_beneficio_pk PRIMARY KEY ( cd_beneficio );

CREATE TABLE t_sgv_categoria_pd (
    cd_categoria NUMBER(6) NOT NULL,
    ds_categoria VARCHAR2(400) NOT NULL,
    st_categ     CHAR(1) NOT NULL,
    dt_inicio    DATE NOT NULL,
    dt_termino   DATE
);

COMMENT ON COLUMN t_sgv_categoria_pd.cd_categoria IS
    'Aqui será armazenado o codigo da categoria do produto. ';

COMMENT ON COLUMN t_sgv_categoria_pd.ds_categoria IS
    'Aqui será armazenada a descrição da categoria da categoria.';

COMMENT ON COLUMN t_sgv_categoria_pd.st_categ IS
    'Aqui será armazenado o status da categoria, se está ativa (A) ou inativa (I). Ambos com letra maiúscula.';

COMMENT ON COLUMN t_sgv_categoria_pd.dt_inicio IS
    'Aqui será armazenada data data de criação da categoria. DD/MM/AAAA';

COMMENT ON COLUMN t_sgv_categoria_pd.dt_termino IS
    'Aqui será armazenada a data de termino da categoria, caso haja. DD/MM/AAAA';

ALTER TABLE t_sgv_categoria_pd
    ADD CONSTRAINT ck_sgv_catagoria_status CHECK ( st_categ IN ( 'S', 'I' ) );

ALTER TABLE t_sgv_categoria_pd ADD CONSTRAINT ck_sgv_categoria_dt_termino CHECK ( dt_termino >= dt_inicio );

ALTER TABLE t_sgv_categoria_pd ADD CONSTRAINT t_sgv_categoria_pk PRIMARY KEY ( cd_categoria );

CREATE TABLE t_sgv_categoria_video (
    cd_categ   NUMBER(10) NOT NULL,
    tipo_categ VARCHAR2(40) NOT NULL
);

COMMENT ON COLUMN t_sgv_categoria_video.cd_categ IS
    'Aqui será armazenado o codigo único da categoria do video.';

COMMENT ON COLUMN t_sgv_categoria_video.tipo_categ IS
    'Aqui será armazenado o tipo da categoria do video.';

ALTER TABLE t_sgv_categoria_video ADD CONSTRAINT t_sgv_categoria_video_pk PRIMARY KEY ( cd_categ );

CREATE TABLE t_sgv_chamado (
    num_chamado    NUMBER(15) NOT NULL,
    cd_produto     NUMBER(14) NOT NULL,
    cd_cliente     NUMBER(9) NOT NULL,
    cd_funcionario NUMBER(9) NOT NULL,
    st_chamado     CHAR(1) NOT NULL,
    dt_abertura    DATE NOT NULL,
    dt_atendimento DATE,
    dt_termino     DATE,
    ind_satisfacao NUMBER(2),
    tp_chamado     VARCHAR2(10) NOT NULL,
    txt_chamado    VARCHAR2(1000) NOT NULL,
    res_chamado    VARCHAR2(2000)
);

COMMENT ON COLUMN t_sgv_chamado.num_chamado IS
    'Aqui será armazenado o número do chamado.';

COMMENT ON COLUMN t_sgv_chamado.cd_produto IS
    'Código que faz referencia do produto ao chamado.';

COMMENT ON COLUMN t_sgv_chamado.cd_cliente IS
    'Código qdo cliente que abriu o chamado.';

COMMENT ON COLUMN t_sgv_chamado.cd_funcionario IS
    'Código do funcionário que irá atender o chamado.';

COMMENT ON COLUMN t_sgv_chamado.st_chamado IS
    'Aqui será armazenado o status do chamado, com as opções 
A - Aberto
E - Em andamento
C - Cancelado
F - Fechado
X - Fechado com insatisfação do User

Ambos com letra maiúscula.';

COMMENT ON COLUMN t_sgv_chamado.dt_abertura IS
    'Aqui é armazenada a data da abertura do chamado. Formato DD/MM/AAAA';

COMMENT ON COLUMN t_sgv_chamado.dt_atendimento IS
    'Aqui será armazenada a data de incio do atendimento. Formato DD/MM/AAAA';

COMMENT ON COLUMN t_sgv_chamado.dt_termino IS
    'Aqui é armazenada a data de término do atendimento.  Formato DD/MM/AAAA';

COMMENT ON COLUMN t_sgv_chamado.ind_satisfacao IS
    'Campo que será preenchido ao final do atendimento, caso o cliente opine sobre, numa escala de 1 a 10.';

COMMENT ON COLUMN t_sgv_chamado.tp_chamado IS
    'Aqui será armazenada a classificação do chamado.Tipo 1: Sugestão    Tipo 2: Reclamação';

COMMENT ON COLUMN t_sgv_chamado.txt_chamado IS
    'Aqui será armazenada a dúvida/reclamação do cliente.';

COMMENT ON COLUMN t_sgv_chamado.res_chamado IS
    'Aqui será armazenada a resposta do funcionário para o chamado. ';

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT ck_sgv_chamado_status CHECK ( st_chamado IN ( 'A', 'E', 'C', 'F', 'X' ) );

ALTER TABLE t_sgv_chamado ADD CONSTRAINT ck_sgv_chamado_dt_atendimento CHECK ( dt_atendimento >= dt_abertura );

ALTER TABLE t_sgv_chamado ADD CONSTRAINT ck_sgv_chamado_dt_termino CHECK ( dt_termino >= dt_atendimento );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT ck_sgv_chamado_tipo CHECK ( tp_chamado IN ( 'Reclamação', 'Sugestão' ) );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT ck_sgv_chamado_satisfacao CHECK ( ind_satisfacao >= 1
                                                     AND ind_satisfacao <= 10 );

ALTER TABLE t_sgv_chamado ADD CONSTRAINT t_sgv_chamado_pk PRIMARY KEY ( num_chamado,
                                                                        cd_cliente );

CREATE TABLE t_sgv_cliente (
    cd_cliente  NUMBER(16) NOT NULL,
    cd_acesso   NUMBER(16) NOT NULL,
    nvl_cliente NUMBER(1) NOT NULL,
    nm_cliente  VARCHAR2(60) NOT NULL,
    end_email   VARCHAR2(40) NOT NULL
);

COMMENT ON COLUMN t_sgv_cliente.cd_cliente IS
    'Aqui será armazerano o codigo unico dos clientes.';

COMMENT ON COLUMN t_sgv_cliente.cd_acesso IS
    'Essa é o codigo que relaciona a senha de acesso ao cliente.';

COMMENT ON COLUMN t_sgv_cliente.nm_cliente IS
    'Aqui será armazenado o nome completo do cliente, no formato InitCap';

COMMENT ON COLUMN t_sgv_cliente.end_email IS
    'Aqui será armazenado o email do cliente, que é por onde ele recebe notificações da plataforma e também é o mesmo  que ele utiliza para realizar login no site.'
    ;

CREATE UNIQUE INDEX t_sgv_cliente__idx ON
    t_sgv_cliente (
        cd_acesso
    ASC );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cliente_pk PRIMARY KEY ( cd_cliente );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cliente_end_email_un UNIQUE ( end_email );

CREATE TABLE t_sgv_departamento (
    cd_depto     NUMBER(4) NOT NULL,
    nm_depto     VARCHAR2(40) NOT NULL,
    area_atuacao VARCHAR2(20)
);

COMMENT ON COLUMN t_sgv_departamento.cd_depto IS
    'Aqui será armazenado o código único do departamento.';

COMMENT ON COLUMN t_sgv_departamento.nm_depto IS
    'Aqui será armazenado o nome do departament, no formato InitCap.';

COMMENT ON COLUMN t_sgv_departamento.area_atuacao IS
    'Aqui será armazenado o setor/area de atuação do departamento.';

ALTER TABLE t_sgv_departamento ADD CONSTRAINT t_sgv_departamento_pk PRIMARY KEY ( cd_depto );

CREATE TABLE t_sgv_funcionario (
    cd_funcionario  NUMBER(9) NOT NULL,
    cd_depto        NUMBER(4) NOT NULL,
    eml_funcionario VARCHAR2(45) NOT NULL,
    nm_funcionario  VARCHAR2(50) NOT NULL,
    dt_nasc         DATE NOT NULL,
    crg_funcionario VARCHAR2(35) NOT NULL
);

COMMENT ON COLUMN t_sgv_funcionario.cd_funcionario IS
    'Aqui será armazenado ocodigo único do funcionário.';

COMMENT ON COLUMN t_sgv_funcionario.eml_funcionario IS
    'Aqui será armazenado o e-mail do funcionário.';

COMMENT ON COLUMN t_sgv_funcionario.nm_funcionario IS
    'Aqui será armazenado o nome completo do funcionário, no formato InitCap.';

COMMENT ON COLUMN t_sgv_funcionario.dt_nasc IS
    'Aqui será armazenada a data de nascimento do funcionário, no formato DD/MM/AAAA';

COMMENT ON COLUMN t_sgv_funcionario.crg_funcionario IS
    'Aqui será armazenado o cargo do funcionário.';

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT t_sgv_funcionario_pk PRIMARY KEY ( cd_funcionario );

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT un_sgv_funcionario_email UNIQUE ( eml_funcionario );

CREATE TABLE t_sgv_guest (
    cd_guest  NUMBER(17) NOT NULL,
    dt_acesso DATE NOT NULL
);

COMMENT ON COLUMN t_sgv_guest.cd_guest IS
    'Aqui será armazenado um codigo de acesso para cada usuário deslogado que acessar.';

COMMENT ON COLUMN t_sgv_guest.dt_acesso IS
    'Aqui fica armazenado a data do acesso do usuário deslogado.';

ALTER TABLE t_sgv_guest ADD CONSTRAINT t_sgv_guest_pk PRIMARY KEY ( cd_guest );

CREATE TABLE t_sgv_nivel_beneficio (
    cd_nivel_beneficio NUMBER(2) NOT NULL,
    nvl_cliente        NUMBER(1) NOT NULL,
    cd_beneficio       NUMBER(2) NOT NULL
);

COMMENT ON COLUMN t_sgv_nivel_beneficio.cd_nivel_beneficio IS
    'Aqui será armazenado um código unico para a relação entre nivel e beneficio.';

COMMENT ON COLUMN t_sgv_nivel_beneficio.nvl_cliente IS
    'Coluna que faz refencia ao nivel do cliente.';

COMMENT ON COLUMN t_sgv_nivel_beneficio.cd_beneficio IS
    'Aqui é armazenado o codigo do beneficio';

ALTER TABLE t_sgv_nivel_beneficio ADD CONSTRAINT t_sgv_nivel_beneficio_pk PRIMARY KEY ( cd_nivel_beneficio );

CREATE TABLE t_sgv_nivel_cliente (
    nvl_cliente NUMBER(1) NOT NULL,
    qtd_pontos  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_nivel_cliente.nvl_cliente IS
    'Nivel do cliente medido de 1 a 5, de acordo com  quantidade de pontos
0 ~ 500 p = N1
501 ~ 1500 = N2
1501 ~ 3000 = N3
3001 ~ 5000 = N4
a partir de 5001= N5';

COMMENT ON COLUMN t_sgv_nivel_cliente.qtd_pontos IS
    'Quantidade de pontos que um usuario possui, pois ele precisa de determinada quantidade de pontos para subir de nivel.';

ALTER TABLE t_sgv_nivel_cliente ADD CONSTRAINT t_sgv_nivel_cliente_pk PRIMARY KEY ( nvl_cliente );

CREATE TABLE t_sgv_pf (
    cd_cliente NUMBER(16) NOT NULL,
    nr_rg      VARCHAR2(13) NOT NULL,
    nr_cpf     VARCHAR2(14) NOT NULL,
    dt_nasc    DATE NOT NULL,
    ds_sexo    CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_sgv_pf.cd_cliente IS
    'Aqui será armazenado o codigo único do cliente PF.';

COMMENT ON COLUMN t_sgv_pf.nr_rg IS
    'Aqui será armazenado o RG do cliente. Mascara XX.XXX.XXX-X';

COMMENT ON COLUMN t_sgv_pf.nr_cpf IS
    'Aqui será armazenado o CPF do cliente. Mascara xxx.xxx.xxx-xx';

COMMENT ON COLUMN t_sgv_pf.dt_nasc IS
    'Aqui será armazeda a adata de nascimento DD/MM/AA';

COMMENT ON COLUMN t_sgv_pf.ds_sexo IS
    'Aqui será armazenado o genero biológico do cliente PF. M (Masculino) ou F (Feminino) Com Letra maiuscula.';

ALTER TABLE t_sgv_pf
    ADD CONSTRAINT ck_sgv_pf_sexo CHECK ( ds_sexo IN ( 'M', 'F' ) );

ALTER TABLE t_sgv_pf ADD CONSTRAINT t_sgv_pf_pk PRIMARY KEY ( cd_cliente );

ALTER TABLE t_sgv_pf ADD CONSTRAINT t_sgv_pf_nr_cpf_un UNIQUE ( nr_cpf );

ALTER TABLE t_sgv_pf ADD CONSTRAINT t_sgv_pf_nr_rg_un UNIQUE ( nr_rg );

CREATE TABLE t_sgv_pj (
    cd_cliente        NUMBER(16) NOT NULL,
    razao_social      VARCHAR2(30) NOT NULL,
    nr_cnpj           VARCHAR2(18) NOT NULL,
    nr_insc_estadual  NUMBER(15),
    dc_ramo_atividade VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_sgv_pj.cd_cliente IS
    'Aqui será armazenado o codigo único do cliente PJ.';

COMMENT ON COLUMN t_sgv_pj.razao_social IS
    'Aqui será armazenada a razão social do cliente no formato IntCap';

COMMENT ON COLUMN t_sgv_pj.nr_cnpj IS
    'Aqui será armazenado o numero do CNPJ da empresa. Máscara XX.XXX.XXX/XXXX-XX';

COMMENT ON COLUMN t_sgv_pj.nr_insc_estadual IS
    'Aqui será armazenado o numero da inscrição estadual do cliente.';

COMMENT ON COLUMN t_sgv_pj.dc_ramo_atividade IS
    'Aqui será descrito o ramo de atividade da empresa';

ALTER TABLE t_sgv_pj ADD CONSTRAINT t_sgv_pj_pk PRIMARY KEY ( cd_cliente );

ALTER TABLE t_sgv_pj ADD CONSTRAINT t_sgv_pj_nr_cnpj_un UNIQUE ( nr_cnpj );

CREATE TABLE t_sgv_produto (
    cd_produto   NUMBER(14) NOT NULL,
    cd_categoria NUMBER(6),
    ds_normal    VARCHAR2(400) NOT NULL,
    ds_completa  VARCHAR2(2000) NOT NULL,
    pc_unit      NUMBER(10, 2) NOT NULL,
    cd_barras    NUMBER(13),
    st_produto   CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_sgv_produto.cd_produto IS
    'Aqui será armazenado o código único do produto em um numero sequencial, conforme os produtos que forem sendo cadastrados. ';

COMMENT ON COLUMN t_sgv_produto.cd_categoria IS
    'Coluna que faz referencia a categoria do produto.';

COMMENT ON COLUMN t_sgv_produto.ds_normal IS
    'Aqui será armazenada uma breve descrição do produto.';

COMMENT ON COLUMN t_sgv_produto.ds_completa IS
    'Aqui será armazenada a descrição completa do produto.';

COMMENT ON COLUMN t_sgv_produto.pc_unit IS
    'Aqui será armazenado o preço unitário do produto  Máscara: XX.XXX.XXX,XX';

COMMENT ON COLUMN t_sgv_produto.cd_barras IS
    'Aqui será armazenado o codigo de barras do produto no formato EAN13';

COMMENT ON COLUMN t_sgv_produto.st_produto IS
    'Aqui é armazenado o status do produto, sendo: (A) ativo, (I) Inativo ou (P) Prospecção. Ambom com letra maiúscula.';

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT ck_sgv_produto_status CHECK ( st_produto IN ( 'A', 'I', 'P' ) );

ALTER TABLE t_sgv_produto ADD CONSTRAINT t_sgv_produto_pk PRIMARY KEY ( cd_produto );

ALTER TABLE t_sgv_produto ADD CONSTRAINT t_sgv_produto_cd_barras_un UNIQUE ( cd_barras );

CREATE TABLE t_sgv_senha (
    cd_acesso   NUMBER(16) NOT NULL,
    cd_password VARCHAR2(32) NOT NULL
);

COMMENT ON COLUMN t_sgv_senha.cd_acesso IS
    'Aqui será armazenado o codigo da senha que será relacionado ao cliente.';

COMMENT ON COLUMN t_sgv_senha.cd_password IS
    'Aqui será armazenada a senhavdo cliente de acesso ao site. Podendo ser até 23 digitos  alfanuméricos. ';

ALTER TABLE t_sgv_senha ADD CONSTRAINT t_sgv_senha_pk PRIMARY KEY ( cd_acesso );

CREATE TABLE t_sgv_tel_func (
    nr_fone        NUMBER(9) NOT NULL,
    cd_funcionario NUMBER(9) NOT NULL,
    nr_ddd         NUMBER(3) NOT NULL
);

COMMENT ON COLUMN t_sgv_tel_func.nr_fone IS
    'Aqui será armazenado o número telefone do funcionário.';

COMMENT ON COLUMN t_sgv_tel_func.nr_ddd IS
    'Aqui será armazenado o DDD do telefone.';

ALTER TABLE t_sgv_tel_func ADD CONSTRAINT t_sgv_tel_func_pk PRIMARY KEY ( cd_funcionario,
                                                                          nr_fone );

CREATE TABLE t_sgv_telefone (
    cd_fone      NUMBER(10) NOT NULL,
    cd_cliente   NUMBER(9) NOT NULL,
    cd_tipo_fone NUMBER(10) NOT NULL,
    num_ddd      NUMBER(3) NOT NULL,
    num_telefone NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_sgv_telefone.cd_fone IS
    'Aqui será armazenado o codigo único do telefone do cliente.';

COMMENT ON COLUMN t_sgv_telefone.cd_cliente IS
    'Aqui é o codigo do cliente associado ao telefone.';

COMMENT ON COLUMN t_sgv_telefone.num_ddd IS
    'Aqui será armazenado o DDD do telefone do cliente.';

COMMENT ON COLUMN t_sgv_telefone.num_telefone IS
    'Aqui é armazenado o numero do telefone.';

ALTER TABLE t_sgv_telefone ADD CONSTRAINT t_sgv_telefone_pk PRIMARY KEY ( cd_fone,
                                                                          cd_cliente );

ALTER TABLE t_sgv_telefone ADD CONSTRAINT t_sgv_telefone_num_telefone_un UNIQUE ( num_telefone );

CREATE TABLE t_sgv_tipo_fone (
    cd_tipo_fone NUMBER(10) NOT NULL,
    tp_fone      VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN t_sgv_tipo_fone.cd_tipo_fone IS
    'Aqui será armazenado o código do tipo de telefone.';

COMMENT ON COLUMN t_sgv_tipo_fone.tp_fone IS
    'Indica o tipo de telefone, por exemplo: Residencial, Celular, Empresarial, Comercial, Recados e etc.';

ALTER TABLE t_sgv_tipo_fone ADD CONSTRAINT t_sgv_tipo_fone_pk PRIMARY KEY ( cd_tipo_fone );

CREATE TABLE t_sgv_video (
    cd_produto NUMBER(14) NOT NULL,
    cd_video   NUMBER(12) NOT NULL,
    cd_categ   NUMBER(10) NOT NULL,
    arq_video  BLOB NOT NULL,
    st_video   CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_sgv_video.cd_produto IS
    'Aqui será armazenado o código único do produto em um numero sequencial, conforme os produtos que forem sendo cadastrados. ';

COMMENT ON COLUMN t_sgv_video.cd_video IS
    'Aqui será armazenado o codigo único do video.';

COMMENT ON COLUMN t_sgv_video.arq_video IS
    'Aqui será armazenado o video.';

COMMENT ON COLUMN t_sgv_video.st_video IS
    'Aqui será armazenado o status do video, que define se o video pode ou não ser exibido,dependendo se está "A" atiivo ou "I" inativo. Ambos com letra maiúscula.
';

ALTER TABLE t_sgv_video
    ADD CONSTRAINT ck_sgv_video_status CHECK ( st_video IN ( 'A', 'I' ) );

ALTER TABLE t_sgv_video ADD CONSTRAINT t_sgv_video_pk PRIMARY KEY ( cd_video,
                                                                    cd_produto );

CREATE TABLE t_sgv_view (
    cd_video   NUMBER(12) NOT NULL,
    cd_produto NUMBER(14) NOT NULL,
    cd_cliente NUMBER(16),
    cd_guest   NUMBER(17),
    dt_visual  DATETIME NOT NULL
);

COMMENT ON COLUMN t_sgv_view.cd_video IS
    'Coluna que faz referencia ao video visualizado.';

COMMENT ON COLUMN t_sgv_view.cd_produto IS
    'Coluna que faz referencia ao produto comprado.';

COMMENT ON COLUMN t_sgv_view.cd_cliente IS
    'Coluna que faz referencia ao cliente que visualizou o video.';

COMMENT ON COLUMN t_sgv_view.dt_visual IS
    'Aqui será armazenada a data e o horario exato da visualização do video. Máscará DD/MM/AAAA hh:mm:ss';

ALTER TABLE t_sgv_view ADD CONSTRAINT t_sgv_view_pk PRIMARY KEY ( cd_video,
                                                                  cd_produto );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT fk_chamado_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT fk_chamado_funcionario FOREIGN KEY ( cd_funcionario )
        REFERENCES t_sgv_funcionario ( cd_funcionario );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT fk_chamado_produto FOREIGN KEY ( cd_produto )
        REFERENCES t_sgv_produto ( cd_produto );

ALTER TABLE t_sgv_cliente
    ADD CONSTRAINT fk_cliente_nivel FOREIGN KEY ( nvl_cliente )
        REFERENCES t_sgv_nivel_cliente ( nvl_cliente );

ALTER TABLE t_sgv_pf
    ADD CONSTRAINT fk_cliente_pf FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_pj
    ADD CONSTRAINT fk_cliente_pj FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_cliente
    ADD CONSTRAINT fk_cliente_senha FOREIGN KEY ( cd_acesso )
        REFERENCES t_sgv_senha ( cd_acesso );

ALTER TABLE t_sgv_funcionario
    ADD CONSTRAINT fk_funcionario_departamento FOREIGN KEY ( cd_depto )
        REFERENCES t_sgv_departamento ( cd_depto );

ALTER TABLE t_sgv_nivel_beneficio
    ADD CONSTRAINT fk_nvl_beneficio_beneficio FOREIGN KEY ( cd_beneficio )
        REFERENCES t_sgv_beneficio ( cd_beneficio );

ALTER TABLE t_sgv_nivel_beneficio
    ADD CONSTRAINT fk_nvl_beneficio_nvl_cliente FOREIGN KEY ( nvl_cliente )
        REFERENCES t_sgv_nivel_cliente ( nvl_cliente );

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT fk_produto_categoria FOREIGN KEY ( cd_categoria )
        REFERENCES t_sgv_categoria_pd ( cd_categoria );

ALTER TABLE t_sgv_telefone
    ADD CONSTRAINT fk_sgv_telefone_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_tel_func
    ADD CONSTRAINT fk_tel_func_funcionario FOREIGN KEY ( cd_funcionario )
        REFERENCES t_sgv_funcionario ( cd_funcionario );

ALTER TABLE t_sgv_telefone
    ADD CONSTRAINT fk_telefone_tipo_fone FOREIGN KEY ( cd_tipo_fone )
        REFERENCES t_sgv_tipo_fone ( cd_tipo_fone );

ALTER TABLE t_sgv_video
    ADD CONSTRAINT fk_video_categoria_video FOREIGN KEY ( cd_categ )
        REFERENCES t_sgv_categoria_video ( cd_categ );

ALTER TABLE t_sgv_video
    ADD CONSTRAINT fk_video_produto FOREIGN KEY ( cd_produto )
        REFERENCES t_sgv_produto ( cd_produto );

ALTER TABLE t_sgv_view
    ADD CONSTRAINT fk_view_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_view
    ADD CONSTRAINT fk_view_guest FOREIGN KEY ( cd_guest )
        REFERENCES t_sgv_guest ( cd_guest );

ALTER TABLE t_sgv_view
    ADD CONSTRAINT fk_view_video FOREIGN KEY ( cd_video,
                                               cd_produto )
        REFERENCES t_sgv_video ( cd_video,
                                 cd_produto );

CREATE OR REPLACE TRIGGER arc_arc_1_t_sgv_pj BEFORE
    INSERT OR UPDATE OF cd_cliente ON t_sgv_pj
    FOR EACH ROW
DECLARE
    d NUMBER(16);
BEGIN
    SELECT
        a.cd_cliente
    INTO d
    FROM
        t_sgv_cliente a
    WHERE
        a.cd_cliente = :new.cd_cliente;

    IF ( d IS NULL OR d <> cd_cliente ) THEN
        raise_application_error(-20223, 'FK FK_CLIENTE_PJ in Table T_SGV_PJ violates Arc constraint on Table T_SGV_CLIENTE - discriminator column cd_cliente doesn''t have value cd_cliente'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_arc_1_t_sgv_pf BEFORE
    INSERT OR UPDATE OF cd_cliente ON t_sgv_pf
    FOR EACH ROW
DECLARE
    d NUMBER(16);
BEGIN
    SELECT
        a.cd_cliente
    INTO d
    FROM
        t_sgv_cliente a
    WHERE
        a.cd_cliente = :new.cd_cliente;

    IF ( d IS NULL OR d <> cd_cliente ) THEN
        raise_application_error(-20223, 'FK FK_CLIENTE_PF in Table T_SGV_PF violates Arc constraint on Table T_SGV_CLIENTE - discriminator column cd_cliente doesn''t have value cd_cliente'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

COMMIT;

--rollback

