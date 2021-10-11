=begin
**********************************************************************
Класс Train (Поезд):
    Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
    Может набирать скорость
    Может возвращать текущую скорость
    Может тормозить (сбрасывать скорость до нуля)
    Может возвращать количество вагонов
    Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
    Может принимать маршрут следования (объект класса Route). 
    При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
    Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
    Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
**********************************************************************
=end

#********** Определение Класс Train (Поезд) ***********************************
class Train
  
  attr_reader :speed				#возвращать текущую скорость
  attr_reader :number_car			#возвращать количество вагонов
  
  def initialize(number, type, num_of_cars)
    @train_number = number			#номер поезда
    @train_type = type				#тип поезда (грузовой, пассажирский)
    @num_of_cars = num_of_cars		#количество вагонов
    @speed = 0
    @route = []
  end

def add_car(num_train="ПС81",number_car=1)		#car+  - прицепить вагон к поезду
    @num_of_cars += 1 if @speed == 0
end

def del_car(num_train="ПС81",num_car=1)		#car-   - отцепить вагон поезда
    @num_of_cars -= 1 if @speed == 0
end

 def number_cars(num_train="ПС81")			#num  - количество вагонов в поезде
    print "В поезде № #{num_train} - #{@num_of_cars} вагон"
    puts @num_of_cars
  end
  
  def train_assign_route(num_train, route) 	#route	- назначить поезду маршрут
    @route = num_train
    @route = route
    @curent_station = route[0]
    @prev_station = nil
    @next_station = route[1]
  end
  
  def train_curent_station(num_train="ПС81") 	#stat - Возвращать положение на маршруте
     puts "Текущая станция 	- #{@curent_station}"
     puts "Предыдущая станция  - #{@prev_station}"
     puts "Следующая станция   - #{@next_station}" 
  end

#перемещаться между станциями, указанными в маршруте.
  def train_forward(num_train)  		#add	- отправить поезд со станции по маршруту
    @prev_station = @curent_station
    @curent_station = @next_station
    i = @route.index(@curent_station).to_i
    @next_station = @route[i + 1]
  end
  
  def train_back(num_train)			#del	- принять поезд на станцию
    @next_station = @curent_station
    @curent_station = @prev_station
    index = @route.index(@curent_station).to_i
    @prev_station = @route[index - 1]
  end

  def trains_show(station)			#show  - показать список поездов на станции
    puts "На станции находятся поезда №№: "
    station.each { |num| print "#{num}, " }
    puts ">"
  end

  def speed_up(speed)				#+   - набирать скорость
    @speed = speed
  end

  def speed_down(speed)			#-   - тормозить (сбрасывать скорость до нуля)
    @speed = speed
  end

  def speed					#-   - тормозить (сбрасывать скорость до нуля)
    puts @speed
  end
  
  def info
    puts "номер поезда		- #{@train_number}"	#номер поезда
    puts "тип поезда 		- #{@train_type}"
    puts "количество вагонов 	- #{@num_of_cars}"		
    puts "скорость 		- #{@speed}"
    puts "маршрут 		- #{@route}"
    puts "Текущая станция 	- #{@curent_station}"
    puts "Предыдущая станция 	- #{@prev_station}"
    puts "Следующая станция 	- #{@next_station}" 
  end

end

#********** Определение Класс Station(Станция) ***********************************
class Station
  attr_reader :trains				# Список поездов на станции
  
  def initialize(name_station)		# CСоздать станцию
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

#********** main ******** main ****** main ******  main ******************************

station = Station.new("Харьков")				# Создадим объект Станция
train = Train.new("ПС19","пассажирский",21)			# Создадим объект Поезд
#  route["19"] = {"Харьков","Белгород","Курск","Орел","Москва"}
#								Назначим маршрут
route = {"num_route"=>"81", "station" => ["Харьков","Лозовая","Запорожье","Синельниково","Новоалексеевка"]}
train_station = ["ПС81"]

puts 
puts "Для продолжения работы введите команду:\n\n"
puts "------ Формирование состава --------------------------"
puts "new   - создать новый состав"
puts "car+  - прицепить вагон к составу"
puts "car-  - отцепить вагон от состава"
puts "num   - количество вагонов в поезде"
puts "stat  - станции на маршруте"
puts "info  - информация о поезде"
puts "------- Движение поезда по маршруту-------------------"
puts "route - назначить поезду маршрут"
puts "next  - поезд вперед на 1 станцию по маршруту"
puts "prev  - поезд назад на 1 станцию по маршруту"
puts "------- Движение поездов по станции ------------------"
puts "add   - принять поезд на станцию"
puts "del   - отправить поезд со станции по маршруту"
puts "show  - показать список поездов на станции" 
puts "------- Управление скоростью поезда ------------------"
puts "up    - набирать скорость)"
puts "down  - тормозить (сбрасывать скорость до нуля)"
puts "speed - возвращать текущую скорость)" 
puts "-----------------------------------------------------"
puts "cmd   - вывод меню команд на экран"	
puts "stop  - завершить работу)"
puts "---------------------------------------\n\n"

cmd = "cmd"
until cmd == "stop" do
#while cmd != "stop" do
  #case cmd = gets.chomp.to_s
  case cmd
# --------------------- Формирование состава ---------------------------------  
  when "new"					#new  - создать новый состав
    print "Номер поезда: "
    num_train = gets.chomp.to_s
    print "Тип поезда (0 - грузовой, 1 - пассажирский): "
    type = gets.chomp.to_i
    print "Количество вагонов: "
    num_cars = gets.chomp.to_i
    type_train = "грузовой" if type == 0 
    type_train = "пассажирский" if type == 1
    
    train = Train.new(num_train,type_train,num_cars)
  
  when "car+"					#car+ - прицепить вагон к составу
    #print "Прицепить вагон к поезду № : "
    #num_train = gets.chomp.to_s
    train.speed_down(0)			#остановите поезд
    train.add_car(num_train)
    
   when "car-"					#car- - отцепить вагон от состава
    #print "Отцепить вагон от поезда № : "
    #num_train = gets.chomp.to_s
    train.speed_down(0)			#остановите поезд
    train.del_car(num_train)
    
    when "num"					#num - количество вагонов в поезде
      print "Номер поезда: "
      num_train = gets.chomp.to_s
      train.number_cars(num_train)
      
# -------------------------- Движение поезда по маршруту ---------------------    
    when "route"				#route - назначить поезду маршрут
      print "Номер поезда: "
      num_train = gets.chomp.to_s
      print "Номер маршрута: #{route}\n"
#      num_route = gets.chomp.to_s
#      train.train_assign_route(num_train, num_route)
      train.train_assign_route(num_train, route["station"])
    
    when "stat"				#stat - станции поезда на маршруте
      #print "Номер поезда: "
      #num_train = gets.chomp.to_s
      train.train_curent_station("ПС81")
  
    when "next"				#next - поезд вперед на 1 станцию по маршруту
      train.train_forward(num_train)
      train_station << num_train
      
    when "prev"				#prev - поезд назад на 1 станцию по маршруту
      train_station.delete(num_train)
 
 # -------------------------- Движение поездов по станции ---------------------   
    when "add"					#add - принять поезд на станцию
      print "Принять на станцию поезд № : "
      num_train = gets.chomp.to_s
      train.train_forward(num_train)
      train_station << num_train
      station.add_train(num_train)		# ----- добавить поезд на станцию
    
    when "del"					#del - отправить поезд со станции по маршруту
      print "Отправить со станции поезд № : "
      num_train = gets.chomp.to_s
      train.train_back(num_train)
      train_station.delete(num_train)
      station.del_train(num_train)		#----- отправить поезд со станции
    
    when "show"				#show - показать поезда на станции
      #print "Показать поезда на станции : "
      #station = gets.chomp.to_s
      #train.trains_show(train_station)
      station.show_trains
  # -------------------------- Скорость движения поезда -------------------------     
    when "up"					#up - набирать скорость поезда
      print "Набрать скорость поезда: "
      speed = gets.chomp.to_f
      train.speed_up(speed)
    
    when "down"				#up - набирать скорость поезда
      print "Снизить скорость поезда до: "
      speed = gets.chomp.to_f
      train.speed_down(speed)
    
    when "speed"				#speed - определить скорость поезда
      train.speed
  # -------------------------- Информация о поезде -------------------------   
   when "info"
     train.info
     
  # -------------------------- Меню команд -------------------------  
  when "cmd"
    puts
    puts "Для продолжения работы введите команду:\n\n"
    puts "------ Формирование состава --------------------------"
    puts "new   - создать новый состав"
    puts "car+  - прицепить вагон к составу"
    puts "car-  - отцепить вагон от состава"
    puts "num   - количество вагонов в поезде"
    puts "stat  - станции на маршруте"
    puts "info  - информация о поезде"
    puts "------- Движение поезда по маршруту-------------------"
    puts "route - назначить поезду маршрут"
    puts "next  - поезд вперед на 1 станцию по маршруту"
    puts "prev  - поезд назад на 1 станцию по маршруту"
    puts "------- Движение поездов по станции ------------------"
    puts "add   - принять поезд на станцию"
    puts "del   - отправить поезд со станции по маршруту"
    puts "show  - показать список поездов на станции" 
    puts "------- Управление скоростью поезда ------------------"
    puts "up    - набирать скорость)"
    puts "down  - тормозить (сбрасывать скорость до нуля)"
    puts "speed - возвращать текущую скорость)" 
    puts "-----------------------------------------------------"
    puts "cmd   - вывод меню команд на экран"	
    puts "stop  - завершить работу"
    puts "---------------------------------------\n\n"
 #  end
  
  when "stop"					#stop - завершение работы
    break
  
  else
    puts "Неудачная команда?"
  end

  print "cmd> "
  cmd = gets.chomp.to_s			# Выбор команды
  
end						# end of until CMD
