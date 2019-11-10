class Ave {
var property fuerza
	
	method recibirDisgusto()
	method relajarse()
	method estaConformeCon(isla)
	method alimentarseDe(isla)	
}

class Aguilucho inherits Ave {
var property velocidad = 20

	override method fuerza() {
		return if (velocidad <= 60) {
			180
		} else {
			velocidad * 3
		}
	}
	override method recibirDisgusto() {
		velocidad = velocidad * 2
	}
	override method relajarse() {
		velocidad -= 10
	}
	override method estaConformeCon(isla) {
		return isla.alpiste() >= 8
	}
	override method alimentarseDe(isla) {
		isla.alpiste(-3)
		velocidad += 15 
	} 	
}

class Albatros inherits Ave {
var property peso = 4000
var property masaMuscular = 600
	
	override method fuerza() {
		return if (peso < 6000) {
			masaMuscular
		} else {
			masaMuscular / 2
		}
	}
	override method recibirDisgusto() {
		peso += 800
	}
	method irAlGym() {
		peso += 500
		masaMuscular += 500
	}
	override method relajarse() {
		peso -= 300
	}
	override method estaConformeCon(isla) {
		return isla.aves().count{a => a.fuerza() > self.fuerza()} <= 2
	}
	override method alimentarseDe(isla) {
		isla.maiz(-4)
		peso += 700
		masaMuscular += 700
	}
}

class Paloma inherits Ave {
var property ira = 200

	override method fuerza() = ira * 2
	override method recibirDisgusto() {
		ira += 300
	}
	override method relajarse() {
		ira -= 50
	}
	override method estaConformeCon(isla) {
		return isla.obtenerAvesDebilesDe(isla).size() <= 1
	}
	override method alimentarseDe(isla) {}
	method equilibrarse() {
		if (self.fuerza() <= 700) {
			self.recibirDisgusto()
		} else {
			self.relajarse()
		}
	}	
}

class AguiluchoColorado inherits Aguilucho {
	override method fuerza() {
		return super() + 400
	}
}

class PalomaTorcaza inherits Paloma {
var property huevos = 3

	override method fuerza() = super() + 100 * huevos
	override method recibirDisgusto() {
		super() ; huevos ++
	}
}

class PalomaMontera inherits Paloma {
	override method fuerza() {
		var tope = 2000
		return if (super() > tope) {
			tope
		} else {
			super()
		}
	}	
}

class PalomaManchada inherits Paloma {
const property nidos = #{}

	override method recibirDisgusto() {
		super()
		nidos.add(self.construirNido()) 
	}
	method construirNido() {
		return new Nido()
	}
	override method relajarse() {
		if (nidos.size() > 2) {
			nidos.forEach{n => n.grosor(+1)}
		} else {
			super()
		}
	}
	override method ira() {
		return super() + nidos.sum{n => n.potencia()}
	}	
}

class Nido {
var property grosor = 5
var property resistencia = 3

	method potencia() = (grosor * resistencia) + 20
}