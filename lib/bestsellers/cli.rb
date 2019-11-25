class Bestsellers::CLI
    
    def call
        Bestsellers::Scraper.create_bestsellers
        welcome
        list_books
        menu_selection
        byebye
    end

    # The welcome message of the cli.
    def welcome
        puts "* * * * * *Barnes & Nobel Bestsellers* * * * * *"
        puts "The Best Selling Books You Must Read!"
        list_books
    end

    # lists the title for each bestselling book. Should list 20 bestsellers.
    def list_books
        @bestseller_books = Bestsellers::Books.all
        @bestseller_books.each.with_index(1) do |book, index|
            puts "#{index}. #{bestseller_books.title}"
        end
        # puts "The Bestseller Books:"
        # @books = Bestsellers::Books.todays_bestsellers
        # @books.each.with_index(1) do |book, index|
        #     puts "#{index}. Title: #{book.title}"
        #     puts "   Author: #{book.author}"
        #     # puts "   Price: #{book.price}"
        #     # puts "   URL: #{book.url}"
        # end
    end

    # prompts user to enter the number of book they want info on, list the bestsellers, or exit the cli.
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
        # input = nil
        # puts "Enter the number of the book you want more information on, type 'list' to view the bestsellers list, or type 'exit' to exit."
        # input = gets.strip.downcase

        # if input.to_i > 0
        #     the_book = @books[input.to_i - 1]
        #     puts "Title: #{the_book.title}"
        #     puts "Author: #{the_book.author}"
        #     puts "Price: #{the_book.price}"
        #     puts "URL: #{the_book.url}"
        #     elsif input == "list"
        #         list_books
        #     else
        #         puts "Option not available, type list or exit."
        # end
    end

    # The byebye message for the cli.
    def byebye
        puts "Thank you for visiting Barnes & Noble bestsellers! Enjoy reading your new book!"
    end
    
end