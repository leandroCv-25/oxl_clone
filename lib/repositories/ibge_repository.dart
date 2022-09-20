import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/city.dart';
import '../models/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFList() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();

    if (preference.containsKey('UF_LIST')) {
      final jsonUF = json.decode(preference.get('UF_LIST') as String);

      final List<UF> ufList = jsonUF?.map<UF>((j) => UF.fromJson(j)).toList();

      ufList.sort(
        (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
      );
      return ufList;
    }

    const endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

    try {
      final response = await Dio().get<List>(endpoint);

      preference.setString('UF_LIST', json.encode(response.data));

      final ufList = response.data?.map<UF>((j) => UF.fromJson(j)).toList();
      if (ufList == null) {
        return Future.error("Falha ao obter a lista dos estados.");
      } else {
        ufList.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
        );
        return ufList;
      }
    } on DioError {
      return Future.error("Falha ao obter a lista dos estados.");
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios";

    try {
      final response = await Dio().get<List>(endpoint);

      final ufList = response.data?.map<City>((j) => City.fromJson(j)).toList();
      if (ufList == null) {
        return Future.error("Falha ao obter a lista das Cidades.");
      } else {
        ufList.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        return ufList;
      }
    } on DioError {
      return Future.error("Falha ao obter a lista das Cidades.");
    }
  }
}
