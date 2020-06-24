import 'package:doctor_dashboard/models/appointment/appointments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointmentsData = Provider.of<Appointments>(context);
    final appointments = appointmentsData.items;

    return Flexible(
      child: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (ctx, i) {
          return Card(
            
            child: ListTile(
              title: Text(appointments[i].name),
              subtitle: Text(
                appointments[i].procedure,
                overflow: TextOverflow.ellipsis,
              ),
              dense: true,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(appointments[i].profileImage),
              ),
              trailing: Text(appointments[i].date,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          );
        },
      ),
    );
  }
}
