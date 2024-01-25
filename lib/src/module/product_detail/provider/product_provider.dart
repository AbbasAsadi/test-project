import 'package:test_project/src/core/provider/safe_provider.dart';

class ProductProvider extends SafeProvider {
  int selectedSizeIndex = 0;

  ProductProvider(this.productID);

  final String productID;

  void changeCoffeeSize(int index) {
    selectedSizeIndex = index;
    notifyListeners();
  }
}
