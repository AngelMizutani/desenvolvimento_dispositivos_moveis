final createTable = '''
  CREATE TABLE users(
    id INTEGER NOT NULL PRIMARY KEY
    , name VARCHAR(255) NOT NULL
    , cpf CHAR(11) NOT NULL
    , email VARCHAR(255) NOT NULL
    , login VARCHAR(255) NOT NULL
    , password VARCHAR(255) NOT NULL
    , category CHAR(1) NOT NULL
  )
''';

final insertInstructor1 = '''
  INSERT INTO users(name, cpf, email, login, password, category)
  VALUES('Luara', '12345678900', 'luara@email.com', 'luara_adreninline', '12345', 'T')
''';

final insertInstructor2 = '''
  INSERT INTO users(name, cpf, email, login, password, category)
  VALUES('Asha', '45678912300', 'asha@email.com', 'asha_skatefresh', '12345', 'T')
''';

final insertApprentice1 = '''
  INSERT INTO users(name, cpf, email, login, password, category)
  VALUES('Angelica', '78912345600', 'angelica@email.com', 'angelica', '12345', 'A')
''';

final insertApprentice2 = '''
  INSERT INTO users(name, cpf, email, login, password, category)
  VALUES('Mateus', '15947826300', 'mateus@email.com', 'mateus', '12345', 'A')
''';

final createTableExercises = '''
    CREATE TABLE exercises(
      id INTEGER NOT NULL PRIMARY KEY
      , name VARCHAR (255) NOT NULL
      , description VARCHAR (1000) NOT NULL
      , instructor_id INT NOT NULL
      , FOREIGN KEY (instructor_id) REFERENCES users (id)
    )
''';
final insertExercise1 = '''
  INSERT INTO exercises(name, description, instructor_id)
  VALUES ('Limões', 'Desenhe círculos com os patins', 1)
''';

final insertExercise2 = '''
  INSERT INTO exercises(name, description, instructor_id)
  VALUES ('Freio em Cunha com Passos', 'Faça uma abertura de pernas com o dobro do tamanho dos ombros, e vá fechando com passos', 2)
''';

final insertExercise3 = '''
  INSERT INTO exercises(name, description, instructor_id)
  VALUES ('Freio em T', 'Faça a posição de tesoura, com o peso 80% na perna da frente. Então vire o pé de trás transversalmente, formando um T com os patins. Arraste o patins de trás até parar por completo', 1)
''';
