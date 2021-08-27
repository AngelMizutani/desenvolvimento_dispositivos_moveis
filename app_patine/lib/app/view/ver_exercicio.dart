import 'package:flutter/material.dart';

class VerExercicio extends StatefulWidget {
  @override
  _VerExercicioState createState() => _VerExercicioState();
}

class _VerExercicioState extends State<VerExercicio> {
  var qtdeLikes = 0;

  void _aumentarLikes() {
    setState(() {
      qtdeLikes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Limões'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Neste exercício, você vai desenhar "limões" com os seus patins',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$qtdeLikes',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'Likes',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _aumentarLikes,
        tooltip: 'Dar like',
        child: Icon(Icons.thumb_up),
      ),
    );
  }
}
