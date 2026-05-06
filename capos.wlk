import castillo.*
import erethia.*
import artefactos.*

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
    method capacidadMochila() {
      return capacidadMochila
    }
    method verificarMochila() {
        return mochila.size() < capacidadMochila
    }
    method elementosMochila() {
        return mochila
    }
    // 1.2
    method llegarAHogar() {
        hogar.guardarArtefactos(mochila)
        mochila.clear()
    }
    //1.3
    const hogar = castillo

    method hogar(){
        return hogar
    }
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
        return poderBase + self.poderArtefactosTotal()
    }
    method poderArtefactosTotal() {
        return mochila.sum({artefacto => artefacto.poderDePeleaPara(self)})
    }
    method pelearBatalla(){
        //self.poderBase(1+poderBase)
        self.usarArtefactosEnMochila()
        self.aumentarPoderBase()
    
    }
    method usarArtefactosEnMochila() {
        mochila.forEach({elemento => elemento.usar()})
    }
    method aumentarPoderBase() {
        poderBase = poderBase + 1
    }
    // 2.2
    method artefactoMasValiosoEnHogar() {
       return hogar.elArtefactoMasValiosoPara(self)
    }
    // 2.3
    method enemigosAGanarDe(lugar) {

        return lugar.enemigosGanablesPara(self)

        /*const enemigos = lugar.enemigos()
        return enemigos.filter({enemigo => enemigo.debilCon(self)})
   */ }
    method moradasAConquistar(lugar) {
        return self.enemigosAGanarDe(lugar).map({enemigo => enemigo.morada()})
      
    } 
    // 2.4
    method poderosoEn(lugar) {
        return lugar.esEnemigoPoderoso(self)
        /*const enemigos = lugar.enemigos()
        return enemigos.all({enemigo => enemigo.debilCon(self)})*/
    }
    // 2.5
    method existeArtefactoFatalContra(enemigo) {
        // Retorna si existe algun elemento fatal para el enemigo dado
        return self.artefactosRecolectados().any({elemento => elemento.letalDePara(self,enemigo)})
    }
    method artefactoFatalPara(enemigo) {
        // Si existe artefacto letal para el enemigo dado, nos lo retorna
        return self.artefactosRecolectados().find({elemento => elemento.letalDePara(self,enemigo)})
    
    }

}

