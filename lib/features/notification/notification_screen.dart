import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          shadowColor: Colors.grey.shade50,
          title: const Text(
            'Notifications',
          ),
        ),
        body: Container(
          color: const Color(0xFFF3F3F3),
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(children: [
            ListView.builder(
              itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Meeting",
                                style: TextStyle(color: primaryColor),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "•",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text("1d")
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "You have been added in a meeting",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("Don't forget to participate", style: TextStyle(color: Colors.grey.shade600))
                        ],
                      ))),
              itemCount: 4,
              shrinkWrap: true,
            )
          ]),
        ));
  }
}
