import UIKit

let nomeConstante = "Steve"

var nomeOpcional: String? = "Jobs"


print("Nome completo: \(nomeConstante) \(nomeOpcional ?? "Wozniack")")

if let nome = nomeOpcional {
    print("Nome completo: \(nomeConstante) \(nome)")
}
