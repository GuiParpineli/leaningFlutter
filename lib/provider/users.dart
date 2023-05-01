import 'dart:math';

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

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (_items.containsKey(user.id) && user.id.trim().isNotEmpty) {
      _items.update(user.id, (value) => user);
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user.id.isNotEmpty) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
