class StageInfo {

  final String? title;
  final String? subTitle;
  final String? desc;
  final String? startDate;
  final String? endDate;
  final String? isParent;

  StageInfo(
      {this.title,
        this.subTitle,
        this.desc,
        this.startDate,
        this.endDate,
        this.isParent});


  factory StageInfo.fromJson(Map<String, dynamic> json) {
    return StageInfo(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      desc: json['desc'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      isParent: json['isParent'] as String?,
    );
  }
}