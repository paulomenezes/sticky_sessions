import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/icon_row.dart';
import 'package:sticky_sessions/features/retrospective/blocs/retrospective_bloc.dart';
import 'package:sticky_sessions/features/retrospective/model/retrospective_model.dart';
import 'package:sticky_sessions/models/meeting.dart';
import 'package:sticky_sessions/utils/constants.dart';

class RetrospectiveScreen extends StatefulWidget {
  const RetrospectiveScreen({Key? key}) : super(key: key);

  get isRecent => null;

  @override
  State<RetrospectiveScreen> createState() => _RetrospectiveScreenState();
}

class _RetrospectiveScreenState extends State<RetrospectiveScreen> {
  late RetrospectiveBloc _retrospectiveBloc;

  @override
  void initState() {
    super.initState();

    _retrospectiveBloc = RetrospectiveBloc();

    Future.delayed(Duration.zero, () {
      final meeting = ModalRoute.of(context)!.settings.arguments as Meeting;

      _retrospectiveBloc.onInit(meeting.id ?? "");
    });
  }

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
        body: StreamBuilder<RetrospectiveModel>(
            stream: _retrospectiveBloc.stream,
            initialData: RetrospectiveModel(),
            builder: (context, state) => state.data?.isLoading == true
                ? Container(
                    color: Colors.white,
                    child: const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )))
                : Container(
                    color: const Color(0xFFF3F3F3),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      ListView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/session', arguments: state.data?.sessions[index]);
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
                                            children: [
                                              Text(state.data?.sessions[index].name ?? "",
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              const Icon(Icons.more_vert)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(state.data?.sessions[index].description ?? "",
                                              maxLines: 2,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              )),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          IconRow(isRecent: false, icon: Icons.message, text: "${state.data?.sessions[index].answer ?? 0} responses"),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        itemCount: state.data?.sessions.length ?? 0,
                        shrinkWrap: true,
                      ),
                    ]),
                  )));
  }
}
