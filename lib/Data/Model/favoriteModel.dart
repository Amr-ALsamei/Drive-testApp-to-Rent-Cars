class FavoriteModel {
  int? favoriteId;
  int? favoriteUserId;
  int? favoriteCarId;
  int? isFavorite;
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
  int? userId;

FavoriteModel(
      {this.favoriteId,
      this.favoriteUserId,
      this.favoriteCarId,
      this.isFavorite,
      this.carId,
      this.carName,
      this.carMake,
      this.carModel,
      this.carImage,
      this.carColor,
      this.carType,
      this.carYear,
      this.carRegNo,
      this.carPricePerday,
      this.userId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['Favorite_Id'];
    favoriteUserId = json['Favorite_userId'];
    favoriteCarId = json['Favorite_carId'];
    isFavorite = json['isFavorite'];
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
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Favorite_Id'] = favoriteId;
    data['Favorite_userId'] = favoriteUserId;
    data['Favorite_carId'] = favoriteCarId;
    data['isFavorite'] = isFavorite;
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
    data['user_id'] = userId;
    return data;
  }
}