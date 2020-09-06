Model Definitions:

  Class Room:
    Class Room has the standard

  User:
    User can be of two types: Student, Teacher.
    User should belongs to class room.
  Teacher:
    Type of User
    Can create reports and update score details of the Students
  Student:
    Type Of User
    Has a scorecard
  Scorecard:
    Has the grade, total information of the subject scores of a student
  Score:
    Has the subject wise scores of a student.

Usage:

  StudentScoreCardFactory: 
    Teacher has to update the student details either through a file or passing the details as an array.
  ClassRoomReport:
    Teacher can request for the students under his class room in a file or print the details.