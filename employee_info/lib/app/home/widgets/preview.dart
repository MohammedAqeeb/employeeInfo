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
    return Material(
      // color:
      // petsAnimal.adopted == true ? const Color(0xFFD3D3D3) : Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () {
          // navigate to details screen
          //
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailPageScreen(
          //       petsModel: petsAnimal,
          //     ),
          //   ),
          // );
        },
        highlightColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildeIdText(context),
                  _buildEnameText(context),
                  _buildDesText(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildeIdText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              employee.eId,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnameText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              employee.eName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              employee.designation,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
