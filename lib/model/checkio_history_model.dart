
class CheckIOHistoryModel {
  String? id;
  String? empId;
  String? checkInTime;
  String? checkOutTime;

  CheckIOHistoryModel(
      {this.id, this.empId, this.checkInTime, this.checkOutTime});

  CheckIOHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empId = json['emp_id'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['emp_id'] = this.empId;
  //   data['check_in_time'] = this.checkInTime;
  //   data['check_out_time'] = this.checkOutTime;
  //   return data;
  }

