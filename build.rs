fn main() {
    cc::Build::new()
        .file("asm/max3_s.s")
        .file("asm/swap_s.s")
        .file("asm/sort_s.s")
        .file("asm/fibrec_s.s")
        .file("asm/sumabs_s.s")
        .compile("asm_functions");

    println!("cargo:rerun-if-changed=asm/max3_s.s");
    println!("cargo:rerun-if-changed=asm/swap_s.s");
    println!("cargo:rerun-if-changed=asm/sort_s.s");
    println!("cargo:rerun-if-changed=asm/fibrec_s.s");
    println!("cargo:rerun-if-changed=asm/sumabs_s.s");
}
