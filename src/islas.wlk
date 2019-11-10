import aves.*

class Isla {
const property aves = #{}
var property alpiste = 10
var property maiz = 10

	method obtenerAvesDebilesDe(isla) {
		return isla.aves().filter{a => a.fuerza() < 1000}
	}
	method obtenerFuerzaTotalDe(isla) {
		return isla.aves().sum{a => a.fuerza()}
	}
	method es_Robusta(isla) {
		return isla.aves().all{a => a.fuerza() > 300}
	}
	method huboUnTerremoto() {
		aves.forEach{a => a.recibirDisgusto()}
	}
	method huboUnaTormenta() {
		self.obtenerAvesDebilesDe(self).forEach{a => a.recibirDisgusto()}
	}
	method avesCandidatas() {
		return aves.filter{a => a.fuerza().between(1000,3000)}
	}
	method aveCapitana() {
		return self.avesCandidatas().max{a => a.fuerza()}
	}
	method sesionDeRelax() {
		aves.forEach{a => a.relajarse()}
	}
	method estaEnPaz() {
		return aves.all{a => a.estaConformeCon(self)}
	}
	method sesionDeAlimentacion() {
		aves.forEach{a => a.alimentarseDe(self)}
	} 	
}