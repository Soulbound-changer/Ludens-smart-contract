const main = async () => {
	const [owner] = await hre.ethers.getSigners();
	const quizContractFactory = await hre.ethers.getContractFactory("Quiz");
	const quizContract = await quizContractFactory.deploy();
	const quiz = await quizContract.deployed();
	console.log("Quiz contract deployed to: ", quiz.address);
	console.log("Quiz contract deployed by: ", owner.address);
	await quizContract.uploadQuiz("Title", "Description");
	const quizzes = await quizContract.getQuizzes();
	console.log(quizzes);
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