import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('data')
        ],
      ),
    );
  }
}
