
michael = Teacher.create!(first_name: "Michael", last_name: "O'Connell",email: "michaeldavidoconnell@gmail.com",password:"password")
rachel = Teacher.create!(first_name: "Rachel", last_name: "O'Connell", email:"rachel.v.oconnell@gmail.com", password:"password")

math101 = michael.klasses.create!(name:"Math 101",description:"Math for beginners",teacher_id:1)
math102 = michael.klasses.create!(name:"Math 102", description: "Intermediate math",teacher_id:1)
med101 = rachel.klasses.create!(name:"Medicine 101", description:"Intro to medicine", teacher_id:2)

john = Student.create(name:"John", grade: 12, parent_guardian1:"Jim",parent_guardian2:"Paula",address:"Upper West Side")
jane = Student.create(name:"Jane", grade: 12, parent_guardian1:"Sam",parent_guardian2:"Janet",address:"Upper East Side")
jim = Student.create(name:"Jim", grade: 12, parent_guardian1:"James",parent_guardian2:"Pat",address:"Upper West Side")
joanna = Student.create(name:"Joanna", grade: 12, parent_guardian1:"Timothy",parent_guardian2:"Sruthi",address:"Upper East Side")

math101.students = [john, jane]
math102.students = [jim, joanna]
med101.students = [john,jane,jim,joanna]

math101.assignments.create(name: "Homework 1")
math101.assignments.create(name: "Homework 2")
math101.assignments.create(name: "Homework 3")
math102.assignments.create(name: "Assignment 1")
math102.assignments.create(name: "Assignment 2")
math102.assignments.create(name: "Assignment 3")
med101.assignments.create(name: "LAB 1")
med101.assignments.create(name: "LAB 2")
med101.assignments.create(name: "LAB 3")

StudentAssignment.all.each do |sa|
    sa.update(grade: Random.rand(70..100))
end