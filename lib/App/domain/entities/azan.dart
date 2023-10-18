import 'package:equatable/equatable.dart';

class Azan extends Equatable {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String dayAr;
  final String dayEn;
  final String date;

  const Azan({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.dayAr,
    required this.dayEn,
    required this.date,
  });

  @override
  List<Object?> get props =>
      [fajr, sunrise, dhuhr, asr, maghrib, isha, dayAr, dayEn, date];
}
