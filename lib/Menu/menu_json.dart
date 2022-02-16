/// _menu : "15,000원"
/// _col : "공기밥 무료"
/// _dodo : "0xffFFE959"

class MenuJson {
  MenuJson({
      String? menu, 
      String? col, 
      String? dodo,}){
    _menu = menu;
    _col = col;
    _dodo = dodo;
}

  MenuJson.fromJson(dynamic json) {
    _menu = json['_menu'];
    _col = json['_col'];
    _dodo = json['_dodo'];
  }
  String? _menu;
  String? _col;
  String? _dodo;

  String? get menu => _menu;
  String? get col => _col;
  String? get dodo => _dodo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_menu'] = _menu;
    map['_col'] = _col;
    map['_dodo'] = _dodo;
    return map;
  }

}