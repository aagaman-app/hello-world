import 'dart:io';
import 'dart:math';

int x = 0;
int y = 0;
int lcount = 0;
int rcount = 0;
int enteredIF = 0;
int didnotIF = 0;
void main() {
  // int N = int.parse(stdin.readLineSync());
  // // stderr.writeln(N);
  // List<int> listPi = [];

  // for (int i = 0; i < N; i++) {
  //   int Pi = int.parse(stdin.readLineSync());
  //   listPi.add(Pi);
  // }

  List<int> testList = [6, 5, 3, 1, 8, 7, 2, 4];
  // stderr.writeln(testList);
  // mergeSort(listPi, listPi.indexOf(listPi.first), listPi.indexOf(listPi.last));

  stderr.writeln(
      '---INTIAL STEP---\nCalling MergeSort for new List: $testList\n');
  mergeSort(testList, testList.indexOf(testList.first),
      testList.indexOf(testList.last));
  // stderr.writeln(listPi);
  stderr.writeln(testList);
}

void merge(List list, int leftIndex, int middleIndex, int rightIndex) {
  stderr.writeln(
      '\n---MERGE START---\nMERGE($leftIndex, $middleIndex, $rightIndex)');
  int leftSize = middleIndex - leftIndex + 1;
  int rightSize = rightIndex - middleIndex;

  List leftList = List(leftSize);
  List rightList = List(rightSize);

  for (int i = 0; i < leftSize; i++) leftList[i] = list[leftIndex + i];
  for (int j = 0; j < rightSize; j++) rightList[j] = list[middleIndex + j + 1];

  stderr.writeln('Left List: $leftList\nRight List: $rightList');

  int i = 0, j = 0;
  int k = leftIndex;

  while (i < leftSize && j < rightSize) {
    if (leftList[i] <= rightList[j]) {
      list[k] = leftList[i];
      stderr.writeln('Enter in List at index($k): ${leftList[i]}');
      i++;
    } else {
      list[k] = rightList[j];
      stderr.writeln('Enter in List at index($k): ${rightList[j]}');
      j++;
    }
    k++;
  }

  while (i < leftSize) {
    list[k] = leftList[i];
    stderr.writeln('Enter in List at index($k): ${leftList[i]}');
    i++;
    k++;
  }

  while (j < rightSize) {
    list[k] = rightList[j];
    stderr.writeln('Enter in List at index($k): ${rightList[j]}');
    j++;
    k++;
  }
  stderr.writeln(list);
  stderr.writeln('---MERGE END---\n');
}

void mergeSort(List list, int leftIndex, int rightIndex) {
  stderr.writeln(
      '\n---MergeSort---\nList: $list \nms($leftIndex,$rightIndex) -->');
  if (leftIndex < rightIndex) {
    int middleIndex = (rightIndex + leftIndex) ~/ 2;
    stderr.writeln('Calling ms($leftIndex,$middleIndex)');
    mergeSort(list, leftIndex, middleIndex);

    stderr.writeln('ms($leftIndex,$middleIndex) --> DONE!');

    stderr.writeln('Calling ms(${middleIndex + 1},$rightIndex)');
    mergeSort(list, middleIndex + 1, rightIndex);
    stderr.writeln('ms(${middleIndex + 1},$rightIndex) --> DONE!');

    y++;
    stderr.writeln('Calling MERGE($leftIndex,$middleIndex,$rightIndex)');
    merge(list, leftIndex, middleIndex, rightIndex);
  }
}
