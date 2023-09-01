
class GetProfile {
    CustomerWithUrl? customerWithUrl;

    GetProfile({this.customerWithUrl});

    GetProfile.fromJson(Map<String, dynamic> json) {
        customerWithUrl = json["customerWithUrl"] == null ? null : CustomerWithUrl.fromJson(json["customerWithUrl"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(customerWithUrl != null) {
            _data["customerWithUrl"] = customerWithUrl?.toJson();
        }
        return _data;
    }
}

class CustomerWithUrl {
    String? id;
    String? name;
    String? email;
    String? username;
    dynamic emailOtp;
    String? mobile;
    dynamic mobileOtp;
    dynamic dob;
    dynamic latitude;
    dynamic longitude;
    dynamic mobileVerifiedAt;
    dynamic emailVerifiedAt;
    String? status;
    dynamic file;
    List<String>? wishList;
    String? createdAt;
    String? updatedAt;
    int? v;
    dynamic imageUrl;

    CustomerWithUrl({this.id, this.name, this.email, this.username, this.emailOtp, this.mobile, this.mobileOtp, this.dob, this.latitude, this.longitude, this.mobileVerifiedAt, this.emailVerifiedAt, this.status, this.file, this.wishList, this.createdAt, this.updatedAt, this.v, this.imageUrl});

    CustomerWithUrl.fromJson(Map<String, dynamic> json) {
        id = json["_id"];
        name = json["name"];
        email = json["email"];
        username = json["username"];
        emailOtp = json["email_otp"];
        mobile = json["mobile"];
        mobileOtp = json["mobile_otp"];
        dob = json["dob"];
        latitude = json["latitude"];
        longitude = json["longitude"];
        mobileVerifiedAt = json["mobile_verified_at"];
        emailVerifiedAt = json["email_verified_at"];
        status = json["status"];
        file = json["file"];
        wishList = json["wishList"] == null ? null : List<String>.from(json["wishList"]);
        createdAt = json["createdAt"];
        updatedAt = json["updatedAt"];
        v = json["__v"];
        imageUrl = json["imageUrl"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["name"] = name;
        _data["email"] = email;
        _data["username"] = username;
        _data["email_otp"] = emailOtp;
        _data["mobile"] = mobile;
        _data["mobile_otp"] = mobileOtp;
        _data["dob"] = dob;
        _data["latitude"] = latitude;
        _data["longitude"] = longitude;
        _data["mobile_verified_at"] = mobileVerifiedAt;
        _data["email_verified_at"] = emailVerifiedAt;
        _data["status"] = status;
        _data["file"] = file;
        if(wishList != null) {
            _data["wishList"] = wishList;
        }
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        _data["__v"] = v;
        _data["imageUrl"] = imageUrl;
        return _data;
    }
}