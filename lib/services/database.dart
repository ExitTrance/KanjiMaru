import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
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
  Future<bool> userListNameExists(String name, String uid) async {
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
  void setUserListName(String name, String uid) {
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

  // Get all defined lists name
  Stream getDefinedListsName() {
    return _firestore.collection('definedLists').doc('allLists').snapshots();
  }

  // Helper function for adding a user list
  void _setUserList(
      String listName, Map<String, dynamic> data, String uid) async {
    _firestore
        .collection('userLists')
        .doc(uid)
        .collection('lists')
        .doc(listName)
        .set(data);
    setUserListName(listName, uid);
  }

  // Add a custom list to the users lists
  void setCustomList(
      String listName, Map<String, dynamic> data, String uid) async {
    bool checkDefinedListNames = await definedListNameExists(listName);
    bool checkUserListNames = await userListNameExists(listName, uid);

    if (!checkDefinedListNames & !checkUserListNames) {
      _setUserList(listName, data, uid);
    } else {
      print('Custom list cannot be added.');
      print('Defined List Name exists: $checkDefinedListNames');
      print('User List Name exists:    $checkUserListNames');
    }
  }

  // Add a defined list to the user's lists
  void setDefinedListToUserList(String listName, String uid) async {
    bool checkDefinedListNames = await definedListNameExists(listName);
    bool checkUserListNames = await userListNameExists(listName, uid);

    if (checkDefinedListNames & !checkUserListNames) {
      getDefinedList(listName).then((value) {
        _setUserList(listName, value.data(), uid);
        setUserListName(listName, uid);
      });
    } else {
      print('Defined list cannot be added to the user.');
      print('Defined List Name exists: $checkDefinedListNames');
      print('User List Name exists:    $checkUserListNames');
    }
  }

  // Get a single user list by name
  Future getUserList(String listName, String uid) {
    return _firestore
        .collection('userLists')
        .doc(uid)
        .collection('lists')
        .doc(listName)
        .get();
  }

  // Get all of the users lists
  Stream getUserLists(String uid) {
    return _firestore
        .collection('userLists')
        .doc(uid)
        .collection('lists')
        .snapshots();
  }

  // Get names of every user list
  Stream getUserListsName(String uid) {
    return _firestore.collection('userLists').doc(uid).snapshots();
  }
}
