class Instructor 
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select {|test| test.instructor == self}
    end

    def passed_students
        self.boating_tests.sum {|test| test.status == 'passed' ? 1 : 0}
    end

    def pass_student(test_name, student_name)
        student_test = self.boating_tests.find{|test| test.student.first_name == student_name && test.boating_test_name == test_name}
        if student_test
            student_test.status = 'passed'
            student_test
        else
            student = Student.all.find{|student| student.first_name == student_name}
            BoatingTest.new(test_name, 'passed', student, self)
        end
    end

    def fail_student(test_name, student_name)
        student_test = self.boating_tests.find{|test| test.student.first_name == student_name && test.boating_test_name == test_name}
        if student_test
            student_test.status = 'fail'
            student_test
        else
            student = Student.all.find{|student| student.first_name == student_name}
            BoatingTest.new(test_name, 'fail', student, self)
        end
    end
end
