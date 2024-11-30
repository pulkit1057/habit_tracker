import 'package:habit_tracker/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((date) =>
      date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}

Map<DateTime, int> prepHeapmapDataset(List<Habit> habits){
  Map<DateTime, int> mpp = {};

  for(var habit in habits)
  {
    for(var date in habit.completedDays)
    {
      final normalizedDate = DateTime(date.year,date.month,date.day);

      if(mpp.containsKey(normalizedDate))
      {
        mpp[normalizedDate] = mpp[normalizedDate]! + 1;
      }
      else
      {
        mpp[normalizedDate] = 1;
      }
    }
  }
  return mpp;
}
