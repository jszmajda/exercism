// only need a u16 to handle incoming data in the tests but maybe u64 is more future proof?
pub fn is_leap_year(year: u16) -> bool {
    if year % 100 == 0 && year % 400 != 0 {
        false
    } else {
        year % 4 == 0
    }
}
