
--criação do bando de dados


CREATE DATABASE grupo_2


--criação das tabelas de acordo com o modelo Logico



CREATE TABLE "usuario" (
  "usu_cd_id_usuario" serial not null,
  "usu_tx_nome" varchar(50) not null,
  "usu_tx_login" varchar(30) not null unique,
  "usu_tx_cpf" varchar(11) not null unique,
  "usu_dt_data_nasc" date not null,
  "usu_tx_email" varchar(75) not null unique,
  PRIMARY KEY ("usu_cd_id_usuario")
);

CREATE TABLE "categoria" (
  "cate_cd_id_categoria" serial not null,
  "cate_tx_nome" varchar(30) not null unique,
  "cate_tx_descricao" varchar(256) not null,
  PRIMARY KEY ("cate_cd_id_categoria")
);

CREATE TABLE "produto" (
  "pro_cd_id_produto" serial not null,
  "pro_tx_nome" varchar(30) unique,
  "pro_tx_descriicao" varchar(256),
  "pro_dt_fabricacao" date not null,
  "pro_nm_valor" numeric not null,
  "pro_int_estoque" int ,
  "fk_cate_cd_id_categoria" int not null,
  "fk_usu_cd_id_usuario" int not null,
  PRIMARY KEY ("pro_cd_id_produto"),
  CONSTRAINT "FK_produto.fk_usu_cd_id_usuario"
    FOREIGN KEY ("fk_usu_cd_id_usuario")
      REFERENCES "usuario"("usu_cd_id_usuario"),
  CONSTRAINT "FK_produto.fk_cate_cd_id_categoria"
    FOREIGN KEY ("fk_cate_cd_id_categoria")
      REFERENCES "categoria"("cate_cd_id_categoria")
);

CREATE TABLE "item_pedido" (
  "itp_cd_id_item_pedido" serial not null,
  "itp_int_quantidade" int not null,
  "fk_pro_cd_id_produto" int not null,
  PRIMARY KEY ("itp_cd_id_item_pedido"),
  CONSTRAINT "FK_item_pedido.fk_pro_cd_id_produto"
    FOREIGN KEY ("fk_pro_cd_id_produto")
      REFERENCES "produto"("pro_cd_id_produto")
);

CREATE TABLE "pedido" (
  "ped_cd_id_pedido" serial not null,
  "ped_dt_datapedido" date not null,
  "fk_usu_cd_id_usuario" int not null,
  "fk_itp_cd_id_item_pedido" int,
  PRIMARY KEY ("ped_cd_id_pedido"),
  CONSTRAINT "FK_pedido.fk_itp_cd_id_item_pedido"
    FOREIGN KEY ("fk_itp_cd_id_item_pedido")
      REFERENCES "item_pedido"("itp_cd_id_item_pedido"),
  CONSTRAINT "FK_pedido.fk_usu_cd_id_usuario"
    FOREIGN KEY ("fk_usu_cd_id_usuario")
      REFERENCES "usuario"("usu_cd_id_usuario")
);

CREATE TABLE "telefone" (
  "num_cd_id_telefone" serial not null,
  "num_tx_celular" varchar(11),
  "fk_usu_cd_id_usuario" int,
  PRIMARY KEY ("num_cd_id_telefone"),
  CONSTRAINT "FK_telefone.fk_usu_cd_id_usuario"
    FOREIGN KEY ("fk_usu_cd_id_usuario")
      REFERENCES "usuario"("usu_cd_id_usuario")
);

CREATE TABLE "endereco" (
  "end_cd_id_endereco" serial not null,
  "end_tx_cep" char(8) not null,
  "end_tx_numero" varchar(5) not null,
  "end_tx_rua" varchar(50) not null,
  "end_tx_bairro" varchar(20) not null,
  "end_tx_cidade" varchar(32) not null,
  "end_tx_uf" varchar(2) not null,
  "fk_usu_cd_id_usuario" int,
  PRIMARY KEY ("end_cd_id_endereco"),
  CONSTRAINT "FK_endereco.fk_usu_cd_id_usuario"
    FOREIGN KEY ("fk_usu_cd_id_usuario")
      REFERENCES "usuario"("usu_cd_id_usuario")
);



--inserir os dados da categoria e produtos


insert into categoria 
values 
(default, 'Tvs','As melhores Tvs'),
(default,'Telefones','Os melhores telefones'),
(default,'Video-game','Os melhores Video-games'),
(default,'Relogio','Os melhores Relogios'),
(default,'Periférico','Os melhores Periféricos');


--listar os dados de categoria

select *from categoria;



--incluir os dados de usuario 


insert into usuario 
values 
(default,'Rafael','rafa','14567894577','19901102','rafa@grupo2.com'),
(default,'Daniel','dani','12345671111','20011021','dani@grupo2.com'),
(default,'Isabela','isa','12345452425','20011001','isa@grupo2.com'),
(default,'James','james','12344576578','20011101','james@grupo2.com'),
(default,'Ana','ana','12331671478','20011021','ana@grupo2.com');



--listar os dados de usuario

select * from usuario;



--incluir os dados do endereco 


insert into endereco 
values 
(default,'25700-00','23','Rua Rafa','Centro','Petropolis','RJ',1),
(default,'25714-01','15','Rua Dani','Centro','Petropolis','RJ',2),
(default,'25777-02','14','Rua Isa','Centro','Petropolis','RJ',3),
(default,'25765-01','15','Rua James','Centro','Petropolis','RJ',4),
(default,'25722-01','15','Rua Ana','Centro','Petropolis','RJ',5);



--listar os dados de endereco

select * from endereco; 


--incluir os dados de telefone


insert into telefone 
values 
(default,'988888888',1),
(default,'988875221',1),
(default,'988881111',1),
(default,'988882222',1),
(default,'988880000',1);

--listar os dados de telefone

select * from telefone;


--incluir dados de produto

insert into produto 
values 
(default,'Tv Samsung OLED','49"',now(),1999.90,20,1,1), 
(default,'Iphone','14S"',now(),3999.90,20,2,3),
(default,'Ps5','PlayStation 5',now(),4299.90,1,3,1),
(default,'Cassio','M32',now(),599.90,1,4,3),
(default,'Teclado Gamer','Mecanico',now(),129.90,1,5,1);


--listar os dados de produto

select *from produto ;


--incluir item_pedido

insert into item_pedido
values
(default, 3, 1),
(default, 2, 2),
(default, 3, 4),
(default, 2, 3),
(default, 3, 5);


-- listar os itens pedidos

select * from item_pedido;

--incluir pedido 

insert into pedido
values
(default,now(),4,1),
(default,now(),1,2),
(default,now(),3,2),
(default,now(),2,3),
(default,now(),2,4);

--listar os pedidos 

select * from pedido;

--listar os produtos

select *from produto ;

insert into produto
values
(default,'Mouse','Rgb',now(),59.90,1,5,1);


select *from produto ;


-- Deletar algum item da tabela

delete from produto where pro_cd_id_produto='16';


--modelo anterior

insert into produto 
values 
(default,'Tv Samsung OLED','49"',now(),1999.90,20,1,1) 
ON CONFLICT (pro_tx_nome) DO
    UPDATE SET pro_int_estoque = produto.pro_int_estoque+1;



--criar regra de inserção em produtos 

create or replace rule inserir as
    on insert to produto
    where exists (
        select * from produto
        where pro_tx_nome = new.pro_tx_nome
        and 
        produto.fk_usu_cd_id_usuario = new.fk_usu_cd_id_usuario
    )
    do instead
    (
        update produto
        set pro_int_estoque  = pro_int_estoque + 1
        where pro_tx_nome = new.pro_tx_nome
        and 
        produto.fk_usu_cd_id_usuario = new.fk_usu_cd_id_usuario
    );



--Mostra quantos tipos de produtos cada usuario está vendendo


select
    produto.fk_usu_cd_id_usuario,
    usuario.usu_tx_nome,
    count(produto.pro_cd_id_produto) as produtos
from
    produto
join usuario on
    usuario.usu_cd_id_usuario = produto.fk_usu_cd_id_usuario
group by
    (fk_usu_cd_id_usuario, usuario.usu_tx_nome);

    

--criacao de view da nota fiscal


CREATE VIEW notafiscal
AS SELECT comprador.usu_tx_nome AS comprador,
    item_pedido.itp_int_quantidade AS quantidade,
    produto.pro_tx_nome AS produto,
    produto.pro_nm_valor AS valor,
    sum (produto.pro_nm_valor  * item_pedido.itp_int_quantidade) as total,
    vendedor.usu_tx_nome as vendedor,
    pedido.ped_dt_datapedido AS "data_de_emissão"
   FROM pedido
     JOIN usuario as comprador ON comprador.usu_cd_id_usuario = pedido.fk_usu_cd_id_usuario
     JOIN item_pedido ON item_pedido.itp_cd_id_item_pedido = pedido.fk_itp_cd_id_item_pedido
     JOIN produto ON produto.pro_cd_id_produto = item_pedido.fk_pro_cd_id_produto
     JOIN usuario as vendedor ON vendedor.usu_cd_id_usuario = produto.fk_usu_cd_id_usuario
     group by (comprador.usu_tx_nome,item_pedido.itp_int_quantidade, produto.pro_tx_nome,produto.pro_nm_valor,pedido.ped_dt_datapedido,vendedor.usu_tx_nome)
     ;




--somar os valores da nota fiscal

select  sum ((valor * quantidade)) as total
from
notafiscal


-- exibindo nota fiscal
select
    nome,
    quantidade ,
    produto ,
    valor ,
    data_de_emissão ,
    sum ((valor * quantidade)) as total
from
    notafiscal
where
    nome = 'Rafael'
    --and data_de_emissão = '2023-03-29'
group by(notafiscal.nome, notafiscal.quantidade, notafiscal.produto, notafiscal.valor, notafiscal.data_de_emissão);





--HISTÓRICO DE TRANSAÇÕES POR USUARIOS

SELECT usuario.usu_tx_nome, ped_cd_id_pedido, ped_dt_datapedido, produto.pro_tx_nome FROM usuario
JOIN pedido ON pedido.fk_usu_cd_id_usuario = usuario.usu_cd_id_usuario 
JOIN item_pedido ON pedido.fk_itp_cd_id_item_pedido = item_pedido.itp_cd_id_item_pedido 
JOIN produto ON usuario.usu_cd_id_usuario = pedido.fk_usu_cd_id_usuario;



--LISTANDO A RELAÇÃO DE ITENS PUBLICADOS COM SEUS NOMES, DESCRIÇÕES, CATEGORIAS, PREÇOS E USUÁRIO VENDEDOR

SELECT produto.pro_tx_nome, produto.pro_tx_descriicao, categoria.cate_tx_nome, produto.pro_nm_valor,
usuario.usu_tx_nome FROM usuario
JOIN produto ON produto.fk_usu_cd_id_usuario = usuario.usu_cd_id_usuario
JOIN categoria ON produto.fk_cate_cd_id_categoria = categoria.cate_cd_id_categoria;

