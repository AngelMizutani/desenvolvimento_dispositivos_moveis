final createTable = '''
  CREATE TABLE usuario(
    id INTEGER NOT NULL PRIMARY KEY
    , nome VARCHAR(255) NOT NULL
    , cpf CHAR(11) NOT NULL
    , email VARCHAR(255) NOT NULL
    , login VARCHAR(255) NOT NULL
    , senha VARCHAR(255) NOT NULL
    , tipo CHAR(1) NOT NULL
  )
''';

final insertTreinador1 = '''
  INSERT INTO usuario(nome, cpf, email, login, senha, tipo)
  VALUES('Luara', '12345678900', 'luara@email.com', 'luara_adreninline', '12345', 'T')
''';

final insertTreinador2 = '''
  INSERT INTO usuario(nome, cpf, email, login, senha, tipo)
  VALUES('Asha', '45678912300', 'asha@email.com', 'asha_skatefresh', '12345', 'T')
''';

final insertAprendiz1 = '''
  INSERT INTO usuario(nome, cpf, email, login, senha, tipo)
  VALUES('Angelica', '78912345600', 'angelica@email.com', 'angelica', '12345', 'A')
''';

final insertAprendiz2 = '''
  INSERT INTO usuario(nome, cpf, email, login, senha, tipo)
  VALUES('Mateus', '15947826300', 'mateus@email.com', 'mateus', '12345', 'A')
''';

final createTableExercicios = '''
    CREATE TABLE exercicios(
      id INTEGER NOT NULL PRIMARY KEY
      , nome VARCHAR (255) NOT NULL
      , descricao VARCHAR (1000) NOT NULL
      , url_imagem VARCHAR (255)
    )
''';

// , treinador_id INT NOT NULL
//       , FOREIGN KEY (treinador_id) REFERENCES usuario (id)

final insertExercicio1 = '''
  INSERT INTO exercicios(nome, descricao, url_imagem)
  VALUES ('Limões', 'Posicione os pés em forma de V, aplique pressão até total abertura das pernas e depois forme um V invertido com os patins', 'https://i.ytimg.com/vi/JLS56y636IY/sddefault.jpg')
''';

final insertExercicio2 = '''
  INSERT INTO exercicios(nome, descricao, url_imagem)
  VALUES ('Freio em Cunha com Passos', 'Faça uma abertura de pernas com o dobro do tamanho dos ombros, e vá fechando com passos', 'https://i.pinimg.com/originals/07/60/4f/07604f926fd39348b7d6aeb104d96437.jpg')
''';

final insertExercicio3 = '''
  INSERT INTO exercicios(nome, descricao, url_imagem)
  VALUES ('Freio em T', 'Faça a posição de tesoura, com o peso 80% na perna da frente. Então vire o pé de trás transversalmente, formando um T com os patins. Arraste o patins de trás até parar por completo', 'https://i.ytimg.com/vi/DeAZogIb464/maxresdefault.jpg')
''';
