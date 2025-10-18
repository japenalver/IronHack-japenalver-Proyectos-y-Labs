# viking_game.py
from vikingsClasses import Viking, Saxon, War
import random
import time

# --- Function auxiliar para crear ejércitos ---
def create_army():
    war = War()

    # Creat Vikingos
    viking_names = ["Ragnar", "Lagertha", "Floki", "Bjorn", "Ivar"]
    for _ in range(3):
        name = random.choice(viking_names)
        health = random.randint(80, 120)
        strength = random.randint(25, 40)
        viking = Viking(name, health, strength)
        war.addViking(viking)

    # Crea 5 Sajones
    for _ in range(5):
        health = random.randint(60, 90)
        strength = random.randint(15, 30)
        saxon = Saxon(health, strength)
        war.addSaxon(saxon)

    return war


# --- Juego de simulación ---
def play_war():
    war = create_army()

    print("\n===  THE GREAT VIKING WAR BEGINS ===\n")
    round_number = 1

    while len(war.vikingArmy) > 0 and len(war.saxonArmy) > 0:
        print(f"--- ROUND {round_number} ---")

        # Elige aleatoriamente quién ataca primero
        if random.choice(["viking", "saxon"]) == "viking":
            result = war.vikingAttack()
            print(f"Viking attacks! → {result}")
        else:
            result = war.saxonAttack()
            print(f"=== Saxon attacks! → {result}")

        print(f"Vikings left: {len(war.vikingArmy)} | Saxons left: {len(war.saxonArmy)}")
        print("-" * 40)

        time.sleep(1)
        round_number += 1

    # Muestra resultado final
    print("\n>>> Final Status:")
    print(war.showStatus())


# --- Ejecuta el juego ---
if __name__ == "__main__":
    play_war()
