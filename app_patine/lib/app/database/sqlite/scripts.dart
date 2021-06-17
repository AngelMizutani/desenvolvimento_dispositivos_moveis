final createTable = '''
  CREATE TABLE usuario(
    id INT PRIMARY KEY
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
