"use strict";

function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],
    info() {
      console.log(`${this.name} is a ${this.year} year student`);
    },

    addCourse(course) {
      this.courses.push(course);
    },

    listCourses() {
      return this.courses;
    },

    getCourse(courseCode) {
      return this.courses.find(course => course.code === courseCode);
    },

    addNote(courseCode, note) {
      let course = this.getCourse(courseCode);

      if (course) {
        if (course.note) {
          course.note += `; ${note}`;
        } else {
          course.note = note;
        }
      }
    },

    updateNote(courseCode, note) {
      let course = this.getCourse(courseCode);
      if (course) course.note = note;
    },

    viewNotes() {
      this.courses.filter(course => course.note).forEach(({name, note}) => {
        console.log(`${name}: ${note}`);
      });
    },
  };
}

let school = {
  students: [],
  addStudent(name, year) {
    if (/1st|2nd|3rd|4th|5th/.test(year)) {
      let student = createStudent(name, year);
      this.students.push(student);
      return student;
    } else {
      console.log('Invalid Year');
    }
  },

  enrollStudent(student, courseName, courseCode) {
    student.addCourse({name: courseName, code: courseCode});
  },

  addGrade(student, courseName, grade) {
    let course = student.listCourses().find(({name}) => name === courseName);
    if (course) course.grade = grade;
  },

  getReportCard(student) {
    student.listCourses().forEach(({name, grade}) => {
      console.log(`${name}: ${grade || 'In progress'}`);
    });
  },

  courseReport(courseName) {
    let studentGrades = {};

    this.students.forEach(student => {
      let course = student.listCourses().find(({name}) => name === courseName);
      if (course && course.grade !== undefined) {
        studentGrades[student.name] = course.grade;
      }
    });

    if (Object.keys(studentGrades).length > 0) {
      let grades = Object.values(studentGrades);
      let average = grades.reduce((sum, grade) => sum + grade, 0) / grades.length;

      console.log(`=${courseName}=`);

      for (let student in studentGrades) {
        console.log(`${student}: ${String(studentGrades[student])}`);
      }

      console.log('---');
      console.log(`Course Average: ${String(average)}`);
    }
  },
};

// addStudent test cases:
let foo = school.addStudent('foo', '3rd');
console.log(foo);
// logs:
// {
//   name: 'foo',
//   grade: '3rd',
//   course: [],
//   ...methods omitted...
// }

let bar = school.addStudent('bar', '1st');
console.log(bar);
// logs:
// {
//   name: 'bar',
//   grade: '1st',
//   course: [],
//   ...methods omitted...
// }

let qux = school.addStudent('qux', '2nd');
console.log(qux);
// logs:
// {
//   name: 'qux',
//   grade: '2nd',
//   course: [],
//   ...methods omitted...
// }

// invalid student year test case:
let bob = school.addStudent('bob', '9th');
// logs:
// "Invalid Year"

console.log(school.students);
// logs:
// [
//   {
//     name: 'foo',
//     grade: '3rd',
//     course: [],
//     ...methods omitted...
//   },
//   {
//     name: 'bar',
//     grade: '1st',
//     course: [],
//     ...methods omitted...
//   },
//   {
//     name: 'qux',
//     grade: '2nd',
//     course: [],
//     ...methods omitted...
//   }
// ]

// enrollStudent test cases:
school.enrollStudent(foo, 'Math', 101);
school.enrollStudent(foo, 'Advanced Math', 102);
school.enrollStudent(foo, 'Physics', 202);

school.enrollStudent(bar, 'Math', 101);

school.enrollStudent(qux, 'Math', 101 );
school.enrollStudent(qux, 'Advanced Math', 102 );

school.students.forEach(({name, courses}) => {
  console.log(`Name: ${name}`);
  console.log('Courses:');
  courses.forEach(course => console.log(course));
  console.log();
});
// logs:
// Name: foo
// Courses:
// { name: 'Math', code: 101 }
// { name: 'Advanced Math', code: 102 }
// { name: 'Physics', code: 202 }

// Name: bar
// Courses:
// { name: 'Math', code: 101 }

// Name: qux
// Courses:
// { name: 'Math', code: 101 }
// { name: 'Advanced Math', code: 102 }

// addGrade test cases:
school.addGrade(foo, 'Math', 95);
school.addGrade(foo, 'Advanced Math', 90);

school.addGrade(bar, 'Math', 91);

school.addGrade(qux, 'Math', 93);
school.addGrade(qux, 'Advanced Math', 90);

school.students.forEach(({name, courses}) => {
  console.log(`Name: ${name}`);
  console.log('Courses:');
  courses.forEach(course => console.log(course));
  console.log();
});
// logs:
// Name: foo
// Courses:
// { name: 'Math', code: 101, grade: 95 }
// { name: 'Advanced Math', code: 102, grade: 90 }
// { name: 'Physics', code: 202 }

// Name: bar
// Courses:
// { name: 'Math', code: 101, grade: 91 }

// Name: qux
// Courses:
// { name: 'Math', code: 101, grade: 93 }
// { name: 'Advanced Math', code: 102, grade: 90 }

// getReportCard test cases:
school.getReportCard(foo);
// logs:
// Math: 95
// Advanced Math: 90
// Physics: In progress
console.log();

school.getReportCard(bar);
// logs:
// Math: 91
console.log();

school.getReportCard(qux);
// logs:
// Math: 93
// Advanced Math: 90
console.log();

// courseReport test cases:
school.courseReport('Math');
// logs:
// =Math Grades=
// foo: 95
// bar: 91
// qux: 93
// ---
// Course Average: 93
console.log();

school.courseReport('Advanced Math');
// logs:
// =Advanced Math Grades=
// foo: 90
// qux: 90
// ---
// Course Average: 90
console.log();

school.courseReport('Physics');
// returns:
// undefined


// ALTERNATIVE SOLUTION:

// const school = {
//   students: [],
//   addStudent(name, year) {
//     if (['1st', '2nd', '3rd', '4th', '5th'].includes(year)) {
//       const student = createStudent(name, year);
//       this.students.push(student);
//       return student;
//     } else {
//       console.log('Invalid Year');
//     }
//   },

//   enrollStudent(student, courseName, courseCode) {
//     student.addCourse({name: courseName, code: courseCode})
//   },

//   addGrade(student, courseName, grade) {
//     const course = student.listCourses().filter(({name}) => name === courseName)[0];

//     if (course) {
//       course.grade = grade;
//     }
//   },

//   getReportCard(student) {
//     student.listCourses().forEach(({grade, name}) => {
//       if (grade) {
//         console.log(`${name}: ${String(grade)}`);
//       } else {
//         console.log(`${name}: In progress`);
//       }
//     });
//   },

//   courseReport(courseName) {
//     function getCourse(student, courseName) {
//       return student.listCourses().filter(({name}) => name === courseName)[0];
//     }

//     const courseStudents = this.students.map(student => {
//       const course = getCourse(student, courseName) || { grade: undefined };
//       return { name: student.name, grade: course.grade };
//     }).filter(({grade}) => grade);

//     if (courseStudents.length > 0) {
//       console.log(`=${courseName} Grades=`);

//       const average = courseStudents.reduce((total, {name, grade}) => {
//         console.log(`${name}: ${String(grade)}`);
//         return total + grade;
//       }, 0) / courseStudents.length;

//       console.log('---');
//       console.log(`Course Average: ${String(average)}`);
//     }
//   },
// };
