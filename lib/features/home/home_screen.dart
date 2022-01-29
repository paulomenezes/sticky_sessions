import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_sessions/components/main_drawer.dart';
import 'package:sticky_sessions/core/auth/blocs/auth_bloc.dart';
import 'package:sticky_sessions/core/auth/model/auth_model.dart';
import 'package:sticky_sessions/features/home/blocs/home_bloc.dart';
import 'package:sticky_sessions/features/home/components/meeting_card.dart';
import 'package:sticky_sessions/features/home/model/home_model.dart';
import 'package:sticky_sessions/models/meeting.dart';
import 'package:sticky_sessions/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  final AuthBloc authBloc;

  const HomeScreen({Key? key, required this.authBloc}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<AuthModel?>? subscription;

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();

    _homeBloc = HomeBloc();
    _homeBloc.onInit();

    widget.authBloc.stream.listen((event) {
      if (event?.isLogged == false) {
        Navigator.of(context).pushReplacementNamed(routerLogin);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    subscription?.cancel();
  }

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
              onPressed: () {
                Navigator.pushNamed(context, routerNotification);
              },
            ),
          ],
        ),
        drawer: MainDrawer(authBloc: widget.authBloc),
        body: StreamBuilder<HomeModel>(
            stream: _homeBloc.stream,
            initialData: HomeModel(),
            builder: (context, state) => state.data?.isLoading == true
                ? Container(
                    color: Colors.white,
                    child: const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )))
                : Container(
                    color: const Color(0xFFF3F3F3),
                    child: SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      // const Padding(
                      //     padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      //     child: Text(
                      //       "Recents",
                      //       style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF929292)),
                      //     )),
                      // const MeetingCard(
                      //   isRecent: true,
                      // ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Text(
                            "Older",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF929292)),
                          )),
                      for (var meeting in state.data?.meetings ?? <Meeting>[])
                        MeetingCard(
                          meeting: meeting,
                          isRecent: false,
                        )
                    ])),
                  )));
  }
}
