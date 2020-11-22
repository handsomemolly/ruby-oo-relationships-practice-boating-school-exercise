class Student
    attr_accessor :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(test_name, status, self, instructor)
    end

    def boating_tests
        BoatingTest.all.select {|test| test.student == self}
    end

    def all_instructors
        self.boating_tests.map {|test| test.instructor}.uniq
    end

    def self.find_student(first_name)
        @@all.find {|student| student.first_name == first_name}
    end

    def grade_percentage
        total_tests = 0.00
        total_passed = 0.00
        self.boating_tests.each do |test|
            total_tests += 1.00
            if test.status == 'passed'
                total_passed += 1.00
            end
        end
        (total_passed/total_tests) * 100.00
        # self.boating_tests.sum{|test| test.status == 'passed' ? 1.00 : 0.00}


    end
end
