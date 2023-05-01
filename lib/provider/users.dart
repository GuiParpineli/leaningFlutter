import 'package:flutter/cupertino.dart';
import 'package:flutterappteste/data/dummy_users.dart';
import 'package:flutterappteste/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}
