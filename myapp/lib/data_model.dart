class DataModel {
  String Id = '';
  String name = '';
  double price = 0;

  DataModel({this.Id = '', this.name = '', this.price = 0});

  DataModel.fromJson(Map<String, dynamic> json) {
    Id = json['_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.Id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
