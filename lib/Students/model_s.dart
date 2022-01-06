// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

List<Students> studentsFromJson(String str) => List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

String studentsToJson(List<Students> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  
class Students {
    Students({
        this.id,
        this.name,
        this.gender,
        this.studentClass,
        this.seat,
        this.club,
        this.persona,
        this.crush,
        this.breastSize,
        this.strength,
        this.hairstyle,
        this.color,
        this.eyes,
        this.eyeType,
        this.stockings,
        this.accessory,
        this.scheduleTime,
        this.scheduleDestination,
        this.scheduleAction,
        this.info,
    });

    String id;
    String name;
    String gender;
    String studentClass;
    String seat;
    String club;
    String persona;
    String crush;
    String breastSize;
    String strength;
    String hairstyle;
    String color;
    String eyes;
    EyeType eyeType;
    String stockings;
    String accessory;
    String scheduleTime;
    String scheduleDestination;
    String scheduleAction;
    String info;

    factory Students.fromJson(Map<String, dynamic> json) => Students(
        id: json["ID"],
        name: json["Name"],
        gender: json["Gender"],
        studentClass: json["Class"],
        seat: json["Seat"],
        club: json["Club"],
        persona: json["Persona"],
        crush: json["Crush"],
        breastSize: json["BreastSize"],
        strength: json["Strength"],
        hairstyle: json["Hairstyle"],
        color: json["Color"],
        eyes: json["Eyes"],
        eyeType: eyeTypeValues.map[json["EyeType"]],
        stockings: json["Stockings"],
        accessory: json["Accessory"],
        scheduleTime: json["ScheduleTime"],
        scheduleDestination: json["ScheduleDestination"],
        scheduleAction: json["ScheduleAction"],
        info: json["Info"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "Gender": gender,
        "Class": studentClass,
        "Seat": seat,
        "Club": club,
        "Persona": persona,
        "Crush": crush,
        "BreastSize": breastSize,
        "Strength": strength,
        "Hairstyle": hairstyle,
        "Color": color,
        "Eyes": eyes,
        "EyeType": eyeTypeValues.reverse[eyeType],
        "Stockings": stockings,
        "Accessory": accessory,
        "ScheduleTime": scheduleTime,
        "ScheduleDestination": scheduleDestination,
        "ScheduleAction": scheduleAction,
        "Info": info,
    };
}

enum EyeType { DEFAULT, GENTLE, COUNCIL1, COUNCIL2, COUNCIL3, COUNCIL4 }

final eyeTypeValues = EnumValues({
    "Council1": EyeType.COUNCIL1,
    "Council2": EyeType.COUNCIL2,
    "Council3": EyeType.COUNCIL3,
    "Council4": EyeType.COUNCIL4,
    "Default": EyeType.DEFAULT,
    "Gentle": EyeType.GENTLE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
