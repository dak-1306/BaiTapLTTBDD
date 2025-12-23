import '../models/book_model.dart';
import '../models/magazine_model.dart';
import '../models/library_item.dart';

// Sử dụng LibraryItem để demo Polymorphism (Đa hình)
final List<LibraryItem> sampleItems = [
  Book(
    id: 'b1',
    title: 'Lập trình Dart',
    author: 'Tác giả A',
    status: BookStatus.available,
    publicationYear: 2020,
  ),
  Book(
    id: 'b2',
    title: 'Flutter cho người mới',
    author: 'Tác giả B',
    status: BookStatus.available,
    borrowedId: 'user123',
    publicationYear: 2021,
  ),
  Magazine(
    id: 'm1',
    title: 'Công nghệ số',
    author: 'Ban biên tập',
    publicationYear: 2023,
    issueNumber: 156,
    publisher: 'NXB Trẻ',
  ),
  Book(
    id: 'b3',
    title: 'Cấu trúc dữ liệu',
    author: 'Tác giả C',
    status: BookStatus.available,
    publicationYear: 2019,
  ),
  Book(
    id: 'b4',
    title: 'Thuật toán nâng cao',
    author: 'Tác giả D',
    status: BookStatus.available,
    publicationYear: 2018,
  ),
  Magazine(
    id: 'm2',
    title: 'Khoa học & Đời sống',
    author: 'Nhiều tác giả',
    publicationYear: 2023,
    issueNumber: 89,
    publisher: 'NXB Khoa học',
  ),
  Book(
    id: 'b5',
    title: 'Thiết kế giao diện',
    author: 'Tác giả E',
    status: BookStatus.available,
    publicationYear: 2022,
  ),
  Book(
    id: 'b6',
    title: 'Quản trị hệ thống',
    author: 'Tác giả F',
    status: BookStatus.available,
    borrowedId: 'user456',
    publicationYear: 2017,
  ),
];

// Giữ lại sampleBooks cho compatibility với code hiện tại
final List<Book> sampleBooks = sampleItems.whereType<Book>().toList();
