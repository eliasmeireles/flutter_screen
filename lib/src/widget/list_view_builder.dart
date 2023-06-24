import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(T, int);

class ListViewBuilder<T> extends StatelessWidget {
  final List<T> values;
  final ItemBuilder<T> itemBuilder;
  final EdgeInsets? padding;

  const ListViewBuilder({
    Key? key,
    required this.values,
    required this.itemBuilder,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: values.length,
        padding: padding ?? const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return itemBuilder.call(values[index], index);
        });
  }
}
