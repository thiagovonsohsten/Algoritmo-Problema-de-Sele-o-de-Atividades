class Activity {
  int start;
  int finish;

  Activity(this.start, this.finish);
}

List<Activity> activitySelection(List<Activity> activities) {
  
  activities.sort((a, b) => a.finish.compareTo(b.finish));

  List<Activity> selectedActivities = [];
  selectedActivities.add(activities[0]); 

  int lastFinishTime = activities[0].finish;

  for (int i = 1; i < activities.length; i++) {
    if (activities[i].start >= lastFinishTime) {
      
      selectedActivities.add(activities[i]);
      lastFinishTime = activities[i].finish;
    }
  }

  return selectedActivities;
}

void main() {
  List<Activity> activities = [
    Activity(1, 4),
    Activity(3, 5),
    Activity(0, 6),
    Activity(5, 7),
    Activity(3, 9),
    Activity(5, 9),
    Activity(6, 10),
    Activity(8, 11),
    Activity(8, 12),
    Activity(2, 14),
    Activity(12, 16),
  ];

  List<Activity> selectedActivities = activitySelection(activities);
  print("Atividades selecionadas (início, término):");
  for (Activity activity in selectedActivities) {
    print("(${activity.start}, ${activity.finish})");
  }
}
