import 'package:app_provider/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page02 extends StatefulWidget {
  const Page02({super.key});

  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<Favorite>(context).fruit),
      ),
    );
  }
}
