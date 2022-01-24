import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class SessionAddNoteScreen extends StatefulWidget {
  const SessionAddNoteScreen({Key? key}) : super(key: key);

  @override
  State<SessionAddNoteScreen> createState() => _SessionAddNoteScreenState();
}

class _SessionAddNoteScreenState extends State<SessionAddNoteScreen> {
  var textControllerNote = TextEditingController();

  var isButtonEnabled = false;
  var isLoading = false;

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = textControllerNote.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    textControllerNote.addListener(() => updateButtonStatus());
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
                'Create Note',
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
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Expanded(
                    child: TextField(
                  decoration: const InputDecoration(contentPadding: EdgeInsets.all(8)),
                  controller: textControllerNote,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                )),
              ]),
            ));
  }
}
