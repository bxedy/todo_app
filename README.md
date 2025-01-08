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

<h3>Instalação</h3>
<ol>
  <li>Clone o repositório:
    <pre><code>git clone https://github.com/bxedy/todo_app/
cd todo_app</code></pre>
  </li>
  <li>Instale as dependências:
    <pre><code>flutter pub get</code></pre>
  </li>
  <li>Rode a aplicação:
    <pre><code>flutter run</code></pre>
  </li>
</ol>

<h3>Executando os testes</h3>
<p>Para executar os testes execute:</p>
<pre><code>flutter test</code></pre>

<h2>Videos</h2>
|<img src="https://github.com/user-attachments/assets/acd36676-7362-4926-bfbc-dbf6440274dd" width="40%">|<img src="https://github.com/user-attachments/assets/ef34500b-717a-4ca9-bb08-13a1bb5edcad" width="40%">|

</html>
