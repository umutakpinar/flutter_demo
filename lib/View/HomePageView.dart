import "package:flutter/material.dart";
import 'package:flutter_demo/View/FormItemsPageView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Demo Training App"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
                padding: EdgeInsets.all(15),
              child: Text(
                "Select which what you want.",
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
              ),
            ),
            //TextButton(onPressed: (){}, child: const Text("Deneme")),
            //IconButton(onPressed: (){}, icon: const Icon(Icons.smart_button))
            //OutlinedButton(onPressed: (){}, child: const Text("Form Items (RadioButton,DropDownButton,TextField etc)")),

            //Form Items Page
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FormItemsPage()));
                },
                child: const Text("Form Items (RadioButton,DropDownButton,TextField etc)")
            ),


          ],
        ),
      ),
    );
  }
}
