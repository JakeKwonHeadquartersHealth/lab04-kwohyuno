use std::env;
use std::process;

extern "C" {
    fn sort_s(arr: *mut i32, len: i32);
}

fn print_array(prefix: &str, arr: &[i32]) {
    print!("{}", prefix);
    for v in arr {
        print!(" {}", v);
    }
    println!();
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("usage: sort up to 32 integers");
        process::exit(-1);
    }

    let original: Vec<i32> = args[1..].iter().map(|s| s.parse().unwrap_or(0)).collect();

    let mut arr = original.clone();
    arr.sort();
    print_array("Rust:", &arr);

    let mut arr = original;
    unsafe { sort_s(arr.as_mut_ptr(), arr.len() as i32) };
    print_array("Asm:", &arr);
}
