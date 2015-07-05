pub fn anagrams_for<'a> (source: &str, candidates: &'a [&str]) -> Vec<&'a str> {
    // not really sure why I need this map in the pipeline
    candidates.into_iter().map(|e| *e ).filter( |example| {
        is_anagram_of(source, *example)
    }).collect::<Vec<&str>>()
}


// sorts string bytes and compares the result. It might be faster to walk each string once, build
// some data structure, and compare that but I'm not braining well today.
fn is_anagram_of(source: &str, test: &str) -> bool {
    let lowered_source = lower(source.to_string());
    let lowered_test   = lower(test.to_string());
    if lowered_source == lowered_test {
        return false
    } else {
        let mut sb = lowered_source.into_bytes();
        let mut tb = lowered_test.into_bytes();
        sb.sort_by(|a,b| a.cmp(b));
        tb.sort_by(|a,b| a.cmp(b));
        sb == tb
    }
}

fn lower(str: String) -> String {
    // good god this is hideous
    str.chars().into_iter().map(|c| c.to_lowercase().next().unwrap() ).collect::<String>()
}
