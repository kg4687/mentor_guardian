import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('images/bell_icon.png', width: 28, height: 28),
      onPressed: () {
        context.push('/notifications');
      },
    );
  }
}
