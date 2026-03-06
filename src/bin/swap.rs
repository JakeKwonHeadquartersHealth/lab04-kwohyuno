use std::env;
use std::process;

extern "C" {
    fn swap_s(arr: *mut i32, i: i32, j: i32);
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
    if args.len() < 4 {
        println!("usage: swap i j a0 a1 [a2 ...]");
        process::exit(-1);
    }

    let i: i32 = args[1].parse().unwrap_or(0);
    let j: i32 = args[2].parse().unwrap_or(0);
    let original: Vec<i32> = args[3..].iter().map(|s| s.parse().unwrap_or(0)).collect();

    let mut arr = original.clone();
    arr.swap(i as usize, j as usize);
    print_array("Rust:", &arr);

    let mut arr = original;
    unsafe { swap_s(arr.as_mut_ptr(), i, j) };
    print_array("Asm:", &arr);
}
