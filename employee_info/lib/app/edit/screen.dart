import 'package:employee_info/model/employee.dart';
import 'package:employee_info/services/edit_service.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final Employee employee;
  const EditScreen({
    required this.employee,
    Key? key,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

TextEditingController controller = TextEditingController();

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Column(
        children: [_buildBody(context), _buildButton(context)],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          EditService().getDoc(
            eId: widget.employee.eId,
            name: controller.text,
          );
        },
        child: const Text('edit'));
  }
}
