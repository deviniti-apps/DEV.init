import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
