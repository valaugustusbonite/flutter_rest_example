import 'package:flutter/material.dart';
import 'package:rest_api/model/user.dart';
import 'package:rest_api/modules/screens/user_screen.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({ 
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return UserScreen(user: user);
          })
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        child:  Column(
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
          ],
        ),
      ),
    );
  }
}