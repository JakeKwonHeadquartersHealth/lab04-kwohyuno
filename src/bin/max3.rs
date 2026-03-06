use std::cmp::max;
use std::env;
use std::process;

extern "C" {
    fn max3_s(a: i32, b: i32, c: i32) -> i32;
}

fn max3(a: i32, b: i32, c: i32) -> i32 {
    max(a, max(b, c))
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        println!("usage: max3 a b c");
        process::exit(-1);
    }

    let a: i32 = args[1].parse().unwrap_or(0);
    let b: i32 = args[2].parse().unwrap_or(0);
    let c: i32 = args[3].parse().unwrap_or(0);

    let rust_result = max3(a, b, c);
    println!("Rust: {}", rust_result);

    let s_result = unsafe { max3_s(a, b, c) };
    println!("Asm: {}", s_result);
}
