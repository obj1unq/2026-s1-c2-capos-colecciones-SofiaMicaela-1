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
