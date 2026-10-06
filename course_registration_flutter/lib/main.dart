import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';
import 'shared/services/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await bootstrap();
  runApp(
    ProviderScope(
      // Màn hình đã có nút thử lại chủ động. Không tự lặp lại
      // các lỗi nghiệp vụ/quyền truy cập vì sẽ giữ UI ở trạng thái tải.
      retry: (_, _) => null,
      overrides: [
        clientProvider.overrideWithValue(dependencies.client),
        databaseProvider.overrideWithValue(dependencies.database),
        syncManagerProvider.overrideWithValue(dependencies.syncManager),
        authRepositoryProvider.overrideWithValue(dependencies.authRepository),
        authStateControllerProvider.overrideWithValue(
          dependencies.authStateController,
        ),
      ],
      child: const CourseRegistrationApp(),
    ),
  );
}
