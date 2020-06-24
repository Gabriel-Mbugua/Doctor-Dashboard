import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:doctor_dashboard/models/appointment/appointments.dart';
import 'package:doctor_dashboard/models/chat/chats.dart';
import 'package:doctor_dashboard/screens/appointments_screen.dart';
import 'package:doctor_dashboard/screens/chats_screen.dart';
import 'package:doctor_dashboard/widgets/patient_list.dart';
import 'package:doctor_dashboard/widgets/search_widget.dart';
import 'package:doctor_dashboard/models/patient/patients.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _cIndex = 0;

  void incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (ctx, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: RichText(
                    text: TextSpan(
                        text: "Welcome, ",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Ben Carson",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor))
                        ]),
                  ),
                  bottom: TabBar(
                    unselectedLabelColor: Colors.grey.withOpacity(0.4),
                    labelColor: Theme.of(context).primaryColor,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                          child: Icon(
                        Icons.people,
                      )),
                      Tab(child: Icon(Icons.chat)),
                      Tab(child: Icon(Icons.timelapse)),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Ben_Carson_official_portrait.jpg/1200px-Ben_Carson_official_portrait.jpg"),
                      ),
                    )
                  ],
                  floating: true,
                  backgroundColor: Colors.transparent,
                ),
              ];
            },
            body: TabBarView(children: [
              Column(
                children: [
                  SearchWidget(),
                  ChangeNotifierProvider(
                    create: (_) => Patients(),
                    child: PatientList(),
                  )
                ],
              ),
              ChangeNotifierProvider(
                create: (ctx) => Chats(),
                child: ChatsScreen(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => Appointments(),
                child: AppointmentsScreen(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}