use std::f64::consts::PI;

fn a() {
    let (mut x1, mut x2) = (0.0, 0.0);
    
    for count in 0..10000 {
        let nx1 = x1 * x1 / 5.0 + x2 * x2 / 80.0 + 0.4;
        let nx2 = nx1 * x2 * x2 / 10.0 + nx1 * 0.4 + 1.6;
        
        if (x1, x2) == (nx1, nx2) {
            println!("{x1}, {x2}  in {count} iterations");            
            break;
        }
        
        (x1, x2) = (nx1, nx2);
    }
}

fn b() {
    let (mut x1, mut x2, mut x3) = (2.1f64, 0.0f64, 0.1f64);
    
    for count in 0..10000 {
        let nx1 = (x2 * x3).cos() / 3.0 + 1.0 / 6.0;
        let nx2 = 0.5 + 625.0 / 2.0 * x2 * x2 - 2.0 * nx1 * nx1;
        let nx3 = (3.0 - 10.0 * PI) / 60.0 - (-nx1 * nx2).exp() / 20.0;
        
        if (x1, x2, x3) == (nx1, nx2, nx3)  {
            println!("{x1}, {x2}, {x3}  in {count} iterations");            
            break;
        }
        
        (x1, x2, x3) = (nx1, nx2, nx3);
    }
}

fn main() {
    a(); b();
}
