import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/triangle_painter.dart';
import 'package:sticky_sessions/utils/constants.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  get isRecent => null;

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              shadowColor: Colors.grey.shade50,
              title: const Text(
                'Starfish',
              ),
              bottom: TabBar(
                labelColor: const Color(0xFF57BE7F),
                labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                unselectedLabelColor: Colors.grey.shade700,
                indicatorColor: const Color(0xFF57BE7F),
                tabs: [
                  Tab(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("START"),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF57BE7F),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: const Text(
                          "32",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            body: Container(
              color: const Color(0xFFF3F3F3),
              child: TabBarView(children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(onPressed: () {}, child: const Text("+ NEW NOTE")),
                        const SizedBox(
                          height: 16,
                        ),
                        Stack(children: [
                          CustomPaint(
                              painter: TrianglePainter(
                                  drawShadow: true,
                                  getPath: (double x, double y) => Path()
                                    ..moveTo(0, y)
                                    ..lineTo(0, 0)
                                    ..lineTo(x, 0)
                                    ..lineTo(x, y - 20)
                                    ..lineTo(x - 20, y),
                                  color: const Color(0xFFD5FDE7),
                                  paintingStyle: PaintingStyle.fill),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Username", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                        Icon(Icons.more_vert)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur.",
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CustomPaint(
                                    painter: TrianglePainter(
                                        drawShadow: false,
                                        getPath: (double x, double y) => Path()
                                          ..moveTo(0, 0)
                                          ..lineTo(x, 0)
                                          ..lineTo(0, y),
                                        color: const Color(0xFF95B1A2),
                                        paintingStyle: PaintingStyle.fill),
                                  ))),
                        ])
                      ],
                    )),
              ]),
            )));
  }
}
