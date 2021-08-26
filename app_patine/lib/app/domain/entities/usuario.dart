//@dart=2.9

class Usuario {
  dynamic id;
  String nome;
  String email;
  String senha;
  int likes;
  int dislikes;
  String tipo;
  String urlAvatar;

  Usuario(
      {this.id,
      this.nome,
      this.email,
      this.senha,
      this.likes = 0,
      this.dislikes = 0,
      this.tipo,
      this.urlAvatar});
}
