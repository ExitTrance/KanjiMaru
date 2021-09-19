import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Database({this.uid = ""});

  final String uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Write cron job that periodically checks how many items are pending for a user

  // Check if a defined list with given name exists
  Future<bool> definedListNameExists(String name) async {
    var allLists =
        await _firestore.collection('definedLists').doc('allLists').get();
    List names = allLists.data()?['listNames'];

    return names.contains(name);
  }

  // Check if a user list with given name exists
  Future<bool> userListNameExists(String name) async {
    var user = await _firestore.collection('userLists').doc(uid).get();
    List names = user.data()?['listNames'];

    return names.contains(name);
  }

  // Add a name to the defined list 'allLists' array
  void setDefinedListName(String name) {
    _firestore.collection('definedLists').doc('allLists').update({
      'listNames': FieldValue.arrayUnion([name])
    });
  }

  // Add a name to the user 'listNames' array
  void setUserListName(String name) {
    _firestore.collection('userLists').doc(uid).update({
      'listNames': FieldValue.arrayUnion([name])
    });
  }

  // Adds a list in JSON Format to the defined lists on Firebase
  // TODO - NEEDS TO BE TESTED FURTHER IN CASE A LIST WITH THAT NAME EXISTS
  Future setDefinedList(Map data) async {
    String listName = data['name'];
    List items = data['items'];

    if (await definedListNameExists(listName)) {
      setDefinedListName(listName);
      return _firestore
          .collection('definedLists')
          .doc(listName)
          .set({'data': items});
    }
  }

  // Get a defined list by name
  Future getDefinedList(String listName) {
    return _firestore.collection('definedLists').doc(listName).get();
  }

  // Get all defined lists
  Future getDefinedLists() {
    return _firestore.collection('definedLists').get();
  }

  // Get a stream of all defined lists name
  Stream getDefinedListsName() {
    return _firestore.collection('definedLists').doc('allLists').snapshots();
  }

  // Helper function for adding a user list
  void _setUserList(String listName, Map<String, dynamic> data) async {
    _firestore
        .collection('userLists')
        .doc(uid)
        .collection('lists')
        .doc(listName)
        .set(data);
    setUserListName(listName);
  }

  // Add a custom list to the users lists
  void setCustomList(String listName, Map<String, dynamic> data) async {
    bool checkDefinedListNames = await definedListNameExists(listName);
    bool checkUserListNames = await userListNameExists(listName);

    if (!checkDefinedListNames & !checkUserListNames) {
      _setUserList(listName, data);
    } else {
      print('Custom list cannot be added.');
      print('Defined List Name exists: $checkDefinedListNames');
      print('User List Name exists:    $checkUserListNames');
    }
  }

  // Add a defined list to the user's lists
  void setDefinedListToUserList(String listName) async {
    bool checkDefinedListNames = await definedListNameExists(listName);
    bool checkUserListNames = await userListNameExists(listName);

    if (checkDefinedListNames & !checkUserListNames) {
      getDefinedList(listName).then((value) {
        _setUserList(listName, value.data());
        setUserListName(listName);
      });
    } else {
      print('Defined list cannot be added to the user.');
      print('Defined List Name exists: $checkDefinedListNames');
      print('User List Name exists:    $checkUserListNames');
    }
  }

  // Get a single user list by name
  Future getUserList(String listName) {
    return _firestore
        .collection('userLists')
        .doc(uid)
        .collection('lists')
        .doc(listName)
        .get();
  }

  // Get a stream of all lists belonging to a user
  Stream getUserLists() {
    return _firestore
        .collection('userLists')
        .doc(uid)
        .collection('lists')
        .snapshots();
  }

  // Gets a stream of every list name of a user
  Stream getUserListsName() {
    return _firestore.collection('userLists').doc(uid).snapshots();
  }

  // Gets a stream of the user's Settings
  Stream getUserSettings() {
    return _firestore.collection('settings').doc(uid).snapshots();
  }

  // Gets a stream of the user's statistics
  Stream getUserStatistics() {
    return _firestore.collection('userStatistics').doc(uid).snapshots();
  }
}
