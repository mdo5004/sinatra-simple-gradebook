Teacher.create(first_name: "Michael", last_name: "O'Connell",email: "michaeldavidoconnell@gmail.com",password:"password")
Teacher.create(first_name: "Rachel", last_name: "O'Connell", email:"rachel.v.oconnell@gmail.com", password:"password")
Klass.create(name:"Math 101",description:"Math for beginners",teacher_id:1)
Klass.create(name:"Math 102", description: "Intermediate math",teacher_id:1)
Klass.create(name:"Medicine 101", description:"Intro to medicine", teacher_id:2)

Student.create(name:"John", grade: 12, parent_guardian1:"Jim",parent_guardian2:"Paula",address:"Upper West Side")
Student.create(name:"Jane", grade: 12, parent_guardian1:"Sam",parent_guardian2:"Janet",address:"Upper East Side")

StudentKlass.create(student_id:1, klass_id: 2)
StudentKlass.create(student_id:2, klass_id: 1)
StudentKlass.create(student_id:2, klass_id: 3)
