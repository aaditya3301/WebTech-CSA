import 'package:flutter/material.dart';

import '../models/activity_model.dart';
import '../theme/app_theme.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _activityController = TextEditingController();
  final _durationController = TextEditingController();

  final List<ActivityModel> _activities = [
    const ActivityModel(name: 'Running', durationMinutes: 30),
    const ActivityModel(name: 'Walking', durationMinutes: 40),
    const ActivityModel(name: 'Cycling', durationMinutes: 25),
  ];

  @override
  void dispose() {
    _activityController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _addActivity() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _activityController.text.trim();
    final duration = int.parse(_durationController.text.trim());

    setState(() {
      _activities.add(ActivityModel(name: name, durationMinutes: duration));
      _activityController.clear();
      _durationController.clear();
    });
  }

  void _toggleCompleted(int index) {
    setState(() {
      _activities[index] = _activities[index].copyWith(
        completed: !_activities[index].completed,
      );
    });
  }

  int get _completedCount =>
      _activities.where((activity) => activity.completed).length;

  int get _totalMinutes => _activities.fold<int>(
        0,
        (total, activity) => total + activity.durationMinutes,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  title: 'Done',
                  value: '$_completedCount/${_activities.length}',
                  icon: Icons.task_alt,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricCard(
                  title: 'Total Minutes',
                  value: '$_totalMinutes',
                  icon: Icons.timer_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Activity',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _activityController,
                      decoration: const InputDecoration(
                        labelText: 'Activity Name',
                        prefixIcon: Icon(Icons.sports_gymnastics_outlined),
                      ),
                      validator: (value) {
                        if ((value ?? '').trim().isEmpty) {
                          return 'Please enter an activity name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _durationController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Duration (minutes)',
                        prefixIcon: Icon(Icons.timer_outlined),
                      ),
                      validator: (value) {
                        final duration = int.tryParse((value ?? '').trim());
                        if (duration == null || duration <= 0) {
                          return 'Enter a valid duration';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _addActivity,
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text('Add Activity'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];
                return GestureDetector(
                  onTap: () => _toggleCompleted(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: activity.completed
                            ? const [Color(0xFFB9EFD3), Color(0xFFDFF8EA)]
                            : const [Color(0xFFFFFFFF), Color(0xFFF8FEFD)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: activity.completed
                            ? AppColors.success
                            : const Color(0xFFDCE8E8),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: activity.completed
                            ? AppColors.success
                            : AppColors.primary,
                        child: Icon(
                          activity.completed
                              ? Icons.check
                              : Icons.directions_run_outlined,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(activity.name),
                      subtitle: Text('${activity.durationMinutes} minutes'),
                      trailing: activity.completed
                          ? const Text(
                              'Done',
                              style: TextStyle(
                                color: AppColors.success,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const Icon(
                              Icons.touch_app_outlined,
                              color: AppColors.primary,
                            ),
                    ),
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

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0x1F0B6E6E),
              child: Icon(icon, color: AppColors.primary, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(title, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
