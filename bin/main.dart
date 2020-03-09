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
  print(reconstructString(['bedbat', 'bed', 'bath', 'bedbath', 'and', 'beyond',], "bedbathandbeyond"));
  print(reconstructString(["that", 'is', 'quick', 'brown', 'the', 'fox',], "thatisthequickbrownfox"));
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

String reconstructString(List<String> dictionary, String string){
  String result = "";
  for(int i = 0; i < string.length + 1; i ++){
//    print('String is : $string and result is $result and index is $i');
    if(dictionary.contains(string.substring(0, i))){
      result = result + " " +string.substring(0, i);
      string = string.substring(i);
      i = -1;
    }
//      String temp = reconstructString(dictionary, string.substring(i + 1));
//      if(temp != null)result = result + temp;
  }
  return string.isEmpty ? result : null;
}