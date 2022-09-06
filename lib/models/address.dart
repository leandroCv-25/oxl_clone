import 'package:olx_clone/models/city.dart';
import 'package:olx_clone/models/uf.dart';

class Address {
  Address({
    required this.uf,
    required this.city,
    required this.cep,
    required this.district,
  });

  UF uf;
  City city;

  String cep;
  String district;
}
