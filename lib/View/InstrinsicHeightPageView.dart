import "package:flutter/material.dart";

class InstrinsicHeightPage extends StatefulWidget {
  const InstrinsicHeightPage({Key? key}) : super(key: key);

  @override
  State<InstrinsicHeightPage> createState() => _InstrinsicHeightPageState();
}

class _InstrinsicHeightPageState extends State<InstrinsicHeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("LayoutBuilder, IntrinsicHeight & ConstrainedBox Widgets Usage Sample"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        height: viewportConstraints.maxHeight,
                        child: const Center(
                          child: Text("Scroll down\n"),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        height: viewportConstraints.maxHeight,
                      ),
                      Container(
                        color: Colors.green,
                        height: viewportConstraints.maxHeight,
                      ),
                      Expanded(
                        child: Container(
                          height: viewportConstraints.maxHeight,
                          color: Colors.purpleAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
