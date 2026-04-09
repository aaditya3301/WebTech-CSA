class ActivityModel {
  const ActivityModel({
    required this.name,
    required this.durationMinutes,
    this.completed = false,
  });

  final String name;
  final int durationMinutes;
  final bool completed;

  ActivityModel copyWith({
    String? name,
    int? durationMinutes,
    bool? completed,
  }) {
    return ActivityModel(
      name: name ?? this.name,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      completed: completed ?? this.completed,
    );
  }
}
