fn newtons_method(f: fn(f64)->f64, der_f: fn(f64)->f64, mut x: f64, tol: f64) -> f64 {
    for _ in 0..20 {
        let new_x = x - f(x) / der_f(x);
        if (new_x - x).abs() < tol {
            x = new_x;
            break
        }
        x = new_x;
    }
    x
}

fn main() {
    let a = |x: f64| x.powf(5.0) + 1.0 * x - 1.0;
    let der_a = |x: f64| 5.0 * x.powf(4.0) + 1.0;
    let b = |x: f64| x.sin() - 6.0 * x - 5.0;
    let der_b = |x: f64| x.cos() - 6.0;
    let c = |x: f64| x.ln() + x.powf(2.0) - 3.0;
    let der_c = |x: f64| 1.0 / x + 2.0 * x;

    let a_solution = newtons_method(a, der_a, 0.754, 1e-8);
    println!("(a) x = {:.10}", a_solution);
    
    let b_solution = newtons_method(b, der_b, -0.97, 1e-8);
    println!("(b) x = {:.10}", b_solution);
    
    let c_solution = newtons_method(c, der_c, 1.5, 1e-8);
    println!("(c) x = {:.10}", c_solution);
}