class Bestsellers::Books
    attr_accessor :title, :author, :price, :url
    @@books = []

    def initialize
        @title = title
        @author = author
        @price = price
        @url = url
        @@books << self
    end

    def self.all
        @@books
    end
end