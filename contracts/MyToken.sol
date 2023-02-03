// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

/**
 * @title TanganyTestToken
 * @dev Very simple ERC20 Token example, where all 10000 tokens are pre-assigned to the creator.
 */
contract MyToken is ERC20PresetFixedSupply {
    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */

    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(18)); // Initially Mint 10000 tokens

    uint256 public constant MINTED_SUPPLY = 10000 * (10 ** uint256(18)); // Then Mint another 10000 tokens

    constructor () ERC20PresetFixedSupply("MyToken", "MT", INITIAL_SUPPLY, msg.sender) {
        _mint(msg.sender, MINTED_SUPPLY);
    }
}