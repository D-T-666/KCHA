fn secants_method(l: f64, r: f64, f: fn(f64)->f64, tol: f64) -> f64 {
    let mut x = (l, r);

    while (x.0 - x.1).abs() / 2.0 > tol {
        x = (x.1, x.1 - f(x.1) * (x.1 - x.0) / (f(x.1) - f(x.0)));
    }

    return (x.0 + x.1) / 2.0;
}

fn main() {
    let a = |x: f64| 3.0 * x.powi(3) + x.powi(2) - x - 5.0;
    let b = |x: f64| x.cos().powi(2) - x + 6.0;
    
    let a = secants_method(1.0, 10.0, a, 1e-7);
    let b = secants_method(-10.0, 10.0, b, 1e-7);

    println!("a: {a} \nb: {b}")
}