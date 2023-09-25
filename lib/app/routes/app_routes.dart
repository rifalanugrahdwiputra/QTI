part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const asset = _Paths.asset;
  static const dashboard = _Paths.dashboard;
  static const signIn = _Paths.signIn;
  static const addAsset = _Paths.addAsset;
}

abstract class _Paths {
  static const home = '/home';
  static const asset = '/asset';
  static const dashboard = '/dashboard';
  static const signIn = '/sign-in';
  static const addAsset = '/addAsset';
}
