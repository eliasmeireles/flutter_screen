import 'package:flutter/material.dart';

class DefaultLoadingPage extends StatelessWidget {
  static const String route = '/loading';

  const DefaultLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}
