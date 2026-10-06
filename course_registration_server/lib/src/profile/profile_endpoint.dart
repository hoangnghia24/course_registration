import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'profile_service.dart';

class ProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<AppUser> current(Session session) => ProfileService.current(session);

  Future<AppUser> ensureProfile(Session session, {String? fullName}) =>
      ProfileService.current(session, preferredFullName: fullName);
}
