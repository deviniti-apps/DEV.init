import 'package:flutter/material.dart';
import 'package:presentation/application/theme.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    this.title,
    Key? key,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title ?? '', style: context.textTheme.subtitle1),
    );
  }
}
