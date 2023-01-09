import 'package:employee_info/app/home/logic.dart';
import 'package:employee_info/app/home/provider.dart';
import 'package:employee_info/app/home/widgets/preview_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeLogic().getDocFromFirebase(ref: ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(employeeDetailsPr);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('Employee Info'),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  // body contains employees list in CustomScrollView
  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeWidgetPreviewList(),
      ],
    );
  }
}
