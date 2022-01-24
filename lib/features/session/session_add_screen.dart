import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class SessionAddScreen extends StatefulWidget {
  const SessionAddScreen({Key? key}) : super(key: key);

  @override
  State<SessionAddScreen> createState() => _SessionAddScreenState();
}

class _SessionAddScreenState extends State<SessionAddScreen> {
  var textControllerTitle = TextEditingController();
  var textControllerDescription = TextEditingController();

  var isButtonEnabled = false;
  var isLoading = false;

  List<Color> colors = [
    Colors.purple,
    Colors.lightBlue,
    Colors.blueGrey,
    Colors.orange,
    Colors.green,
    Colors.lightGreen,
    Colors.pink,
    Colors.red,
    Colors.grey,
    Colors.teal,
    Colors.yellow,
    Colors.cyan
  ];

  Color selectedColor = Colors.purple;

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = textControllerTitle.text.isNotEmpty && textControllerDescription.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    textControllerTitle.addListener(() => updateButtonStatus());
    textControllerDescription.addListener(() => updateButtonStatus());
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            width: 50,
            color: Colors.white,
            child: const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              shadowColor: Colors.grey.shade50,
              title: const Text(
                'Create Session',
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.check,
                      color: isButtonEnabled ? Colors.green : Colors.grey,
                    ),
                    onPressed: () => {
                          //
                        }),
              ],
            ),
            body: Container(
              color: const Color(0xFFF3F3F3),
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const SizedBox(height: 40),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                  controller: textControllerTitle,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  maxLength: 30,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: textControllerDescription,
                ),
                const SizedBox(height: 20),
                Text(
                  "Select a color",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Expanded(
                    child: GridView.count(
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: [
                    for (var color in colors)
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                            padding: const EdgeInsets.all(8),
                            child: selectedColor == color
                                ? Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black.withAlpha(150)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                          )),
                  ],
                ))
              ]),
            ));
  }
}
