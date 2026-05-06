object espadaDelDestino {
    var usado = false

    method poderDePeleaPara(personaje){
        if (usado){
            return personaje.poderBase() / 2
        }
        else {
            return personaje.poderBase()
        }
    }
    method usar() {
      usado = true
    }
    method letalDePara(dueño,enemigo) {
        return self.poderDePeleaPara(dueño) > enemigo.poderDePelea()
    }
}
object libroDeHechizos {
    const hechizos = []

    method poderDePeleaPara(personaje) {
        if (hechizos.isEmpty()){
            return 0}
        else {
            return hechizos.first().poderDePeleaPara(personaje)
        }
        
    }
    method usar() {
        if(!hechizos.isEmpty()){
        hechizos.remove(hechizos.get(0))
        }
    }
    method hechizoNuevo(_hechizo) {
        hechizos.add(_hechizo)
    }
    method hechizos() {
        return (hechizos)
    }
    method letalDePara(dueño,enemigo) {
        return self.poderDePeleaPara(dueño) > enemigo.poderDePelea()
    }

}
object bendicion {
    method poderDePeleaPara(personaje) {
      return 4
    }
}
object invisibilidad {
    method poderDePeleaPara(personaje) {
        return personaje.poderBase()
    }
}
object invocacion {
    method poderDePeleaPara(personaje) {
        return personaje.artefactoMasValiosoEnHogar().poderDePeleaPara(personaje)
        /*const artefacto = personaje.artefactoMasValiosoEnHogar()
        if (artefacto != null){
        return artefacto.poderDePeleaPara(personaje)
        }
        else {return 0}
        */
    }
    // aca en vez de fijarme que no este vacio deberia hacer que si esta vacio 
    // tire un error tipo "No hay artefactos en hogar" ? o lo mismo pero en artefactoMasValiosoEnHogar()
}
object collarDivino {
    var usos = 0

    method poderDePeleaPara(personaje) {
        if (personaje.poderBase() > 6){
            return 3 + usos
        }
        else{
            return 3
        }
    }
    method usar() {
      usos = usos + 1 
    }
    method letalDePara(dueño,enemigo) {
        return self.poderDePeleaPara(dueño) > enemigo.poderDePelea()
    }
  
}
object armaduraDeAcero {
    method poderDePeleaPara(personaje) {
      return 6
    }
    method usar() {
    }
    method letalDePara(dueño,enemigo) {
        return self.poderDePeleaPara(dueño) > enemigo.poderDePelea()
    }
}