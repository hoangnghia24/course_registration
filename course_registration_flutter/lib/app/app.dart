import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';
import '../shared/services/providers.dart';
import '../features/sync/presentation/widgets/offline_banner.dart';

class CourseRegistrationApp extends ConsumerStatefulWidget {
  const CourseRegistrationApp({super.key});

  @override
  ConsumerState<CourseRegistrationApp> createState() =>
      _CourseRegistrationAppState();
}

class _CourseRegistrationAppState extends ConsumerState<CourseRegistrationApp> {
  late final _router = AppRouter.create(ref.read(authStateControllerProvider));

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Đăng ký học phần',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      builder: (context, child) => OfflineBanner(child: child!),
    );
  }
}
