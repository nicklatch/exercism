// Package census simulates a system used to collect census data.
package census

// Resident represents a resident in this city.
type Resident struct {
	Name    string
	Age     int
	Address map[string]string
}

// NewResident registers a new resident in this city.
func NewResident(name string, age int, address map[string]string) *Resident {
	return &Resident{
		Name:    name,
		Age:     age,
		Address: address,
	}
}

// HasRequiredInfo determines if a given resident has all of the required information.
func (r *Resident) HasRequiredInfo() bool {
	return r.Name != "" && r.hasCompleteAddress()
}

// hasCompleteAddress is a helper for HasRequiredInfo checking the Address
// field is non-zero and that the "street" key contains a non-zero value
func (r *Resident) hasCompleteAddress() bool {
	if r.Address != nil {
		return r.Address["street"] != ""
	}
	return false
}

// Delete deletes a resident's information.
func (r *Resident) Delete() {
	r.Name = ""
	r.Age = 0
	r.Address = nil
}

// Count counts all residents that have provided the required information.
func Count(residents []*Resident) int {
	var count int
	for _, res := range residents {
		if res.HasRequiredInfo() {
			count++
		}
	}
	return count
}
