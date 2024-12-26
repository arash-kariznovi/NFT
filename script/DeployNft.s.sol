// SPDX-License-Modifier:MIT

pragma solidity ^0.8.19;

import {NFT} from "../src/NFT.sol";
import {Script} from "forge-std/Script.sol";


contract DeployNft is Script{
    
    function run() external returns(NFT){
        vm.startBroadcast();
        NFT nft = new NFT();
        vm.stopBroadcast();
        return nft;
    }
}