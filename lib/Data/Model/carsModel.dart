class CarsModel {
  int? carId;
  String? carName;
  String? carMake;
  String? carModel;
  String? carImage;
  String? carColor;
  String? carType;
  int? carYear;
  String? carRegNo;
  int? carPricePerday;
  int? favorite;

  CarsModel(
      {this.carId,
      this.carName,
      this.carMake,
      this.carModel,
      this.carImage,
      this.carColor,
      this.carType,
      this.carYear,
      this.carRegNo,
      this.carPricePerday,
      this.favorite});

  CarsModel.fromJson(Map<String, dynamic> json) {
    carId = json['car_Id'];
    carName = json['car_name'];
    carMake = json['car_Make'];
    carModel = json['car_Model'];
    carImage = json['car_image'];
    carColor = json['car_Color'];
    carType = json['car_Type'];
    carYear = json['car_Year'];
    carRegNo = json['car_RegNo'];
    carPricePerday = json['car_PricePerday'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['car_Id'] = carId;
    data['car_name'] = carName;
    data['car_Make'] = carMake;
    data['car_Model'] = carModel;
    data['car_image'] = carImage;
    data['car_Color'] = carColor;
    data['car_Type'] = carType;
    data['car_Year'] = carYear;
    data['car_RegNo'] = carRegNo;
    data['car_PricePerday'] = carPricePerday;
    data['favorite'] = favorite;
    return data;
  }
}