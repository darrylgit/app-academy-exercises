class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @grades = Hash.new { |h, k| h[k] = [] } 
    @teachers = []
    @students = []
  end

  def name
    @name
  end

  def slogan 
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(new_teacher)
    @teachers << new_teacher
  end

  def enroll(new_student)
    if (@students.length < @student_capacity)
      @students << new_student
      return true
    end
    
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if self.enrolled?(student)
      @grades[student] << grade
      return true
    end
    
    false
  end


  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if @grades[student].length > 0
      return @grades[student].sum / self.num_grades(student)
    end

    nil
  end
end
