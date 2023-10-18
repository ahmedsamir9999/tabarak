import 'package:tabarak/App/domain/entities/azan.dart';

class AzanModel extends Azan {
  const AzanModel(
      {required super.fajr,
      required super.sunrise,
      required super.dhuhr,
      required super.asr,
      required super.maghrib,
      required super.isha,
      required super.dayAr,
      required super.dayEn,
      required super.date});

  factory AzanModel.fromJson(Map<String, dynamic> json) => AzanModel(
      fajr: json['data']['timings']['Fajr'],
      sunrise: json['data']['timings']['Sunrise'],
      dhuhr: json['data']['timings']['Dhuhr'],
      asr: json['data']['timings']['Asr'],
      maghrib: json['data']['timings']['Maghrib'],
      isha: json['data']['timings']['Isha'],
      dayAr: json['data']['date']['hijri']['weekday']['en'],
      dayEn: json['data']['date']['hijri']['weekday']['ar'],
      date: json['data']['date']['readable']);
}
