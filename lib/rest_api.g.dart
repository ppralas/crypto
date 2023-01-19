// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rates _$RatesFromJson(Map<String, dynamic> json) => Rates(
      DateTime.parse(json['time'] as String),
      json['asset_id_quote'] as String,
      rate: json['rate'] as num,
    );

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'rate': instance.rate,
      'time': instance.time.toIso8601String(),
      'asset_id_quote': instance.assetIdQuote,
    };

RatesResponse _$RatesResponseFromJson(Map<String, dynamic> json) =>
    RatesResponse(
      (json['rates'] as List<dynamic>)
          .map((e) => Rates.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['asset_id_base'] as String,
    );

Map<String, dynamic> _$RatesResponseToJson(RatesResponse instance) =>
    <String, dynamic>{
      'rates': instance.rates,
      'asset_id_base': instance.assetIdBase,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BitcoinApiClient implements BitcoinApiClient {
  _BitcoinApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://rest.coinapi.io/v1/exchangerate/BTC?invert=false';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RatesResponse> getRates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RatesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/exchangerate',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RatesResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
