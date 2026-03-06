use std::env;

extern "C" {
    fn fibrec_s(n: i32) -> i32;
}

fn fibrec(n: i32) -> i32 {
    if n <= 1 {
        return n;
    }
    fibrec(n - 1) + fibrec(n - 2)
}

fn main() {
    let n: i32 = env::args().nth(1).unwrap_or_default().parse().unwrap_or(0);

    let rust_result = fibrec(n);
    println!("Rust: {}", rust_result);

    let s_result = unsafe { fibrec_s(n) };
    println!("Asm: {}", s_result);
}
