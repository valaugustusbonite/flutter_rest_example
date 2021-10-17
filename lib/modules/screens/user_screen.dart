import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rest_api/model/user.dart';

class UserScreen extends HookWidget {
  final User user;

  const UserScreen({
     Key? key,
     required this.user,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(user.avatarURL ?? ''),
              ),
            ),
            Text('${user.firstName} ${user.lastName}'),
            Text(user.email ?? '---'),
            const SizedBox(height: 25),
            const SizedBox(
              width: 400,
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            )
          ],
        ),
      ),
    );
  }
}