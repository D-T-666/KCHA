use gnuplot::{Caption, Color, Figure, ContourStyle, AutoOption::{Auto, self, Fix}, PlotOption::{self, LineStyle}, AxesCommon, DashType, XAxis, YAxis};

fn main() {
    let mut data = Vec::new();
    
    let s = 10.0f64;
    let n = 50usize;
    for i in 0..n as i32 {
        // let mut row = Vec::new();
        for j in 0..n as i32 {
            let x = (i-n as i32 /2) as f32 * 2.0 * s as f32 / n as f32;
            let y = (j-n as i32 /2) as f32 * 2.0 * s as f32 / n as f32;
            // let t = ((i-n as i32 /2) as f32 * 8.0 / n as f32).powi(2) + ((j-n as i32/2) as f32 * 8.0 / n as f32).powi(2);
            // data.push(t.cos() / (t + 1.0));
            let t = x * x + y * y;
            data.push(t);
        }
        // data.push(row);
    }
    
    let mut fg = Figure::new();
    fg.axes3d()
        .surface(data, n, n, Some((-s, -s, s, s)), &[PlotOption::Color("white")])
        .set_x_grid(true)
        .set_y_grid(true)
        .show_contours(true, false, ContourStyle::Spline(16, 16), AutoOption::Auto, Auto);
    // fg.show().unwrap();
    fg.save_to_pdf("1-2-a-2.pdf", 5.0, 4.0).unwrap();
}