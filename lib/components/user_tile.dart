import 'package:flutter/material.dart';
import 'package:flutterappteste/provider/users.dart';
import 'package:flutterappteste/routes/AppRoutes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              color: Colors.orange,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Excluir Usuario'),
                          content: const Text('Tem certeza?'),
                          actions: [
                            FloatingActionButton.small(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Não'),
                            ),
                            FloatingActionButton.small(
                              onPressed: () {
                                Provider.of<Users>(context, listen: false)
                                    .remove(user);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Sim'),
                            )
                          ],
                        ));
              },
              color: Colors.red,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
