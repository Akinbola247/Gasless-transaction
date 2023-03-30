// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Swapper.sol";
import "../src/iSwapper.sol";
import "lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol";


contract SwapperScript is Script {
    Swapper swapper;
    address swapp = 0x7c55185a57643676c2FB44413C24A488dbb3bB70;
    IERC20 DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    function setUp() public {}
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        // swapper = new Swapper(address(0xE041608922d06a4F26C0d4c27d8bCD01daf1f792));
        // DAI.approve(address(swapp), 100 ether);
        // ISwapper(swapp).AddDAILiquidity(0);
    }
}
