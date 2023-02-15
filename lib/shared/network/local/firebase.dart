import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/watchlist_item.dart';


CollectionReference<watchlist_item> getTasksCollections() {
  return FirebaseFirestore.instance.collection('watchlist_item').withConverter<watchlist_item>(
      fromFirestore: ((snapshot, options) => watchlist_item.fromJson(snapshot.data()!)),
      toFirestore: (value, options) => value.toJson());
}

Future<void> addTaskToFireStore(watchlist_item item) {
  // FirebaseFirestore.instance.collection('tasks').add(data);
  var collection = getTasksCollections();
  var documentref = collection.doc();
  item.id = documentref.id;
  return documentref.set(item);
}

// Stream<QuerySnapshot<watchlist_item>> getDataFromFireStore(DateTime date) {
//   return getTasksCollections()
//       .where('date', isEqualTo: date.microsecondsSinceEpoch)
//       .snapshots();
// }

Future<void> deleteTasksFromFireStore(String id) {
  return getTasksCollections().doc(id).delete();
}