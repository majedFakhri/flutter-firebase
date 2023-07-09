import 'package:flutter/Material.dart';

class MyDrawerItem extends StatelessWidget {
  const MyDrawerItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    if (title == '') {
      return Container();
    } else {
      return ListTile(
        onTap: onPressed,
        trailing: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
      );
    }
  }
}
