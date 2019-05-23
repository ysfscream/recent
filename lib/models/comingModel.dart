class ComingModel {
  final int count;
  final int start;
  final int total;
  final List subjects;
  final String title;

  const ComingModel({
    this.count,
    this.start,
    this.total,
    this.subjects,
    this.title,
  });

  ComingModel.fromJSON(Map<String, dynamic> json):
    count = json['count'],
    start = json['start'],
    total = json['total'],
    subjects = json['subjects'],
    title = json['title'];
}