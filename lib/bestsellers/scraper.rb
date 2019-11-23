require 'pry'
require 'nokogiri'
require 'open-uri'

class Bestsellers::Scraper

    # set the webpage to barnes and noble bestsellers.
    def self.webpage
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    end

    # gets the section of the webpage with all the books.
    def self.select_bestsellers
        self.webpage.css("resultsListContainer.topXList.favIconContainer")
    end

    # iterates through the bestsellers and gets the info for each bestseller book (title, author, price, url).
    def self.create_bestsellers
        self.select_bestsellers.each do |bestseller_book|
          book = Bestsellers::Books.new
          book.title = bestseller_book.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a').text
          book.author = bestseller_book.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[2]').text.gsub("by ","")
          book.price = bestseller_book.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[4]/table/tbody/tr/td[2]/span[1]/a').text
          book.url = bestseller_book.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a/@href')
        end
    end

    # def self.todays_bestsellers
    #     # scrape barnes and nobles and then return the bestseller books based on that data.
    #     self.scrape_bestsellers
    # end

    # def self.scrape_bestsellers
    #     books = []
    #     books << self.scrape_books
    #     books
    # end

    # def self.scrape_books
    #     doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    #     bestsellers = doc.xpath('//*[@id="searchGrid"]')
    #     bestsellers.map do |book|
    #     # binding.pry
    #     new_book = self.new
    #     new_book.title = title = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a').text
    #     new_book.author = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[2]').text.gsub("by ","")
    #     new_book.price = doc.search("a.current.link").first.text
    #     new_book.url = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a/@href')
    #     end
    # end
end