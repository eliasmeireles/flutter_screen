import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  final double size;

  const DefaultCircularProgressIndicator({
    Key? key,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return Center(
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(16.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
