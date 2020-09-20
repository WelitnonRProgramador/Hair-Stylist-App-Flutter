
class User {

  

  final String id;
  final String name;
  final String email;
  final String senha;
  final String avatarUrl;
  final int celular;
  final int cpf;
  final bool salao;

  const User({

    this.name,
    this.email,
    this.senha,
    this.celular,
    this.id,
    this.avatarUrl,
    this.cpf,
    this.salao,
  });
}