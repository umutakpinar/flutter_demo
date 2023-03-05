import "package:flutter/material.dart";

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formGlobalKey = GlobalKey();

  String textFieldText = "";

  List<String> dropwDownMenuList = ["A","B","C","D","E","F","G","H"];
  String? selectedListItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Form Page",
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                    key: _formGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: textFieldText,
                          decoration: const InputDecoration(
                            label: Text("Name:"),
                            hintText: "John Doe"
                          ),
                          onChanged: (updatedText){
                            setState(() {
                              textFieldText = updatedText;
                            });
                          },
                          validator: (value){
                            if(value != null){
                              if(value.isEmpty){
                                return "At least insert a character please.";
                              }else{
                                return null; //Everything ok return null
                              }
                            }else{
                              return "It cant be null probably you have never seen this message but I have wrote it anyway :)";
                            }
                          },
                        ),
                        DropdownButtonFormField(
                            value: selectedListItem,
                            items: dropwDownMenuList.map(
                                  (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                  ),).toList(),
                            onChanged: (value){
                              setState(() {
                                selectedListItem = value;
                              });
                            },
                          validator: (value) {
                            if(value != null){
                              if(dropwDownMenuList.contains(value)){
                                return null; //if its in the list there are no problem return null
                              }else{
                                //but if its not in the list probably something gone wrong maybe the user haven't selected anything.
                                return "You need to select one of them";
                              }
                            }else{
                              return "It can't be null\nYou need to choose something from the list";
                            }
                          },
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton( onPressed: () {
                final isValidationSuccess = _formGlobalKey.currentState?.validate();
                if(isValidationSuccess == true){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved!")));
                }
              },
                child: const Text("Send"),
              ),
            )
          ]),
        ));
  }
}
