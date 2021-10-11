=begin
**********************************************************************
Класс Station (Станция):
    Имеет название, которое указывается при ее создании
    Может принимать поезда (по одному за раз)
    Может возвращать список всех поездов на станции, находящиеся в текущий момент
    Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
    Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
**********************************************************************
=end
puts "*********** Операции с классом Станция ***************"
class Station
  attr_reader :trains
  
  def initialize(name_station)
    @name_station = name_station
    @trains = []
  end
  
  def add_train(num_train)			#add   - прибытие поезда на станцию
    @trains << num_train
  end

def del_train(num_train)			#del   - отправление поезда со станцию
    if @trains.include?(num_train)
       @trains.delete(num_train)
    else
       puts "Нет такого поезда на станции!"
    end
end
  
  def show_trains				#show  - показать список поездов на станции
    puts "***** На станции находятся поезда №№: ************"
    @trains.each { |num| print "#{num}, " }
    puts ">"
  end
end

station = Station.new("Харьков")

puts "Для продолжения работы введите команду:\n\n"
puts "new   - создать новую станцию"
puts "add   - добавить поезд на станцию"
puts "show  - показать список поездов на станции"
puts "del   - удалить поезд из списка на станции" 
puts "stop  - завершить маршрут"
puts "---------------------------------------\n\n"
cmd = "show"

while cmd != "stop" do
  case cmd = gets.chomp.to_s
  
  when "new"					#show  - показать станции в маршруте
    print "Название станци: "
    name_st = gets.chomp.to_s
    station = Station.new(name_st)
  
  when "add"
    
    work_train = station.trains			#указатель на массив станций
    puts work_train
    num = ""
    
    print "Добавить на станцию поезд №: "		#добавление поезда на станцию
    num = gets.chomp.to_s
    if work_train.include?(num)
      puts "Такой поезд есть в списке!"
    else
      station.add_train(num)
    end

  when "del"
    print "Удалить со станци поезд №: "
    num = gets.chomp.to_s
    puts "Ошибка при удалении станции #{num}" if station.del_train(num) == nil
  
  when "show"
    station.show_trains
  
  when "stop"
    break
  
  else
    puts "Неудачная команда?"
  end
  
  print "cmd> "
end
