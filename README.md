# The Movie Database Front End

## Explicação do Projeto

Este é um projeto que demonstra meu conhecimento em Flutter e arquitetura de software para aplicações de nível Pleno/Senior. O objetivo é criar uma aplicação em Flutter para Android, Windows e Web que permita visualizar filmes e fazer pesquisas utilizando a API do TMDB (The Movie Database).

O framework utilizado foi o Flutter e a arquitetura escolhida foi a [Clean Dart Architecture](https://github.com/Flutterando/Clean-Dart) do Fluterando.

A injeção de dependência foi aplicada em todas as camadas da arquitetura: External, Infra, Domain e Presenter.

Foram desenvolvidos testes unitários para garantir a qualidade e a integridade do código em todas as camadas.

A versão web do projeto é responsiva e pode ser facilmente acessada e utilizada em dispositivos móveis, oferecendo uma experiência consistente em diferentes tamanhos de tela.

## Rotas da API Utilizadas

As seguintes rotas da API do TMDB foram utilizadas:

- https://api.themoviedb.org/3/movie/popular
- https://api.themoviedb.org/3/search/movie
- https://api.themoviedb.org/3/trending/movie/{time_window}

Além disso, a rota https://api.themoviedb.org/3/movie/upcoming foi implementada para uso posterior no projeto.

## Demonstração Online

O projeto está disponível online para visualização e teste em [The Movie Database Front End](https://the-movie-database-front-end.netlify.app/).

## Execução Local

Para executar o projeto localmente, siga os passos abaixo:

1. Crie o arquivo `.env` seguindo o exemplo do arquivo `.example.env`, e insira a chave da API do TMDB.
2. Você pode executar o projeto em Android, Windows e Web executando o comando `flutter run` e selecionando a plataforma desejada.
   - Obs: O iOS não está configurado.

## Testes Unitários

O projeto inclui testes unitários para garantir a qualidade e robustez do código. Os testes foram desenvolvidos utilizando a estrutura padrão de testes do Flutter.

### Como Executar os Testes

Para executar os testes unitários, utilize o seguinte comando:
 `flutter test`

Este comando irá rodar todos os testes unitários presentes no projeto e fornecerá feedback sobre o resultado de cada teste.


## Dependências

As seguintes dependências foram utilizadas no projeto:

- dio: ^5.4.1
- flutter_dotenv: ^5.1.0
- cached_network_image: ^3.3.1
- google_fonts: ^6.2.1
- pager: ^0.0.6
- mockito: ^5.4.4
- build_runner: ^2.4.7
- dartz: ^0.10.1

Estas dependências foram escolhidas para auxiliar no desenvolvimento e na execução do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](https://opensource.org/licenses/MIT).

