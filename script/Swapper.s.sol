// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Swapper.sol";

contract SwapperScript is Script {
    Swapper swapper;
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        swapper = new Swapper(address(0xE041608922d06a4F26C0d4c27d8bCD01daf1f792));
    }
}
