import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_demo/View/ConstraintsView.dart';
import 'package:flutter_demo/View/FormItemsPageView.dart';

import 'FormPageView.dart';
import 'InstrinsicHeightPageView.dart';

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
      body: SingleChildScrollView(
        child :
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text(
                  "Select which what you want.",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                ),
                //Form Items Page
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FormItemsPage()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Form Items (RadioButton, DropDownButton, Slider, TextField etc)",
                        textAlign: TextAlign.center,
                      ),
                    )
                ),

                //Form Page
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FormPage(),));
                },
                    child: const Text("Form Page")
                ),

                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConstraintsPage()));
                    },
                    child: const Text("Constraints Page")
                ),

              //InstrinsicHeight/IntrinsicWidth
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InstrinsicHeightPage()));
                    },
                    child: const Padding(
                        padding: EdgeInsets.all(10),
                      child: Text(
                          "LayoutBuilder, IntrinsicHeight & ConstrainedBox Widgets Usage Sample"
                      ),
                    )
                ),

              ],
            ),
          ),


        ),
      )
    );
  }
}
