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

/*
 * Discriminant: (https://doc.rust-lang.org/nightly/reference.html#enumerations)
 * You can cast an enum to get this value:
 * let x = Foo::Bar as u32; // x is now 123u32
 */

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
