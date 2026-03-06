.PHONY: all clean c rust

all:
	cargo build --manifest-path Cargo.toml

clean:
	cargo clean --manifest-path Cargo.toml
