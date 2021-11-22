import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? ddd;
  String? siafi;

  AddressModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.ddd,
    this.siafi,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return _$AddressModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
