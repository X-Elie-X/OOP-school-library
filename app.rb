require './student'
require './teacher'
require './rental'
require './book'

class List
  def initialize
    @books = []
    @rental = []
    @people = []
  end

  def list_all_books
    puts 'There are no books found, Kindly add at least one book' if @books.empty?
    @books.each_with_index do |book, index|
      puts "(#{index + 1}) Book => Title: #{book.title}, Author: #{book.author}"
    end
  end

  # List all people method
  def list_all_people
    puts 'There are no people in the list. Kindly add at least one person' if @people.empty?
    @people.each_with_index do |person, index|
      puts "(#{index + 1}) [#{person.class}] => Id: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'If you are a Student insert (1) Or If you are a Teacher insert (2)'
    selection = gets.chomp.to_i
    case selection
    when 1
      print 'Add Student Name:'
      name :gets.chomp
      print 'Add Age:'
      age = gets.chomp
      student = student.new(age, name)
      @people << student
      puts "#{name} Congratulation (^_^) New Student"
    when 2
      print 'Add Teacher Name:'
      name :gets.chomp
      print 'Add Age:'
      age = gets.chomp
      teacher = teacher.new(age, name)
      @people << teacher
      puts "#{name} Congratulation ($_$) New Teacher"
    end
  end

  def create_book
    print 'Add title: '
    title = gets.chomp
    print 'Add Author: '
    author gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{title} By #{author} was Created"
  end

  def create_rental
    puts 'Select a book by Id: '
    books_list
    book_id = gets.chomp.to_i
    puts 'Select Person By Id: '
    list_people
    person_id = gets.chomp.to_i
    puts 'Rental Sarting Date ex:(YYYY/MM/DD)'
    date = gets.chomp.to_s
    puts ' Date Added'
    @rental.push(Rental.new(date, @people[person_id - 1], @books[book_id - 1]))
    puts ' Congratulation You Get the  Book '
  end

  def rental_list
    print 'Enter Person ID: '
    id = gets.chomp.to_i
    puts ' List of Rentals Books: '
    @rental.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} ,
         Date: #{rental.date}, Book : #{rental.book.title} BY #{rental.book.author}"
      else
        puts 'No Rental Found Check the Proper ID '
      end
    end
  end
  # rubocop:disable Metrics/CyclomaticComplexity

  def option_list
    puts
    puts 'Choose an option by entering a Number: '
    puts '1)  List All Books.'
    puts '2)  List All People.'
    puts '3)  Ceart a Person.'
    puts '4)  Ceart a Book.'
    puts '5)  Creat a Rental.'
    puts '6)  List All rentals By ID.'
    puts '7)  Exit '
  end

  def option_lists
    option_list
    input = gets.chomp.to_i
    case input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_list
    when 7
      puts 'Thank you for using  School Library'
      exit
    end
    option_lists
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
