import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../../../../core/network/error_handler.dart';
import '../../../../core/presentation/app_labels.dart';
import '../providers/admin_providers.dart';

class UserManagementPage extends ConsumerStatefulWidget {
  const UserManagementPage({super.key});
  @override
  ConsumerState<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends ConsumerState<UserManagementPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 3, vsync: this);
  String _query = '';
  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Quản lý người dùng'),
      bottom: TabBar(
        controller: _tabs,
        tabs: const [
          Tab(text: 'Sinh viên'),
          Tab(text: 'Giảng viên'),
          Tab(text: 'Quản trị'),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => _showUserDialog(),
      icon: const Icon(Icons.person_add),
      label: const Text('Tạo tài khoản'),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            key: const Key('admin-user-search'),
            onChanged: (value) => setState(() => _query = value.toLowerCase()),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Tìm kiếm',
            ),
          ),
        ),
        Expanded(
          child: ref
              .watch(userManagementProvider)
              .when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text('$error')),
                data: (users) => TabBarView(
                  controller: _tabs,
                  children: [
                    _list(users, UserRole.student),
                    _list(users, UserRole.lecturer),
                    _list(users, UserRole.admin),
                  ],
                ),
              ),
        ),
      ],
    ),
  );

  Widget _list(List<AdminUserDto> users, UserRole role) {
    final values = users
        .where(
          (item) =>
              item.role == role &&
              (item.fullName.toLowerCase().contains(_query) ||
                  item.email.toLowerCase().contains(_query)),
        )
        .toList();
    if (values.isEmpty) {
      return const Center(child: Text('Không có người dùng phù hợp.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 96),
      itemCount: values.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = values[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.isActive ? Icons.account_circle : Icons.person_off,
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.fullName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(item.email),
                          Text(
                            item.roleCode == null
                                ? AppLabels.userRole(item.role)
                                : '${AppLabels.userRole(item.role)} • ${item.roleCode}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    spacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      IconButton(
                        tooltip: 'Chỉnh sửa',
                        onPressed: () => _showUserDialog(user: item),
                        icon: const Icon(Icons.edit),
                      ),
                      if (item.isActive)
                        TextButton(
                          onPressed: () => _setUserActive(item, false),
                          child: const Text('Vô hiệu hóa'),
                        )
                      else
                        FilledButton.tonalIcon(
                          onPressed: () => _setUserActive(item, true),
                          icon: const Icon(Icons.person_add_alt_1),
                          label: const Text('Kích hoạt lại'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _setUserActive(AdminUserDto user, bool isActive) async {
    try {
      final repository = ref.read(adminRepositoryProvider);
      if (isActive) {
        await repository.enableUser(user.userId);
      } else {
        await repository.disableUser(user.userId);
      }
      final _ = await ref.refresh(userManagementProvider.future);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isActive
                  ? 'Đã kích hoạt lại ${user.fullName}.'
                  : 'Đã vô hiệu hóa ${user.fullName}.',
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

  Future<void> _showUserDialog({AdminUserDto? user}) async {
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => _UserDialog(user: user),
    );
    if (saved == true) {
      try {
        final _ = await ref.refresh(userManagementProvider.future);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đã lưu tài khoản.')),
          );
        }
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã lưu nhưng không thể tải lại dữ liệu.'),
            ),
          );
        }
      }
    }
  }
}

class _UserDialog extends ConsumerStatefulWidget {
  const _UserDialog({this.user});

  final AdminUserDto? user;

  @override
  ConsumerState<_UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends ConsumerState<_UserDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _fullName;
  late final TextEditingController _phone;
  late UserRole _role;
  UuidValue? _majorId;
  UuidValue? _trainingProgramId;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: widget.user?.email);
    _password = TextEditingController();
    _fullName = TextEditingController(text: widget.user?.fullName);
    _phone = TextEditingController(text: widget.user?.phone);
    _role = widget.user?.role ?? UserRole.student;
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _fullName.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    title: Text(
      widget.user == null ? 'Tạo tài khoản' : 'Chỉnh sửa tài khoản',
    ),
    content: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _email,
              enabled: widget.user == null,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  (value?.contains('@') ?? false) ? null : 'Email không hợp lệ',
            ),
            const SizedBox(height: 12),
            if (widget.user == null) ...[
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu ban đầu',
                ),
                validator: (value) => (value?.length ?? 0) >= 8
                    ? null
                    : 'Mật khẩu phải có ít nhất 8 ký tự',
              ),
              const SizedBox(height: 12),
            ],
            TextFormField(
              controller: _fullName,
              decoration: const InputDecoration(labelText: 'Họ tên'),
              validator: (value) =>
                  (value?.trim().isEmpty ?? true) ? 'Bắt buộc' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              key: const Key('admin-user-phone'),
              controller: _phone,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
                helperText: 'Gồm 8–15 chữ số',
              ),
              validator: (value) {
                final normalized = value?.trim() ?? '';
                if (normalized.isNotEmpty &&
                    (normalized.length < 8 || normalized.length > 15)) {
                  return 'Số điện thoại phải có từ 8–15 chữ số';
                }
                return null;
              },
            ),
            if (widget.user == null) const SizedBox(height: 12),
            if (widget.user == null)
              DropdownButtonFormField<UserRole>(
                initialValue: _role,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Vai trò',
                  helperText: 'Mã tài khoản được tạo tự động',
                ),
                items: UserRole.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(AppLabels.userRole(value)),
                      ),
                    )
                    .toList(),
                onChanged: _saving
                    ? null
                    : (value) => setState(() {
                        _role = value!;
                        if (_role != UserRole.student) {
                          _majorId = null;
                          _trainingProgramId = null;
                        }
                      }),
              ),
            if (widget.user == null && _role == UserRole.student) ...[
              const SizedBox(height: 12),
              _studentAcademicFields(),
            ],
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: _saving ? null : () => Navigator.pop(context, false),
        child: const Text('Hủy'),
      ),
      FilledButton(
        onPressed: _saving ? null : _save,
        child: _saving
            ? const SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Text('Lưu'),
      ),
    ],
  );

  Widget _studentAcademicFields() {
    final majors = ref.watch(majorsAdminProvider);
    final programs = ref.watch(trainingProgramsAdminProvider);
    return majors.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Text(ErrorHandler.message(error)),
      data: (majorItems) => programs.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Text(ErrorHandler.message(error)),
        data: (programItems) {
          final selectedMajorId =
              majorItems.any(
                (major) => major.id == _majorId,
              )
              ? _majorId
              : null;
          final availablePrograms = programItems
              .where(
                (program) =>
                    program.majorId == selectedMajorId &&
                    program.status == TrainingProgramStatus.active,
              )
              .toList(growable: false);
          final selectedProgramId =
              availablePrograms.any(
                (program) => program.id == _trainingProgramId,
              )
              ? _trainingProgramId
              : null;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<UuidValue>(
                key: const Key('admin-student-major'),
                initialValue: selectedMajorId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Ngành'),
                items: majorItems
                    .map(
                      (major) => DropdownMenuItem(
                        value: major.id,
                        child: Text(
                          '${major.code} • ${major.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: _saving
                    ? null
                    : (value) => setState(() {
                        _majorId = value;
                        _trainingProgramId = null;
                      }),
                validator: (value) =>
                    value == null ? 'Vui lòng chọn ngành' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<UuidValue>(
                key: const Key('admin-student-program'),
                initialValue: selectedProgramId,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Chương trình đào tạo',
                  helperText: selectedMajorId == null
                      ? 'Chọn ngành trước'
                      : availablePrograms.isEmpty
                      ? 'Ngành chưa có chương trình đang áp dụng'
                      : 'Khóa tuyển sinh được lấy theo chương trình',
                ),
                items: availablePrograms
                    .map(
                      (program) => DropdownMenuItem(
                        value: program.id,
                        child: Text(
                          '${program.code} • Khóa ${program.academicYear}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: _saving
                    ? null
                    : (value) => setState(() => _trainingProgramId = value),
                validator: (value) =>
                    value == null ? 'Vui lòng chọn chương trình đào tạo' : null,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final repository = ref.read(adminRepositoryProvider);
      if (widget.user == null) {
        final programs = ref.read(trainingProgramsAdminProvider).value;
        final selectedProgram = _role == UserRole.student
            ? programs
                  ?.where((item) => item.id == _trainingProgramId)
                  .firstOrNull
            : null;
        await repository.createUser(
          email: _email.text.trim(),
          password: _password.text,
          fullName: _fullName.text.trim(),
          role: _role,
          phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
          academicYear: selectedProgram?.academicYear,
          majorId: _role == UserRole.student ? _majorId : null,
          trainingProgramId: _role == UserRole.student
              ? _trainingProgramId
              : null,
        );
      } else {
        await repository.updateUser(
          widget.user!.userId,
          _fullName.text.trim(),
          _phone.text.trim(),
        );
      }
      if (mounted) Navigator.pop(context, true);
    } catch (error) {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }
}
