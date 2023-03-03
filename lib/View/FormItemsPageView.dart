import 'package:flutter/material.dart';

class FormItemsPage extends StatefulWidget {
  const FormItemsPage({Key? key}) : super(key: key);

  @override
  State<FormItemsPage> createState() => _FormItemsPageState();
}

class _FormItemsPageState extends State<FormItemsPage> {
  String? textFieldName;
  final txtFieldController = TextEditingController();
  bool? checkBoxChecked = false;
  bool switchOpened = false;
  List<String> dropDownList = [
    "Sword&Shield",
    "Bow",
    "Double Axe",
    "Spear&Shield",
    "Two Handed Sword"
  ];
  String? selectedItem;

  double currentSliderValue = 100;

  @override
  void dispose() {
    txtFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Form Items"),
        ),
        body: ListView(
          children:[ Center(
            child: Column(
              children: [
                TextField(
                  controller: txtFieldController,
                  onChanged: (value) {
                    setState(() {
                      textFieldName = value;
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text("Enter your name here"),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: MediaQuery.of(context).size.width - 50,
                    minHeight: 20,
                    maxHeight: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Your name : ${textFieldName ?? 'John Doe'}"),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Text("Are you a student?"),
                        Checkbox(
                          value: checkBoxChecked,
                          onChanged: (value) {
                            setState(() {
                              checkBoxChecked = value;
                            });
                          },
                        ),
                        Text(checkBoxChecked! ? "Yes, I am" : "No I am not"),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Text("Do you know flutter?"),
                        Switch(
                          value: switchOpened,
                          onChanged: (value) {
                            setState(() {
                              switchOpened = value;
                            });
                          },
                        ),
                        Text(switchOpened ? "Yes, I am" : "No I am not"),
                      ],
                    )),
                const Center(
                    child: Text("Which middle age weapon do you prefer?")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: DropdownButton<String>(
                    value: selectedItem,
                    items: dropDownList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value;
                      });
                    },
                  ),
                ),


                Padding(
                    padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Text(selectedItem == null
                          ? ""
                          : "You have selected $selectedItem")
                  ),
                ),

                const Text(
                  "How tall are you? (centimeters)",
                  textAlign: TextAlign.center,
                ),

                Slider(
                    value: currentSliderValue,
                    min: 100,
                    max: 300,
                    onChanged: (value){
                      setState(() {
                        currentSliderValue = value;
                      });
                    }
                ),

                 Text(
                  currentSliderValue == 100 ? "" : "Your heigt : ${currentSliderValue.toStringAsFixed(0)} cm",
                  textAlign: TextAlign.center,
                ),

                Center(
                  child: ElevatedButton(
                    child: const Text("Set evertyhing to default values"),
                    onPressed: (){
                      setState(() {
                        textFieldName = null;
                        txtFieldController.text = "";
                        checkBoxChecked = false;
                        switchOpened = false;
                        selectedItem = null;
                        currentSliderValue = 100;
                      });
                    },
                  ),
                )

              ],
            ),
          ),
        ])
    );
  }
}
