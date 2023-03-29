// const {hardhat, ethers, window} = require('hardhat');
// const {Biconomy} = require('biconomy')


// const biconomy = new Biconomy(window.ethereum as ExternalProvider, {
//     apiKey: "pK_BU7APe.5ca892da-2015-4ec8-87cb-a1fce5bd5818",
//     debug: true,
//     contractAddresses: ["0x046EDDef34A4c950DeBE4F0Ba8a002D345DbcA0B"], // list of contract address you want to enable gasless on
//   });
  
//   // The first argument of the Biconomy class is an EIP 1193 type provider that has to be passed. 
//   // If there is a type mismatch you'll have to set the type of the provider as 
//   // External Provider
//   export type ExternalProvider = {
//     isMetaMask?: boolean;
//     isStatus?: boolean;
//     host?: string;
//     path?: string;
//     sendAsync?: (request: { method: string, params?: Array<any> }, callback: (error: any, response: any) => void) => void
//     send?: (request: { method: string, params?: Array<any> }, callback: (error: any, response: any) => void) => void
//     request?: (request: { method: string, params?: Array<any> }) => Promise<any>
//   }
  
//   // To create contract instances you can do:
//   const contractInstance = new ethers.Contract(
//     "0x046EDDef34A4c950DeBE4F0Ba8a002D345DbcA0B",
//     [{"inputs":[{"internalType":"address","name":"_trustedForwarder","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"uint256","name":"_amount","type":"uint256"}],"name":"AddDAILiquidity","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_amount","type":"uint256"}],"name":"AddUNILiquidity","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getDAIUSDPrice","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getTrustedForwarder","outputs":[{"internalType":"address","name":"forwarder","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getUNIUSDPrice","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"forwarder","type":"address"}],"name":"isTrustedForwarder","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"removeDAIliquidity","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"removeUNIliquidity","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"dai_amount","type":"uint256"}],"name":"swapDAIforUNI","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"UNI_amount","type":"uint256"}],"name":"swapUNIforDai","outputs":[],"stateMutability":"nonpayable","type":"function"}],
//     biconomy.ethersProvider
//   );
