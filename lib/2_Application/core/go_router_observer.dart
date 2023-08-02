import 'package:flutter/cupertino.dart';

class GoRouterObserver extends NavigatorObserver{
GoRouterObserver();
  @override
  void didPop(Route route, Route? previousRoute) {
   debugPrint("didPop : ${route.settings.name}");
  }

  @override
  void didPush(Route route, Route? previousRoute) {

    debugPrint("didPush : ${route.settings.name} previousRoute : ${previousRoute?.settings.name}");
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    debugPrint("didRemove : ${route.settings.name} previousRoute : ${previousRoute?.settings.name}");
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint("didPush : ${oldRoute?.settings.name} previousRoute : ${newRoute?.settings.name}");
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
debugPrint('didStartUserGesture');
  }


}