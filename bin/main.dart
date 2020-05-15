import 'dart:io';
import 'dart:math';

void main() {
  String LON = stdin.readLineSync();
  String LAT = stdin.readLineSync();
  double lat = double.parse(LAT.replaceAll(',', '.'));
  double lon = double.parse(LON.replaceAll(',', '.'));

  // stderr.writeln('Lon: $lon, Lat: $lat');
  Map<String, String> defibInfo = {};
  List<double> distance = [];
  Map<double, String> dis = {};
  double pi = 22 / 7;

  List<String> defib = [];
  int N = int.parse(stdin.readLineSync());
  for (int i = 0; i < N; i++) {
    String DEFIB = stdin.readLineSync();
    // stderr.writeln(DEFIB);
    defib = DEFIB.split(';');
    // stderr.writeln(defib);
    defibInfo['id'] = defib[0];
    defibInfo['name'] = defib[1];
    defibInfo['add'] = defib[2];
    defibInfo['phone'] = defib[3];
    defibInfo['lon'] = defib[4];
    defibInfo['lat'] = defib[5];
    // stderr.writeln(defibInfo);

    double defibLat = double.parse(defibInfo['lat'].replaceAll(',', '.'));
    double defibLon = double.parse(defibInfo['lon'].replaceAll(',', '.'));

    // stderr.writeln('debifLAT: $defibLat, debifLon: $defibLon');

    double x = ((lon * pi / 180) - (defibLon * pi / 180)) *
        cos(((defibLat * pi / 180) + (lat * pi / 180)) / 2);
    double y = ((lat * pi / 180) - (defibLat * pi / 180));
    double d = sqrt((pow(x, 2) + pow(y, 2)) * 6371);
    distance.add(d);
    // stderr.writeln(defibInfo['name']);
    dis[d] = defibInfo['name'];
  }
  // stderr.writeln(dis);
  double nearest = distance.reduce(min);
  // stderr.writeln(nearest);
  // stderr.writeln(dis[nearest]);
  print(dis[nearest]);
}
