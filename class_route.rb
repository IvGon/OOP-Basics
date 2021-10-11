=begin
**********************************************************************
Класс Route (Маршрут):
   Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
    Может добавлять промежуточную станцию в список
    Может удалять промежуточную станцию из списка
    Может выводить список всех станций по-порядку от начальной до конечной
**********************************************************************
=end
puts "*********** Операции с Маршрутом ***************"
class Route
  attr_reader :station
  
  def initialize(star_station, end_station)
    @star_station = star_station
    @end_station = end_station
    @station = [star_station, end_station]
  end
  
  def add_station(name_st, prev_st)		#add   - добавить станцию в маршрут
    prev_ind = @station.index(prev_st) +1
    @station.insert(prev_ind, name_st) 
  end

def del_station(name_st)			#del   - удалить станцию из списка
    if @station.include?(name_st) == nil
       puts "Нет такой станции есть в списке!"
    else   
       index = @station.index(name_st).to_i
       if (index == 0) || (index == @station.size-1)
         puts "#{name_st} - это начало маршрута!" if (index == 0) 
         puts "#{name_st} - это конец маршрута!" if (index == @station.size-1)
       else
         @station.delete(name_st)
       end
    end
  end
  
  def clear_station				#clear - очистить маршрут
    beg_st = @station[0]
    end_st = @station.last
    @station.clear
    @station << beg_st << end_st
  end


  def show_stations				#show  - показать станции в маршруте
    puts "***** Схема маршрута: ************"
    print "<- "
    @station.each { |name_st| print "#{name_st} - " }
    puts ">"
  end
end

route = Route.new("Харьков", "Новоалексеевка")

puts "Для продолжения работы введите команду:\n\n"
puts "new   - создать маршрут"
puts "add   - добавить станцию в маршрут"
puts "show  - показать станции в маршруте"
puts "del   - удалить станцию из маршрута" 
puts "clear - очистить маршрут"
puts "stop  - завершить маршрут"
puts "---------------------------------------\n\n"
cmd = "show"

while cmd != "stop" do
  case cmd = gets.chomp.to_s
  
  when "new"					#show  - показать станции в маршруте
    print "Начальная станци маршрута: "
    beg_st = gets.chomp.to_s
    print "Конечная станци маршрута: "
    end_st = gets.chomp.to_s
    route = Route.new(beg_st, end_st)
    route.show_stations
  
  when "add"
    work_st = route.station			#указатель на массив станций
    new_st = ""
    
    print "Добавить станцию: "		#добавляемая станция
    new_st = gets.chomp.to_s
    if work_st.include?(new_st)
      puts "Такая станция есть в списке!"
    else
      print "Вставить после станции: "	#предыдущая станция
      prev_st = gets.chomp.to_s
      if work_st.include?(prev_st)
	 if work_st.index(prev_st) == work_st.size-1
	    puts "Эта станция за конечной станцией!" 
	 else
	    route.add_station(new_st,prev_st)	#добавить станцию
         end     
      else 
         puts "Нет такой станции в списке!" 
      end         
    end    

  when "del"
    print "Удалить станцию: "
    new_st = gets.chomp.to_s
    puts "Ошибка при удалении станции #{new_st}" if route.del_station(new_st) == nil
  
  when "clear"
    puts "Ошибка при удалении станций" if route.clear_station == nil
  
  when "show"
    route.show_stations
  
  when "stop"
    break
  
  else
    puts "Неудачная команда?"
  end
  
  print "cmd> "
end
