require 'pry'
class Bestsellers::Books
    attr_accessor :title, :author, :price, :url

    def self.todays_bestsellers
        # scrape barnes and nobles and then return the bestseller books based on that data.
        self.scrape_bestsellers
    end

    def self.scrape_bestsellers
        books = []
        books << self.scrape_books
        books
    end

    def self.scrape_books
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
        bestsellers = doc.xpath('//*[@id="searchGrid"]')
        bestsellers.map do |book|
        binding.pry
        new_book = self.new
        new_book.title = title = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a').text
        new_book.author = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[2]').text.gsub("by ","")
        new_book.price = doc.search("a.current.link").first.text
        new_book.url = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a/@href')
        end
    end
end