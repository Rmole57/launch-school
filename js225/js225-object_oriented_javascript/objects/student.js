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

let foo = createStudent('Foo', '1st');

foo.info();
// logs:
// "Foo is a 1st year student"

console.log(foo.listCourses());
// logs:
// []

foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
console.log(foo.listCourses());
// logs:
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]

foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// logs:
// "Math: Fun course; Remember to study for algebra"

foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// logs:
// "Math: Fun course; Remember to study for algebra"
// "Advanced Math: Difficult subject"

foo.updateNote(101, 'Fun course');
foo.viewNotes();
// logs:
// "Math: Fun course"
// "Advanced Math: Difficult subject"


// ALTERNATIVE SOLUTION:

// function createStudent(name, year) {
//   return {
//     name,
//     year,
//     courses: [],
//     info() {
//       console.log(`${this.name} is a ${this.year} year student`);
//     },

//     listCourses() {
//       return this.courses;
//     },

//     addCourse(course) {
//       this.courses.push(course);
//     },

//     addNote(courseCode, note) {
//       const course = this.courses.filter(({code}) => code === courseCode)[0];

//       if (course) {
//         if (course.note) {
//           course.note += `; ${note}`;
//         } else {
//           course.note = note;
//         }
//       }

//     },

//     viewNotes() {
//       this.courses.forEach(course => {
//         if (course.note) {
//           console.log(`${course.name}: ${course.note}`);
//         }
//       });
//     },

//     updateNote(courseCode, note) {
//       const course = this.courses.filter(({code}) => code === courseCode)[0];

//       if (course) {
//         course.note = note;
//       }
//     },
//   };
// }
