class OrdersModel {
  int? orderID;
  int? orderUserId;
  int? orderAddress;
  int? orderType;
  int? orderPricedelivery;
  int? orderPrice;
  int? orderTotalprice;
  int? orderCoupon;
  int? ordersRating;
  String? ordersNoteRating;
  int? orderPaymentMethod;
  int? orderStatus;
  String? orderDateTime;
  int? addressID;
  String? addressName;
  int? addressUserId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrdersModel(
      {this.orderID,
      this.orderUserId,
      this.orderAddress,
      this.orderType,
      this.orderPricedelivery,
      this.orderPrice,
      this.orderTotalprice,
      this.orderCoupon,
      this.ordersRating,
      this.ordersNoteRating,
      this.orderPaymentMethod,
      this.orderStatus,
      this.orderDateTime,
      this.addressID,
      this.addressName,
      this.addressUserId,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderID = json['order_ID'];
    orderUserId = json['order_userId'];
    orderAddress = json['order_address'];
    orderType = json['order_Type'];
    orderPricedelivery = json['order_pricedelivery'];
    orderPrice = json['order_Price'];
    orderTotalprice = json['order_totalprice'];
    orderCoupon = json['order_coupon'];
    ordersRating=json['orders_rating'];
    ordersNoteRating=json['orders_noterating'];
    orderPaymentMethod = json['order_PaymentMethod'];
    orderStatus = json['order_status'];
    orderDateTime = json['order_dateTime'];
    addressID = json['Address_ID'];
    addressName = json['Address_Name'];
    addressUserId = json['Address_userId'];
    addressCity = json['Address_city'];
    addressStreet = json['Address_street'];
    addressLat = json['Address_lat'];
    addressLong = json['Address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_ID'] = orderID;
    data['order_userId'] = orderUserId;
    data['order_address'] = orderAddress;
    data['order_Type'] = orderType;
    data['order_pricedelivery'] = orderPricedelivery;
    data['order_Price'] = orderPrice;
    data['order_totalprice'] = orderTotalprice;
    data['order_coupon'] = orderCoupon;
    data['orders_rating']=ordersRating;
    data['orders_noterating']=ordersNoteRating;
    data['order_PaymentMethod'] = orderPaymentMethod;
    data['order_status'] = orderStatus;
    data['order_dateTime'] = orderDateTime;
    data['Address_ID'] = addressID;
    data['Address_Name'] = addressName;
    data['Address_userId'] = addressUserId;
    data['Address_city'] = addressCity;
    data['Address_street'] = addressStreet;
    data['Address_lat'] = addressLat;
    data['Address_long'] = addressLong;
    return data;
  }
}