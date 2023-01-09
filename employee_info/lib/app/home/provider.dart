import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/details/service.dart';

/// ChangeNotifierProvider to listen to the EmployeeDetailsService
///
final employeeDetailsPr = ChangeNotifierProvider.autoDispose(
  (ref) => EmployeeDetailsService(),
);
