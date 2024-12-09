# Flutter Crypto App

## Overview

This project is a Flutter-based application that displays real-time cryptocurrency data. It uses the **CoinGecko API** to fetch market data and visualizes it with charts. The project leverages the `provider` package for state management and `fl_chart` for graphical representation of data.

---

## Features

- Fetches real-time cryptocurrency data from the CoinGecko API.
- Displays a list of cryptocurrencies with market details.
- Visualizes cryptocurrency trends using sparkline charts.
- Utilizes `Provider` for efficient state management.

---

## Packages Used

### 1. `http`
- **Purpose**: For making HTTP requests to the CoinGecko API.
- **Documentation**: [http package](https://pub.dev/packages/http)

### 2. `fl_chart`
- **Purpose**: For creating graphs and charts, such as sparklines.
- **Documentation**: [fl_chart package](https://pub.dev/packages/fl_chart)

### 3. `provider`
- **Purpose**: For managing state across the application efficiently.
- **Documentation**: [provider package](https://pub.dev/packages/provider)

---

## API Used

### CoinGecko API
- **Endpoint**:  
  `https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true`
- **Response**: Returns market data for cryptocurrencies, including current prices and sparkline data for trends.

---

## Project Structure

```
lib/
├── main.dart             # Entry point of the application
├── model/
│   └── crypto_model.dart # Data model for cryptocurrency
└── provider/
    └── crypto_provider.dart # State management for cryptocurrency data
```

---

## How to Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

---

## Code Explanation

### Provider for State Management
The `CryptoProvider` class fetches and holds the cryptocurrency data. It uses the `http` package to retrieve data from the CoinGecko API and notifies listeners when data updates.

```dart
class CryptoProvider with ChangeNotifier {
  List<CryptoModel> _cryptos = [];
  List<CryptoModel> get cryptos => _cryptos;

  Future<void> fetchCryptoData() async {
    final url = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _cryptos = data.map((item) => CryptoModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
```

---

## Prerequisites

- Flutter SDK installed ([Install Flutter](https://flutter.dev/docs/get-started/install))
- A stable internet connection (for API requests)

---

## Contributing

Feel free to fork this repository and make contributions. Submit a pull request with your enhancements!

---

## License

This project is open-source and available under the MIT License. See the [LICENSE](LICENSE) file for more details.
