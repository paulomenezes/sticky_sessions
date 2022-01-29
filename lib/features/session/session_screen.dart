import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/triangle_painter.dart';
import 'package:sticky_sessions/core/utils/color.dart';
import 'package:sticky_sessions/features/session/blocs/session_bloc.dart';
import 'package:sticky_sessions/features/session/model/session_model.dart';
import 'package:sticky_sessions/models/column.dart' as session_column;
import 'package:sticky_sessions/models/session.dart';
import 'package:sticky_sessions/models/sticky.dart';
import 'package:sticky_sessions/utils/constants.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  get isRecent => null;

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  late SessionBloc _sessionBloc;

  @override
  void initState() {
    super.initState();

    _sessionBloc = SessionBloc();

    Future.delayed(Duration.zero, () {
      var session = ModalRoute.of(context)!.settings.arguments as Session;

      _sessionBloc.onInit(session);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SessionModel>(
        stream: _sessionBloc.stream,
        initialData: SessionModel(),
        builder: (context, state) => DefaultTabController(
            length: state.data?.session?.columns?.length ?? 0,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  shadowColor: Colors.grey.shade50,
                  title: Text(
                    state.data?.session?.name ?? '',
                  ),
                  bottom: TabBar(
                    labelColor: const Color(0xFF57BE7F),
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    unselectedLabelColor: Colors.grey.shade700,
                    indicatorColor: const Color(0xFF57BE7F),
                    isScrollable: true,
                    tabs: [
                      for (var column in state.data?.session?.columns ?? <session_column.Column>[])
                        Tab(
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(column.name ?? ""),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: column.color != null ? HexColor.fromHex(column.color!) : const Color(0xFF57BE7F),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Text(
                                state.data?.stickyByColumnMap[column.name ?? ""]?.length.toString() ?? "0",
                                style: const TextStyle(color: Colors.white, fontSize: 14),
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
                    for (var column in state.data?.session?.columns ?? <session_column.Column>[])
                      Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(routerSessionAddNote);
                                  },
                                  child: const Text("+ NEW NOTE")),
                              const SizedBox(
                                height: 16,
                              ),
                              for (var sticky in state.data?.stickyByColumnMap[column.name] ?? <Sticky>[])
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Stack(children: [
                                      CustomPaint(
                                          painter: TrianglePainter(
                                              drawShadow: true,
                                              getPath: (double x, double y) => Path()
                                                ..moveTo(0, y)
                                                ..lineTo(0, 0)
                                                ..lineTo(x, 0)
                                                ..lineTo(x, y - 20)
                                                ..lineTo(x - 20, y),
                                              color: column.color != null ? HexColor.fromHex(column.color!) : const Color(0xFF57BE7F),
                                              paintingStyle: PaintingStyle.fill),
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(sticky.userName ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                    const Icon(Icons.more_vert)
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(sticky.content ?? ""),
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
                                    ]))
                            ],
                          )),
                  ]),
                ))));
  }
}
