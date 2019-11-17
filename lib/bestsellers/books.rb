# require 'pry'
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

        # binding.pry
        book = self.new
        book.title = title = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a').text
        book.author = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[2]').text.gsub("by ","")
        book.price = doc.search("a.current.link").first.text
        book.url = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a/@href')
        
        book

    end
end


        # book = self.new
        # book.title = title = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a').text
        # book.author = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[2]').text.gsub("by ","")
        # book.price = doc.search("a.current.link").first.text
        # book.url = doc.xpath('//*[@id="listView_"]/ol/li[1]/div/div[3]/div[1]/h3/a/@href') need to add https://www.barnesandnoble.com/ to the begining of the link

        # book