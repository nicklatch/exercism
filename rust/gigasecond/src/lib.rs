use time::{Duration, PrimitiveDateTime as DateTime};

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
   let one_giga_later =  start.checked_add(Duration::seconds(1000000000));

    one_giga_later.unwrap()
}
