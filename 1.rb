file = File.open("archivo1.csv", "r")
data = file.readlines()
file.close

data = data.each_slice(1).to_a

puts "Ingrese un numero entre 1 y 4. [Exit =4]"
opcion = gets.chomp.to_i

def promedio(data)
	aux = []
	file = File.open("promedios.txt", "w")
	suma = 0
	promedio = 0

	data.each do |v|
		aux << v[0].chomp.split(", ")
	end

	File.open('promedios.txt', 'a') { |f|

		aux.each do |v|
			contador = 1
			v.length.times do

				if v[contador].to_s == "A"
					contador += 1
					next
				end

				suma += v[contador].to_f
				contador += 1
			end

			promedio = suma/(v.length.to_f-1)

			f.puts "#{v[0]}, #{promedio.round(1)}"

			suma = 0
			promedio = 0

		end

	}	
	return nil
end

def calcularinasistencia (data)
	aux = []
	

	data.each do |v|
		aux << v[0].chomp.split(", ")
	end

	aux.each do |v|
		inasistencia = 0
		v.each_with_index do |k, index|
			if v[index].to_s == "A"
				inasistencia += 1
			end	
		end
		if inasistencia > 0
			puts "El alumno #{v[0]} tiene #{inasistencia} inasistencias"
		end
	end

end

def aprobacion(notanecesaria = 5)

	file = File.open("promedios.txt", "r")
	data = file.readlines()
	file.close
	aux = []

	data = data.each_slice(1).to_a

	data.each do |v|
		aux << v[0].chomp.split(", ")
	end
	aux.each do |v|
		if v[1].to_f >= notanecesaria
		puts "El alumno #{v[0]} aprobó el curso con nota #{v[1]}"
		end
	end
end


while (opcion > 4 || opcion <=0) do
	puts "Opción Inválida."
	puts "Por favor ingrese un numero entre 1 y 4. [Exit = 4]"
	opcion = gets.chomp.to_i
end

while (opcion <= 3 && opcion > 0) do
	if opcion == 1
		promedio(data)
	elsif opcion == 2
		calcularinasistencia(data)
	elsif opcion == 3
		aprobacion
	end
	puts "Si desea puede ingresar otra opción entre 1 y 4. [Exit = 4]"
	opcion = gets.chomp.to_i

	while (opcion > 4 || opcion <=0) do
		puts "Opción Inválida."
		puts "Por favor ingrese un numero entre 1 y 4. [Exit = 4]"
		opcion = gets.chomp.to_i
	end
end

