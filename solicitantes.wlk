class Persona{
    const property provincia
    method puedeSerAtendidoPor(unProfesional){
        return unProfesional.provincia().contains(provincia)
    }
}

class Institucion{
    const property universidades = []
    method agregarUniversidad(unaUniversidad){
        universidades.add(unaUniversidad)
    }
    method puedeSerAtendidoPor(unProfesional){
        return universidades.contains(unProfesional.universidad())
    }
}

class Club{
    const property provincias = [] 
    method puedeSerAtendidoPor(unProfesional){
        return not provincias.asSet().intersection(unProfesional.provinciasDondeTrabaja().asSet()).isEmpty()
    }
}