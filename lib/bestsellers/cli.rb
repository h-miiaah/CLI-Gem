class Bestsellers::CLI
    
    def call
        Bestsellers::Scraper.create_bestsellers
        welcome
        list_books
        menu_selection
        byebye
    end

    def welcome
        puts "* * * * * *Barnes & Nobel Bestsellers* * * * * *"
        puts "The Best Selling Books You Must Read!"
    end

    def list_books
        @bestseller_books = Bestsellers::Books.all
        @bestseller_books.each.with_index(1) do |book, index|
            puts "#{index}. #{book.title}"
        end
    end

    def menu_selection
        input = ""
        while input != "exit"
            puts "Enter the number of the book you want more information on, type 'list' to view the bestsellers list, or type 'exit' to exit."
            input = gets.strip.downcase

            if input == "list"
                list_books
                elsif input.to_i > 20
                    puts "Please enter a valid number from the bestsellers list."
                elsif input.to_i > 0
                    user_selection = @bestseller_books[input.to_i - 1]
                    puts "Title: #{user_selection.title}"
                    puts "Author: #{user_selection.author}"
                    puts "Price: #{user_selection.price}"
                    puts "URL: #{user_selection.url}"
            end
        end
    end

    def byebye
        puts "Thank you for visiting Barnes & Noble bestsellers! Enjoy reading your new book!"
    end
    
end