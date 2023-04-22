import 'package:app_provider/newPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (_) => Favorite(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State {
  String title = 'My favorite fruit is ';
  String fruit = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'My favorite fruit is ${Provider.of<Favorite>(context).fruit}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              FruitButton(fruit: 'Apple'),
              FruitButton(fruit: 'Oranges'),
              FruitButton(fruit: 'Mangoes'),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;
  const FruitButton({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Provider.of<Favorite>(context, listen: false).changeFruit(fruit);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const Page02();
            },
          ));
        },
        child: Text(fruit));
  }
}

class Favorite extends ChangeNotifier {
  String fruit = 'Unknown11';

  changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
