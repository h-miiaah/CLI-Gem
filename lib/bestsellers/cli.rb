class Bestsellers::CLI
    
    def call
        list_books
        menu
        byebye
    end

    def list_books
        puts "The Bestseller Books:"
        @books = Bestsellers::Books.todays_bestsellers
        @books.each.with_index(1) do |book, index|
            puts "#{index}. Title: #{book.title}"
            puts "   Author: #{book.author}"
            # puts "   Price: #{book.price}"
            # puts "   URL: #{book.url}"
        end
    end

    def menu
        input = nil
        puts "Enter the number of book you want more information on, type list to view the bestsellers list, or type exit."
        input = gets.strip.downcase

        if input.to_i > 0
            the_book = @books[input.to_i - 1]
            puts "Title: #{the_book.title}"
            puts "Author: #{the_book.author}"
            puts "Price: #{the_book.price}"
            puts "URL: #{the_book.url}"
            elsif input == "list"
                list_books
            else
                puts "Option not available, type list or exit."
        end
    end

    def byebye
        puts "Thank you for visiting the bestsellers!"
    end
    
end