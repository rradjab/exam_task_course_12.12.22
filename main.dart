import 'dart:io';

import 'getAPIs/getFromDB.dart';
import 'models/course_model.dart';
import 'models/course_type_model.dart';
import 'models/teacher_model.dart';

const courseName = "Vdemy";

void main() {
  print("-" * 70 + "\n$courseName kursuna xosh gelmisiniz.\n" + "-" * 70);
  List<Teacher> teacherClasses = getListOfTeachers();
  List<Course> courseClasses = getListOfCourses();
  List<CourseType> courseTypeClasses =
      getListOfCourseTypeClasses(teacherClasses);
  print("1) Kurslarin siyahisi ile tanish ol");
  print("2) Muellimlerin siyahisi ile tanish ol");
  stdout.write("Sechiminiz: ");
  String choise = stdin.readLineSync().toString();
  switch (choise) {
    case "1":
      print("Movcud kurslar ashagidakilardir:");
      for (int i = 0; i < courseClasses.length; i++) {
        //bug
        print("${i + 1}) ${courseClasses[i].courseName.trim()}  kurslari");
      }
      stdout.write("Sechiminiz: ");
      int selected = int.parse(stdin.readLineSync().toString());
      if (selected > 0 && selected < courseClasses.length) {
        print("${courseClasses[selected - 1].courseName.trim()} - etrafli:");
        for (int i = 0; i < courseTypeClasses.length; i++) {
          if (courseTypeClasses[i].parentId == selected) {
            print(
                "${courseTypeClasses[i].id} ${courseTypeClasses[i].typeName}");
          }
        }
        stdout.write("Kursu sechin: ");
        selected = int.parse(stdin.readLineSync().toString()) - 1;

        courseTypeClasses[selected].showInfo();
      } else {
        print("Yanlish sechim");
      }
      break;
    case "2":
      print("Muellimlerin siyahisi:");
      for (int i = 0; i < teacherClasses.length; i++) {
        print("${i + 1}) ${teacherClasses[i].teacherName}");
      }
      stdout.write("Sechiminiz: ");
      int selected = int.parse(stdin.readLineSync().toString());
      if (selected > 0 && selected <= teacherClasses.length) {
        teacherClasses[selected - 1].showTeacherInfo(courseTypeClasses);
      }
      break;
    default:
      print("Sechiminiz duzgun deyil");
      break;
  }
}
