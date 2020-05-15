//https://www.codingame.com/training/easy/chuck-norris

import 'dart:io';
import 'dart:math';

void main() {
  String MESSAGE = stdin.readLineSync();

  List<int> codeunits = MESSAGE.codeUnits;
  // stderr.writeln(codeunits);
  // stderr.writeln('$MESSAGE : $codeunits');
  List<String> binary = [];

  for (int codeunit in codeunits) {
    int q = codeunit;
    int remainder;
    List<int> bitNumbers = [];
    while (q > 0) {
      remainder = q % 2;
      q = q ~/ 2;
      bitNumbers.add(remainder);
      // stderr.writeln('q: ${q}, remainder: $remainder');
    }
    if (bitNumbers.length < 7) {
      for (int i = 0; i < 7 - bitNumbers.length; i++) {
        bitNumbers.add(0);
      }
      binary.add(bitNumbers.reversed.join());
    } else {
      binary.add(bitNumbers.reversed.join());
    }
  }

  String bin = binary.join();
  // stderr.writeln(bin);

  String answer;
  // stderr.writeln(bin.length);
  String id;
  String count;
  for (int i = 0; i < bin.length; i++) {
    if (i == 0) {
      id = bin[i] == '0' ? '00' : '0';
      count = '0';
    } else {
      if (bin[i] == bin[i - 1]) {
        id = bin[i] == '0' ? '00' : '0';
        count = '${count}0';
        answer = i == bin.length - 1 ? '$answer $id $count' : answer;
      } else {
        answer = answer != null ? '$answer $id $count' : '$id $count';
        id = bin[i] == '0' ? '00' : '0';
        count = '0';
        answer = i == bin.length - 1 ? '$answer $id $count' : answer;
      }
    }
    // stderr.writeln('Step:$i: $answer');
    // stderr.writeln('${bin[i]}: $id : $count');

    // stderr.writeln('$id-$count = $answer');
  }

  print(answer);
}
