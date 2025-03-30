class Habit {
  final String name;
  final bool isGoodHabit;
  int streakCount;
  bool isChecked;

  Habit({
    required this.name,
    required this.isGoodHabit,
    this.streakCount = 0,
    this.isChecked = false,
  });
}