// To parse this JSON data, do
//
//     final userdataBase = userdataBaseFromJson(jsonString);

import 'dart:convert';

UserdataBase userdataBaseFromJson(String str) => UserdataBase.fromJson(json.decode(str));

String userdataBaseToJson(UserdataBase data) => json.encode(data.toJson());

class UserdataBase {
  String response;
  String message;
  List<Datum> data;
  String error;

  UserdataBase({
    required this.response,
    required this.message,
    required this.data,
    required this.error,
  });

  factory UserdataBase.fromJson(Map<String, dynamic> json) => UserdataBase(
    response: json["response"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
  };
}

class Datum {
  int id;
  String enquiryId;
  int totalEnquiry;
  String eventDate;
  String serviceName;
  List<CustomerDetail> customerDetails;
  String photo;

  Datum({
    required this.id,
    required this.enquiryId,
    required this.totalEnquiry,
    required this.eventDate,
    required this.serviceName,
    required this.customerDetails,
    required this.photo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    enquiryId: json["enquiry_id"],
    totalEnquiry: json["total_enquiry"],
    eventDate: json["event_date"],
    serviceName: json["service_name"],
    customerDetails: List<CustomerDetail>.from(json["customer_details"].map((x) => CustomerDetail.fromJson(x))),
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "enquiry_id": enquiryId,
    "total_enquiry": totalEnquiry,
    "event_date": eventDate,
    "service_name": serviceName,
    "customer_details": List<dynamic>.from(customerDetails.map((x) => x.toJson())),
    "photo": photo,
  };
}

class CustomerDetail {
  int id;
  String enquiryId;
  int userId;
  String name;
  String phone;
  int serviceId;
  String eventDate;
  String guests;
  dynamic pinCode;
  dynamic location;
  String city;
  String area;
  String contactPerson;
  String contactNo;
  String? email;
  dynamic splRequest;
  int status;
  DateTime createdAt;
  dynamic updatedAt;

  CustomerDetail({
    required this.id,
    required this.enquiryId,
    required this.userId,
    required this.name,
    required this.phone,
    required this.serviceId,
    required this.eventDate,
    required this.guests,
    required this.pinCode,
    required this.location,
    required this.city,
    required this.area,
    required this.contactPerson,
    required this.contactNo,
    required this.email,
    required this.splRequest,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
    id: json["id"],
    enquiryId: json["enquiry_id"],
    userId: json["user_id"],
    name: json["name"],
    phone: json["phone"],
    serviceId: json["service_id"],
    eventDate: json["event_date"],
    guests: json["guests"],
    pinCode: json["pin_code"],
    location: json["location"],
    city: json["city"],
    area: json["area"],
    contactPerson: json["contact_person"],
    contactNo: json["contact_no"],
    email: json["email"],
    splRequest: json["spl_request"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "enquiry_id": enquiryId,
    "user_id": userId,
    "name": name,
    "phone": phone,
    "service_id": serviceId,
    "event_date": eventDate,
    "guests": guests,
    "pin_code": pinCode,
    "location": location,
    "city": city,
    "area": area,
    "contact_person": contactPerson,
    "contact_no": contactNo,
    "email": email,
    "spl_request": splRequest,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
  };
}
