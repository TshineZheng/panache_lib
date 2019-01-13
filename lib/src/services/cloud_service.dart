import '../models.dart';

abstract class CloudService {
  Future<bool> get authenticated;
  //User get user;
  Stream<User> get currentUser$;

  Future login();
  Future logout();
  Future save(String content);
}
