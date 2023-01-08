import 'package:employee_info/app/home/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeLogic {
  Future<void> getDocFromFirebase({
    required WidgetRef ref,
  }) async {
    final service = ref.read(employeeDetailsPr);
    await service.getDoc();
  }
}
