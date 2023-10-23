import Foundation

// 5. Enums e Structs
enum TipoAnimal {
    case mamífero, pássaro, réptil
}

// 4. Funções e Closures
protocol AnimalProtocol {
    var nome: String { get }
    var tipo: TipoAnimal { get }
    
    func fazerBarulho()
}

struct Animal: AnimalProtocol {
    var nome: String
    var tipo: TipoAnimal
    
// Implementação do protocolo
    func fazerBarulho() {
        switch tipo {
        case .mamífero:
            print("O \(nome) faz um rugido poderoso!")
        case .pássaro:
            print("O \(nome) emite um canto melodioso.")
        case .réptil:
            print("A \(nome) emite um sibilo sinistro.")
        }
    }
}

// 6. Concorrências
func processarAnimais(_ animais: [AnimalProtocol]) {
    let dispatchQueue = DispatchQueue(label: "myQueue", attributes: .concurrent)
    let group = DispatchGroup()
    
    for animal in animais {
        dispatchQueue.async(group: group) {
            animal.fazerBarulho()
        }
    }
    
    group.notify(queue: .main) {
        print("Todos os processos em segundo plano foram concluídos.")
    }
}

// Criação de instâncias de animais
let leao = Animal(nome: "Leão", tipo: .mamífero)
let aguia = Animal(nome: "Águia", tipo: .pássaro)
let cobra = Animal(nome: "Cobra", tipo: .réptil)

let animais: [AnimalProtocol] = [leao, aguia, cobra]

processarAnimais(animais)
