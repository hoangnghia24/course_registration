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

## Cấu hình mật khẩu PostgreSQL

Serverpod lấy mật khẩu database từ `config/passwords.yaml`. Khi clone repository,
tạo file local từ mẫu nếu file này chưa tồn tại:

```powershell
if (-not (Test-Path config/passwords.yaml)) {
  Copy-Item config/passwords.yaml.example config/passwords.yaml
}
```

Đặt mật khẩu PostgreSQL của user `postgres` vào `development.database`:

```yaml
development:
  database: 'MAT_KHAU_POSTGRESQL_CUA_BAN'
```

Giá trị này phải trùng với mật khẩu trong PostgreSQL. Để đổi mật khẩu database,
chạy lệnh sau trong `psql`, rồi cập nhật lại `config/passwords.yaml` bằng cùng giá trị:

```sql
ALTER USER postgres WITH PASSWORD 'MAT_KHAU_MOI';
```

Thay toàn bộ placeholder secret còn lại bằng giá trị ngẫu nhiên và không commit
`config/passwords.yaml`. Cấu hình development mặc định kết nối `localhost:5432`;
Compose trong file này mở PostgreSQL ở host port `8090`, vì vậy cần đồng bộ lại cổng
nếu chọn dùng Docker.

## Dữ liệu development

Seed idempotent tạo dữ liệu học vụ và các tài khoản được cấp sẵn. Mật khẩu khởi
tạo chỉ dùng cho development; xem hướng dẫn tại README gốc và đổi mật khẩu
trước khi dùng staging/production.

## Demo data

Create the development schema and insert idempotent sample data (including four login accounts):

    dart run bin/seed_demo.dart --mode development --apply-migrations

The provisioned development accounts use the shared initial password `HocVu@2026`. See `../docs/POSTGRESQL_WINDOWS_SETUP.md` for the account list and native PostgreSQL setup instructions for Windows.
