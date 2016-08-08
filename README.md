Bolsa_Emprego

Este projecto é um portal destinado a uma Bolsa de Emprego. Os candidatos de entidades após efetuarem o seu registo, poderão pesquisar e demonstrar o seu interesse mútuo. As entidades poderão também indicar ofertas de emprego que possuam e os candidatos poderão fazer a sua candidatura.

Existirá um perfil de backoffice reponsável por gerir notícias e poder editar qualquer registo de sistema quer seja de um candidato, entidade, notícia ou oferta.


SETUP:

Clone the repository from bitbucket.org:
   
   SSH: git@bitbucket.org:rotiv_13/bolsa_emprego.git
   
   HTTPS: https://rotiv_13@bitbucket.org/rotiv_13/bolsa_emprego.git

Install rails from source and PostgreSQL using this tutorial:

https://gorails.com/setup/ubuntu/16.04

-Check pg_hba.conf if connection is not made and error is peer 
authentication
 
   
Setup development DB and deploy:
   - rails db:create
   - rails db:migrate:reset
   - rails db:seed
   - rails s

Heroku:

git remote add heroku https://git.heroku.com/rocky-tor-69436.git
    
