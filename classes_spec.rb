require ('minitest/autorun')
require ('minitest/rg')
require_relative('./student.rb')
require_relative('./team.rb')
require_relative('./library.rb')

class TestClasses < MiniTest::Test

###Part A -- STUDENT

  def test_student_class__has_name
    student = Student.new("Barry", 11)
    assert_equal("Barry", student.get_name)
  end

  def test_student_class__has_cohort
    student = Student.new("Barry", 11)
    assert_equal(11, student.get_cohort)
  end

  def test_change_student_name
    student = Student.new("Barry", 11)
    student.change_student_name("Brian")
    assert_equal("Brian", student.get_name)
  end

  def test_change_student_cohort
    student = Student.new("Barry", 11)
    student.change_cohort(12)
    assert_equal(12, student.get_cohort)
  end

  def test_student_can_talk
    student = Student.new("Barry", 11)
    assert_equal("I can talk!", student.talk)
  end

  def test_favourite_language
    student = Student.new("Barry", 11)
    assert_equal("I love Ruby!", student.favourite_language("Ruby"))
  end

  ##Part B -- TEAM##

  def test_team_has_name
    team = Team.new("The A Team", ["Mr T", "Murdock"], "Hannibal")
    assert_equal("The A Team", team.team_name) 

  end

  def test_team_has_players
    team = Team.new("The A Team", ["Mr T", "Murdock"], "Hannibal")
    assert_equal(["Mr T", "Murdock"], team.players)
  end

  def test_team_has_coach
    team = Team.new("The A Team", ["Mr T", "Murdock"], "Hannibal")
    assert_equal("Hannibal", team.coach)
  end

  def test_change_team_coach
    team = Team.new("The A Team", ["Mr T", "Murdock"], "Hannibal")
    team.coach = "Brian"
    assert_equal("Brian", team.coach)
  end

  def test_add_team_player
    team = Team.new("The A Team", ["Mr T", "Murdock"], "Hannibal")
    team.add_player('Betty')
    assert_equal(["Mr T", "Murdock", "Betty"], team.players)
  end

  def test_player_in_array_is_true
    team = Team.new("The A Team", ["Mr T", "Murdock", "Betty"], "Hannibal")
    assert_equal(true, team.has_player?("Betty"))
  end

  def test_player_in_array_is_false
    team = Team.new("The A Team", ["Mr T", "Murdock", "Betty"], "Hannibal")
    assert_equal(false, team.has_player?("John"))
  end

  def test_team_points_are_zero
    team = Team.new("The A Team", ["Mr T", "Murdock", "Betty"], "Hannibal")
    assert_equal(0, team.points)
  end

  def test_win_increases_points
    team = Team.new("The A Team", ["Mr T", "Murdock", "Betty"], "Hannibal")
    assert_equal(1, team.game_played("win"))
  end

  
###Extension - LIBRARY###


def test_library_has_three_books
  library = Library.new
  assert_equal(3, library.contents.length)
end

def test_list_books_and_details
  library = Library.new
  expected = [{
      title: "Lord of the Rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
      }
    },

    {
      title: "Life of Pi",
      rental_details: {
        student_name: "Lisa",
        date: "05/01/17"
      }
    },

    {
      title: "Tale of Two Cities",
      rental_details: {
        student_name: "Betty",
        date: "05/02/17"
      }
    }]
    assert_equal(expected, library.contents)
end

###trying out a neater displaying method
def test_list_books_and_details__neater
library = Library.new
expected = "Title: Lord of the Rings (On loan to: Jeff, Due: 01/12/16)
Title: Life of Pi (On loan to: Lisa, Due: 05/01/17)
Title: Tale of Two Cities (On loan to: Betty, Due: 05/02/17)
"

assert_equal(expected, library.short_list)

end


def test_book_info_by_title
  library = Library.new
  expected = {
      title: "Lord of the Rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
      }
    }

  assert_equal(expected, library.book_info_by_title("Lord of the Rings"))
end

def test_rental_details_by_title
  library = Library.new
  expected = {
        student_name: "Jeff",
        date: "01/12/16"
      }
  assert_equal(expected, library.rental_details_by_title("Lord of the Rings"))

end

def test_adds_book_to_contents
  library = Library.new
  library.add_book("Wild")

  assert_equal(4, library.contents.length)
end

def test_adds_book_to_contents__rental_details_empty_strings
  library = Library.new
  library.add_book("Wild")

  expected = {
    student_name:"",
    date: ""
  }
  assert_equal(expected, library.rental_details_by_title("Wild"))
end


def test_rent_book__updates_student_name
  library = Library.new
  library.add_book("Wild")
  library.rent_book("Wild", "Suzanne", "01/03/2017")

  expected = {
    student_name: "Suzanne",
    date: "01/03/2017"
  }

  assert_equal(expected, library.rental_details_by_title("Wild"))

end

  



end