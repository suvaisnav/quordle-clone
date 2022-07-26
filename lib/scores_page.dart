import 'package:flutter/cupertino.dart';

class ScoresPage extends StatelessWidget {
  const ScoresPage({Key? key, this.score, this.answer}) : super(key: key);
  final score;
  final answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Score:{$score}"),
      ),
    );
  }
}
