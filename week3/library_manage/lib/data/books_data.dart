import '../models/book_model.dart';

final List<Book> sampleBooks = [
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
