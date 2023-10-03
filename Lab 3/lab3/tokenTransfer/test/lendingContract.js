const LendingContract = artifacts.require("LendingContract");

contract('LendingContract', (accounts) => {
    let lendingContractInstance;

    beforeEach(async () => {
        lendingContractInstance = await LendingContract.new();
    });

    it("should deposit assets correctly", async () => {
        const initialBalance = await lendingContractInstance.balances(accounts[0]);
        const depositAmount = 100;
        await lendingContractInstance.deposit(depositAmount, { from: accounts[0] });
        const finalBalance = await lendingContractInstance.balances(accounts[0]);

        assert.equal(
            finalBalance - initialBalance,
            depositAmount,
            "Deposit amount is incorrect"
        );
    });

    it("should allow borrowing if sufficient balance", async () => {
        const depositAmount = 100;
        await lendingContractInstance.deposit(depositAmount, { from: accounts[0] });

        const initialBalance = await lendingContractInstance.balances(accounts[0]);
        const borrowAmount = 50;
        await lendingContractInstance.borrow(borrowAmount, { from: accounts[0] });
        const finalBalance = await lendingContractInstance.balances(accounts[0]);

        assert.equal(
            initialBalance - finalBalance,
            borrowAmount,
            "Borrowed amount is incorrect"
        );
    });

    it("should not allow borrowing if insufficient balance", async () => {
        const borrowAmount = 50;
        try {
            await lendingContractInstance.borrow(borrowAmount, { from: accounts[0] });
            assert.fail("Borrow should fail");
        } catch (error) {
            assert(
                error.toString().includes("revert Insufficient balance"),
                "Unexpected error message"
            );
        }
    });


    // Lending Simulation
    it("should not allow borrowing more than available liquidity", async () => {
        const lendingContractInstance = await LendingContract.new();
        const depositAmount = 100;
        const borrowAmount = 150; // Borrow more than deposited

        await lendingContractInstance.deposit(depositAmount, { from: accounts[0] });

        try {
            await lendingContractInstance.borrow(borrowAmount, { from: accounts[0] });
            assert.fail("Borrow should fail");
        } catch (error) {
            assert(
                error.toString().includes("revert Insufficient balance"),
                "Unexpected error message"
            );
        }
    });
});



