import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_info/model/employee.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsService with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  late Query _query;
  // show data 
  int pagination = 10;

  // add the data to employee list
  List<Employee> employee = [];
  bool loading = true;
  bool moreAvailable = true;

  /// Function to get employee details from firebase
  ///
  Future<void> getDoc() async {
    employee.clear();
    loading = true;
    moreAvailable = true;
    notifyListeners();

    _query = _db.collection('employee').limit(10);
    await _query.get().then((querySnapshot) {
      firestoreToDoc(querySnapshot.docs);
    });
    loading = false;
    notifyListeners();
  }

  /// Function to convert firestore documents to dart  objects
  ///
  void firestoreToDoc(List<DocumentSnapshot> document) {
    if (document.isEmpty) {
      moreAvailable = false;
    } else if (document.isNotEmpty) {
      if (document.length < pagination) {
        moreAvailable = false;
      }
      for (var doc in document) {
        employee.add(
          Employee.fromJson(
            doc.data() as Map<String, dynamic>,
          ),
        );
      }
    }
  }
}
