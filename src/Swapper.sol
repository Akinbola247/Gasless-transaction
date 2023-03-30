// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "lib/openzeppelin-contracts/contracts/utils/math/SafeCast.sol";
import "lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/metatx/ERC2771Context.sol";

contract Swapper is ERC2771Context {
     using SafeCast for int256;
    AggregatorV3Interface internal DAIusdpriceFeed;
    AggregatorV3Interface internal LINKusdpriceFeed;
IERC20 DAI;
IERC20 LINK;
mapping(address => uint) DAIliquidityProvider;
address[] DAIliquidityProviders;

mapping(address => uint) LINKliquidityProvider;
address[] LINKliquidityProviders;

constructor(address trustedForwarder)ERC2771Context(trustedForwarder){

    DAI = IERC20(0xf2edF1c091f683E3fb452497d9a98A49cBA84666);  //18 decimals
    LINK = IERC20(0x5646927512a016Fc181D541ed60AF991122E7413); //18 decimals

DAIusdpriceFeed = AggregatorV3Interface(0x0d79df66BE487753B02D015Fb622DED7f0E9798d); 
LINKusdpriceFeed = AggregatorV3Interface(0xAb5c49580294Aff77670F839ea425f5b78ab3Ae7); //goerli

// DAIusdpriceFeed = AggregatorV3Interface(0xAed0c38402a5d19df6E4c03F4E2DceD6e29c1ee9); 
// LINKusdpriceFeed = AggregatorV3Interface(0x8fFfFfd4AfB6115b954Bd326cbe7B4BA576818f6);
}

function AddDAILiquidity(uint _amount)external  {
    address sender = _msgSender();
    DAI.transferFrom(sender, address(this), _amount);
    DAIliquidityProvider[_msgSender()] += _amount;
    DAIliquidityProviders.push(_msgSender());
}

function removeDAIliquidity() public {
    address sender = _msgSender();
    uint liq = DAIliquidityProvider[sender];
    require(liq != 0, "no balance");
    DAI.transferFrom(address(this), sender, liq);
}

function removeLINKliquidity() public {
    address sender = _msgSender();
    uint liq = LINKliquidityProvider[sender];
    require(liq != 0, "no balance");
    LINK.transferFrom(address(this), sender, liq);
}


function AddLINKLiquidity(uint _amount)external {
    address sender = _msgSender();
    LINK.transferFrom(sender, address(this), (_amount));
    LINKliquidityProvider[sender] += _amount;
    LINKliquidityProviders.push(sender);
}


function getDAIUSDPrice() public view returns (uint) {
        ( , int price, , , ) = DAIusdpriceFeed.latestRoundData();
        return price.toUint256();
    }
function getLINKUSDPrice() public view returns (uint) {
        ( , int price, , , ) = LINKusdpriceFeed.latestRoundData();
        return (price * 1e18).toUint256();
    }

function swapLINKforDai(uint LINK_amount) public {
    address receiver = _msgSender();
    LINK.transferFrom(receiver, address(this), LINK_amount);
    uint LINKPrice = getLINKUSDPrice();
    uint daiPrice = getDAIUSDPrice();
    uint swappedAmount = (LINKPrice * LINK_amount)/daiPrice ;
    uint balance = DAI.balanceOf(address(this));
    require(balance >= swappedAmount, "not enough liquidity, check back");
    DAI.transferFrom(address(this), receiver, swappedAmount);

}

function swapDAIforLINK(uint dai_amount) external {
    address receiver = _msgSender();
    DAI.transferFrom(receiver, address(this), dai_amount);
    uint LINKPrice = getLINKUSDPrice();
    uint daiPrice = getDAIUSDPrice();
    uint swappedAmount = (daiPrice * dai_amount)/LINKPrice;
    uint balance = LINK.balanceOf(address(this));
    require(balance >= swappedAmount, "not enough liquidity, check back");
    LINK.transferFrom(address(this), receiver, swappedAmount);
}



}
