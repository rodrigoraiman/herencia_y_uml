class Apointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Apointment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
    end

    def occurs_on?(day)
    end

    def to_s
        puts "Reunion mensual en #{@location} sobre #{@purpose} el dia #{@day} a la(s) #{@hour}:#{@min}"
    end
end

class DailyAppointment < Apointment
    def occurs_on?(hour, min)
        @hour == hour && @min == min
    end

    def to_s
        puts "Reunion diaria en #{@location} sobre #{purpose} a la(s) #{@hour}:#{@min}"
    end
end

class OneTimeAppointment < Apointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end
    def occurs_on?(day, month, year)
        @day == day && @month == month && @year == year
    end

    def to_s
        puts "Reunion unica en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
end

puts OneTimeAppointment.new('Desafio Latam', 'Trabajo', 14, 30, 4, 6, 2019).to_s
puts DailyAppointment.new('Desafio Latam', 'Educacion', 8, 15).to_s
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23).to_s