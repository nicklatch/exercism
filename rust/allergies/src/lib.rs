#[derive(PartialEq, Debug, Clone)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,

    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
}

impl Allergen {
    fn all_allergens() -> Vec<Allergen> {
        use Allergen::*;
        vec![
            Eggs,
            Peanuts,
            Shellfish,
            Strawberries,
            Tomatoes,
            Chocolate,
            Pollen,
            Cats,
        ]
    }
}

pub struct Allergies {
    score: usize,
}

impl Allergies {
    pub fn new(score: usize) -> Allergies {
        Allergies { score: score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.score & (allergen.clone() as usize) > 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        Allergen::all_allergens()
            .into_iter()
            .filter(|allergen| self.is_allergic_to(&allergen))
            .collect()
    }
}
