object erethia {
    const enemigos = #{caterina,archibaldo,astra} 

    method enemigos() {
      return enemigos
    }
    method enemigosGanablesPara(personaje){
      return enemigos.filter({enemigo => enemigo.debilCon(personaje)})
    }
    method esEnemigoPoderoso(personaje) {
      return enemigos.all({enemigo => enemigo.debilCon(personaje)})
    }
  
}
object caterina {

    method poderDePelea() {
      return 28
    }
    method morada() {
      return fortalezaDeAcero
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
      return palacioDeMarmol
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
      return torreDeMarfil
    }
    method debilCon(enemigo) {
        return self.poderDePelea() < enemigo.poderDePelea()
    }
}
object palacioDeMarmol {
  
}
object fortalezaDeAcero {
  
}
object torreDeMarfil {
  
}
