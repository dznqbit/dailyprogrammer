// https://www.reddit.com/r/dailyprogrammer/comments/4msu2x/challenge_270_easy_transpose_the_input_text/

use std::io;
use std::io::prelude::*;

fn main() {
    let mut stdin = io::stdin();
    let mut input = String::new();

    stdin.read_to_string(&mut input).unwrap();

    // Start with an array of empty Strings.
    let max_len = input.lines().map(|l| l.len()).max().unwrap();
    let mut transposed: Vec<String> = vec![String::new(); max_len];

    for l in input.lines() {
        // append each character to the corresponding output String.
        for (ci, c) in l.chars().enumerate() { 
            transposed[ci].push(c); 
        }
        
        // Pad ending entries to keep length identical
        let l_len = l.len();
        for i in 0..(max_len - l_len) { 
            transposed[l_len + i].push(' '); 
        }
    }

    for line in &transposed {
        println!("{}", line);
    }
}
