class Bestsellers::CLI
    
    def call
        Bestsellers::Scraper.create_bestsellers
        welcome
        list_books
        puts " "
        menu_selection
        byebye
    end

    def welcome
        puts <<-GREETING
        
        ██████╗ ███████╗███████╗████████╗███████╗███████╗██╗     ██╗     ███████╗██████╗ ███████╗
        ██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔════╝██║     ██║     ██╔════╝██╔══██╗██╔════╝
        ██████╔╝█████╗  ███████╗   ██║   ███████╗█████╗  ██║     ██║     █████╗  ██████╔╝███████╗
        ██╔══██╗██╔══╝  ╚════██║   ██║   ╚════██║██╔══╝  ██║     ██║     ██╔══╝  ██╔══██╗╚════██║
        ██████╔╝███████╗███████║   ██║   ███████║███████╗███████╗███████╗███████╗██║  ██║███████║
        ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝
                                The Best Selling Books You Must Read!
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        GREETING
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
            puts " "
            input = gets.strip.downcase

            if input == "list"
                list_books
                puts " "
                elsif input.to_i > 20 || input.to_i < 0
                    puts "Please enter a valid number from the bestsellers list."
                elsif input.to_i > 0
                    user_selection = @bestseller_books[input.to_i - 1]
                    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
                    puts "Title: #{user_selection.title}"
                    puts "Author: #{user_selection.author}"
                    puts "Price: #{user_selection.price}"
                    puts "URL: #{user_selection.url}"
                    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            end
        end
    end

    def byebye
        puts " "
        puts "Thank you for visiting Bestsellers! Enjoy reading your new book!"
    end
    
end