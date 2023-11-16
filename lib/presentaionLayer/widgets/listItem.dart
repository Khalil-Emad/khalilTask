import 'package:flutter/material.dart';

import '../../domainLayer/models/myModel.dart';

class DoctorListItem extends StatelessWidget {
  final Result item;

  DoctorListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Doctor: ${item.doctor.user.name ?? ""}'),
            Text('Department: ${item.doctor.department ?? ""}'),
            Text('Service Amount: \$${item.doctor.serviceAmount.toStringAsFixed(2)}'),
            SizedBox(height: 8.0),
            Text('Patient:'),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Patient Name: ${item.patient.user.name ?? ""}'),
                  Text('Phone Number: ${item.patient.user.phoneNumber}'),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
