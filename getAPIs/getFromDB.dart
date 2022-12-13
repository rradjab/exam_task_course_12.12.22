import 'dart:io';

import '../models/course_model.dart';
import '../models/course_type_model.dart';
import '../models/teacher_model.dart';

List<CourseType> getListOfCourseTypeClasses(List<Teacher> teachers) {
  List courseTypes = File('db/course_types.txt').readAsStringSync().split('\n');
  List<CourseType> courseTypeClasses =
      List<CourseType>.filled(courseTypes.length, CourseType(0, 0, "", "", 0));
  for (int i = 0; i < courseTypes.length; i++) {
    courseTypeClasses[i] = new CourseType(
        int.parse(courseTypes[i].split(", ")[0]),
        int.parse(courseTypes[i].split(", ")[1]),
        courseTypes[i].split(", ")[2],
        courseTypes[i].split(", ")[3],
        double.parse(courseTypes[i].split(", ")[4]));
    for (Teacher teacher in teachers) {
      if (teacher.teachField
          .split(".")
          .contains(courseTypeClasses[i].id.toString())) {
        courseTypeClasses[i].courseTeachers.add(teacher);
      }
    }
  }
  return courseTypeClasses;
}

List<Course> getListOfCourses() {
  List courses = File('db/courses.txt').readAsStringSync().split('\n');
  List<Course> courseClasses =
      List<Course>.filled(courses.length, Course(0, ""));
  for (int i = 0; i < courses.length; i++) {
    courseClasses[i] = new Course(
        int.parse(courses[i].split(", ")[0]), courses[i].split(", ")[1]);
  }
  return courseClasses;
}

List<Teacher> getListOfTeachers() {
  List teachers = File('db/teachers.txt').readAsStringSync().split('\n');
  List<Teacher> teacherClasses =
      List<Teacher>.filled(teachers.length, Teacher("", "", "", 0));
  for (int i = 0; i < teachers.length; i++) {
    teacherClasses[i] = new Teacher(
        teachers[i].split(", ")[0],
        teachers[i].split(", ")[1],
        teachers[i].split(", ")[2],
        int.parse(teachers[i].split(", ")[3]));
  }
  return teacherClasses;
}
