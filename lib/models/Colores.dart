class ProductColor{
  // late int colorHexCode;
  late int r;
  late int g;
  late int b;
  // late String codColor;
  late String nombreColor;
  late bool isSelected;

  ProductColor({
    // required this.colorHexCode,
    required this.r,
    required this.g,
    required this.b,
    // required this.codColor,
    required this.nombreColor,
    required this.isSelected,
  });

  static ProductColor fromJson(Map json) {
    return ProductColor(   
      // colorHexCode:int.parse(json['ColorHexCode'] ?? '0' ),
      r: json['R'] as int? ?? 0,
      g: json['G'] as int? ?? 0,
      b: json['B'] as int? ?? 0,
      // codColor: json['CodColor'] as String? ?? '',
      nombreColor: json['Color'] as String? ?? '',
      isSelected: false,
    );
  }

  ProductColor.empty() {
    // colorHexCode = 0;
    r = 0;
    g = 0;
    b = 0;
    // codColor = '';
    nombreColor = '';
    isSelected = false;
  }

  // @override
  // bool operator ==(other) {
  //   if (other is! ProductColor) {
  //     return false;
  //   }
  //   return colorHexCode == other.colorHexCode;
  // }

  // @override
  // int get hashCode => (colorHexCode).hashCode;

}