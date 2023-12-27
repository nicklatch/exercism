#[derive(Debug)]
pub struct RainDrops {
    num: u32,
    pling: bool,
    plang: bool,
    plong: bool,
}

impl RainDrops {
    fn new(n: u32) -> Self {
        Self {
            num: n,
            pling: n % 3 == 0,
            plang: n % 5 == 0,
            plong: n % 7 == 0,
        }
    }

    fn drops(&self) -> String {
        let mut drops_: Vec<String> = Vec::new();

        if self.pling {
            drops_.push("Pling".to_string());
        }

        if self.plang {
            drops_.push("Plang".to_string());
        }

        if self.plong {
            drops_.push("Plong".to_string());
        }

        if drops_.is_empty() {
            drops_.push(self.num.to_string());
        }

        drops_.concat()
    }
}

pub fn raindrops(n: u32) -> String {
    RainDrops::new(n).drops()
}
