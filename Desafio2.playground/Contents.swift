import Foundation

// 5. Enums e Structs
enum TipoAnimal {
    case mamífero, pássaro, réptil
}

struct Animal {
    var nome: String
    var tipo: TipoAnimal
}

// 2. Controle de Fluxos
func verificaTipo(animal: Animal) -> String {
    switch animal.tipo {
    case .mamífero:
        return "É um mamífero."
    case .pássaro:
        return "É um pássaro."
    case .réptil:
        return "É um réptil."
    }
}

// 1. Programação Orientada a Objetos
class Zoo {
    var animais: [Animal] = []
    
    func adicionarAnimal(_ animal: Animal) {
        animais.append(animal)
    }
    
// 3. Coleções
    func listarNomesDosAnimais() -> [String] {
        return animais.map { $0.nome }
    }
    
// 4. Funções e Closures
    func processarAnimais(_ closure: (Animal) -> Void) {
        for animal in animais {
            closure(animal)
        }
    } 
}

// 6. Concorrências
let dispatchQueue = DispatchQueue(label: "myQueue", attributes: .concurrent)
let group = DispatchGroup()

let zoo = Zoo()
zoo.adicionarAnimal(Animal(nome: "Leão", tipo: .mamífero))
zoo.adicionarAnimal(Animal(nome: "Águia", tipo: .pássaro))
zoo.adicionarAnimal(Animal(nome: "Cobra", tipo: .réptil))

let nomes = zoo.listarNomesDosAnimais()
print("Nomes dos animais no zoológico: \(nomes)")

zoo.processarAnimais { animal in
    print("Processando \(animal.nome) - \(verificaTipo(animal: animal)) em segundo plano.")
}

group.notify(queue: .main) {
    print("Todos os processos em segundo plano foram concluídos.")
}
