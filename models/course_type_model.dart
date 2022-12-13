import 'teacher_model.dart';

class CourseType {
  int id;
  int parentId;
  String typeName;
  String price;
  num period;
  List<Teacher> courseTeachers = [];
  CourseType(this.id, this.parentId, this.typeName, this.price, this.period);

  void showInfo() {
    print("$typeName adli kurs haqqinda melumat");
    if (period - period.truncate() == 0) {
      print("Kursun muddeti: ${period.truncate()} ay");
    } else {
      print("Kursun muddeti: ${period.truncate()} ay yarim");
    }
    print("Kursun ayligi: ${price} AZN");
    print("Kurs uzre muellimler:");
    for (Teacher teacher in courseTeachers) {
      print("${teacher.teacherName}, ${teacher.teacherAge} yas");
    }
  }
}
