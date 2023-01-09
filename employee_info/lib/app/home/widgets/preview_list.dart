import 'package:employee_info/app/home/provider.dart';
import 'package:employee_info/app/home/widgets/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/details/service.dart';

// ignore: must_be_immutable
class HomeWidgetPreviewList extends ConsumerWidget {
  HomeWidgetPreviewList({Key? key}) : super(key: key);

  late EmployeeDetailsService service;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  provider to read service
    service = ref.read(employeeDetailsPr);
    Widget build = const SliverToBoxAdapter(
      child: SizedBox(),
    );
    // check weater employee is empty or not
    if (service.loading == true) {
      // show loader
      build = _buildLoading(context);
    } else if (service.employee.isEmpty) {
      // if empty then display empty messgae
      build = _buildListEmpty(context);
    } else if (service.employee.isNotEmpty) {
      // if not empty then build list of employee
      build = _buildList(context);
    }
    return build;
  }

  /// display loader on the screen
  ///
  Widget _buildLoading(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// widget to display empty messgae
  ///
  Widget _buildListEmpty(BuildContext context) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Center(
          child: Text(
            'No Employee Info',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  /// sliver list convert list into single data and
  /// pass the argument to HomeWidgetPreview
  ///
  Widget _buildList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            child: HomeWidgetPreview(
              employee: service.employee[index],
            ),
          );
        },
        childCount: service.employee.length,
      ),
    );
  }
}
