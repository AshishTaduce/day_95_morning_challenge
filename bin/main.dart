// Challenge 1
// Longest Streak
// Create a function that takes an array of objects with date property and return the
// "longest streak" (i.e. number of consecutive days in a row).
//
// Example
// longestStreak([
//   {
//   "date": "2019-09-18"
//   },
//   {
//   "date": "2019-09-19"
//   },
//   {
//   "date": "2019-09-20"
//   },
//   {
//   "date": "2019-09-26"
//   },
//   {
//   "date": "2019-09-27"
//   },
//   {
//   "date": "2019-09-30"
//   }
// ]) ➞ 3


// Challenge 2
// This problem was asked by Microsoft.
//
// Given a dictionary as a list of words and a string made up of those words (no spaces),
// return the original sentence in a list. If there is more than one possible
// reconstruction, return any of them. If there is no possible reconstruction,
// then return null.
//
// For example, given the set of words 'quick', 'brown', 'the', 'fox', and the
// string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
//
// Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the
// string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or
// ['bedbath', 'and', 'beyond'].

import 'dart:math';

void main() {
//  print(longestStreak([ {
//          "date": "2019-09-19"
//        },
//        {
//          "date": "2019-09-18"
//        },
//        {
//          "date": "2019-09-20"
//        },
//        {
//          "date": "2019-09-26"
//        },
//        {
//          "date": "2019-09-27"
//        },
//        {
//          "date": "2019-09-30"
//        }
//      ]));
//
//  print(longestStreak([{
//          "date": "2019-09-30"
//        },
//        {
//        "date": "2019-10-01"
//        },
//        {
//          "date": "2019-10-02"
//        },
//      ]));
  print(reconstructString(['quick', 'brown', 'the', 'fox',], "thequickbrownfox"));
  print(reconstructString(['bed', 'bath', 'bedbath', 'and', 'beyond',], "bedbathandbeyond"));
  print(reconstructString(['bedbat', 'bedbath', 'and', 'beyond',], "bedbathandbeyond"));
  print(reconstructString(['bedbat', 'bed', 'bath', 'bedbath', 'and', 'beyond',], "bedbathandbeyondbedbathandbeyond"));
  print(reconstructString(["that", 'is', 'quick', 'brown', 'the', 'fox',], "abcn"));

  print("test 1");
  print(reconstructString(['quick', 'brown', 'the', 'fox'], "thequickbrownfox"));
  print("------------");
  print("test 2");
  print(reconstructString(
      ['bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
  print("test 3");
  print(reconstructString(['bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print("------------");
  print("test 4");
  print(reconstructString(['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print("------------");
  print("test 5");
  print(reconstructString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'],
      'thatfoxisthequickbrownfox'));
  print("------------");
  print("test 6");
  print(reconstructString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], 'fox'));
  print("test 7");
  print(reconstructString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], ''));
  print("------------");
  print("test 8");
  print(reconstructString(
      ['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
  print("random tests or test 9");
  print(reconstructString(
      ['bedb','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
}

int longestStreak(List<Map<String, String>> dates){
  List<DateTime> listOfDates= [];
  for(Map date in dates){
    listOfDates.insert(0, DateTime.parse(date['date']));
  }
  listOfDates.sort((a, b) => a.compareTo(b));
  int count = 0;
  List<int> listOfStreaks= [];
  for(int i = 0; i < listOfDates.length - 1; i++){
    if(listOfDates[i].add(Duration(days: 1)) != listOfDates[i + 1]){
      if(count != 0) print('Streak lost. 😔');
      listOfStreaks.add(count);
      count = 0;
    }
    else{
      count++;
      print('Streak! 🔥 $count');
      if(i == listOfDates.length - 2)
        listOfStreaks.add(count);
    }
  }

  print(listOfStreaks);
  return listOfStreaks.isNotEmpty ? (listOfStreaks.reduce(max)) : 0;
}

List<String> reconstructString(List<String> dictionary, String string){
  if(string.isEmpty) return [];
  for(int i = 1; i < string.length; i ++){
    if(dictionary.contains(string.substring(0, i))){
      String wordsLeft = string.substring(i);
      List temp = [[string.substring(0, i),], wordsLeft];
      int j = 1;
      while(wordsLeft.isNotEmpty && j < wordsLeft.length + 1){
        if(dictionary.contains(wordsLeft.substring(0,j))){
          temp[0].add(wordsLeft.substring(0,j));
          wordsLeft = wordsLeft.substring(j);
          j = 1;
        }
        else{j++;}
      }
      if(wordsLeft.isEmpty)
      return (temp[0]);
    }
  }
  return null;
}

