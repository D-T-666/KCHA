fn fixed_point(f: fn(f64)->f64, x_0: f64, tol: f64) -> f64 {
    let mut x = x_0;
    for _ in 0..1000 {
        let new_x = -f(x) / 100.0 + x;
        if (new_x - x).abs() < tol {
            return x
        }
        x = new_x;
    }
    let mut x = x_0;
    for _ in 0..1000 {
        let new_x = f(x) / 100.0 + x;
        if (new_x - x).abs() < tol {
            return x
        }
        x = new_x;
    }
    x_0
}

fn main() {
    let a = |x: f64| x.powf(5.0) + 1.0 * x - 1.0;
    let b = |x: f64| x.sin() - 6.0 * x - 5.0;
    let c = |x: f64| x.ln() + x.powf(2.0) - 3.0;

    println!("Fixed-point iteration method:");
    let a_solution = fixed_point(a, 0.754, 1e-10);
    println!("(a) x = {:.10}", a_solution);

    let b_solution = fixed_point(b, -0.97, 1e-10);
    println!("(b) x = {:.10}", b_solution);

    let c_solution = fixed_point(c, 1.5, 1e-10);
    println!("(c) x = {:.10}", c_solution);
}