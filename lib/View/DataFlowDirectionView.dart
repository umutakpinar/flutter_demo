import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DataFlowDirectionsPage extends StatefulWidget {
  const DataFlowDirectionsPage({Key? key}) : super(key: key);

  @override
  State<DataFlowDirectionsPage> createState() => _DataFlowDirectionsPageState();
}

class _DataFlowDirectionsPageState extends State<DataFlowDirectionsPage> {
  //In here create my states
  var ogrenciler = ["Ali", "Ayse", "Can"];
  final controller = TextEditingController();
  late var text = "";

  void addStudent(){
    if (text != "") {
      setState(() {
        ogrenciler.add(text);
        controller.text = "";
        text = "";
      });
    }
  }

  //If something needs to do when we started, it will be making in initState function
  @override
  void initState() {
    super.initState();
    ogrenciler.add("Reco");
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DataFlowDirections Page"),
          centerTitle: true,
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints layoutConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: layoutConstraints.maxHeight
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      Text(
                        "Students",
                        textScaleFactor: 2.2,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.greenAccent,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  const Text(
                    "Ogrenciler",
                    textScaleFactor: 1.5,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView(
                      children: [
                        for (var i in ogrenciler)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(i.toString())),
                              const Divider(
                                color: Colors.black,
                                height: 2,
                                thickness: 2,
                                indent: 40,
                                endIndent: 40,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("New Student: $text"),
                  ),
                  TextField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        if (value != "") {
                          text = value;
                        }
                      });
                    },
                  ),
                  AddStudentButton(yeniOgrenciEkle: addStudent,)
                ],
              ),
            ),
          );
        }));
  }
}

class AddStudentButton extends StatefulWidget {
  final void Function() yeniOgrenciEkle;

  const AddStudentButton({Key? key, required this.yeniOgrenciEkle}) : super(key: key);

  @override
  State<AddStudentButton> createState() => _AddStudentButtonState();
}

class _AddStudentButtonState extends State<AddStudentButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: widget.yeniOgrenciEkle,
          child: const Text("Add new student!"),
      ),
    );
  }
}



