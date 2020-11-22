class BoatingTest
    attr_reader :boating_test_name, :student, :instructor
    attr_accessor :status

    @@all = []

    def initialize(boating_test_name, status, student, instructor)
        @boating_test_name = boating_test_name
        @status = status
        @student = student
        @instructor = instructor
        @@all << self
    end

    def self.all
        @@all
    end
end
