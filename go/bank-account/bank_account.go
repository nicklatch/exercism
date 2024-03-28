package account

import "sync"

// Account represents a bank account with a balance,
// its status of being open, and a mutex
type Account struct {
	balance int64
	open    bool
	*sync.Mutex
}

func Open(amount int64) *Account {
	if amount < 0 {
		return nil
	}
	return &Account{amount, true, &sync.Mutex{}}
}

func (a *Account) Balance() (int64, bool) {
	a.Lock()
	defer a.Unlock()
	return a.balance, a.open
}

func (a *Account) Deposit(amount int64) (int64, bool) {
	a.Lock()
	defer a.Unlock()
	if !a.open {
		return 0, false
	}
	if amount+a.balance < 0 {
		return a.balance, false
	}
	a.balance += amount
	return a.balance, true
}

func (a *Account) Close() (int64, bool) {
	a.Lock()
	defer a.Unlock()
	if !a.open {
		return a.balance, false
	}
	bal := a.balance
	a.balance = 0
	a.open = false
	return bal, true
}
