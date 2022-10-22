const main = async () => {
	const [deployer] = await hre.ethers.getSigners();
	const accountBalance = await deployer.getBalance();
	const quizContractFactory = await hre.ethers.getContractFactory("Quiz");
	const quizContract = await quizContractFactory.deploy();
	const quiz = await quizContract.deployed();
	console.log("Deploying contracts with account: ", deployer.address);
	console.log("Account balance: ", accountBalance.toString());
	console.log("Contract deployed to: ", quiz.address);
	console.log("Contract deployed by: ", deployer.address);
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch (error) {
		console.log(error);
		process.exit(1);
	}
};

runMain();