const main = async () => {
	const [deployer] = await hre.ethers.getSigners();
	const accountBalance = await deployer.getBalance();
	const skillSbtContractFactory = await hre.ethers.getContractFactory("SkillSbt");
	const skillSbtContract = await skillSbtContractFactory.deploy();
	const skillSbt = await skillSbtContract.deployed();
	console.log("Deploying contracts with account: ", deployer.address);
	console.log("Account balance: ", accountBalance.toString());
	console.log("Contract deployed to: ", skillSbt.address);
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