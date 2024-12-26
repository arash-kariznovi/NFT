// SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployNft} from "../script/DeployNft.s.sol";
import {NFT} from "../src/NFT.sol";

contract TestNft is Test {
    NFT public nft;
    DeployNft public deployer;
    address USER = makeAddr("user");
    string public constant LEO_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function setUp() public {
        deployer = new DeployNft();
        nft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = nft.name();
        // array of bytes => can't compare arrays
        // can do => primitives: int, bull, address, bytes
        // compare hashes:

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveUser() public{
        vm.prank(USER);
        nft.mintNFT(LEO_URI);

        assert(nft.balanceOf(USER)==1);
        assert(keccak256(abi.encodePacked(LEO_URI))==keccak256(abi.encodePacked(nft.tokenURI(0))));

    }
}
