class NavigationState {
  final bool? _unknown;
  final bool? _basket;

  String? selectedProductId;

  bool get isBasket => _basket == true;

  bool get isDetails => selectedProductId != null;

  bool get isUnknown => _unknown == true;

  bool get isRoot => !isBasket && !isDetails && !isUnknown;

  NavigationState.root()
      : _basket = false,
        _unknown = false,
        selectedProductId = null;

  NavigationState.basket()
      : _basket = true,
        _unknown = false,
        selectedProductId = null;

  NavigationState.product(this.selectedProductId)
      : _basket = false,
        _unknown = false;

  NavigationState.unknown()
      : _basket = false,
        _unknown = true,
        selectedProductId = null;
}
