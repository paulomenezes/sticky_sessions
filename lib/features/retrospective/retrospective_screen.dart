import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/icon_row.dart';
import 'package:sticky_sessions/utils/constants.dart';

class RetrospectiveScreen extends StatefulWidget {
  const RetrospectiveScreen({Key? key}) : super(key: key);

  get isRecent => null;

  @override
  State<RetrospectiveScreen> createState() => _RetrospectiveScreenState();
}

class _RetrospectiveScreenState extends State<RetrospectiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          shadowColor: Colors.grey.shade50,
          title: const Text(
            'Retrospective',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/session/add');
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          color: const Color(0xFFF3F3F3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/session');
                  },
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 135,
                          color: const Color(0xFF8844A4),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 10,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Starfish", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur.",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                const SizedBox(
                                  height: 8,
                                ),
                                const IconRow(isRecent: false, icon: Icons.message, text: "6 responses"),
                              ],
                            ))
                      ],
                    ),
                  )),
              itemCount: 3,
              shrinkWrap: true,
            ),
          ]),
        ));
  }
}
