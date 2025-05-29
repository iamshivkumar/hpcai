import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forms')),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/write-form');
        },
        label: Text('Create Form'),
        icon: Icon(Icons.add_rounded),
      ),
    );
  }
}
