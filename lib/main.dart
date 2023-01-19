import 'package:cryptoapp/bitcoin_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: BitcoinValue(),
      ),
    );
  }
}

//Okay, let's say you have a magic box and inside the magic box there is a file called "configurations.json" which contains some special information. We want to use that information in our app, but it's locked inside the magic box.

//So we use something called FutureProvider that can open the magic box and take the file "configurations.json" out, so we can use the information in our app.

//FutureProvider<Configuration> is like a special key to open the magic box and it is going to give us a special object called Configuration which we can use in our app.

//We are also using something called rootBundle.loadString this is like a helper to open the magic box and get the contents of the file "configurations.json" out.

//json.decode this is like a helper that takes the contents of the file and turns it into something our app can understand and use.

//And Configuration.fromJson(content) this is like a helper that takes the information we got from the file and turns it into the Configuration object we can use in our app.

//So basically we are using FutureProvider to open the magic box and get the special information out, so we can use it in our app.



// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
  
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//      AsyncValue<AsyncValue<String>>config = ref.watch(bitcoinProvider);

//      return config.when(
//     loading: () => const CircularProgressIndicator(),
//     error: (err, stack) => Text('Error: $err'),
//     data: (config) {
//       return Text(config.host);
//   }
// }


//   class _MyHomePageState extends {
//    @override
//    Widget build(BuildContext context, WidgetRef ref) {
//     final bitcoinValue = ref.watch(bitcoinProvider);

  
//     },
//   );
//    }

  


// class Bitcoin {
//   String? assetIdBase;
//   List<Rates>? rates;

//   Bitcoin({this.assetIdBase, this.rates});

//   Bitcoin.fromJson(Map<String, dynamic> json) {
//     assetIdBase = json['asset_id_base'];
//     if (json['rates'] != null) {
//       rates = <Rates>[];
//       json['rates'].forEach((v) {
//         rates!.add(new Rates.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['asset_id_base'] = this.assetIdBase;
//     if (this.rates != null) {
//       data['rates'] = this.rates!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Rates {
//   String? time;
//   String? assetIdQuote;
//   double? rate;

//   Rates({this.time, this.assetIdQuote, this.rate});

//   Rates.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     assetIdQuote = json['asset_id_quote'];
//     rate = json['rate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['asset_id_quote'] = this.assetIdQuote;
//     data['rate'] = this.rate;
//     return data;
//   }
// }


