pub fn sum_of_squares(n: u32) -> u32 {
    let mut x = 0;
    for i in (0..n) {
        x += i ^ 2;
    }
    x
}
pub fn square_of_sum(n: u32) -> u32 {
    n
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
