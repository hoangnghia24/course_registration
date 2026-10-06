# course_registration_server

Đây là API Serverpod của dự án Course Registration. Hướng dẫn đầy đủ cho việc
clone, cấu hình PostgreSQL, tạo secret cục bộ, seed dữ liệu và chạy Flutter nằm
ở [README.md](../README.md) tại thư mục gốc.

## Chạy nhanh trong môi trường development

Từ thư mục server, sau khi đã tạo `config/passwords.yaml` từ file mẫu và tạo
database PostgreSQL:

```powershell
dart pub get
dart run bin/seed_demo.dart --mode development --apply-migrations
dart run bin/main.dart --mode development
```

Docker Compose là lựa chọn phụ cho môi trường cô lập. Các password của Compose
được lấy từ biến môi trường; không ghi secret thật vào file YAML hoặc commit.

## Dữ liệu development

Seed idempotent tạo dữ liệu học vụ và các tài khoản được cấp sẵn. Mật khẩu khởi
tạo chỉ dùng cho development; xem hướng dẫn tại README gốc và đổi mật khẩu
trước khi dùng staging/production.

## Demo data

Create the development schema and insert idempotent sample data (including four login accounts):

    dart run bin/seed_demo.dart --mode development --apply-migrations

The provisioned development accounts use the shared initial password `HocVu@2026`. See `../docs/POSTGRESQL_WINDOWS_SETUP.md` for the account list and native PostgreSQL setup instructions for Windows.
