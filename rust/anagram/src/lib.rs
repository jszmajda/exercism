pub fn anagrams_for<'a> (source: &str, candidates: &'a [&str]) -> Vec<&'a str> {
    candidates.iter()
              .map(AsRef::as_ref) // equiv .map({|e| *e })
              .filter( |example| { is_anagram_of(source, *example) })
              .collect()
}


// sorts string characters and compares the result. It might be faster to walk each string once, build
// some data structure, and compare that but I'm not braining well today.
fn is_anagram_of(source: &str, test: &str) -> bool {
    let uppered_source = upper(source);
    let uppered_test   = upper(test);

    if uppered_source == uppered_test { return false; }

    let mut sc: Vec<char> = uppered_source.chars().collect();
    let mut tc: Vec<char> = uppered_test.chars().collect();
    sc.sort();
    tc.sort();
    sc == tc
}

// this is basically Rust 1.2's String::to_uppercase
fn upper(s: &str) -> String {
    let mut upper_string = String::with_capacity(s.len());
    upper_string.extend(s.chars().flat_map(|c| c.to_uppercase()));
    return upper_string;
}
