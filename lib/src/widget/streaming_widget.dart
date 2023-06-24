import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamingWidget<T> extends StatelessWidget {
  final BehaviorSubject<T> stream;
  final Widget? error;
  final Function(T) builder;
  final Widget? loading;

  const StreamingWidget({
    Key? key,
    required this.stream,
    required this.builder,
    this.loading,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return builder.call(snapshot.data as T);
        } else if (snapshot.hasError) {
          return error ?? const SizedBox();
        } else {
          return loading ?? const SizedBox();
        }
      },
    );
  }
}
