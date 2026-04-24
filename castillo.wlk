object castillo {
    const artefactos= #{}

    method guardarArtefactos(_artefactos) {
        artefactos.addAll(_artefactos)
    }
    method artefactosGuardados() {
        return artefactos
    }
  
}