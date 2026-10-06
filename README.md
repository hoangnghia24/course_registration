# Course Registration

Ứng dụng quản lý đào tạo và đăng ký học phần cho trường đại học. Hệ thống có ba vai trò: sinh viên, giảng viên và phòng đào tạo. Người dùng được cấp tài khoản sẵn; ứng dụng không mở chức năng tự đăng ký tài khoản.

## Tính năng chính

- Đăng nhập email/mật khẩu và khôi phục mật khẩu.
- Sinh viên: hồ sơ, chương trình đào tạo, bảng điểm/GPA, tìm lớp mở, đăng ký hoặc hủy học phần, lịch học.
- Giảng viên: lớp được phân công, lịch dạy, danh sách sinh viên và nhu cầu mở lớp.
- Phòng đào tạo: quản lý người dùng, môn học, chương trình, duyệt lớp, báo cáo và lịch sử thao tác.
- Kiểm tra điều kiện tiên quyết, trùng lịch, giới hạn tín chỉ, thời hạn đăng ký và sức chứa lớp.
- Cache Drift/SQLite và hàng đợi đồng bộ cho các thao tác đăng ký khi thiết bị tạm mất mạng.

## Công nghệ

- Flutter 3.47.5 và Dart 3.12.2+
- Serverpod 4.0.3
- PostgreSQL 16+
- Drift/SQLite, Riverpod và go_router

## Cấu trúc repository

```text
course_registration/
├── course_registration_client/    # Protocol, DTO và model dùng chung
├── course_registration_server/    # API Serverpod, nghiệp vụ và migration
├── course_registration_flutter/   # Ứng dụng Flutter
├── pubspec.yaml                   # Dart workspace
└── README.md
```

Thư mục `docs/` chứa tài liệu nội bộ và ảnh báo cáo, được cố ý loại khỏi repository GitHub theo yêu cầu dự án.

## Yêu cầu cài đặt

Trên Windows cần cài Git, Dart SDK 3.12.2+, Flutter 3.47.5+, PostgreSQL 16+ và Android Studio/Android SDK nếu chạy Android.

```powershell
git --version
dart --version
flutter doctor -v
psql --version
```

## Cài đặt lần đầu

```powershell
git clone <URL_REPOSITORY> course_registration
cd course_registration
dart pub get
cd course_registration_flutter
flutter pub get
cd ..
```

Tạo database PostgreSQL:

```sql
CREATE DATABASE course_registration_db
  WITH OWNER = postgres
       ENCODING = 'UTF8';
```

Sao chép file cấu hình bí mật mẫu:

```powershell
Copy-Item course_registration_server/config/passwords.yaml.example course_registration_server/config/passwords.yaml
```

Mở `course_registration_server/config/passwords.yaml`, thay `POSTGRES_PASSWORD` bằng mật khẩu PostgreSQL và thay các placeholder còn lại bằng chuỗi ngẫu nhiên. File `passwords.yaml` đã được `.gitignore`; không commit file này.

Cấu hình database mặc định nằm tại `course_registration_server/config/development.yaml`:

```yaml
database:
  host: localhost
  port: 5432
  name: course_registration_db
  user: postgres
```

### Cập nhật mật khẩu PostgreSQL

Serverpod đọc mật khẩu database từ `course_registration_server/config/passwords.yaml`,
không đọc trực tiếp từ `development.yaml`. Nếu chưa có file secrets, tạo file local từ
file mẫu (lệnh này không ghi đè file đã tồn tại):

```powershell
if (-not (Test-Path course_registration_server/config/passwords.yaml)) {
  Copy-Item course_registration_server/config/passwords.yaml.example `
    course_registration_server/config/passwords.yaml
}
```

Mở `course_registration_server/config/passwords.yaml` và đặt mật khẩu của user
PostgreSQL vào khóa `development.database`:

```yaml
development:
  database: 'MAT_KHAU_POSTGRESQL_CUA_BAN'
```

Mật khẩu này phải trùng với mật khẩu của user `postgres` trong PostgreSQL. Nếu muốn
đổi mật khẩu PostgreSQL, thực hiện trong `psql` trước:

```sql
ALTER USER postgres WITH PASSWORD 'MAT_KHAU_MOI';
```

Sau đó cập nhật lại `development.database` bằng cùng mật khẩu mới. Các khóa secret
khác trong phần `development` (`serviceSecret`, `jwtHmacSha512PrivateKey`, ...)
cũng phải được thay bằng chuỗi ngẫu nhiên; không để nguyên các placeholder
`<GENERATE_RANDOM_VALUE>`. Không commit `passwords.yaml` hoặc mật khẩu thật lên Git.

Kiểm tra mật khẩu và database trước khi chạy Serverpod:

```powershell
Test-NetConnection localhost -Port 5432
psql -h localhost -p 5432 -U postgres -d course_registration_db
```

Nếu dùng Docker Compose, PostgreSQL được mở ở cổng host `8090` theo
`course_registration_server/docker-compose.yaml`, trong khi `development.yaml` mặc
định dùng cổng `5432`. Hãy dùng PostgreSQL native ở cổng 5432 để chạy theo hướng dẫn
này, hoặc chủ động đồng bộ cổng Docker với cấu hình trước khi chạy ứng dụng.

## Seed dữ liệu development

```powershell
cd course_registration/course_registration_server
dart run bin/seed_demo.dart --mode development --apply-migrations
```

Seed có thể chạy lại và không nhân bản dữ liệu. Tài khoản development:

| Vai trò | Email |
|---|---|
| Phòng đào tạo | `phongdaotao@namviet.edu.vn` |
| Giảng viên | `minh.tran@namviet.edu.vn`, `lan.pham@namviet.edu.vn`, `duc.le@namviet.edu.vn` |
| Sinh viên | `26cntt001@namviet.edu.vn` đến `26cntt010@namviet.edu.vn` |

Mật khẩu khởi tạo development là `HocVu@2026`. Không dùng mật khẩu này cho staging hoặc production.

## Chạy API server

```powershell
cd course_registration/course_registration_server
dart run bin/main.dart --mode development
```

API mặc định chạy ở `http://localhost:8080`. Kiểm tra bằng `Test-NetConnection localhost -Port 8080`.

## Chạy Flutter

```powershell
cd course_registration/course_registration_flutter
flutter devices
flutter run -d <device-id>
```

### Android Emulator

```powershell
adb reverse tcp:8080 tcp:8080
flutter run -d <emulator-id>
```

Nếu không dùng `adb reverse`, địa chỉ host trong emulator thường là `http://10.0.2.2:8080`.

### Điện thoại Android thật

Cho điện thoại và máy tính cùng mạng LAN. Dùng `ipconfig` lấy IPv4 máy tính, ví dụ `192.168.1.20`, rồi cấu hình API thành `http://192.168.1.20:8080`. Cho phép server qua Windows Firewall ở cổng 8080. Không mở PostgreSQL ra Internet.

## Kiểm tra mã nguồn

```powershell
cd course_registration_server
dart format --set-exit-if-changed lib test
dart analyze
dart test

cd ..\course_registration_flutter
dart format --set-exit-if-changed lib test
flutter analyze
flutter test
```

## Bảo mật và file không được commit

`.gitignore` đã loại khỏi commit toàn bộ `docs/`, `config/passwords.yaml`, `.serverpod/`, build, coverage, cache, IDE files, private key, certificate, keystore và `.env`. Chỉ commit `passwords.yaml.example` với placeholder. Nếu secret từng bị commit, phải revoke/rotate ngay và làm sạch lịch sử Git trước khi public repository.

## Lỗi thường gặp

- Không kết nối PostgreSQL: kiểm tra service, database, user, port và `passwords.yaml`.
- Emulator timeout API: chạy `adb reverse tcp:8080 tcp:8080` hoặc dùng `10.0.2.2:8080`.
- Điện thoại thật timeout: kiểm tra cùng Wi‑Fi, IPv4 và Windows Firewall.
- Port đã dùng: `Get-NetTCPConnection -LocalPort 5432,8080`.
- Dependency lỗi: chạy lại `dart pub get`, `flutter clean` và `flutter pub get`.

## Ghi chú

Đây là đồ án học tập. Trước khi triển khai thật cần bổ sung HTTPS, email provider, secret manager, rate limiting, logging/monitoring và kiểm thử staging.

