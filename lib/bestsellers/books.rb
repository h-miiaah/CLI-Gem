class Bestsellers::Books
    attr_accessor :title, :author, :price, :url
    @@books = []

    def initialize
        @@books << self
    end

    def self.all
        @@books
    end
end