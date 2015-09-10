# README #

### Resumo ###

Este projeto é uma proposta de solução para o seguinte teste: [https://gist.github.com/rgalba/b8244d02df17be94c6ef](https://gist.github.com/rgalba/b8244d02df17be94c6ef). Utiliza testes unitários e funcionais com RSpec, cabybara. Os relatórios são feitos com o Simplecov. 

### Versões ###

Neste projeto utilizamos as seguintes versões
* ruby 2.2.2
* rails 4.2.3

### Instalando a aplicação ###

É necessário que se tenha previamente:
(RVM recomendado)

1. Ruby versão 2.2.2
2. Rails 4.2.3


Para instalar a aplicação deve realizar as seguintes operações:
 
1. Fazer o clone da aplicação https://RafaelCosta@bitbucket.org/RafaelCosta/dictionary.git
2. Executar o comando 'bundle install'

.
.
.

### Problemas na instalação ###

É possível que se depare com os erros na instalação do projeto

1. An error occurred while installing safe_yaml (1.0.4), and Bundler cannot continue.
SOLUÇÃO: rodar gem install safe_yaml antes de rodar o bundle install

2. An error occurred while installing crack (0.4.2), and Bundler cannot continue.
SOLUÇÃO: rodar gem install crack -v '0.4.2' antes de rodar o bundle install