//SPDX-License-Modifier:MIT

pragma solidity ^0.8.19;

import {NFT} from "../src/NFT.sol";
import {DeployNft} from "./DeployNft.s.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Script} from "forge-std/Script.sol";

contract MintNFT is Script {
    string public constant LEO_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "NFT",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        NFT(contractAddress).mintNFT(LEO_URI);
        vm.stopBroadcast();
    }
}
