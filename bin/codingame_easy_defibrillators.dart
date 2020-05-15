//https://www.codingame.com/ide/puzzle/defibrillators

import 'dart:io';
import 'dart:math';

void main() {
  String LON = stdin.readLineSync();
  String LAT = stdin.readLineSync();
  double lat = double.parse(LAT.replaceAll(',', '.'));
  double lon = double.parse(LON.replaceAll(',', '.'));

  Map<String, String> defibInfo = {};
  List<double> distance = [];
  Map<double, String> dis = {};
  double pi = 22 / 7;

  List<String> defib = [];
  int N = int.parse(stdin.readLineSync());
  for (int i = 0; i < N; i++) {
    String DEFIB = stdin.readLineSync();

    defib = DEFIB.split(';');

    defibInfo['id'] = defib[0];
    defibInfo['name'] = defib[1];
    defibInfo['add'] = defib[2];
    defibInfo['phone'] = defib[3];
    defibInfo['lon'] = defib[4];
    defibInfo['lat'] = defib[5];

    double defibLat = double.parse(defibInfo['lat'].replaceAll(',', '.'));
    double defibLon = double.parse(defibInfo['lon'].replaceAll(',', '.'));

    double x = ((lon * pi / 180) - (defibLon * pi / 180)) *
        cos(((defibLat * pi / 180) + (lat * pi / 180)) / 2);
    double y = ((lat * pi / 180) - (defibLat * pi / 180));
    double d = sqrt((pow(x, 2) + pow(y, 2)) * 6371);
    distance.add(d);

    dis[d] = defibInfo['name'];
  }

  double nearest = distance.reduce(min);
  print(dis[nearest]);
}
