class Employee

    attr_reader :name, :boss, :salary, :title
    attr_writer :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

        self.boss.employees << self unless self.boss.nil?
    end


    def bonus(multiplier)
        self.salary * multiplier
    end

end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employees(employee)
            self.employees << employee
    end
    
    def bonus(multiplier)
        total = 0

        # if self.is_a?(Manager)
        #     self.employees.each do |employee| 
        #         if employee.is_a?(Manager)
        #             total +=  employee.salary
        #             employee.employees.each { |sub_employee| total += sub_employee.salary }
        #         else
        #             total += employee.salary
        #         end
        #     end
        # end

        queue = [self.employees]

        until queue.empty?
            employee_listing = queue.shift
            employee_listing.each do |employee| 
                total += employee.salary
                queue.push(employee.employees) if employee.is_a?(Manager)
            end
        end

        total * multiplier

    end
    
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

# p ned
# p darren
# p shawna
# p david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000