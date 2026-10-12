import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_shop/pages/login/index.dart';
import 'package:nexus_shop/pages/main/index.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: "/", builder: (context, state) => MainPage()),
    GoRoute(path: "/login", builder: (context, state) => LoginPage()),
  ],
);

// return root widget
Widget getRootWidget() {
  return MaterialApp.router(routerConfig: router);
}
