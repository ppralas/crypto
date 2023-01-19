import 'package:cryptoapp/rest_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bitcoinProvider = FutureProvider((ref) async {
  final bitcoin = await BitcoinApiClient(
    Dio(
      BaseOptions(
        headers: {'X-CoinAPI-Key': 'CA73EB70-BE69-4E46-AC37-18A97CC49774'},
      ),
    ),
  );

  return bitcoin.getRates();
});
