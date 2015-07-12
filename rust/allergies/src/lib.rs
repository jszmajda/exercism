// Why PartialEq and not Eq?
#[derive(Debug,PartialEq)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128
}

// very surprising to have to publicize the only member of this tuple struct
pub struct Allergies(pub u8);

impl Allergies {
    pub fn is_allergic_to(&self, _a: &Allergen) -> bool {
        false
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        vec![]
    }
}
