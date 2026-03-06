use std::env;
use std::process;

extern "C" {
    fn sumabs_s(arr: *const i32, len: i32) -> i32;
}

fn sumabs(arr: &[i32]) -> i32 {
    arr.iter().map(|x| x.abs()).sum()
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("usage: sumabs n1 n2 ...");
        process::exit(-1);
    }

    let arr: Vec<i32> = args[1..].iter()
        .map(|s| s.parse().unwrap_or(0))
        .collect();

    let rust_result = sumabs(&arr);
    println!("Rust: {}", rust_result);

    let s_result = unsafe { sumabs_s(arr.as_ptr(), arr.len() as i32) };
    println!("Asm: {}", s_result);
}
