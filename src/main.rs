use std::env;
use std::fs;
fn main() {
    let file_name: Vec<_> = env::args().collect();
    if file_name.len() < 2 {
        eprint!("Did not provide a filename");
        return;
    } else if file_name.len() > 2 {
        eprint!("Too many arguments");
        return;
    }
    let mut offset_count = 0;
    let mut byte_count = 0;
    let file_contents = fs::read(&file_name[1]).expect("Couldn't read the file.");
    for bytes in &file_contents {
        if byte_count == 0 {
            let offset = offset_count * 16;
            print!("{:08x}", offset);
        }
        print!(" {:02x} ", bytes);
        byte_count += 1;
        if byte_count == 16 {
            println!();
            byte_count = 0;
            offset_count += 1;
        }
    }
}
