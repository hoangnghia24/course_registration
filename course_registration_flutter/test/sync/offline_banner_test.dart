import 'package:course_registration_flutter/core/sync/sync_models.dart';
import 'package:course_registration_flutter/features/sync/presentation/widgets/offline_banner.dart';
import 'package:course_registration_flutter/shared/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('offline indicator shows pending operation count', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          networkStatusProvider.overrideWith(
            (ref) => Stream.value(NetworkStatus.offline),
          ),
          syncStatusProvider.overrideWith(
            (ref) => Stream.value(const SyncStatusState(pending: 3)),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(body: OfflineBanner(child: Text('Content'))),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Offline'), findsOneWidget);
    expect(find.textContaining('3 thao tác'), findsOneWidget);
    expect(find.text('Content'), findsOneWidget);
  });
}
