class ApiConstance
{
  static const String baseUrl = 'http://api.aladhan.com/v1' ;

  static const String azanTimingByCity = '$baseUrl/timingsByCity' ;


 static String quranUrl(String numOfSurah )
  {
    return 'https://server8.mp3quran.net/afs/$numOfSurah.mp3';
  }

}