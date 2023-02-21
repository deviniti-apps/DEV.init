import 'package:flutter/material.dart';
import 'package:presentation/application/app.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title ?? '', style: context.textTheme.titleMedium),
    );
  }
}
