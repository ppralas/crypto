import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "https://rest.coinapi.io/v1/exchangerate/BTC?invert=false")
abstract class BitcoinApiClient {
  factory BitcoinApiClient(Dio dio, {String baseUrl}) = _BitcoinApiClient;

  @GET("/exchangerate")
  Future<RatesResponse> getRates();
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Rates {
  final num rate;
  final DateTime time;
  final String assetIdQuote;
  Rates(this.time, this.assetIdQuote, {required this.rate});
  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RatesResponse {
  final List<Rates> rates;
  final String assetIdBase;

  RatesResponse(this.rates, this.assetIdBase);

  factory RatesResponse.fromJson(Map<String, dynamic> json) =>
      _$RatesResponseFromJson(json);
}

//future provider -> providea async value (predefinirani state) init loading i error
//pozovem s njim endpoint od kreiranog getRates i vratim response koji trebam, pretvorit u rates klasu 
//dobit cu json i onda direktno zovem s ref.watch u build metodi od nekog widgeta i imam provider il state.when i opcije i stateove 
//kad dohvati kad vrati provider response mogu prikazat na ekranu 