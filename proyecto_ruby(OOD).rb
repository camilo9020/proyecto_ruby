class Reto5
	
	

	attr_reader :nombre, :preguntas, :respuestas, :puntuacion
		
	def initialize(nombre)
		@nombre=nombre
		@preguntas=[] 
		@respuestas=[]
		@puntuacion=0
	end
	
	def play
		loadfile
		greet
		questionary
		score
	end

	def loadfile
	
		File.foreach('cuestionario.txt').map.with_index do |line,i| 
			if i%2==0
					@preguntas << line.strip
				else
					@respuestas << line.strip
			end
		end
	end

	def greet
		print "Bienvenido #{@nombre} al Reto Ruby de Make It Real, a continuación ",
		       "usted deberá responder a cada una de las preguntas,se le haran 10",
		       " preguntas y cada respuesta correcta acumulara 10 puntos ¿preparado?",
		        " Empecemos."
		 gets
	end


	def random
		@a=rand(preguntas.length)
	end



	def questionary
		
		num=1
		10.times  do
		random
		puts "Pregunta #{num}: #{@preguntas[@a]}"
		print "Respuesta #{num}:"
		respuesta_user= gets.chomp
			if  respuesta_user==@respuestas[@a]
					@puntuacion=@puntuacion+10
					p "correcto! su puntuacion es: #{@puntuacion}" 
					gets
				else
					p "incorrecto! su puntuacion es: #{@puntuacion}" 
					gets
			end
			num+=1
		end
	end

	def score
		p  "SU PUNTUACION FINAL ES: #{@puntuacion}"	
	end
end

user=Reto5.new("camilo")
user.play




	









