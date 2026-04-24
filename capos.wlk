object rolando{
    var capacidadMochila = 2
    const mochila = #{}
    const historialArtefactos = []

    method recolectar(artefacto) {
        mochila.add(artefacto)
    }
    method encontrar(_artefacto) {
        if (self.verificarMochila()){
            self.recolectar(_artefacto)
        }
        historialArtefactos.add(_artefacto) //1.4
    }
    method capacidadMochila(_capacidadMochila) {
      capacidadMochila = _capacidadMochila
    }
    method verificarMochila() {
        return mochila.size() < capacidadMochila
    }
    method elementosMochila() {
        return mochila
    }
    // 1.2
    method llegarA(lugar) {
        lugar.guardarArtefactos(mochila)
        mochila.clear()
    }
    //1.3
    const hogar = castillo

    method artefactosRecolectados() {
      return mochila.union(hogar.artefactosGuardados())
    }
    method contiene(_artefacto){
        return self.artefactosRecolectados().any({elemento => elemento == _artefacto})
    }
    //1.4
    method artefactosEncontrados() {
        return historialArtefactos
    }
    //2.1
    var poderBase = 0

    method poderBase(_poderBase) {
        poderBase = _poderBase
    }
    method poderBase() {
      return poderBase
    }

    method poderDePelea() {
        return poderBase + mochila.sum({artefacto => artefacto.poderDePeleaPara(self)})
    }
    method pelearBatalla(){
        //self.poderBase(1+poderBase)
        self.aumentarPoderBase()
        mochila.forEach({elemento => elemento.usar()})
    }
    method aumentarPoderBase() {
        poderBase = poderBase + 1
    }
    // 2.2
    method artefactoMasValiosoEnHogar() {
        if (hogar.artefactosGuardados().isEmpty()){
            return null
        }
        else {
            return hogar.artefactosGuardados().max({elemento => elemento.poderDePeleaPara(self)})
        }
    }
    // 2.3
    method enemigosAGanarDe(lugar) {
        const enemigos = lugar.enemigos()
        return enemigos.filter({enemigo => enemigo.debilCon(self)})
    }
    method moradasAConquistar(lugar) {
        return self.enemigosAGanarDe(lugar).map({enemigo => enemigo.morada()})
      
    }
    // 2.4
    method poderosoEn(lugar) {
        const enemigos = lugar.enemigos()
        return enemigos.all({enemigo => enemigo.debilCon(self)})
    }
    // 2.5
    method artefactoFatalContra(enemigo) {
        // Retorna si existe algun elemento fatal para el enemigo dado
        return self.artefactosRecolectados().any({elemento => elemento.letalDePara(self,enemigo)})
    }
    method artefactoFatalPara(enemigo) {
        // Si existe artefacto letal para el enemigo dado, nos lo retorna
        if (self.artefactoFatalContra(enemigo)){
            return self.artefactosRecolectados().find({elemento => elemento.letalDePara(self,enemigo)})
        }
        else {
            return "No hay artefacto letal"
        }
    }

}
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
        const artefacto = personaje.artefactoMasValiosoEnHogar()
        if (artefacto != null){
        return artefacto.poderDePeleaPara(personaje)
        }
        else {return 0}
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
object castillo {
    const artefactos= #{}

    method guardarArtefactos(_artefactos) {
        artefactos.addAll(_artefactos)
    }
    method artefactosGuardados() {
        return artefactos
    }
  
}
object erethia {
    const enemigos = #{caterina,archibaldo,astra} 

    method enemigos() {
      return enemigos
    }
  
}
object caterina {

    method poderDePelea() {
      return 28
    }
    method morada() {
      return "fortalezaDeAcero"
    }
    method debilCon(enemigo) {
        return self.poderDePelea() < enemigo.poderDePelea()
    }
}
object archibaldo {
    method poderDePelea() {
      return 16
    }
    method morada() {
      return "palacioDeMarmol"
    }
    method debilCon(enemigo) {
        return self.poderDePelea() < enemigo.poderDePelea()
    }
}
object astra {
    method poderDePelea() {
      return 14
    }
    method morada() {
      return "torreDeMarfil"
    }
    method debilCon(enemigo) {
        return self.poderDePelea() < enemigo.poderDePelea()
    }
}
