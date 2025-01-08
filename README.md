# Todo App - Flutter

Este é um aplicativo de **Lista de Tarefas** (Todo App) desenvolvido com **Flutter**. O app permite ao usuário adicionar, buscar e excluir tarefas.

## Sobre

- **Gerenciamento de Estado**:
  - Utiliza **ValueNotifier** e **ChangeNotifier** para gerenciar o estado do aplicativo, evitando bibliotecas de terceiros e garantindo maior facilidade na manutenção futura..

- **Arquitetura**:
  - A arquitetura adotada é o padrão **MVVM** (Model-View-ViewModel).
  - O padrão **Clean Architecture** foi seguido para estruturar o código de forma modular, promovendo a independência entre as camadas, o que facilita a criação de testes unitários e de integração, garantindo que cada componente possa ser testado de maneira independente.

- **Banco de Dados Local**:
  - Utiliza **Sqflite** para persistência de dados de tarefas localmente.

- **Injeção de Dependências**:
  - **GetIt** é utilizado para facilitar a injeção de dependências no projeto.

- **Testes Unitários**:
  - O app inclui **Testes Unitários** com **Mocktail** para garantir o funcionamento correto das funcionalidades principais.

- **Animações**:
  - O app conta com animações suaves.

- **Algumas das Funcionalidades de Interação**:
  - **Desabilitação do botão "Criar Tarefa"** até que o título seja preenchido.
  - **Desfocar a barra de pesquisa** quando o usuário clicar fora dela.
  - **Exclusão de Tarefas**: Implementada a funcionalidade de excluir tarefas arrastando o item (swipe).
  - **Busca**: Funcionalidade de busca de tarefas através do título da tarefa.

## Tecnologias Utilizadas

- **Flutter** 3.22.2
- **GetIt**: Para injeção de dependências
- **Sqflite**: Banco de dados local (SQLite)
- **Mocktail**: Para testes unitários com mock de dependências
- **ValueNotifier** e **ChangeNotifier**: Para gerenciamento de estado reativo

