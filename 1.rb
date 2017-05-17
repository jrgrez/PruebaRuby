file = File.open("archivo1.csv", "r")
data = file.readlines()
file.close

puts "Ingrese un numero entre 1 y 4. [Exit =4]"
opcion = gets.chomp.to_i

while (opcion > 4 || opcion <=0) do
	puts "Opción Inválida."
	puts "Por favor ingrese un numero entre 1 y 4. [Exit = 4]"
	opcion = gets.chomp.to_i
end

while (opcion <= 3 && opcion > 0) do
	if opcion == 1
		

	elsif opcion == 2

	elsif opcion == 3

	end
	puts "Si desea puede ingresar otra opción entre 1 y 4. [Exit = 4]"
	opcion = gets.chomp.to_i
end