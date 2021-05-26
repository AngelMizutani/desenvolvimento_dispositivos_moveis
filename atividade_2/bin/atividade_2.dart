import 'package:atividade_2/atividade_2.dart' as atividade_2;

void main(List<String> arguments) {
  var playlist = [
    'It´s my life',
    'American Pie',
    'A million dreams',
    'Better when I´m dancing',
    'Advice for the young at heart',
    'Spirit',
    'Hungy like the wolf'
  ];

  playlist.add('Photograph');
  playlist.insert(2, 'Firework');
  playlist.removeAt(1);

  var qtdeMusicas = playlist.length;
  print(qtdeMusicas);

  print(playlist);

  var cont = 0;

  while (cont < qtdeMusicas) {
    print(playlist[cont]);
    cont++;
  }

  do {
    print(playlist[cont]);
    cont++;
  } while (cont < qtdeMusicas);

  for (var i = 0; i < qtdeMusicas; i++) {
    print(playlist[i]);
  }

  playlist.forEach((musica) {
    print(musica);
  });

  playlist.forEach((musica) => print(musica));

  playlist.forEach(print);
}
