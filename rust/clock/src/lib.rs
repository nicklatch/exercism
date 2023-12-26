#[derive(Debug, Eq, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_mins: i32 = hours * 60 + minutes;
        let adjusted_total_mins: i32 = match total_mins < 0 {
            true => total_mins + (((1 - (total_mins.div_euclid(24 * 60))) * 24) * 60),
            false => total_mins
        };

        Clock {
            hours: adjusted_total_mins
                .div_euclid(60)
                .rem_euclid(24),
            minutes: adjusted_total_mins.rem_euclid(60),
        }
    }


    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.hours, self.minutes + minutes)
    }
}


impl std::fmt::Display for Clock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> Result<(), std::fmt::Error> {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}