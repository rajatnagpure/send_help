import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: const Icon(Icons.notifications_none),
        //   iconSize: 28.0,
        //   onPressed: () {},
        // ),
        IconButton(
          icon: const Icon(Icons.chat),
          iconSize: 28.0,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.share),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
