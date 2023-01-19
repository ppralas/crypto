import 'dart:developer';

import 'package:cryptoapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BitcoinValue extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bitcoinProvider);
    return Scaffold(
        appBar: AppBar(actions: [
          ElevatedButton(
              onPressed: () => ref.refresh(bitcoinProvider),
              child: Icon(Icons.refresh))
        ]),
        body: state.when(
          data: (data) => ListView.separated(
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.rates[index].time.toUtc().toIso8601String(),
                ),
                Text(data.rates[index].rate.toStringAsFixed(2)),
                Text(data.rates[index].assetIdQuote)
              ],
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: data.rates.length,
          ),
          error: (error, stackTrace) {
            log(stackTrace.toString());
            return Text(error.toString());
          },
          loading: () => CircularProgressIndicator(),
        ));
  }
}
