import 'package:flutter/material.dart';

class FormItemsPage extends StatefulWidget {
  const FormItemsPage({Key? key}) : super(key: key);

  @override
  State<FormItemsPage> createState() => _FormItemsPageState();
}

class _FormItemsPageState extends State<FormItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Form Items"),
      ),
      body: Center(
        child: Text("Form Items sayfası"),
      )
    );
  }
}
