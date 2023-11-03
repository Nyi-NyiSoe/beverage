class Items {
  final String imgUrl;
  final String itemName;
  final String price;

  Items({required this.imgUrl, required this.itemName, required this.price});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Items &&
          runtimeType == other.runtimeType &&
          imgUrl == other.imgUrl &&
          itemName == other.itemName &&
          price == other.price;

  @override
  int get hashCode => imgUrl.hashCode ^ itemName.hashCode ^ price.hashCode;
}
