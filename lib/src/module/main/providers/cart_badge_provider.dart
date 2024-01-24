import 'package:gandom/src/core/provider/safe_provider.dart';

class CartBadgeProvider extends SafeProvider {
  int cartItemCount = 0;

  increaseCartItemCount(){
    cartItemCount = cartItemCount + 1;
    notifyListeners();
  }
  decreaseCartItemCount(){
    cartItemCount = cartItemCount - 1;
    notifyListeners();
  }

  void setCartItemCount(int newValue) {
    cartItemCount = newValue;
    notifyListeners();
  }
}