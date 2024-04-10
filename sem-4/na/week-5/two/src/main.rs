fn main() {
    let (mut x1, mut x2) = (1.0f64, 1.0f64);
    let mut count = 0usize;
    
    loop {
        let nx1 = (x2 * x2 / 3.0).sqrt();
        let nx2 = ((x1 * x1 + 1.0 / x1) / 3.0).sqrt();
        
        if (x1 - nx1).abs().max((x2 - nx2).abs()) < 1e-10 {
            println!("{x1}, {x2}  in {count} iterations");
            break;
        }
        
        (x1, x2) = (nx1, nx2);
        count += 1;
    }
}
