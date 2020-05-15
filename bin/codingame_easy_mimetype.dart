//https://www.codingame.com/training/easy/mime-type

import 'dart:io';

void main() {
  List inputs;
  Map<String, String> mimeTypes = {};
  Map<String, String> lowermimeTypes = {};

  int N = int.parse(stdin
      .readLineSync()); // Number of elements which make up the association table.
  int Q =
      int.parse(stdin.readLineSync()); // Number Q of file names to be analyzed.
  for (int i = 0; i < N; i++) {
    inputs = stdin.readLineSync().split(' ');
    String EXT = inputs[0]; // file extension
    String MT = inputs[1]; // MIME type.
    mimeTypes[EXT] = MT;
    lowermimeTypes[EXT.toLowerCase()] = MT;
  }

  List<String> lowerCaseFileSplit = [];
  List<String> fileSplit = [];

  stderr.writeln(mimeTypes);
  stderr.writeln(lowermimeTypes);

  for (int i = 0; i < Q; i++) {
    String FNAME = stdin.readLineSync(); // One file name per line.

    fileSplit = FNAME.split('.');
    for (String name in fileSplit) {
      lowerCaseFileSplit.add(name.toLowerCase());
    }
    String mt;
    if (FNAME.contains('.')) {
      if (lowermimeTypes.containsKey(lowerCaseFileSplit.last)) {
        if (mimeTypes.containsKey(fileSplit.last)) {
          mt = mimeTypes[fileSplit.last];
        } else {
          mt = lowermimeTypes[lowerCaseFileSplit.last];
        }
      } else {
        mt = 'UNKNOWN';
      }
    } else {
      mt = 'UNKNOWN';
    }

    print(mt);
  }
}
