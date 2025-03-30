import 'package:flutter/material.dart';
import '/models/habits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Habit> goodHabits = [
    Habit(name: 'Exercise', isGoodHabit: true),
    Habit(name: 'Read a book', isGoodHabit: true),
  ];

  final List<Habit> badHabits = [
    Habit(name: 'Smoking', isGoodHabit: false),
    Habit(name: 'Procrastination', isGoodHabit: false),
  ];

  final List<Habit> newHabits = [];
  final List<Habit> brokenHabits = [];

  void toggleHabit(Habit habit) {
    setState(() {
      habit.isChecked = !habit.isChecked;
    });
  }

  void nextDay() {
    setState(() {
      // Process good habits
      for (int i = goodHabits.length - 1; i >= 0; i--) {
        final habit = goodHabits[i];
        if (habit.isChecked) {
          habit.streakCount++;
          if (habit.streakCount == 30) {
            newHabits.add(habit);
            goodHabits.removeAt(i);
          }
        } else {
          habit.streakCount = 0;
        }
        habit.isChecked = false; // Reset check for the next day
      }

      // Process bad habits
      for (int i = badHabits.length - 1; i >= 0; i--) {
        final habit = badHabits[i];
        if (!habit.isChecked) {
          habit.streakCount++;
          if (habit.streakCount == 30) {
            brokenHabits.add(habit);
            badHabits.removeAt(i);
          }
        } else {
          habit.streakCount = 0;
        }
        habit.isChecked = false; // Reset check for the next day
      }
    });
  }

  void addHabit(bool isGoodHabit) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text(isGoodHabit ? 'Add Good Habit' : 'Add Bad Habit'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter habit name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    if (isGoodHabit && goodHabits.length < 4) {
                      goodHabits.add(Habit(name: controller.text, isGoodHabit: true));
                    } else if (!isGoodHabit && badHabits.length < 4) {
                      badHabits.add(Habit(name: controller.text, isGoodHabit: false));
                    }
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            child: HabitList(
              title: 'Good Habits',
              habits: goodHabits,
              onToggle: toggleHabit,
              onAdd: () => addHabit(true),
            ),
          ),
          Expanded(
            child: HabitList(
              title: 'Bad Habits',
              habits: badHabits,
              onToggle: toggleHabit,
              onAdd: () => addHabit(false),
            ),
          ),
          ElevatedButton(
            onPressed: nextDay,
            child: const Text('Next Day'),
          ),
        ],
      ),
    );
  }
}

class HabitList extends StatelessWidget {
  final String title;
  final List<Habit> habits;
  final Function(Habit) onToggle;
  final VoidCallback onAdd;

  const HabitList({
    super.key,
    required this.title,
    required this.habits,
    required this.onToggle,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return ListTile(
                  title: Text(habit.name),
                  subtitle: Text('Streak: ${habit.streakCount} days'),
                  trailing: Checkbox(
                    value: habit.isChecked,
                    onChanged: (value) => onToggle(habit),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}