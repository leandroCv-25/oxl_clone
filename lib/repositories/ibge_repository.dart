import 'package:dio/dio.dart';

import '../models/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFListFromApi() async {
    const endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

    try {
      final response = await Dio().get<List>(endpoint);

      final ufList = response.data?.map<UF>((j) => UF.fromJson(j)).toList();
      if (ufList == null) {
        return Future.error("Falha ao obter a lista dos estados.");
      } else {
        ufList.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        return ufList;
      }
    } on DioError {
      return Future.error("Falha ao obter a lista dos estados.");
    }
  }
}
