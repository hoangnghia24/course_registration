import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_handler.dart';
import '../providers/admin_providers.dart';

class ClassApprovalPage extends ConsumerStatefulWidget {
  const ClassApprovalPage({super.key});

  @override
  ConsumerState<ClassApprovalPage> createState() => _ClassApprovalPageState();
}

class _ClassApprovalPageState extends ConsumerState<ClassApprovalPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  ClassAdjustmentStatus? _filter = ClassAdjustmentStatus.pending;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Duyệt lớp học phần'),
      bottom: TabBar(
        controller: _tabs,
        tabs: const [
          Tab(text: 'MỞ LỚP'),
          Tab(text: 'ĐIỀU CHỈNH'),
        ],
      ),
    ),
    body: TabBarView(
      controller: _tabs,
      children: [_openingRequests(), _adjustmentRequests()],
    ),
  );

  Widget _openingRequests() => ref
      .watch(approvalProvider)
      .when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(ErrorHandler.message(error))),
        data: (items) => items.isEmpty
            ? const Center(child: Text('Không có lớp chờ duyệt.'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.courseCode} - ${item.courseName}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${item.classCode} • GV ${item.lecturerName} • ${item.capacity} sinh viên',
                          ),
                          for (final schedule in item.proposals)
                            Text(_schedule(schedule)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () =>
                                    _decideClass(item.courseClassId, false),
                                child: const Text('TỪ CHỐI'),
                              ),
                              FilledButton(
                                onPressed: () =>
                                    _decideClass(item.courseClassId, true),
                                child: const Text('DUYỆT'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      );

  Widget _adjustmentRequests() {
    final requests = ref.watch(adjustmentRequestsProvider(_filter));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: DropdownButtonFormField<ClassAdjustmentStatus?>(
            key: const Key('adjustment-filter'),
            initialValue: _filter,
            decoration: const InputDecoration(labelText: 'Trạng thái'),
            items: const [
              DropdownMenuItem(value: null, child: Text('Tất cả')),
              DropdownMenuItem(
                value: ClassAdjustmentStatus.pending,
                child: Text('Chờ duyệt'),
              ),
              DropdownMenuItem(
                value: ClassAdjustmentStatus.approved,
                child: Text('Đã duyệt'),
              ),
              DropdownMenuItem(
                value: ClassAdjustmentStatus.rejected,
                child: Text('Đã từ chối'),
              ),
            ],
            onChanged: (value) => setState(() => _filter = value),
          ),
        ),
        Expanded(
          child: requests.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) =>
                Center(child: Text(ErrorHandler.message(error))),
            data: (items) => items.isEmpty
                ? const Center(child: Text('Không có yêu cầu điều chỉnh.'))
                : RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(adjustmentRequestsProvider(_filter));
                      await ref.read(
                        adjustmentRequestsProvider(_filter).future,
                      );
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      itemCount: items.length,
                      itemBuilder: (context, index) =>
                          _adjustmentCard(items[index]),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _adjustmentCard(ClassAdjustmentRequestDto item) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${item.courseCode} - ${item.courseName}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              _StatusChip(status: item.status),
            ],
          ),
          Text('${item.classCode} • GV ${item.lecturerName}'),
          Text('Gửi lúc ${_dateTime(item.createdAt.toLocal())}'),
          const Divider(height: 24),
          Text('Sĩ số: ${item.oldCapacity} → ${item.newCapacity}'),
          const SizedBox(height: 8),
          Text('Lịch hiện tại', style: Theme.of(context).textTheme.labelLarge),
          if (item.oldSchedules.isEmpty) const Text('Chưa có lịch'),
          for (final schedule in item.oldSchedules) Text(_schedule(schedule)),
          const SizedBox(height: 8),
          Text('Lịch đề nghị', style: Theme.of(context).textTheme.labelLarge),
          for (final schedule in item.newSchedules) Text(_schedule(schedule)),
          if (item.rejectReason != null) ...[
            const SizedBox(height: 8),
            Text('Lý do từ chối: ${item.rejectReason}'),
          ],
          if (item.status == ClassAdjustmentStatus.pending)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _decideAdjustment(item, false),
                  child: const Text('TỪ CHỐI'),
                ),
                FilledButton(
                  onPressed: () => _decideAdjustment(item, true),
                  child: const Text('DUYỆT'),
                ),
              ],
            ),
        ],
      ),
    ),
  );

  Future<void> _decideClass(UuidValue id, bool approve) async {
    try {
      await ref.read(adminRepositoryProvider).decideClass(id, approve, null);
      ref.invalidate(approvalProvider);
      ref.invalidate(adminProvider);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }

  Future<void> _decideAdjustment(
    ClassAdjustmentRequestDto item,
    bool approve,
  ) async {
    String? reason;
    if (!approve) {
      reason = await _rejectReason();
      if (reason == null) return;
    }
    try {
      await ref
          .read(adminRepositoryProvider)
          .decideAdjustmentRequest(
            requestId: item.requestId,
            approve: approve,
            rejectReason: reason,
          );
      ref.invalidate(adjustmentRequestsProvider(_filter));
      ref.invalidate(adminProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              approve
                  ? 'Đã duyệt yêu cầu điều chỉnh.'
                  : 'Đã từ chối yêu cầu điều chỉnh.',
            ),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }

  Future<String?> _rejectReason() async {
    final controller = TextEditingController();
    final value = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Lý do từ chối'),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Nhập lý do để giảng viên biết cần điều chỉnh gì',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              final reason = controller.text.trim();
              if (reason.isNotEmpty) Navigator.pop(context, reason);
            },
            child: const Text('Từ chối'),
          ),
        ],
      ),
    );
    controller.dispose();
    return value;
  }

  static String _schedule(dynamic schedule) =>
      'Thứ ${schedule.dayOfWeek}, tiết ${schedule.startPeriod}-${schedule.endPeriod}, ${schedule.room}';

  static String _dateTime(DateTime value) =>
      '${_two(value.day)}/${_two(value.month)}/${value.year} '
      '${_two(value.hour)}:${_two(value.minute)}';

  static String _two(int value) => value.toString().padLeft(2, '0');
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final ClassAdjustmentStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      ClassAdjustmentStatus.pending => ('🟡 Chờ duyệt', Colors.orange),
      ClassAdjustmentStatus.approved => ('🟢 Đã duyệt', Colors.green),
      ClassAdjustmentStatus.rejected => ('🔴 Đã từ chối', Colors.red),
    };
    return Chip(
      label: Text(label),
      side: BorderSide(color: color.withValues(alpha: 0.5)),
    );
  }
}
