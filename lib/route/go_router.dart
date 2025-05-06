// 3️⃣ GoRouter setup
import 'package:go_router/go_router.dart';
import 'package:go_router_app/custom_scroll_view_animation.dart';
import 'package:go_router_app/custom_scrollview/custom_scroll.dart';
import 'package:go_router_app/fancy_scroll_app_bar.dart';
import 'package:go_router_app/fruit_list_screen.dart';
import 'package:go_router_app/profile_screen.dart';

import '../about_screen.dart';
import '../home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage(),),
    GoRoute(path: '/about', builder: (context, state) {
      final category = state.uri.queryParameters['category'];
      final price = state.uri.queryParameters['price'];
      final piStr = state.uri.queryParameters['pi'];
      final pi = double.tryParse(piStr??'0');
      final isclickedStr = state.uri.queryParameters['isClicked'];
      final isClickedStr = isclickedStr == true;
       return AboutPage(category: category??"", price: price??"", isClicked: isClickedStr, pi: pi!);

    },),
    GoRoute(path: '/profile/:phoneNumber/:id',
      builder: (context, state) {
      final phoneNumber = state.pathParameters['phoneNumber'];
      final id = state.pathParameters['id'];
       return ProfileScreen(phoneNumber: phoneNumber!, id: id!);
       }
      ),
    GoRoute(
        path: '/fruitListScreen',
     builder: (context, state){
          final data = state.extra as bool;
      return FruitListScreen(data: data);
     }
    ),
    GoRoute(
        path: '/customScrollExample',
     builder: (context, state){
      return CustomScrollExample();
     }
    ),
    GoRoute(
        path: '/delayedAppBarReveal',
     builder: (context, state){
      return DelayedAppBarReveal();
     }
    ),
    GoRoute(
        path: '/fancyScrollAppBar',
     builder: (context, state){
      return FancyScrollAppBar();
     }
    ),
  ],
);
