import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as auth_core;

import '../generated/protocol.dart';
import '../core/input_validator.dart';

abstract final class ProfileService {
  static Future<AppUser> createForEmailAccount(
    Session session, {
    required UuidValue authUserId,
    required String email,
    Transaction? transaction,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final fallbackName = normalizedEmail.split('@').first;
    return AppUser.db.insertRow(
      session,
      AppUser(
        authUserId: authUserId,
        email: normalizedEmail,
        fullName: fallbackName,
        role: UserRole.student,
      ),
      transaction: transaction,
    );
  }

  static Future<AppUser> current(
    Session session, {
    String? preferredFullName,
  }) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw AppException(code: 'unauthenticated', message: 'Login required.');
    }

    var user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user == null) {
      final authProfile = await auth_core.UserProfile.db.findFirstRow(
        session,
        where: (table) => table.authUserId.equals(authUserId),
      );
      final verifiedEmail = authProfile?.email;
      if (verifiedEmail == null) {
        throw AppException(
          code: 'profile_not_ready',
          message: 'A verified email is required to create the profile.',
        );
      }
      user = await createForEmailAccount(
        session,
        authUserId: authUserId,
        email: verifiedEmail,
      );
    }

    if (!user.isActive) {
      throw AppException(
        code: 'account_disabled',
        message: 'This account has been disabled.',
      );
    }

    final normalizedName = preferredFullName?.trim();
    if (normalizedName != null &&
        (!InputValidator.requiredText(normalizedName, maxLength: 120) ||
            normalizedName.length < 2)) {
      throw AppException(
        code: 'invalid_full_name',
        message: 'Full name must contain 2 to 120 characters.',
      );
    }
    if (normalizedName != null && normalizedName != user.fullName) {
      user.fullName = normalizedName;
      user.updatedAt = DateTime.now().toUtc();
      user = await AppUser.db.updateRow(session, user);
    }
    return user;
  }
}
