
class ProfesionalViculado{
    const property universidad
    method honorario() = universidad.honorariosRecomendados()
    method provinciasDondeTrabaja() = [universidad.provincia()]
    method cobrar(unImporte){
        universidad.donaciones(unImporte * 0.5)
    }
}

class ProfesionalAsociado{
    const property universidad
    method provinciasDondeTrabaja() = ["Entre Rios","Santa Fe", "Corrientes"]
    method honorario() = 3000
    method cobrar(unImporte){
        asociacionDeProfesionalesDelLitoral.recibirDonaciones(unImporte)
    }
}

class ProfesionalLibre{
    var totalRecaudado = 0
    const property universidad
    const property provinciasDondeTrabaja = []
    var property honorario
    method agregarProvincia(unaProvincia){
        provinciasDondeTrabaja.add(unaProvincia)
    }
    method cobrar(unImporte){
        totalRecaudado += unImporte
    }
    method totalRecaudado() = totalRecaudado

    method pasarDinero(unProfesional, unImporte){
        unProfesional.cobrar(unImporte)
        totalRecaudado = 0.max(totalRecaudado - unImporte)
    }
}

object asociacionDeProfesionalesDelLitoral{
    var donaciones = 0
    method recibirDonaciones(unImporte){
        donaciones += unImporte
    }
    method donaciones() = donaciones
}