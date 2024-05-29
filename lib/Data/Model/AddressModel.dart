class AddressModel {
  int? addressID;
  String? addressName;
  int? addressUserId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  AddressModel(
      {this.addressID,
      this.addressName,
      this.addressUserId,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressID = json['Address_ID'];
    addressName = json['Address_name'];
    addressUserId = json['Address_userId'];
    addressCity = json['Address_city'];
    addressStreet = json['Address_street'];
    addressLat = json['Address_lat'];
    addressLong = json['Address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Address_ID'] = addressID;
    data['Address_name'] = addressName;
    data['Address_userId'] = addressUserId;
    data['Address_city'] = addressCity;
    data['Address_street'] = addressStreet;
    data['Address_lat'] = addressLat;
    data['Address_long'] = addressLong;
    return data;
  }
}