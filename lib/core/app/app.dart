import 'package:app/core/auth/bloc/local_auth.dart';
import 'package:app/modules/budidaya/bloc/bloc_budidaya.dart';
import 'package:app/modules/budidaya/repo/repo_budidaya.dart';
import 'package:app/modules/pond/bloc/bloc_pond.dart';
import 'package:app/modules/pond/repo/repo_pond.dart';
import 'package:app/modules/profile/bloc/bloc_profile.dart';
import 'package:app/modules/profile/repo/repo_profile.dart';
import 'package:flutter/material.dart';

import 'package:app/core/route/bloc_route.dart';
import 'package:app/core/route/route_page.dart';
import 'package:app/modules/login/screen/page_login.dart';
import 'package:app/modules/register/screen/page_register.dart';
import 'package:provider/provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => LocalAuth(),
          lazy: false,
        ),
        Provider(
          create: (_) => ProfileBloc(ProfileHttpRepo()),
        ),
        Provider(
          create: (_) => BudidayaBloc(BudidayaHttpRepo()),
        ),
        Provider(
          create: (_) => PondBloc(PondHttpRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Fish Venture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [routeObserver],
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: AppPage(navigatorKey: _navigatorKey),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({
    Key? key,
    required GlobalKey<NavigatorState> navigatorKey,
  })  : _navigatorKey = navigatorKey,
        super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return RouteBloc().pop();
      },
      child: StreamBuilder<List<RoutePage>>(
          stream: RouteBloc().pages.stream,
          initialData: RouteBloc().pages.value,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return Navigator(
                key: _navigatorKey,
                observers: [HeroController()],
                pages: const [
                  MaterialPage(child: LoginPage()),
                ],
                onPopPage: (route, result) {
                  return route.didPop(result);
                },
              );
            }
            return Navigator(
              key: _navigatorKey,
              observers: [HeroController()],
              pages: data.map((e) => e.page).toList(),
              onPopPage: (route, result) {
                return route.didPop(result);
              },
            );
          }),
    );
  }
}
