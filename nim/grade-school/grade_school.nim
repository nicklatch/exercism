import algorithm, sequtils

type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

proc showGrades(school: School): seq[int] =
  result = school.students.mapIt(it.grade).deduplicate
  result.sort

proc grade*(school: School, grade: int): seq[string] =
  ## Returns a sorted sequence of students names, filtered by the
  ## given `grade` from the given `school` 
  result = school.students.filterIt(it.grade == grade).mapIt(it.name)
  result.sort

proc roster*(school: School): seq[string] =
  ## Returns a sequence of student names in the `school`
  for g in school.showGrades:
    result.add(school.grade(g))

proc addStudent*(school: var School, name: string, grade: int) =
  ## Adds a `Student` to the given `school` using the given `name` and `grade`
  ## 
  ## Raises a `ValueError` if the `Student` already exists in the `school` 
  if name notin school.roster:
    school.students.add(Student(name: name, grade: grade))
  else:
    raise newException(ValueError, "This student already exists in the roster.")
