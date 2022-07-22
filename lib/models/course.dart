class Course{
  String id ;
  String userid;
  String courseName;
  String instructorName;
  int noOfWeeks;
  int  noOfLectures;
  int lecturesFinished;
  Map weekdata;
  String dateAdded;
  Map remvlec;
  int noOfReminders;

  Course({ required this.id, required this.userid, required this.courseName, required this.instructorName, required this.noOfWeeks, required this.noOfLectures, required this.weekdata, 
  required this.dateAdded,required this.lecturesFinished,
  required this.remvlec,
  required this.noOfReminders
  });

factory Course.fromMap(Map<String,dynamic> map){
  if(map["remvlec"]==null){
    map["remvlec"]={};
  }
   return Course(
    
      id: map["id"],
      userid:map["userid"],
    courseName: map["courseName"],
    instructorName: map["instructorName"],
    noOfWeeks: map["noOfWeeks"],
    noOfLectures: map["noOfLectures"],
    lecturesFinished: map["lecturesFinished"],
    weekdata: map["weekdata"],
    dateAdded: map["dateAdded"],
    remvlec: map["remvlec"],
    noOfReminders: map["noOfReminders"],
   );
}
 Map<String,dynamic> toMap(){
       return{
        "id":id,
        "userid":userid,
        "courseName":courseName,
        "instructorName":instructorName,
        "noOfWeeks":noOfWeeks,
        "noOfLectures":noOfLectures,
        "lecturesFinished":lecturesFinished,
        "weekdata":weekdata,
         "dateAdded":dateAdded,
         "remvlec":remvlec,
         "noOfReminders":noOfReminders
       };
 }

}