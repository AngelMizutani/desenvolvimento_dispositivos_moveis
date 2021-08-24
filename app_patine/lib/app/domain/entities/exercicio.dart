//@dart=2.9

class Exercicio {
  dynamic id;
  String nome;
  String descricao;
  String urlImagem;
  int likes;
  int dislikes;
  //dynamic treinadorId;

  Exercicio(
      {this.id,
      this.nome,
      this.descricao,
      this.urlImagem,
      this.likes = 0,
      this.dislikes = 0
      //this.treinadorId
      });
}
