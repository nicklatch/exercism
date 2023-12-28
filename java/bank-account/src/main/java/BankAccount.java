class BankAccount {

    private int balance = 0;
    private boolean isOpen = false;

    void open() throws BankAccountActionInvalidException {
        if (isOpen) {
            throw new BankAccountActionInvalidException("Account already open");
        } else {
            isOpen = true;
            balance = 0;
        }
    }

    void close() throws BankAccountActionInvalidException {
        if (isOpen) {
            isOpen = false;
            balance = 0;
        } else {
            throw new BankAccountActionInvalidException("Account not open");
        }
    }

    synchronized int getBalance() throws BankAccountActionInvalidException {
        verifyOpen();
        return balance;

    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        verifyOpen();
        if (verifyTxAmount(amount)) {
            balance += amount;
        }
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        verifyOpen();
        if ((balance - amount) < 0) {
            throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
        } else {
            verifyTxAmount(amount);
            balance -= amount;
        }

    }

    synchronized void verifyOpen() throws BankAccountActionInvalidException {
        if (!isOpen) {
            throw new BankAccountActionInvalidException("Account closed");
        }
    }

    synchronized boolean verifyTxAmount(int amount) throws BankAccountActionInvalidException {
        if (amount > 0) {
            return true;
        } else {
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        }
    }

}