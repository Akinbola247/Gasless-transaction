// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Swapper.sol";
import "lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol";

contract SwapperTest is Test {
    Swapper public swapper;
   IERC20 DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
   IERC20 LINK = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

    function setUp() public {
         vm.startPrank(0xBB9F947cB5b21292DE59EFB0b1e158e90859dddb);
        uint mainnet = vm.createFork("https://eth-mainnet.g.alchemy.com/v2/xypdsCZYrlk6oNi93UmpUzKE9kmxHy2n", 16927792);
        vm.selectFork(mainnet);
        swapper = new Swapper(address(0xE041608922d06a4F26C0d4c27d8bCD01daf1f792));
        vm.stopPrank();
    }

    function testAddDAILiquidity() public {
        setUp();
        vm.startPrank(0x748dE14197922c4Ae258c7939C7739f3ff1db573);
        DAI.approve(address(swapper), 100 ether);
        swapper.AddDAILiquidity(10 ether);
        vm.stopPrank();
    }

    function testAddLINKLiquidity() public {
        setUp();
       vm.startPrank(0xDBe9fD53D3e2EfF2300A76033b78Fd458ec2A1E6);
       LINK.approve(address(swapper), 100 ether);
       LINK.balanceOf(address(0xDBe9fD53D3e2EfF2300A76033b78Fd458ec2A1E6));
       swapper.AddLINKLiquidity(3296473);
       vm.stopPrank();
    }

    function testswapLINKforDai () public {
        setUp();
        testAddDAILiquidity();
        vm.startPrank(0xDBe9fD53D3e2EfF2300A76033b78Fd458ec2A1E6);
        LINK.approve(address(swapper), 5 ether);
        swapper.swapLINKforDai(10);
        vm.stopPrank();
    }

    function testswapDAIforLINK() public {
        testAddLINKLiquidity();
        vm.startPrank(0x748dE14197922c4Ae258c7939C7739f3ff1db573);
        DAI.approve(address(swapper), 5 ether);
        swapper.swapDAIforLINK(10);
        vm.stopPrank();
    }

    function testRemoveDaiLiq() public {
            testAddDAILiquidity();
            vm.startPrank(0xDBe9fD53D3e2EfF2300A76033b78Fd458ec2A1E6);
            DAI.approve(address(swapper), 5 ether);
            swapper.removeDAIliquidity();
            vm.stopPrank();
    }

    function testRemoveLinkliq() public {
        testAddLINKLiquidity();
        vm.startPrank(0xDBe9fD53D3e2EfF2300A76033b78Fd458ec2A1E6);
        LINK.approve(address(swapper), 5 ether);
        swapper.removeLINKliquidity();
        vm.stopPrank();
    }
}
