import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_crypto_calculator/view_model/crypto_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crypto Market')),
      body: FutureBuilder(
        future: Provider.of<CryptoProvider>(context, listen: false).fetchCryptoData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }

          final cryptos = Provider.of<CryptoProvider>(context).cryptos;

          return ListView.builder(
            itemCount: cryptos.length,
            itemBuilder: (ctx, index) {
              final crypto = cryptos[index];
              return Card(
                child: ListTile(
                  leading: Text(crypto.symbol.toUpperCase()),
                  title: Text(crypto.name),
                  subtitle: Text('\$${crypto.price.toStringAsFixed(2)}'),
                  trailing: Container(
                    height: 50,
                    width: 100,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: crypto.priceChangeHistory
                                .asMap()
                                .entries
                                .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                                .toList(),
                            isCurved: true,
                            colors: [Colors.blue],
                          ),
                        ],
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
