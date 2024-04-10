fn main() {
    let (mut x1, mut x2) = (0.0f64, 0.0f64);
    let mut count = 0;
    loop {
        // let (nx1, nx2) = ((
        //     x1*x1 + x2*x2 + 8.0) / 10.0, 
        //     (x1*x2*x2 + x1 + 8.0) / 10.0);
        let nx1 = (x1*x1 + x2*x2 + 8.0) / 10.0;
        let nx2 = (nx1*x2*x2 + nx1 + 8.0) / 10.0;
            
        // if (x1, x2) == (nx1, nx2) {
        if ((x1 - nx1)*(x1 - nx1) + (x2 - nx2)*(x2 - nx2)).sqrt() < 1e-5 {
            println!("{x1}, {x2}  in {count} iterations");
            break;
        }
        (x1, x2) = (nx1, nx2);
        count += 1;
    }

}
