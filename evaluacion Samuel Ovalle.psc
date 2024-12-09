funcion op = menu(op)
	Escribir '============================='
	Escribir 'x        Student DB         x'
	Escribir '============================='
	Escribir 'x 1. Registrar Estudiante   x'
	Escribir 'x 2. Asignar Notas          x'
	Escribir 'x 3. Inasistencias          x'
	Escribir 'x 4. Listar Estudiantes     x'
	Escribir 'x 5. Calcular notas finales x'
	Escribir 'x 0. Salir                  x'
	Escribir '============================='
	Leer op
FinFuncion

Funcion x = crearEstudiante(arreglo, maximoEstudiantes)
	Limpiar Pantalla
	Escribir '----------------------'
	Escribir '  Agregar Estudiante  '
	Escribir '----------------------'
	Esperar 2 Segundos
	Limpiar Pantalla
	Escribir Sin Saltar 'Digite el codigo del estudiante'
	Leer code
	Escribir Sin Saltar 'Digite el nombre visible del estudiante'
	Leer name
	
	arreglo[maximoEstudiantes, 1] = code
	arreglo[maximoEstudiantes, 2] = name
	
	x = 'Estudiante Creado con Exito!'
	
FinFuncion

funcion asignarNota(arreglo, notasParciales, maximoEstudiantes)
	Limpiar Pantalla
	Escribir '----------------------'
	Escribir '    Agregar Notas     '
	Escribir '----------------------'
	Esperar 2 Segundos
	Limpiar Pantalla
	terminar = Falso
	Repetir
		Si maximoEstudiantes = 1 Entonces
			Limpiar Pantalla
			Escribir 'No hay estudiantes registrados'
			Esperar 1.4 Segundos
			Limpiar Pantalla
			terminar = Verdadero
		SiNo
			encontrado = Falso
			Escribir 'Dame el codigo del estudiante'
			Leer code
			Para i = 1 Hasta maximoEstudiantes - 1 Hacer
				Si arreglo[i, 1] = code
					Escribir 'Encontrado'
					encontrado = Verdadero
					Escribir 'Dame la nota 1 de', arreglo[i, 2]
					Leer notasParciales[i, 1]
					Escribir 'Dame la nota 2 de', arreglo[i, 2]
					Leer notasParciales[i, 2]
					Escribir 'Dame la nota 3 de', arreglo[i, 2]
					Leer notasParciales[i, 3]
					Escribir 'Las notas de ', arreglo[i, 2], ' Son: ', notasParciales[i, 1], ', ', notasParciales[i, 2], ', ', notasParciales[i, 3]
					Esperar 2 Segundos
					Limpiar Pantalla
					terminar = Verdadero
				FinSi
			FinPara
			Si No encontrado
				Escribir 'No he encontrado un estudiante con ese codigo'
				terminar = Verdadero
			FinSi
		FinSi
		
	Hasta Que terminar = Verdadero
FinFuncion

funcion asignarInAsis(arreglo, arregloNotas, arregloInAsis, maximoEstudiantes)
	Limpiar Pantalla
	Escribir '----------------------'
	Escribir '    Agregar Fallas    '
	Escribir '----------------------'
	Esperar 2 Segundos
	Limpiar Pantalla
	terminar = falso
	Repetir
		Si maximoEstudiantes = 1 Entonces
			Limpiar Pantalla
			Escribir 'No hay estudiantes registrados'
			Esperar 1.4 Segundos
			Limpiar Pantalla
			terminar = Verdadero
		Sino
			encontrado = Falso
			Escribir 'Ingresa el codigo del estudiante'
			Leer code
			Para i = 1 Hasta maximoEstudiantes - 1 Hacer
				Si arreglo[i, 1] = code Entonces
					Escribir 'Encontrado'
					encontrado = Verdadero
					Escribir 'Dame el numero de inasistencias del estudiante ', arreglo[i, 2] 
					Leer inAsis
					
					Escribir inAsis, ' Inasistencias'
					arregloInAsis[i, 1] = inAsis
					Esperar 2 Segundos
					Limpiar Pantalla
					terminar = Verdadero
				FinSi
			FinPara
			Si no encontrado Entonces
				Escribir 'No he encontrado un estudiante con ese codigo'
				terminar = Verdadero
			FinSi
		FinSi
	Hasta Que terminar = Verdadero
FinFuncion

Funcion listar(arreglo, arregloNotas, arregloAsis, maximoEstudiantes)
	Si maximoEstudiantes = 1 Entonces
		Limpiar Pantalla
		Escribir 'No hay estudiantes registrados'
		Esperar 1.4 Segundos
		Limpiar Pantalla
	SiNo
		Limpiar Pantalla
		Escribir 'Codigo ', 'Nombre ', 'N1 ', 'N2 ', 'N3 ', '|| Inasistencias'
		para i = 1 hasta maximoEstudiantes - 1 Hacer
			Escribir arreglo[i, 1],' ', arreglo[i,2],' ', arregloNotas[i, 1],' ', arregloNotas[i, 2],' ', arregloNotas[i, 3],' || ', arregloAsis[i, 1]
		FinPara
	FinSi
FinFuncion

Funcion calcNota(arreglo, arregloNotas, arregloAsis, maximoEstudiantes)
	terminar = Falso
	repetir
		Si maximoEstudiantes = 1 Entonces
			Limpiar Pantalla
			Escribir 'No hay estudiantes registrados'
			Esperar 1.4 Segundos
			Limpiar Pantalla
			terminar = Verdadero
		SiNo
			encontrado = Falso
			Escribir 'Ingrese el codigo del estudiante'
			Leer code
			Limpiar Pantalla
			Para i = 1 Hasta maximoEstudiantes
				Si arreglo[i, 1] = code
					encontrado = Verdadero
					asistencia = arregloAsis[i, 1]
					nota1 = arregloNotas[i, 1]
					nota2 = arregloNotas[i, 2]
					nota3 = arregloNotas[i, 3]
					notaFinal = (nota1 + nota2 + nota3)/3
					Si asistencia < 9 Entonces
						asistencia = 0
					SiNo
						Si asistencia >= 10 Y asistencia < 15 Entonces
							asistencia = 0.5
						SiNo
							asistencia = 1
						FinSi
					FinSi
					notaFinal = notaFinal - asistencia
					Escribir '---Nota Final---'
					Escribir arreglo[i, 2]
					Escribir arreglo[i, 1],' ', arreglo[i,2],' ', arregloNotas[i,1],' ', arregloNotas[i,2],' ', arregloNotas[i,3],' ', notaFinal
					terminar = Verdadero
				FinSi
			FinPara
			Si no encontrado Entonces
				Escribir 'No he encontrado un estudiante con ese codigo'
				terminar = Verdadero
			FinSi
		FinSi
	Hasta Que terminar
FinFuncion

// INICIO DE ALGORITMO

Algoritmo crearEstudiantes
	maxEstudiantes = 1 // Variable que vincula los datos en los arreglos <- Se suma cada que el usuario crea un estudiante
	
	Dimension estudiantes[maxEstudiantes, 2] // Dimension para codigos y nombres
	Dimension notasParciales[maxEstudiantes, 3] // Dimension para las 3 notas parciales
	Dimension inAsistencias[maxEstudiantes, 1] // Dimension de inAsistencias. <- Creada para evitar errores de tipo en arreglos
	
	
	finalizarProceso = Verdadero // Flag para terminar nuestro menú
	Repetir
		op = menu(op) // Invocamos nuestro menu (En Funcion)
		Segun op Hacer // Segun la opcion ingresada manejamos nuestro menu
			0: 
				finalizarProceso = Falso
			1: 
				estudiante = crearEstudiante(estudiantes, maxEstudiantes)
				maxEstudiantes = maxEstudiantes + 1
				Limpiar Pantalla
				Escribir estudiante
				Redimension estudiantes[maxEstudiantes, 2]
				Esperar 1.2 Segundos
				Limpiar Pantalla
			2:
				asignarNota(estudiantes, notasParciales, maxEstudiantes)
				Redimension notasParciales(maxEstudiantes, 3)
			3: 
				asignarInAsis(estudiantes, notasParciales, inAsistencias, maxEstudiantes)
				Redimension  inAsistencias[maxEstudiantes, 1]
			4: 
				listar(estudiantes, notasParciales, inAsistencias, maxEstudiantes)
			5:
				calcNota(estudiantes, notasParciales, inAsistencias, maxEstudiantes)
		FinSegun
	Hasta Que No finalizarProceso
FinAlgoritmo
