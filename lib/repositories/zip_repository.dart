import 'package:dio/dio.dart';
import 'package:olx_clone/models/address.dart';
import 'package:olx_clone/repositories/ibge_repository.dart';

class ZipRepository {
  Future<Address> getAddressFromApi(String zip) async {
    final endpoint = 'http://viacep.com.br/ws/$zip/json';
    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data!.containsKey('erro') && response.data!['erro']) {
        return Future.error("CEP inválido.");
      }

      final ufList = await IBGERepository().getUFList();

      return Address(
        uf: ufList.firstWhere((uf) => uf.initials == response.data!['uf']),
        city: response.data!['localidade'],
        cep: response.data!['cep'],
        district: response.data!['bairro'],
      );
    } catch (e) {
      return Future.error("Falha ao obter o endereço.");
    }
  }
}
