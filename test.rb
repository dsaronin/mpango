puts "test_library included"

module MyLibrary
  puts "my self is #{self.class.name}"
  class << self
    def initialize
      puts "TestClass object created"
    end

    def pink()
      puts "** peanut clusters **"
    end

  end
end
