import 'package:employee_info/app/home/detail_screen.dart';
import 'package:employee_info/model/employee.dart';
import 'package:flutter/material.dart';

class HomeWidgetPreview extends StatelessWidget {
  final Employee employee;
  const HomeWidgetPreview({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // to calculate number of years working
    DateTime doj = employee.doj!;
    // difference doj with current date
    var years = DateTime.now().difference(doj);
    // we get total working years
    var totalWokingYears = years.inDays ~/ 365;
    return InkWell(
      onTap: () {
        // navigate to details screen
        //
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              employee: employee,
            ),
          ),
        );
      },
      child: Material(
        // totalWokingYears isequal or morethan 5 then change background color to green
        color: totalWokingYears >= 5
            ? const Color.fromARGB(255, 134, 231, 101)
            : Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Employee Id",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildeIdText(context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildEnameText(context),
                            const SizedBox(height: 10),
                            _buildDesText(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// widget displays an employee id obtained from the firebase.
  ///
  Widget _buildeIdText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Text(
        employee.eId,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  /// widget displays an employee name obtained from the firebase.
  ///
  Widget _buildEnameText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Text(
        'Name : ${employee.eName.toUpperCase()}',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 3,
      ),
    );
  }

  /// widget displays an designation obtained from the firebase.
  ///
  Widget _buildDesText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Text(
        'Role : ${employee.designation}',
        style: Theme.of(context).textTheme.titleMedium,
        maxLines: 3,
      ),
    );
  }
}
