// class FailureModel {
//   final int? statusCode;
//   final String? message;
//   final String? data;

//   FailureModel({
//     this.statusCode,
//     required this.message,
//     this.data,
//   });

// }
class FailureModel {
  bool? status;
  String? message;
  Data? data;

  FailureModel({
    this.status,
    this.message,
    this.data,
  });
}

class Data {
  String? error;

  Data({
    this.error,
  });
}
