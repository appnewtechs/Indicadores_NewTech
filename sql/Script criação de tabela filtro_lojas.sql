CREATE TABLE filtro_lojas(id_usuario int REFERENCES usuario(id_usuario),
                          id_loja int REFERENCES loja(id_loja))