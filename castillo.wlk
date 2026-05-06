object castillo {
    const artefactos= #{}

    method guardarArtefactos(_artefactos) {
        artefactos.addAll(_artefactos)
    }
    method artefactosGuardados() {
        return artefactos
    }
    method elArtefactoMasValiosoPara(personaje){
        return artefactos.maxIfEmpty({art => art.poderDePeleaPara(personaje)}, {self.error("No hay artefactos en el hogar")})
    }
  
}