# Add students name to the roster for a grade
# Get a list of students enrolled in a grade
# Get a sorted list of all students in all grades 
  # Grades should be sorted as 1, 2, 3, etc.
  # Students within a grade should be sorted alphabetically 

class School 
  def initialize
    @students = {}
  end

  def to_h
    @students.sort_by{|k, v| k}.to_h
  end

  def add(name, year)
    if @students[year] == nil
      @students[year] = [name]
    else
      @students[year] << name
    end

    @students[year] = @students[year].sort
  end

  def grade(year)
    if @students[year] == nil
      return []
    else
      @students[year]
    end
  end
end
