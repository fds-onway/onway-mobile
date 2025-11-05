# onway

Projeto criado para fins de obtenção de conceito na matéria de fábrica de software no curso de Engenharia de Software na UTFPR - Campus Dois Vizinhos.

# Arquitetura 

O projeto utiliza a arquitetura sugerida pelo Google para aplicações Flutter, conforme descrito em: https://docs.flutter.dev/app-architecture/guide

As camadas principais são:
- **UI Layer**: Responsável pela apresentação e interação com o usuário. Criação da interface gráfica e gerência do estado. Widgets, ViewModels constituem essa camada.
- **Data Layer**: Gerencia o acesso e manipulação dos dados da aplicação. Services para acesso de dados remotos e repositories constituem essa camada.
- **Domain Layer**: Contém a lógica de negócio e regras da aplicação. UseCases e Entidades constituem essa camada.

# Padrões de projeto

## Result pattern
Para tratamento de erros, será utilizado o padrão Result, fazendo uso do package: https://pub.dev/packages/result_dart

## Command pattern
Para facilitar o gerenciamento do estado, será utilizado o padrão Command: https://docs.flutter.dev/app-architecture/design-patterns/command
Command basicamente será uma classe onde encapsulará os possíveis estados das ações tomadas pelo usuário (loading, error, sucess).


# Geração de código

Para armazenar os dados locais, faremos uso de um banco relacional SQLite através do ORM Drift: https://pub.dev/packages/drift
Para que seja possível utilizá-lo, a geração de código é necessária. Sendo possível através do comando abaixo.
```
dart run build_runner build --delete-conflicting-outputs
```

# Protótipo
```
https://github.com/fds-onway/onway-mobile
```