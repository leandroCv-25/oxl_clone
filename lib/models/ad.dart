import 'address.dart';
import 'category.dart';
import 'user.dart';

enum AdStatus { pending, active, sold, deleted }

class Ad {
  Ad({
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.price,
    required this.hidePhone,
    required this.user,
    this.views = 0,
    this.status = AdStatus.pending,
  });

  String? id;

  List images = [];

  String title;
  String description;

  Category category;

  Address address;

  num price;
  bool hidePhone = false;

  AdStatus status;
  DateTime? created;

  User user;

  int views;
}
