class Library

  attr_accessor :contents

  def initialize()

    @contents = [{
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

  end

  def short_list

    list = ""

    for book in @contents
      list << "Title: #{book[:title]} (On loan to: #{book[:rental_details][:student_name]}, Due: #{book[:rental_details][:date]})\n"
    end

    return list
  end



  def book_info_by_title(title)
    for book in @contents
      if book[:title] == title
        return book
      end
    end
  end

  def rental_details_by_title(title)
    for book in @contents
      if book[:title] == title
        return book[:rental_details]
      end
    end
  end

  def add_book(title)
    new_book = {
      title: title,
      rental_details: {
        student_name: "",
        date: ""
      }
    }

    @contents << new_book
  end

  def rent_book(title, student, return_date)

    for book in @contents

      if book[:title] == title

        book[:rental_details][:student_name] = student
        book[:rental_details][:date] = return_date

      end

    end

  end

end