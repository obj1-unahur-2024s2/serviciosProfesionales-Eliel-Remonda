import universidades.*
class Empresa{
    const property profesional = []
    const property clientes = []
    var property honorarioReferencia
    method contratarProfesional(unProfesional){
        profesional.add(unProfesional)
    }

    method cuantosEstudiaronEn(unaUniversidad){
        return profesional.count({p => p.universidad() == unaUniversidad})
    }

    method profesionalesCaros(){
        return profesional.filter({p => p.honorario() > honorarioReferencia}).asSet()
    }
    method universidadesFormadoras(){
        return profesional.map({p => p.universidad()}).asSet()
    }
    method profesionalMasBarato(){
        return profesional.min({p => p.honorario()})
    }
    method esDeGenteAcotada(){
        return profesional.all({p => p.provinciasDondeTrabaja().size() <= 3})
    }
    method puedeSatisfacer(unSolicitante){
        return profesional.any({p => unSolicitante.puedeSerAtendidoPor(p)})
    }
    method darServicio(unSolicitante){
        if (self.puedeSatisfacer(unSolicitante)){
            const unProf = profesional.find({p => unSolicitante.puedeSerAtendidoPor(p)})
            unProf.cobrar(unProf.honorario())
            clientes.add(unSolicitante)
        }
    }
    method cantidadClientes(){
        return clientes.size()
    }
    method tieneComoClientesA(unSolicitante){
        return clientes.contains(unSolicitante)
    }
    method esProfesionalPocoAtractivo(unProfesional){
        const prof = unProfesional.provinciasDondeTrabaja().asSet()
        const otroProf = profesional.find({p => p.provinciasDondeTrabaja().asSet() == prof})
        return otroProf.any({p => p.honorario() < unProfesional.honorario()})
    }
}