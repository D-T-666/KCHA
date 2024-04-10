fn bisection_method(mut l: f64, mut r: f64, f: fn(f64)->f64, tol: f64) -> f64 {
    while (r - l) / 2.0 > tol {
        let m = (l + r) / 2.0;
        if f(m) == 0.0 {
            return m
        } else if f(l) * f(m) < 0.0 {
            r = m
        } else {
            l = m
        }
    }
        
    (l + r) / 2.0
}

fn main() {
    let a = |x: f64| 3.0 * x.powi(3) + x.powi(2) - x - 5.0;
    let b = |x: f64| x.cos().powi(2) - x + 6.0;
    
    let a = bisection_method(-100.0, 100.0, a, 1e-7);
    let b = bisection_method(-100.0, 100.0, b, 1e-7);
    
    println!("a: {a} \nb: {b}")
}
