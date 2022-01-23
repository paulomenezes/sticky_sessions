import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/main_drawer.dart';
import 'package:sticky_sessions/features/home/components/meeting_card.dart';
import 'package:sticky_sessions/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          shadowColor: Colors.grey.shade50,
          title: const Text(
            'Meetings',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Container(
          color: const Color(0xFFF3F3F3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Recents",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF929292)),
                )),
            const MeetingCard(
              isRecent: true,
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Older",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF929292)),
                )),
            ListView.builder(
              itemBuilder: (context, index) => const MeetingCard(
                isRecent: false,
              ),
              itemCount: 1,
              shrinkWrap: true,
            ),
          ]),
        ));
  }
}
