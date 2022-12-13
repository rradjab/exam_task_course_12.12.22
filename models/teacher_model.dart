import 'course_type_model.dart';

class Teacher {
  String id;
  String teacherName;
  int teacherAge;
  String teachField;
  Teacher(this.id, this.teachField, this.teacherName, this.teacherAge);

  void showTeacherInfo(List<CourseType> courseTypeClasses) {
    print("Muellimin adi $teacherName");
    print("Muellimin yashu $teacherAge");
    print("Kechirdiyi kurslar:");
    for (CourseType courseTypes in courseTypeClasses) {
      if (teachField.split(".").contains(courseTypes.id.toString())) {
        print("-" * 25);
        print("Kursun adi: ${courseTypes.typeName} kurslari");
        if (courseTypes.period - courseTypes.period.truncate() == 0) {
          print("Kursun muddeti: ${courseTypes.period.truncate()} ay");
        } else {
          print("Kursun muddeti: ${courseTypes.period.truncate()} ay yarim");
        }
        print("Kursun ayligi: ${courseTypes.price} AZN");
      }
    }
  }
}
