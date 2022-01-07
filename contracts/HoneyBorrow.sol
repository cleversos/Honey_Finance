// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract HoneyBorrow {
    address private admin;

    address private avaxAddress;
    address private HLaddress;

    struct BorrowTicket {
        address collectionAddress;
        uint256 tokenId;
        uint256 stakeTime;
        uint256 stakeAmount;
    }

    mapping(address => uint256) private borrowRate;
    mapping(address => uint256) private interestRate;
    mapping(address => uint256) private limitRate;

    mapping(address => bool) public status;
    mapping(address => BorrowTicket[]) public accountTickets;

    constructor() {
        admin = msg.sender;
    }

    /**
     * @notice Sender supplies an NFT into the market and receives AVAX in exchange
     * @dev Reverts upon any failure
     * @param NFTaddress The contract address of the NFT
     * @param tokenId The NFT tokenId which is will be supplied
     */
    function stake(address NFTaddress, uint256 tokenId) external {
        require(status[NFTaddress] == true, "ND"); // Not available to deposit

        // Get the price of NFT from Oracle -
        uint256 oraclePrice = 100 ether;

        // Transfer the selected NFT to this contract
        IERC721(NFTaddress).transferFrom(msg.sender, address(this), tokenId);

        // Push the data of BorrowTicket into the accountTickets of this account
        accountTickets[msg.sender].push(
            BorrowTicket({
                collectionAddress: NFTaddress,
                tokenId: tokenId,
                stakeTime: block.timestamp,
                stakeAmount: oraclePrice
            })
        );

        // Get the borrowAmount by calculating with the borrowRate
        uint256 borrowAmount = getBorrowAmount(NFTaddress, oraclePrice);

        // Borrow AVAX to this account with borrowAmount
        IERC20(avaxAddress).transfer(msg.sender, borrowAmount);
    }

    /**
     * @notice The borrower repay the AVAX and receive the NFT again
     * @dev Reverts upon any failure
     * @param amount The amount of AVAX the borrower spend to receive the NFT again
     * @param cid The NFT Id of the unique sequence
     */
    function repay(uint256 amount, uint256 cid) external {
        require(accountTickets[msg.sender].length > cid, "MB"); //This NFT must be staked in this contract

        // Get the struct BorrowTicket bt by using address and cid
        BorrowTicket memory bt = accountTickets[msg.sender][cid];

        // Set the variables from the struct bt which is defined by address and Cid
        address NFTaddr = bt.collectionAddress;
        uint256 tokenId = bt.tokenId;
        uint256 startTime = bt.stakeTime;
        uint256 payAmount = bt.stakeAmount;

        // Get the multiplier from the this time and stakeTime
        uint256 multiplier = getMultiplier(NFTaddr, startTime);

        require(multiplier < limitRate[NFTaddr], "LR"); // The multiplier is must be less than LimitRate

        // Get the repay Amount by stakeAmount and Multiplier
        payAmount = (payAmount * multiplier) / 10000;

        require(payAmount <= amount, "OP"); // The amount of AVAX must be over payAmount

        // The borrower repay the AVAX to this contract
        IERC20(avaxAddress).transferFrom(msg.sender, address(this), amount);

        // Send the NFT again to its owner
        IERC721(NFTaddr).transferFrom(address(this), msg.sender, tokenId);

        // Remove this cid from the array
        remove(msg.sender, cid);
    }

    function sendLiquidationPool(address owner, uint256 cid) external {
        // Get the struct BorrowTicket bt by using address and cid
        BorrowTicket memory bt = accountTickets[owner][cid];

        // Set the variables from the struct bt which is defined by address and Cid
        address NFTaddr = bt.collectionAddress;
        uint256 tokenId = bt.tokenId;

        // Send the NFT again to HoneyLiquidation
        IERC721(NFTaddr).transferFrom(address(this), HLaddress, tokenId);
        // Remove this cid from the array
        remove(owner, cid);
    }

    function remove(address staker, uint256 index)
        internal
        returns (BorrowTicket[] storage)
    {
        uint256 length = accountTickets[staker].length;
        require(index < length, "LL");

        accountTickets[staker][index] = accountTickets[staker][length - 1];

        delete accountTickets[staker][length - 1];
        accountTickets[staker].pop();

        return accountTickets[staker];
    }

    /**
     * @notice Get the multiplier by using timediff
     * @param collection the collection address
     * @param startTime the staked starttime
     * @return borrowamount that the user can borrow
     */
    function getMultiplier(address collection, uint256 startTime)
        public
        view
        returns (uint256)
    {
        uint256 multi = (interestRate[collection] - 100 * 100) *
            (block.timestamp / 1 days - startTime / 1 days) +
            10000;
        return multi;
    }

    /**
     * @notice Get the BorrowAmount by calculating with borrowRate
     * @param collection The collection address
     * @param amount The oracle Price of NFT release by AVAX
     * @return borrowamount that the user can borrow
     */
    function getBorrowAmount(address collection, uint256 amount)
        internal
        view
        returns (uint256)
    {
        require(amount > 0, "OZ"); // amount must be over Zero
        uint256 bamount = (amount * borrowRate[collection]) / 10000;
        return bamount;
    }

    /**
     * @notice Add collections to use only them for Lending/Borrowing
     * @dev Reverts upon any failure
     * @param addresses[] Add addresses to use them for Lending/Borrowing
     * @param borrow[] Add borrowRate with the addresses to set borrowRate[addresses[i]]
     * @param interest[] Add interestRate with the addresses to set interestRate[addresses[i]]
     * @param limit[] Add limitRate with the addresses to set limitRate[addresses[i]]
     */
    function addCollection(
        address[] calldata addresses,
        uint256[] calldata borrow,
        uint256[] calldata interest,
        uint256[] calldata limit
    ) external {
        for (uint256 i = 0; i < addresses.length; i++) {
            if (status[addresses[i]] == false) {
                status[addresses[i]] = true;
                borrowRate[addresses[i]] = borrow[i];
                interestRate[addresses[i]] = interest[i];
                limitRate[addresses[i]] = limit[i];
            }
        }
    }

    /**
     * @notice Set the BorrowAmount by only admin set
     * @param collection The collection address
     * @param newBorrowRate New BorrowRate
     */
    function setBorrowRate(address collection, uint256 newBorrowRate)
        external
        onlyAdmin
    {
        borrowRate[collection] = newBorrowRate;
    }

    /**
     * @notice Set the interestRate by only admin set
     * @param collection The collection address
     * @param newInterestRate New InterestRate
     */
    function setInterestRate(address collection, uint256 newInterestRate)
        external
        onlyAdmin
    {
        interestRate[collection] = newInterestRate;
    }

    /**
     * @notice Set the limitAmount by only admin
     * @param collection The collection address
     * @param newLimitRate New LimitRate
     */
    function setLimitRate(address collection, uint256 newLimitRate)
        external
        onlyAdmin
    {
        limitRate[collection] = newLimitRate;
    }

    /*** Admin role ***/

    modifier onlyAdmin() {
        require(admin == msg.sender, "OA");
        _;
    }

    function setNewAdmin(address newAdd) external onlyAdmin {
        admin = newAdd;
    }

    function withdraw() external onlyAdmin {
        uint256 amount = IERC20(avaxAddress).balanceOf(address(this));
        IERC20(avaxAddress).transfer(msg.sender, amount);
    }
}
