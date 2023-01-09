import 'package:employee_info/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/info_field.dart';

class DetailScreen extends StatelessWidget {
  final Employee employee;
  const DetailScreen({
    required this.employee,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _buildTitle(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    // to convert datetime in dd-MM-yyyy format
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    var doj = dateFormat.format(employee.doj!);

    // to calculate number of years working
    DateTime workJoined = employee.doj!;
    // difference doj with current date 
    var years = DateTime.now().difference(workJoined);
    // we get total working years
    var totalWokingYears = years.inDays ~/ 365;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Employee Details',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                InfoFieldValue(
                  field: 'Name',
                  value: employee.eName.toUpperCase(),
                ),
                const SizedBox(height: 10),
                InfoFieldValue(
                  field: 'Department',
                  value: employee.department,
                ),
                const SizedBox(height: 10),
                InfoFieldValue(
                  field: 'Designation',
                  value: employee.designation,
                ),
                const SizedBox(height: 10),
                InfoFieldValue(
                  field: 'DOJ',
                  value: doj,
                ),
                const SizedBox(height: 10),
                InfoFieldValue(
                  field: 'Email',
                  value: employee.email,
                ),
                const SizedBox(height: 10),
                InfoFieldValue(
                  field: 'Phone Numer',
                  value: employee.phoneNumber,
                ),
                const SizedBox(height: 10),
                InfoFieldValue(
                  field: 'Working Experience',
                  value: '${totalWokingYears.toString()} Years',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
