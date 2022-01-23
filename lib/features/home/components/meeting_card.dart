import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class MeetingCard extends StatefulWidget {
  final bool isRecent;

  const MeetingCard({Key? key, required this.isRecent}) : super(key: key);

  @override
  State<MeetingCard> createState() => _MeetingCardState();
}

class _MeetingCardState extends State<MeetingCard> {
  Widget iconRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(color: (widget.isRecent ? Colors.white : primaryColor).withAlpha(70), shape: BoxShape.circle),
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  icon,
                  color: widget.isRecent ? Colors.white : primaryColor,
                  size: 18,
                ))),
        const SizedBox(
          width: 8,
        ),
        Text(text, style: TextStyle(color: widget.isRecent ? Colors.white : primaryColor)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 8,
              color: const Color(0xFFD5D5D5),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 8,
              color: primaryColor,
            ),
          ],
        ),
        Container(
          color: widget.isRecent ? const Color(0xFF3C0A3C) : Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Retrospective",
                  style: TextStyle(color: widget.isRecent ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 8),
              Text("Sala 01 (Cesar Apolo) • 21/03 12:30",
                  style: TextStyle(
                    color: widget.isRecent ? Colors.white : Colors.black,
                  )),
              const SizedBox(height: 8),
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur.",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
              const SizedBox(height: 8),
              iconRow(Icons.message, "3 sessions"),
              const SizedBox(height: 8),
              iconRow(Icons.people, "8 participants"),
            ],
          ),
        )
      ],
    );
  }
}
