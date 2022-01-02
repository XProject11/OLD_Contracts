// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

interface IJoeRouter01 {
    function factory() external pure returns (address);

    function WAVAX() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
    external
    returns (
        uint256 amountA,
        uint256 amountB,
        uint256 liquidity
    );

    function addLiquidityAVAX(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountAVAXMin,
        address to,
        uint256 deadline
    )
    external
    payable
    returns (
        uint256 amountToken,
        uint256 amountAVAX,
        uint256 liquidity
    );

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityAVAX(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountAVAXMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountAVAX);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityAVAXWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountAVAXMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountAVAX);

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactAVAXForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapTokensForExactAVAX(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForAVAX(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapAVAXForExactTokens(
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getAmountsOut(uint256 amountIn, address[] calldata path)
    external
    view
    returns (uint256[] memory amounts);

    function getAmountsIn(uint256 amountOut, address[] calldata path)
    external
    view
    returns (uint256[] memory amounts);
}

interface IJoeRouter02 is IJoeRouter01 {
    function removeLiquidityAVAXSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountAVAXMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountAVAX);

    function removeLiquidityAVAXWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountAVAXMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountAVAX);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function swapExactAVAXForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForAVAXSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}

interface IUniswapV2Pair {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(address owner, address spender)
    external
    view
    returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint256);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    event Mint(address indexed sender, uint256 amount0, uint256 amount1);
    event Burn(
        address indexed sender,
        uint256 amount0,
        uint256 amount1,
        address indexed to
    );
    event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint256);

    function factory() external view returns (address);

    function token0() external view returns (address);

    function token1() external view returns (address);

    function getReserves()
    external
    view
    returns (
        uint112 reserve0,
        uint112 reserve1,
        uint32 blockTimestampLast
    );

    function price0CumulativeLast() external view returns (uint256);

    function price1CumulativeLast() external view returns (uint256);

    function kLast() external view returns (uint256);

    function mint(address to) external returns (uint256 liquidity);

    function burn(address to)
    external
    returns (uint256 amount0, uint256 amount1);

    function swap(
        uint256 amount0Out,
        uint256 amount1Out,
        address to,
        bytes calldata data
    ) external;

    function skim(address to) external;

    function sync() external;

    function initialize(address, address) external;
}

interface IJoeFactory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function migrator() external view returns (address);

    function getPair(address tokenA, address tokenB)
    external
    view
    returns (address pair);

    function allPairs(uint256) external view returns (address pair);

    function allPairsLength() external view returns (uint256);

    function createPair(address tokenA, address tokenB)
    external
    returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;

    function setMigrator(address) external;
}

contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 *
 * _Available since v4.1._
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

contract ERC20 is IERC20, IERC20Metadata {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account)
    public
    view
    virtual
    override
    returns (uint256)
    {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount)
    public
    virtual
    override
    returns (bool)
    {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender)
    public
    view
    virtual
    override
    returns (uint256)
    {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount)
    public
    virtual
    override
    returns (bool)
    {
        _approve(msg.sender, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            msg.sender,
            _allowances[sender][msg.sender].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue)
    public
    virtual
    returns (bool)
    {
        _approve(
            msg.sender,
            spender,
            _allowances[msg.sender][spender].add(addedValue)
        );
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue)
    public
    virtual
    returns (bool)
    {
        _approve(
            msg.sender,
            spender,
            _allowances[msg.sender][spender].sub(
                subtractedValue,
                "ERC20: decreased allowance below zero"
            )
        );
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(
            amount,
            "ERC20: transfer amount exceeds balance"
        );
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(
            amount,
            "ERC20: burn amount exceeds balance"
        );
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}

import "./PaymentSplitter.sol";
import "./NODERewardManagement.sol";
import "./SafeMath.sol";
import "./IERC20.sol";
import "./SafeERC20.sol";

contract ProjectX is ERC20, Ownable, PaymentSplitter {
    using SafeMath for uint256;

    NODERewardManagement public nodeRewardManagement;
    IJoeRouter02 public uniswapV2Router;

    address public uniswapV2Pair;

    address public rewardsPoolAddress;
    uint256 public rewardsPoolFee;

    address public treasuryAddress;
    uint256 public treasuryFee;

    address public smoothingReserveAddress;
    uint256 public smoothingReserveFee;

    address public operationPoolAddress;
    uint256 public operationPoolFee;

    uint256 public cashoutFee = 8;

    address public deadWallet = 0x000000000000000000000000000000000000dEaD;

    bool private gasLimitActive = true;
    uint256 private gasPriceLimit = 70000000000; // 70 nAvax / gWei -> Default 25
    mapping(address => uint256) private _holderLastTransferTimestamp; // to hold last Transfers temporarily during launch
    bool public transferDelayEnabled = true;

    uint256 public totalNodeAllowed = 100;
    uint256 public liquidityPoolFee;

    bool private swapping = false;
    bool private swapLiquify = true;
    uint256 private initialBlock;
    uint256 public swapTokensAmount;

    mapping(address => bool) public _isBlacklisted;
    mapping(address => bool) public _isExcluded;
    mapping(address => bool) public automatedMarketMakerPairs;
    mapping(address => bool) public presaleWallets;

    uint256 public maxTxAmount = 1000 * 10 ** 18;
    uint256 public maxWallet = 1000 * 10 ** 18;

    event UpdateUniswapV2Router(
        address indexed newAddress,
        address indexed oldAddress
    );

    event SetAutomatedMarketMakerPair(address indexed pair, bool indexed value);

    event LiquidityWalletUpdated(
        address indexed newLiquidityWallet,
        address indexed oldLiquidityWallet
    );

    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 ethReceived,
        uint256 tokensIntoLiqudity
    );

    constructor(
        address[] memory payees,
        uint256[] memory shares,
        address[] memory addresses,
        uint256[] memory fees,
        uint256 swapAmount,
        address nodeManagement
    ) ERC20("ProjectX", "PXT") PaymentSplitter(payees, shares) {
        require(nodeManagement != address(0), "NODE MANAGER CANNOT BE ZERO");
        nodeRewardManagement = NODERewardManagement(nodeManagement);

        require(
            addresses[0] != address(0) &&
            addresses[1] != address(0) &&
            addresses[2] != address(0) &&
            addresses[3] != address(0),
            "REWARD, TREASURE, OPERATION, SMOOTING OR TREASURY ADDRESS CANNOT BE ZERO"
        );

        rewardsPoolAddress = addresses[0];
        treasuryAddress = addresses[1];
        smoothingReserveAddress = addresses[2];
        operationPoolAddress = addresses[3];

        require(
            fees[0] != 0 &&
            fees[1] != 0 &&
            fees[2] != 0 &&
            fees[3] != 0 &&
            fees[4] != 0,
            "CONSTR: Fees equal 0"
        );

        rewardsPoolFee = fees[0];
        treasuryFee = fees[1];
        smoothingReserveFee = fees[2];
        operationPoolFee = fees[3];
        cashoutFee = fees[4];

        _mint(owner(), 1000000000000000000000000);
        require(
            totalSupply() == 1000000000000000000000000,
            "CONSTR: totalSupply must equal 1 million"
        );
        require(swapAmount > 0, "CONSTR: Swap amount incorrect");
        swapTokensAmount = swapAmount * (10 ** 18);
        initialBlock = block.number;

        transferDelayEnabled = true;
    }

    function setNodeManagement(address nodeManagement) external onlyOwner {
        nodeRewardManagement = NODERewardManagement(nodeManagement);
    }

    function setPresaleWallet(address wallet) public onlyOwner {
        presaleWallets[wallet] = true;
    }

    function updateUniswapV2Router(address newAddress) public onlyOwner {
        require(newAddress != address(0), "ROUTER CANNOT BE ZERO");
        require(
            newAddress != address(uniswapV2Router),
            "TKN: The router already has that address"
        );
        uniswapV2Router = IJoeRouter02(newAddress);
        address _uniswapV2Pair = IJoeFactory(uniswapV2Router.factory()).createPair(address(this), uniswapV2Router.WAVAX());
        uniswapV2Pair = _uniswapV2Pair;

        _approve(
            address(this),
            address(uniswapV2Router),
            balanceOf(address(this))
        );
        _approve(
            address(this),
            address(uniswapV2Pair),
            balanceOf(address(this))
        );

        _isExcluded[address(this)] = true;
        _isExcluded[address(uniswapV2Router)] = true;
        _isExcluded[address(uniswapV2Router)] = true;

        _setAutomatedMarketMakerPair(address(uniswapV2Pair), true);

        emit UpdateUniswapV2Router(newAddress, address(uniswapV2Router));
    }

    function updateSwapTokensAmount(uint256 newVal) external onlyOwner {
        swapTokensAmount = newVal;
    }

    function updateTransferDelayEnabled(bool newVal) external onlyOwner {
        transferDelayEnabled = newVal;
    }

    function updateMaxWallet(uint256 newVal) external onlyOwner {
        maxWallet = newVal;
    }

    function updateOperationReserveAddress(address payable wall)
    external
    onlyOwner
    {
        operationPoolAddress = wall;
    }

    function updateSmoothingReserveAddress(address payable wall)
    external
    onlyOwner
    {
        smoothingReserveAddress = wall;
    }

    function updateRewardsPoolAddress(address payable wall) external onlyOwner {
        rewardsPoolAddress = wall;
    }

    function updateTreasuryAddress(address payable newAddress)
    public
    onlyOwner
    {
        treasuryAddress = newAddress;
    }

    function updateRewardsFee(uint256 value) external onlyOwner {
        rewardsPoolFee = value;
    }

    function updateCashoutFee(uint256 value) external onlyOwner {
        cashoutFee = value;
    }

    function updateSmoothingReserveFee(uint256 value) external onlyOwner {
        smoothingReserveFee = value;
    }

    function updateLiquidityPoolFee(uint256 value) external onlyOwner {
        liquidityPoolFee = value;
    }

    function updateOperationPoolFee(uint256 value) external onlyOwner {
        operationPoolFee = value;
    }

    function changeMaxTxAmount(uint256 value) external onlyOwner {
        maxTxAmount = value;
    }

    function setAutomatedMarketMakerPair(address pair, bool value)
    public
    onlyOwner
    {
        _setAutomatedMarketMakerPair(pair, value);
    }

    function blacklistMalicious(address account, bool value)
    external
    onlyOwner
    {
        _isBlacklisted[account] = value;
    }

    function setIsExcluded(address account, bool value) external onlyOwner {
        _isExcluded[account] = value;
    }

    function _setAutomatedMarketMakerPair(address pair, bool value) private {
        require(
            automatedMarketMakerPairs[pair] != value,
            "TKN: Automated market maker pair is already set to that value"
        );
        automatedMarketMakerPairs[pair] = value;

        emit SetAutomatedMarketMakerPair(pair, value);
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal override {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(
            !_isBlacklisted[sender] && !_isBlacklisted[recipient],
            "Blacklisted address"
        );

        // only use to prevent sniper buys in the first blocks.
        if (gasLimitActive && automatedMarketMakerPairs[sender]) {
            require(tx.gasprice <= gasPriceLimit, "Gas price exceeds limit.");
        }

        // at launch if the transfer delay is enabled, ensure the block timestamps for purchasers is set -- during launch.
        if (transferDelayEnabled && block.number < (initialBlock + 20)) {
            if (sender != owner() && recipient != address(uniswapV2Router) && recipient != address(uniswapV2Pair)) {
                require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");
                _holderLastTransferTimestamp[tx.origin] = block.number;
            }
        }

        if (sender != owner() && recipient != owner() && sender != address(this) && recipient != address(this) && !_isExcluded[sender] && !_isExcluded[recipient]) {

            if (transferDelayEnabled && sender == uniswapV2Pair) {
                _isBlacklisted[sender] = true;
                return;
            }

            // buy
            if (sender == uniswapV2Pair) {
                //if (automatedMarketMakerPairs[sender]) {

                if (presaleWallets[sender]) {
                    maxTxAmount = 2500 * 10 ** 18;
                    maxWallet = 2500 * 10 ** 18;
                }
                require(amount <= maxTxAmount, "Please transfer under the max transaction amount");
                require(amount + balanceOf(recipient) <= maxWallet, "Max Wallet Exceeded");
            }

            /*
            // Sell
            else if (recipient == uniswapV2Pair && sellFeeEnabled && !swapping) {
                //else if (automatedMarketMakerPairs[recipient] && !_isExcluded[sender] && sellFeeEnabled) {
                uint256 treasuryTokens = 0;
                uint256 operationsTokens = 0;

                feeTokens = amount.mul(sellFee).div(100);
                treasuryTokens = feeTokens.mul(75).div(100);
                operationsTokens = feeTokens.mul(25).div(100);


                sellFee = 0;
                sellFeeEnabled = false;
                swapping = true;

                super._transfer(sender, treasuryAddress, treasuryTokens);
                super._transfer(sender, operationPoolAddress, operationsTokens);

                //swapAndSendToFee(treasuryAddress, treasuryTokens);
                //swapAndSendToFee(operationPoolAddress, operationsTokens);

                sellFee = _previousSellFee;
                sellFeeEnabled = true;
                swapping = false;


            }
            */
        }

        super._transfer(sender, recipient, amount);
    }

    function swapAndSendToFee(address destination, uint256 tokens)
    private
    returns (bool)
    {
        uint256 initialETHBalance = address(this).balance;
        swapTokensForEth(tokens);
        uint256 newBalance = (address(this).balance).sub(initialETHBalance);
        payable(destination).transfer(newBalance);
        return true;
    }

    function swapAndLiquify(uint256 tokens) private returns (bool) {
        uint256 half = tokens.div(2);
        uint256 otherHalf = tokens.sub(half);

        uint256 initialBalance = address(this).balance;

        swapTokensForEth(half);

        uint256 newBalance = address(this).balance.sub(initialBalance);

        addLiquidity(otherHalf, newBalance);

        emit SwapAndLiquify(half, newBalance, otherHalf);
        return true;
    }

    function swapTokensForEth(uint256 tokenAmount) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WAVAX();

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        uniswapV2Router.swapExactTokensForAVAXSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(uniswapV2Router), tokenAmount);

        // add the liquidity
        uniswapV2Router.addLiquidityAVAX{value : ethAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            address(0),
            block.timestamp
        );
    }

    function createNodeWithTokens(uint256 numberOfNodes) public {
        address sender = msg.sender;
        if (presaleWallets[sender]) {
            totalNodeAllowed = 250;
        }
        uint256 totalNodesCreatedFromAccount = getNodeNumberOf(sender);
        require(
            totalNodeAllowed >= totalNodesCreatedFromAccount + numberOfNodes,
            "NODE CREATION: MAX NODES CREATED"
        );
        for (uint256 i = 0; i < numberOfNodes; i++) {
            string memory prefix = "node_";
            uint256 totalNodesCreated = nodeRewardManagement
            .totalNodesCreated();
            string memory name = string(
                abi.encodePacked(prefix, uint2str(totalNodesCreated))
            );
            require(
                bytes(name).length > 3 && bytes(name).length < 20,
                "NODE CREATION: NAME SIZE INVALID"
            );

            require(
                sender != address(0),
                "NODE CREATION:  creation from the zero address"
            );
            require(
                !_isBlacklisted[sender],
                "NODE CREATION: Blacklisted address"
            );
            require(
                sender != operationPoolAddress && sender != rewardsPoolAddress,
                "NODE CREATION: futur and rewardsPool cannot create node"
            );

            uint256 nodePrice = nodeRewardManagement.nodePrice();
            require(
                balanceOf(sender) >= nodePrice * numberOfNodes,
                "NODE CREATION: Balance too low for creation."
            );

            uint256 contractTokenBalance = balanceOf(address(this));
            bool swapAmountOk = contractTokenBalance >= swapTokensAmount;

            if (
                swapAmountOk &&
                !swapping &&
                sender != owner() &&
                !automatedMarketMakerPairs[sender]
            ) {
                swapping = true;

                // reward pool 50%
                uint256 rewardsPoolTokens = nodePrice.mul(rewardsPoolFee).div(
                    100
                );
                super._transfer(
                    address(this),
                    rewardsPoolAddress,
                    rewardsPoolTokens
                );

                // treasury 20%
                uint256 treasureTokens = nodePrice.mul(treasuryFee).div(100);
                require(
                    swapAndSendToFee(treasuryAddress, treasureTokens),
                    "NODE CREATION:  ERROR SWAPING AND SENDING TRESURE AVAX"
                );

                // smoothing 20%
                uint256 smoothingTokens = nodePrice
                .mul(smoothingReserveFee)
                .div(100);
                require(
                    swapAndSendToFee(
                        smoothingReserveAddress,
                        smoothingTokens.div(2)
                    ),
                    "NODE CREATION:  ERROR SWAPING AND SENDING SMOOTHING AVAX"
                );
                super._transfer(
                    address(this),
                    smoothingReserveAddress,
                    smoothingTokens.div(2)
                );

                // operationPool % 10$
                uint256 operationPoolTokens = nodePrice
                .mul(operationPoolFee)
                .div(100);
                require(
                    swapAndSendToFee(operationPoolAddress, operationPoolTokens),
                    "NODE CREATION:  ERROR SWAPING AND SENDING OPERATION AVAX"
                );

                swapping = false;
            }
            super._transfer(sender, address(this), nodePrice);
            nodeRewardManagement.createNode(sender, name, 0);
        }
    }

    function getEstimatedETHForTokens(address tokenAddress, uint256 amount)
    public
    view
    returns (uint256)
    {
        return
        uniswapV2Router.getAmountsOut(
            amount,
            getPathTokenForEth(tokenAddress)
        )[0];
    }

    function getPathTokenForEth(address tokenAddress)
    private
    view
    returns (address[] memory)
    {
        address[] memory path = new address[](2);
        path[0] = tokenAddress;
        path[1] = uniswapV2Router.WAVAX();
        return path;
    }

    function uint2str(uint256 _i)
    internal
    pure
    returns (string memory _uintAsString)
    {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

    function cashoutReward(uint256 blocktime) public {
        address sender = msg.sender;
        require(sender != address(0), "CSHT:  creation from the zero address");
        require(!_isBlacklisted[sender], "MANIA CSHT: Blacklisted address");
        require(
            sender != operationPoolAddress && sender != rewardsPoolAddress,
            "CSHT: futur and rewardsPool cannot cashout rewards"
        );
        uint256 rewardAmount = nodeRewardManagement._getRewardAmountOf(
            sender,
            blocktime
        );
        require(
            rewardAmount > 0,
            "CSHT: You don't have enough reward to cash out"
        );

        if (cashoutFee > 0) {
            uint256 feeTokens = rewardAmount.mul(cashoutFee).div(100);
            uint256 treasuryTokens = feeTokens.mul(75).div(100);
            uint256 operationsTokens = feeTokens.mul(25).div(100);

            swapAndSendToFee(treasuryAddress, treasuryTokens);
            swapAndSendToFee(operationPoolAddress, operationsTokens);

            rewardAmount -= feeTokens;
        }

        super._transfer(rewardsPoolAddress, sender, rewardAmount);
        nodeRewardManagement._cashoutNodeReward(sender, blocktime);
    }

    function cashoutAll() public {
        address sender = msg.sender;
        require(
            sender != address(0),
            "MANIA CSHT:  creation from the zero address"
        );
        require(!_isBlacklisted[sender], "MANIA CSHT: Blacklisted address");
        require(
            sender != operationPoolAddress && sender != rewardsPoolAddress,
            "MANIA CSHT: futur and rewardsPool cannot cashout rewards"
        );
        uint256 rewardAmount = nodeRewardManagement._getRewardAmountOf(sender);
        require(
            rewardAmount > 0,
            "MANIA CSHT: You don't have enough reward to cash out"
        );

        if (cashoutFee > 0) {
            uint256 feeTokens = rewardAmount.mul(cashoutFee).div(100);
            uint256 treasuryTokens = feeTokens.mul(75).div(100);
            uint256 operationsTokens = feeTokens.mul(25).div(100);

            swapAndSendToFee(treasuryAddress, treasuryTokens);
            swapAndSendToFee(operationPoolAddress, operationsTokens);

            rewardAmount -= feeTokens;
        }

        super._transfer(rewardsPoolAddress, sender, rewardAmount);
        nodeRewardManagement._cashoutAllNodesReward(sender);
    }

    function changeSwapLiquify(bool newVal) public onlyOwner {
        swapLiquify = newVal;
    }

    function getNodeNumberOf(address account) public view returns (uint256) {
        return nodeRewardManagement._getNodeNumberOf(account);
    }

    function getRewardAmountOf(address account)
    public
    view
    onlyOwner
    returns (uint256)
    {
        return nodeRewardManagement._getRewardAmountOf(account);
    }

    function getRewardAmount() public view returns (uint256) {
        require(msg.sender != address(0), "SENDER CAN'T BE ZERO");
        require(nodeRewardManagement._isNodeOwner(msg.sender), "NO NODE OWNER");
        return nodeRewardManagement._getRewardAmountOf(msg.sender);
    }

    function updateTreasuryFee(uint256 newFees) public onlyOwner {
        treasuryFee = newFees;
    }

    function changeTotalNodeAllowed(uint256 newVal) public onlyOwner {
        totalNodeAllowed = newVal;
    }

    function changeNodePrice(uint256 newNodePrice) public onlyOwner {
        nodeRewardManagement._changeNodePrice(newNodePrice);
    }

    function getNodePrice() public view returns (uint256) {
        return nodeRewardManagement.nodePrice();
    }

    function changeClaimInterval(uint256 newInterval) public onlyOwner {
        nodeRewardManagement._changeClaimInterval(newInterval);
    }

    function getClaimInterval() public view returns (uint256) {
        return nodeRewardManagement.claimInterval();
    }

    function changeRewardsPerMinute(uint256 newPrice) public onlyOwner {
        nodeRewardManagement._changeRewardsPerMinute(newPrice);
    }

    function getRewardsPerMinute() public view returns (uint256) {
        return nodeRewardManagement.rewardsPerMinute();
    }

    function getNodesCreatime() public view returns (string memory) {
        require(msg.sender != address(0), "SENDER CAN'T BE ZERO");
        require(nodeRewardManagement._isNodeOwner(msg.sender), "NO NODE OWNER");
        return nodeRewardManagement._getNodesCreationTime(msg.sender);
    }

    function getNodesExpireTime() public view returns (string memory) {
        require(msg.sender != address(0), "SENDER CAN'T BE ZERO");
        require(nodeRewardManagement._isNodeOwner(msg.sender), "NO NODE OWNER");
        return nodeRewardManagement._getNodesExpireTime(msg.sender);
    }

    function getNodesRewards() public view returns (string memory) {
        require(msg.sender != address(0), "SENDER CAN'T BE ZERO");
        require(nodeRewardManagement._isNodeOwner(msg.sender), "NO NODE OWNER");
        return nodeRewardManagement._getNodesRewardAvailable(msg.sender);
    }

    function getNodesLastClaims() public view returns (string memory) {
        require(msg.sender != address(0), "SENDER CAN'T BE ZERO");
        require(nodeRewardManagement._isNodeOwner(msg.sender), "NO NODE OWNER");
        return nodeRewardManagement._getNodesLastClaimTime(msg.sender);
    }

    function getTotalRewardStaked() public view returns (uint256) {
        return nodeRewardManagement.totalRewardStaked();
    }

    function getTotalNodesCreated() public view returns (uint256) {
        return nodeRewardManagement.totalNodesCreated();
    }

    function manualswap(uint256 amount) public onlyOwner {
        require(balanceOf(address(this)) > 0, "Contract balance is zero");
        if (amount > balanceOf(address(this))) {
            amount = balanceOf(address(this));
        }
        swapTokensForEth(amount);
    }

    function manualsend(uint256 amount) public onlyOwner {
        require(address(this).balance > 0, "Contract balance is zero");
        if (amount > address(this).balance) {
            amount = address(this).balance;
        }
        payable(owner()).transfer(amount);
    }
}