# nullable

## Mục tiêu

Tìm hiểu cơ bản về Nullable trong Dart/Flutter và cách xử lý null an toàn.

## Nội dung

- Định nghĩa Nullable
- Khi nào nên / không nên dùng
- Kỹ thuật xử lý null phổ biến (`?`, `?.`, `??`, `if`, `!`)
- Ví dụ màn hình minh họa

---

### 1. Nullable là gì?

Trong Dart, một biến nullable là biến có thể nhận giá trị `null`.

- Non-nullable: `String name = 'Dak';`
- Nullable: `String? email;`

Null Safety ở Dart giúp phát hiện nhiều lỗi liên quan đến `null` ngay ở thời điểm biên dịch.

---

### 2. Khi nào nên / không nên dùng

- Nên dùng khi:

  - Dữ liệu tới từ API / database hoặc input của người dùng (không đảm bảo có giá trị).
  - Thông tin là tùy chọn (optional).
  - Trạng thái ban đầu chưa có dữ liệu.

- Không nên dùng khi:
  - Giá trị bắt buộc phải tồn tại (bắt buộc sử dụng non-nullable).
  - Có thể sử dụng giá trị mặc định thay vì `null`.
  - Lạm dụng nullable làm tăng độ phức tạp kiểm tra `null` khắp nơi.

---

### 3. Cách xử lý null phổ biến (với ví dụ Dart)

- Nullable type: `String? name;`

- Safe access `?.`: chỉ truy cập khi khác `null`

```dart
int length = name?.length ?? 0; // nếu name null => length = 0
```

- Elvis operator `??`: giá trị mặc định

```dart
String displayName = name ?? 'Chưa cập nhật';
```

- Kiểm tra null với `if`:

```dart
if (name != null) {
  print(name);
}
```

- Bang `!` (unsafe, ép kiểu non-null khi bạn chắc chắn không null):

```dart
print(name!.length); // nếu name là null sẽ ném lỗi ở runtime
```

---

### 4. Ví dụ màn hình (mô tả)

Một màn hình profile đơn giản hiển thị tên và email người dùng (email có thể không có).

- UI: `CircleAvatar`, `Text` cho tên và email.
- Hiển thị mặc định khi email null: "Chưa cập nhật".

Ví dụ widget (chỉ minh họa):

```dart
class ProfileHeader extends StatelessWidget {
  final String name;
  final String? email;

  const ProfileHeader({required this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 32),
        SizedBox(height: 8),
        Text(name),
        Text(email ?? 'Chưa cập nhật'),
      ],
    );
  }
}
```

---

### 5. Nguyên tắc sử dụng Nullable

- Nullable càng ít càng tốt

- Xử lý null ngay tại nơi sử dụng

- Ưu tiên: ?? → if → hạn chế !

- Model rõ ràng: nullable / non-null ngay từ đầu

---

### Tham khảo

- Tài liệu Dart: Null Safety
