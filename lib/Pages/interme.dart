import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class intermediatery extends StatefulWidget {
  const intermediatery({Key? key}) : super(key: key);

  @override
  State<intermediatery> createState() => _intermediateryState();
}

class _intermediateryState extends State<intermediatery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intermediatery Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              child: Text("Catalo Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.apiScreenRoute);
              },
              child: Text("Rest API Page"),
            ),
          ],
        ),
      ),
    );
  }
}
