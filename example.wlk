import armas.*
class Gladiador {
  var vida = 100
  method atacar(otroGladiador) {
    otroGladiador.recibirDaño(self)
  }
  method defenderse() {}
  method vida()= vida
  method modificarVida(nuevaVida) {
    vida = nuevaVida
  }
  method recibirDaño(unGladiador) {
    vida = vida - (unGladiador.poderDeAtaque() - self.defensa())
    self.atacar(unGladiador)
  }
  method estaVivo() {
    
  }
  method defensa() 
  method fuerza()
}

class Mirmillon inherits Gladiador {
    var arma 
    var armadura
    var fuerza 

    method armaActual() {
        return arma
    }
    method cambiarArma(nuevaArma) {
        arma = nuevaArma
    }
    method armaduraActual() {
        return armadura
    }
    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }
    override method fuerza() {
      return fuerza
    }
    method cambiarFuerza(nuevaFuerza) {
        fuerza = nuevaFuerza
    }
    method destreza() {
      return 15
    }
    override method defensa() {
       return armadura + self.destreza()
    }
}
class Dimachaer inherits Gladiador {
    const armas = []
    var destreza

    override method fuerza() = 10
    method destreza() = destreza
    method agregarArma(nuevaArma) {
        return armas.add(nuevaArma)
    }
    override method defensa() {
        return destreza/2
    }
    method poderDeAtaque() {
        return armas.sum({a=>a.valorDeAtaque()})
    }
    override method atacar(otroGladiador) {
        super(otroGladiador)
        destreza += 1
    }
    
}
class Arma {
  method valorDeAtaque()
}

class ArmaFilo inherits Arma {
  var property filo
  var longitud

  method longitud() = longitud
  method cambiarLongitud(newLongitud) {
    longitud = newLongitud.max(0).min(1)
  }
  override method valorDeAtaque() = filo * longitud
}

class ArmaContundente inherits Arma {
  var property peso

  override method valorDeAtaque() = peso
}


object casco  {
  method defensa(unGladiador) = 10
}
object escudo {
  method defensa(unGladiador) = 5 + (unGladiador.destreza() * 0.10)
}
class Grupo {
  const gladiadores = [] 
  const nombre
  var cantidadPeleas = 0
  method elCampean() = gladiadores.filter({g => g.estaVivo() })
    
  
}
