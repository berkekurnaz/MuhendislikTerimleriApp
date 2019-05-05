import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Mühendislik Terimleri", style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
    );
  }

 @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  
}