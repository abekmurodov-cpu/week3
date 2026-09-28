enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

void main() {
  Day today = Day.Monday;

  switch (today) {
    case Day.Monday:
      print('Today is Monday');
      break;
    case Day.Tuesday:
      print('Today is Tuesday');
      break;
    case Day.Wednesday:
      print('Today is Wednesday');
      break;
    case Day.Thursday:
      print('Today is Thursday');
      break;
    case Day.Friday:
      print('Today is Friday');
      break;
    case Day.Saturday:
      print('Today is Saturday');
      break;
    case Day.Sunday:
      print('Today is Sunday');
      break;
  }
}