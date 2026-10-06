import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          Tab(text: 'Student'),
          Tab(text: 'Lecturer'),
          Tab(text: 'Admin'),
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
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) {
        final item = values[index];
        return ListTile(
          leading: Icon(
            item.isActive ? Icons.account_circle : Icons.person_off,
          ),
          title: Text(item.fullName),
          subtitle: Text('${item.roleCode ?? item.role.name} • ${item.email}'),
          trailing: Wrap(
            children: [
              IconButton(
                tooltip: 'Chỉnh sửa',
                onPressed: () => _showUserDialog(user: item),
                icon: const Icon(Icons.edit),
              ),
              if (item.isActive)
                TextButton(
                  onPressed: () async {
                    await ref
                        .read(adminRepositoryProvider)
                        .disableUser(item.userId);
                    ref.invalidate(userManagementProvider);
                  },
                  child: const Text('Disable'),
                )
              else
                const Chip(label: Text('Disabled')),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showUserDialog({AdminUserDto? user}) async {
    final formKey = GlobalKey<FormState>();
    final email = TextEditingController(text: user?.email);
    final password = TextEditingController();
    final fullName = TextEditingController(text: user?.fullName);
    final phone = TextEditingController(text: user?.phone);
    final roleCode = TextEditingController(text: user?.roleCode);
    var role = user?.role ?? UserRole.student;
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(user == null ? 'Tạo tài khoản' : 'Chỉnh sửa tài khoản'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: email,
                    enabled: user == null,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) => (value?.contains('@') ?? false)
                        ? null
                        : 'Email không hợp lệ',
                  ),
                  if (user == null)
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Mật khẩu ban đầu',
                      ),
                      validator: (value) => (value?.length ?? 0) >= 8
                          ? null
                          : 'Mật khẩu phải có ít nhất 8 ký tự',
                    ),
                  TextFormField(
                    controller: fullName,
                    decoration: const InputDecoration(labelText: 'Họ tên'),
                    validator: (value) =>
                        (value?.trim().isEmpty ?? true) ? 'Bắt buộc' : null,
                  ),
                  TextFormField(
                    controller: user == null ? roleCode : phone,
                    decoration: InputDecoration(
                      labelText: user == null ? 'Mã vai trò' : 'Điện thoại',
                    ),
                  ),
                  if (user == null)
                    DropdownButtonFormField<UserRole>(
                      initialValue: role,
                      decoration: const InputDecoration(labelText: 'Vai trò'),
                      items: UserRole.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setDialogState(() => role = value!),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Hủy'),
            ),
            FilledButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                final repository = ref.read(adminRepositoryProvider);
                if (user == null) {
                  await repository.createUser(
                    email: email.text.trim(),
                    password: password.text,
                    fullName: fullName.text.trim(),
                    role: role,
                    roleCode: roleCode.text.trim().isEmpty
                        ? null
                        : roleCode.text.trim(),
                  );
                } else {
                  await repository.updateUser(
                    user.userId,
                    fullName.text.trim(),
                    phone.text.trim(),
                  );
                }
                if (context.mounted) Navigator.pop(context, true);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
    email.dispose();
    password.dispose();
    fullName.dispose();
    phone.dispose();
    roleCode.dispose();
    if (saved == true) ref.invalidate(userManagementProvider);
  }
}
