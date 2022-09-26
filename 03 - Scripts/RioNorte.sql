
CREATE SEQUENCE logistica.dim_produto_sk_produto_seq;

CREATE TABLE logistica.dim_produto (
                sk_produto INTEGER NOT NULL DEFAULT nextval('logistica.dim_produto_sk_produto_seq'),
                nk_produto INTEGER NOT NULL,
                data_entrada DATE NOT NULL,
                preco REAL NOT NULL,
                validade DATE NOT NULL,
                nome VARCHAR(30) NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                quantidade INTEGER NOT NULL,
                nm_categoria VARCHAR(20) NOT NULL,
                cod_categoria INTEGER NOT NULL,
                etl_inicio TIMESTAMP NOT NULL,
                etl_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


ALTER SEQUENCE logistica.dim_produto_sk_produto_seq OWNED BY logistica.dim_produto.sk_produto;

CREATE SEQUENCE logistica.dim_tempo_sk_tempo_seq;

CREATE TABLE logistica.dim_tempo (
                sk_tempo INTEGER NOT NULL DEFAULT nextval('logistica.dim_tempo_sk_tempo_seq'),
                nk_tempo DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_tempo PRIMARY KEY (sk_tempo)
);


ALTER SEQUENCE logistica.dim_tempo_sk_tempo_seq OWNED BY logistica.dim_tempo.sk_tempo;

CREATE TABLE logistica.ft_compra (
                sk_produto INTEGER NOT NULL,
                sk_tempo INTEGER NOT NULL,
                hora TIME NOT NULL,
                data DATE NOT NULL,
                quantidade INTEGER NOT NULL
);


ALTER TABLE logistica.ft_compra ADD CONSTRAINT dim_produto_ft_compra_fk
FOREIGN KEY (sk_produto)
REFERENCES logistica.dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE logistica.ft_compra ADD CONSTRAINT dim_tempo_ft_compra_fk
FOREIGN KEY (sk_tempo)
REFERENCES logistica.dim_tempo (sk_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
