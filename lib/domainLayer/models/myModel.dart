// To parse this JSON data, do
//
//     final myModel = myModelFromJson(jsonString);

import 'dart:convert';

MyModel myModelFromJson(String str) => MyModel.fromJson(json.decode(str));

String myModelToJson(MyModel data) => json.encode(data.toJson());

class MyModel {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    MyModel({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    int id;
    Doctor doctor;
    Patient patient;
    String? problem;
    dynamic diagnosedWith;
    dynamic document;
    DateTime date;
    String orderSummary;
    int serviceAmount;
    bool isCouponApplied;
    bool isVip;
    bool isRated;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic prescriptions;

    Result({
        required this.id,
        required this.doctor,
        required this.patient,
        required this.problem,
        required this.diagnosedWith,
        required this.document,
        required this.date,
        required this.orderSummary,
        required this.serviceAmount,
        required this.isCouponApplied,
        required this.isVip,
        required this.isRated,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.prescriptions,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        doctor: Doctor.fromJson(json["doctor"]),
        patient: Patient.fromJson(json["patient"]),
        problem: json["problem"],
        diagnosedWith: json["diagnosed_with"],
        document: json["document"],
        date: DateTime.parse(json["date"]),
        orderSummary: json["order_summary"],
        serviceAmount: json["service_amount"],
        isCouponApplied: json["is_coupon_applied"],
        isVip: json["is_vip"],
        isRated: json["is_rated"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        prescriptions: json["prescriptions"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor": doctor.toJson(),
        "patient": patient.toJson(),
        "problem": problem,
        "diagnosed_with": diagnosedWith,
        "document": document,
        "date": date.toIso8601String(),
        "order_summary": orderSummary,
        "service_amount": serviceAmount,
        "is_coupon_applied": isCouponApplied,
        "is_vip": isVip,
        "is_rated": isRated,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "prescriptions": prescriptions,
    };
}

class Doctor {
    int id;
    DoctorUser user;
    int status;
    bool onVacation;
    dynamic designation;
    dynamic degrees;
    dynamic languagesSpoken;
    int experienceYear;
    int serviceAmount;
    int vipServiceAmount;
    String detail;
    String educationalJourney;
    int totalPatientsCured;
    int totalEarnings;
    dynamic department;
    List<dynamic> slot;

    Doctor({
        required this.id,
        required this.user,
        required this.status,
        required this.onVacation,
        required this.designation,
        required this.degrees,
        required this.languagesSpoken,
        required this.experienceYear,
        required this.serviceAmount,
        required this.vipServiceAmount,
        required this.detail,
        required this.educationalJourney,
        required this.totalPatientsCured,
        required this.totalEarnings,
        required this.department,
        required this.slot,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        user: DoctorUser.fromJson(json["user"]),
        status: json["status"],
        onVacation: json["on_vacation"],
        designation: json["designation"],
        degrees: json["degrees"],
        languagesSpoken: json["languages_spoken"],
        experienceYear: json["experience_year"],
        serviceAmount: json["service_amount"],
        vipServiceAmount: json["vip_service_amount"],
        detail: json["detail"],
        educationalJourney: json["educational_journey"],
        totalPatientsCured: json["total_patients_cured"],
        totalEarnings: json["total_earnings"],
        department: json["department"],
        slot: List<dynamic>.from(json["slot"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "status": status,
        "on_vacation": onVacation,
        "designation": designation,
        "degrees": degrees,
        "languages_spoken": languagesSpoken,
        "experience_year": experienceYear,
        "service_amount": serviceAmount,
        "vip_service_amount": vipServiceAmount,
        "detail": detail,
        "educational_journey": educationalJourney,
        "total_patients_cured": totalPatientsCured,
        "total_earnings": totalEarnings,
        "department": department,
        "slot": List<dynamic>.from(slot.map((x) => x)),
    };
}

class DoctorUser {
    int id;
    dynamic name;
    dynamic phoneNumber;
    PurpleEmail email;
    dynamic gender;
    dynamic identity;
    int userType;
    dynamic birthdate;
    dynamic country;
    DateTime updatedAt;
    List<int> languages;

    DoctorUser({
        required this.id,
        required this.name,
        required this.phoneNumber,
        required this.email,
        required this.gender,
        required this.identity,
        required this.userType,
        required this.birthdate,
        required this.country,
        required this.updatedAt,
        required this.languages,
    });

    factory DoctorUser.fromJson(Map<String, dynamic> json) => DoctorUser(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: purpleEmailValues.map[json["email"]]!,
        gender: json["gender"],
        identity: json["identity"],
        userType: json["user_type"],
        birthdate: json["birthdate"],
        country: json["country"],
        updatedAt: DateTime.parse(json["updated_at"]),
        languages: List<int>.from(json["languages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": purpleEmailValues.reverse[email],
        "gender": gender,
        "identity": identity,
        "user_type": userType,
        "birthdate": birthdate,
        "country": country,
        "updated_at": updatedAt.toIso8601String(),
        "languages": List<dynamic>.from(languages.map((x) => x)),
    };
}

enum PurpleEmail {
    BASHEER_ALSAMMARRAIE_GMAIL_COM
}

final purpleEmailValues = EnumValues({
    "basheer.alsammarraie@gmail.com": PurpleEmail.BASHEER_ALSAMMARRAIE_GMAIL_COM
});

class Patient {
    int id;
    PatientUser user;
    List<dynamic> chronics;
    List<dynamic> medicines;
    List<dynamic> surgicalHistory;
    List<dynamic> allergy;
    List<dynamic> socialHistory;
    List<dynamic> investigation;
    String familyHistory;

    Patient({
        required this.id,
        required this.user,
        required this.chronics,
        required this.medicines,
        required this.surgicalHistory,
        required this.allergy,
        required this.socialHistory,
        required this.investigation,
        required this.familyHistory,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        user: PatientUser.fromJson(json["user"]),
        chronics: List<dynamic>.from(json["chronics"].map((x) => x)),
        medicines: List<dynamic>.from(json["medicines"].map((x) => x)),
        surgicalHistory: List<dynamic>.from(json["surgical_history"].map((x) => x)),
        allergy: List<dynamic>.from(json["allergy"].map((x) => x)),
        socialHistory: List<dynamic>.from(json["social_history"].map((x) => x)),
        investigation: List<dynamic>.from(json["investigation"].map((x) => x)),
        familyHistory: json["family_history"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "chronics": List<dynamic>.from(chronics.map((x) => x)),
        "medicines": List<dynamic>.from(medicines.map((x) => x)),
        "surgical_history": List<dynamic>.from(surgicalHistory.map((x) => x)),
        "allergy": List<dynamic>.from(allergy.map((x) => x)),
        "social_history": List<dynamic>.from(socialHistory.map((x) => x)),
        "investigation": List<dynamic>.from(investigation.map((x) => x)),
        "family_history": familyHistory,
    };
}

class PatientUser {
    int id;
    List<Language> languages;
    dynamic name;
    dynamic phoneNumber;
    FluffyEmail email;
    dynamic image;
    dynamic gender;
    dynamic identity;
    int userType;
    dynamic birthdate;
    bool isNotification;
    dynamic country;
    DateTime lastLogin;
    bool isActive;
    DateTime createdAt;
    DateTime updatedAt;

    PatientUser({
        required this.id,
        required this.languages,
        required this.name,
        required this.phoneNumber,
        required this.email,
        required this.image,
        required this.gender,
        required this.identity,
        required this.userType,
        required this.birthdate,
        required this.isNotification,
        required this.country,
        required this.lastLogin,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PatientUser.fromJson(Map<String, dynamic> json) => PatientUser(
        id: json["id"],
        languages: List<Language>.from(json["languages"].map((x) => languageValues.map[x]!)),
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: fluffyEmailValues.map[json["email"]]!,
        image: json["image"],
        gender: json["gender"],
        identity: json["identity"],
        userType: json["user_type"],
        birthdate: json["birthdate"],
        isNotification: json["is_notification"],
        country: json["country"],
        lastLogin: DateTime.parse(json["last_login"]),
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "languages": List<dynamic>.from(languages.map((x) => languageValues.reverse[x])),
        "name": name,
        "phone_number": phoneNumber,
        "email": fluffyEmailValues.reverse[email],
        "image": image,
        "gender": gender,
        "identity": identity,
        "user_type": userType,
        "birthdate": birthdate,
        "is_notification": isNotification,
        "country": country,
        "last_login": lastLogin.toIso8601String(),
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum FluffyEmail {
    BASHEER_AUDTEYE_COM
}

final fluffyEmailValues = EnumValues({
    "basheer@audteye.com": FluffyEmail.BASHEER_AUDTEYE_COM
});

enum Language {
    EN
}

final languageValues = EnumValues({
    "EN": Language.EN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
