import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_project/di/get_it.dart';
import 'package:reqres_project/presentation/bloc/user_bloc/user_cubit.dart';
import 'package:reqres_project/presentation/ui/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:reqres_project/presentation/ui/profile/profile_page.dart';
import 'package:reqres_project/utils/routes/app_routes.dart';

final GoRouter _routes = GoRouter(
  routes: [
    GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
    GoRoute(
        path: AppRoutes.profile,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => UserCubit(getUserUseCase: sl()),
            child: const ProfilePage(),
          );
        })
  ],
);

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routes,
      title: 'Reqres Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
