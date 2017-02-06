class Student

  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def get_name()
    return @name
  end

  def get_cohort()
    return @cohort
  end

  def change_student_name(new_name)
    @name = new_name
  end

  def change_cohort(new_cohort)
    @cohort = new_cohort
  end

  def talk()
    return "I can talk!"
  end

  def favourite_language(language)
    return "I love #{language}!"
  end

end