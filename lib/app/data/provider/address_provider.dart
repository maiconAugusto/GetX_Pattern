import 'package:dio/dio.dart';
import 'package:get_x/app/data/model/address_model.dart';

class AddressProvier {
  Future<AddressModel> getAddress(String cep) async {
    dynamic response = (await Dio().get('https://viacep.com.br/ws/$cep/json/'));
    return AddressModel.fromJson(response.data);
  }
}
