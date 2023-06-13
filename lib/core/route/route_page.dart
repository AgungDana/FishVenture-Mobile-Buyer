import 'package:app/modules/home/screen/page_home.dart';
import 'package:app/modules/login/screen/page_login.dart';
import 'package:app/modules/register/screen/page_register.dart';
import 'package:flutter/material.dart';

abstract class RoutePage {
  final MaterialPage page;
  final bool isProtected;
  final String name;
  RoutePage(this.page, this.name, {this.isProtected = false});
}

class RouteLogin extends RoutePage {
  RouteLogin()
      : super(
          const MaterialPage(child: LoginPage()),
          'login',
        );
}

class RouteRegister extends RoutePage {
  RouteRegister()
      : super(
          const MaterialPage(child: RegisterPage()),
          'register',
        );
}

class RouteHome extends RoutePage {
  RouteHome()
      : super(
          const MaterialPage(child: HomePage()),
          'home',
        );
}
