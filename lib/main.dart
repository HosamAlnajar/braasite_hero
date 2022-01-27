import 'package:braasite_hero/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = [
      User(
        name: 'Hosam',
        photo: 'assets/1.png',
      ),
      User(
        name: 'Jalal',
        photo: 'assets/3.png',
      ),
      User(
        name: 'Natalie',
        photo: 'assets/2.png',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ...users
              .map(
                (user) => ListTile(
                  leading: Hero(
                    tag: user.name,
                    child: Image(
                      image: AssetImage(user.photo),
                    ),
                  ),
                  title: Text(user.name),
                  trailing: const Icon(Icons.delete),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        name: user.name,
                        photo: user.photo,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.name, required this.photo})
      : super(key: key);

  final String photo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Hero(
            tag: name,
            child: Image(
              image: AssetImage(photo),
            ),
          ),
          Text(name)
        ],
      ),
    );
  }
}
