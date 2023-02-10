import 'package:cloud_firestore/cloud_firestore.dart';

class EditService {
  final _db = FirebaseFirestore.instance;

  Future<void> getDoc({
    required String eId,
    required String name,
  }) async {
    final _query = _db.collection('employee').doc('2gqMVpY3pVFHJW6Eadul').update({
      'name': name,
    }).then((value) {
      print('update successfully');
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
