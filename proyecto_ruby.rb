

preguntas=Array.new(0) 
respuestas=Array.new(0) 

File.foreach('flashcard.txt').map.with_index do |line,i| 
if i%2==0
	preguntas << line.strip
else
	respuestas << line.strip
end
end

prints "Bienvenido al Reto Ruby de Make It Real, a continuación
 usted deberá responder a cada una de las preguntas,se le haran 10 preguntas 
 y cada respuesta correcta acumulara 10 puntos ¿preparado? Empecemos."

gets.chomp

puntuacion=0
num=1

10.times  do

a=rand(preguntas.length)
puts "Pregunta #{num}: #{preguntas[a]}"
print "Respuesta #{num}:"
respuesta_user= gets.chomp

if  respuesta_user==respuestas[a]
	puntuacion=puntuacion+10
	p "correcto! su puntuacion es: #{puntuacion}" 
	gets.chomp
else
	p "incorrecto! su puntuacion es: #{puntuacion}" 
	gets.chomp
end
num+=1
end

p "SU PUNTUACION FINAL ES: #{puntuacion}"


=begin

#File.open("flashcard.txt", "r:UTF-8").each_line do |line|
#p line.strip
#end



File.open("flashcard.txt", "r:UTF-8").each_line.map.with_index do |line,i|

-------

preguntas=Array.new() 
respuestas=Array.new() 
if i%2==0
	line.to_preguntas
else
	line.to_respuestas
end

=end



	

  












