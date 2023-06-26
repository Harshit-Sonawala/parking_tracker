import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter Search Query:',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                )),
            const TextField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {},
              child: Text(
                'Search',
                style: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
