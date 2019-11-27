require 'pry'
require 'nokogiri'
require 'open-uri'

class Bestsellers::Scraper

    def self.create_bestsellers
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
        books = doc.css("ol.product-shelf-list.product-list-view li")
        books.each do |book| 
            title = book.css("h3.product-info-title a").text.strip
            author = book.css("div.product-shelf-author a").text.strip
            price = book.css("a.current").text.strip
            url = "https://www.barnesandnoble.com" + book.css("h3.product-info-title a").attr("href")
            Bestsellers::Books.new(title, author, price, url)
        end
    end

end