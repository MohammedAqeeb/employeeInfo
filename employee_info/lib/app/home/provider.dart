import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/details/service.dart';

final employeeDetailsPr = ChangeNotifierProvider.autoDispose(
  (ref) => EmployeeDetailsService(),
);
