# Modelagem_BD_relacional
Modelagem de banco de dados relacional contendo esquema físico das tabelas e seus relacionamentos, comando DDL, DML, DQL

# Regras de negócio 

Regras de Negócios (RN):

RN01
Um produto pode ter nenhum ou vários vídeos associados, e cada vídeo somente pode exibido caso seu status esteja em “A” (ativo).
RN02
O código de identificação do produto deve ser um número sequencial para ser utilizado como SEQUENCE e crescente de acordo com novos produtos que forem sendo cadastrados.
RN03
A descrição normal do produto, sua descrição completa, e o preço unitário são obrigatórios. Já o código de barras padrão EAN13 ou correspondentes deve ser opcional.
RN04
Uma categoria de produtos pode estar associada a nenhum ou a vários produtos, e um produto somente pode estar associado a uma categoria.
RN05
O código da categoria deve ser um número sequencial para ser utilizado como SEQUENCE e crescente de acordo com novas categorias que forem cadastradas.
RN06
A descrição da categoria, o status e a data de início devem ter conteúdos obrigatoriamente. Já a data de término deve ser opcional, determinando que a categoria está com status “A” (ativo) e operante.
RN07
Existe a necessidade de se armazenar a data, hora, minutos e segundos da visualização do vídeo. Sendo assim, um vídeo pode ter nenhuma ou várias visualizações e uma visualização pertence a um único vídeo. Vídeos que estão inativos  não podem ser  visualizados.
RN08
Se o usuário estiver conectado (logado como cliente) é necessário armazenar essa informação. Caso seja um usuário anônimo (não tem login na plataforma), não é necessário armazenar informação.
RN09
A data e hora de visualização é informação obrigatória, bem como o código do produto visualizado.
RN10
Cada vídeo deve ser classificado em categoria. A seguir temos alguns exemplos dessas categorias: instalação do produto, uso no cotidiano, comercial com personalidade, entre outros. Existem centenas de categorias, sendo assim, sugerimos fortemente uma entidade aqui.
RN11
Somente o usuário logado (cliente) pode abrir nenhum ou vários chamados de dúvidas e sugestões, e cada chamado desses deve ser associado a um único cliente.
RN12
Os chamados de dúvidas e sugestões deve conter uma chave única e que possa ser utilizada como SEQUENCE.
RN13
Os chamados de dúvidas e sugestões deve conter uma data e hora de abertura do chamado e é uma informação obrigatória. Já a data e hora de atendimento do chamado deve ser opcional, ou seja, preenchida somente quando um funcionário da Melhores Compras atender.
RN14
Todo chamado tem que ter o código do funcionário associado em algum momento, pois é a partir dele que sabemos quem está realizando o atendimento. Nesse nosso projeto, vamos assumir que o chamado deve ser associado somente a um funcionário e um funcionário pode atender nenhum ou vários chamados.
RN15
Todo chamado tem um status que permite saber em qual situação ele se encontra. Os principais status são: “A” (aberto) e o primeiro status criado no início, “E” (em atendimento), “C” (cancelado)”, “F” (fechado com sucesso), “X” (fechado com insatisfação do cliente), conforme for evoluindo o atendimento. Sendo assim, esse status é informação obrigatória.
RN16
Todo chamado deve o tempo total de atendimento, computado desde a abertura até à conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.
RN17
Todo chamado dever ter um índice de satisfação, computado como um valor simples de 1 a 10, em que 1 refere-se ao cliente menos satisfeito e 10 ao cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.
RN18
Todo chamado deve ser classificado em  dois tipos:
Tipo 1: Sugestão e  Tipo 2: Reclamação e é informação obrigatória.
RN19
Todo chamado deve ser associado a um produto. Então, um produto pode possuir nenhum ou vários chamados e um chamado pertence a um único produto.
RN20
Todo chamado deve ter um texto contendo no mínimo 10.000 caracteres e seu conteúdo é obrigatório. Nessa estrutura de armazenamento, essas preciosas informações que o cliente descrever serão analisadas posteriormente pelo funcionário.
RN21
Todo chamado deve conter um texto de no mínimo 20.0000 caracteres e seu conteúdo dever ser opcional. Nessa estrutura de armazenamento, as informações de retorno do chamado serão informados pelo funcionário que atendeu ao chamado.
RN22
As principais informações do funcionário que atendeu são: código do funcionário (PK), nome do funcionário, data de nascimento, telefone com DDD, e-mail, cargo e nome do departamento que trabalha. Todas essas informações são obrigatórias.
RN23
As principais informações do cliente, que está logado e solicita abertura de chamado, são: código do cliente (PK), nome do cliente, data de nascimento, gênero de nascimento, telefone com DDD e e-mail. Todas essas informações são obrigatórias.
RN24
Regra de negócio a ser definida pelo grupo. Crie uma regra de negócio adicional e única de seu grupo que necessite criar uma nova entidade (tabela no modelo físico), bem como no mínimo três atributos (sem contar a chave PK).
