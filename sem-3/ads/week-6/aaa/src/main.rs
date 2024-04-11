use std::{rc::Rc, borrow::BorrowMut};

struct LL {
    v: i32,
    next: Option<Rc<LL>>
}

struct Queue {
    pointers: Option<(Rc<LL>, Rc<LL>)>
}

impl Queue {
    fn enqueue(&mut self, v: i32) {
        let n = Rc::new(LL { v, next: None });

        self.pointers = Some(match self.pointers {
            None => (n, n),
            Some((start, end)) => {
                end.borrow_mut().next = Some(n);
                (start, n)
            }
        });
    }

    fn dequeue(&mut self) -> Option<v> {
        if 
    }
}

fn main() {
    let mut q = Queue {a: vec![], b: vec![], en: true};

    for i in 1..=10 {
        q.enqueue(i)
    }

    while let Some(v) = q.dequeue() {
        println!("{}", v);
    }
}
