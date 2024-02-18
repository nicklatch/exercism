package gross // Units stores the Gross Store unit measurements.
func Units() map[string]int {
	units := make(map[string]int)
	units["quarter_of_a_dozen"] = 3
	units["half_of_a_dozen"] = 6
	units["dozen"] = 12
	units["small_gross"] = 120
	units["gross"] = 144
	units["great_gross"] = 1728

	return units
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return make(map[string]int)
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	val, exists := units[unit]
	if exists {
		bill[item] += val
	}

	return exists
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	unitVal, unitExits := units[unit]
	itemVal, itemExists := bill[item]
	diff := itemVal - unitVal

	if unitExits && itemExists {
		if diff > 0 {
			bill[item] -= unitVal
			return unitExits && itemExists
		} else if diff == 0 {
			delete(bill, item)
			return unitExits && itemExists
		}
	}
	return false
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	if qty, exists := bill[item]; exists {
		return qty, exists
	}
	return 0, false
}
