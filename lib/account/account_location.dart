import 'package:duck_router/duck_router.dart';
import 'package:fundwise/account/account_page.dart';

class AccountLocation extends Location {
  const AccountLocation({this.id});

  final int? id;

  @override
  LocationPageBuilder? get pageBuilder =>
      (_) => DuckPage(
        child: AccountPage(path: path),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      );

  @override
  String get path => switch (id) {
    final int id => '/account/$id',
    _ => '/account',
  };
}
