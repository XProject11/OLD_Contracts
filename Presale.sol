// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "./SafeMath.sol";

contract PresaleSplitter is Ownable {
    using SafeMath for uint256;
    address[] PRESALE_WALLETS = [
        0x6BFD376A9F519c063aF2955622410a1d526FA5D3,
        0x74e829F10d708f03fC14891D808392E4769d821e,
        0x1859f52B0711975aC47a98B520d8D6A6fF13f82A,
        0x20d1299605C8842DD07Fe7e419d0606000Ee4b35,
        0xdFE538562f84267efbbc44c15f8A82894ece365e,
        0x0a0Bdc24B88004c4E106B9E76384270f2D785098,
        0xAB48D6E6a704CDBEeD1707a7171783C523849F9a,
        0x2c59900B9442b7A865F93219c04f553a0D7BD003,
        0x5b890462b028EA5aB990EC835DC025546675ed4c,
        0xF4C246a7756518E800c7906B3e839b8F59be34B4,
        0x6205de9C5FA8c78601DF3497234CbDcb06145d84,
        0x3c118d8FFD841075B4fF7E0a17B9246ed307F943,
        0x09F20Ee17434203A70DACf56D77d4Ea2FaBF3AD7,
        0xdd1aCbb332Ac0BB474331af06239Eb19766f012a,
        0x2549855C91685aE5712A2eaEC98Ab77DB3D95f92,
        0xBd300dEBe2bDe209D0EC52d54EaEfCea03162738,
        0xDddd34f88B475daE9feF76af218B00CCa0d7a06A,
        0x2F7F73C12aF065bc9F543200687EADFfE2765d6B,
        0x678DA03Ee2c311Daa7ED32D4aD9C351Af3A6e9de,
        0x3fF069c5b6A2B7f24Bab39010De631c76024Bd85,
        0x6B594BdF1867EC53A23533a11dd59bCC1F3996c8,
        0xcf7450A761D0e6e5A5Fb9c4fCEe6d70E86Afb7C9,
        0xB386326f66F08B0A4E9DeD768Ae58082c4d5Df84,
        0x53ee0bAa5a782249E7bA8E1601c6d63ef14831e1,
        0xa0EfB61e502935c184DF81202B8A03c3a24F8820,
        0x5B25E9C1A6bA6dD713f985759497fDC022B2BC1C,
        0x6f1fbcdFc8B93D9EddA20aCdE12b7A8Ee69c66B0,
        0xf74ea010C41520741D984A6dc4c95E576D13b199,
        0x1978fF6F1c0A3760696169B001647f7f7D9600C8,
        0xBe47430010C3eB40188c72e6D77ad1111abB8177,
        0xa2ebD1C59EB79e3e48BDdB9Ebff46292638ef868,
        0x76CA63269Ef4868Ce3a49E4B5C8AE5af697F1b7b,
        0xfB67a6a59609662330171f63142c7259f241f346,
        0x3fd2870fdE84C13087883A02f02d6620Dcf1a6c8,
        0xC386D86Aa8d2562d16542A01CFb707Deb4591047,
        0x5bdB7099528Cf257a250EFFB205147CCa6Ce4297,
        0xcc91ab199b9E33F6677Cb43c1554f4dE873471c5,
        0x4066643f04859fa538Ba8EAa906C197c57e4e3e0,
        0x1a356127c8f71c4D806dacCAD55E713bF5d7694C,
        0xF3dcf73975a657822ce3F00d3558f5D7523FAB8b,
        0x0655c24b35EAa1d45A802Ae4EA90E032322DAA2A,
        0xE18C488e8f06B1C23a18034652263754fBf2b85d,
        0xE9EE334a1fE1567905Be99205BBB147c6362A86f,
        0x0462096A2631fA4974713F0C0E29B43b510f6570,
        0x589f1CA208E199835E9900717Ae512B2d1d0b615,
        0x5e46c8281b928B339E37eACec196c90E6C97117b,
        0x68C30f76246d44AADa78847b55563d76d480802b,
        0x47D11cD57c4E82a4740C03943A4F0A7FFd3B1e98,
        0xC28B1f5692c3D02e6AB9631a8BEf49A7750A9826,
        0xc7d376cdEcCBE2f853ca42E4bF92f1ADb4e7E104,
        0x953F88cE7F3180A5dBB7e677f6400c43E50F7c88,
        0xb9B97A6aDeaD5f721B731bE71C6f350462fc5855,
        0x352Ec5E1370302C4137C1B48A5273e057053d7DA,
        0x19f168a360184AE820b39bB7045B586417c72693,
        0xA8E35427c5E8819537A4722beE6D31C1170193ae,
        0x2E3BfE75EE3e95a8d8964D27c4ea19D51FCb488E,
        0xa03Fa6E5A08d0e03D317CaBd975bC1e6005195a6,
        0x5E40ca84Dd0aEBeb70178D811742001b5A84C572,
        0x4ab79a32a0f6Eb1D2eb3d9CcfCd74485f8c2F2D6,
        0xbD9492AAfcea713BF5dE6D42E5c142Ac67A37cdA,
        0x14F258325A985e11C2c492f903e0a87FdA0dE33f,
        0xB35f652428ED26216D2331D5ce0978acE42287Ec,
        0xF124A32E40ba76b529955F25a0e93f41b5387A87,
        0x1F1c72835e4a6886cB9FeF58D153580B0efF78ae,
        0xe73e8e809ED6Effdc9A8c892fc69f2ED6F70a62F,
        0x376A2F01F821FfF7bb2f19b2D0480673c7F73c95,
        0xD7ec863643e06a548A6d9f0B0bd9Aa0AB2B80a8e,
        0xb36669a35e2E8383D3F02d196f8A757Fb2eE0CbC,
        0xA6F10047C07f4e3f8Ca38997953D5F99520A8469,
        0x2B14F0bE362DC03650e3dA2723C6e38117845376,
        0x804CB947D282e493f166aef62abd69e80e5047Ff,
        0xd201489f6efebb671E616Da8E1BE280d63A614F7,
        0xF38e7F44783e53597206Fc3d55B53e844c244Cc6,
        0x1afe3b339440F2367f3B11B69CA60dB5b3f122A1,
        0xbA2A8E5C9771203aa3de81E12C95034EAD915e56,
        0x2F442Ad2d8fb7ebc65e89055Cbf7eeF64b60DF96,
        0x380CFcD0b98Cc56aA57A7eB9D90996A98360A494,
        0x60Ee29796DbeaC110a92D2C4c4ca2A2CDaC35B3a,
        0xB8Cd77756cA8550c285f32deCE441262540C020d,
        0x9c46305ecA4879656252a4323bF2ef85C22a14Fb,
        0x08A1390B69650e69DA1457dc30F4FF6b3685f71C,
        0xA932162f59ac303E1154E1B0af14aBa16663aCB1,
        0x362776a5e816db882AD238d1706F03A0d55A095f,
        0xbd42878d3cC49BB4903DF1f04E7b445ECA4bd238,
        0x4d60E753c22A3be2ee4Fe05086B792644a425335,
        0x811f1A08aA3eC1C681a4D67EF66689d51b3C3429,
        0x70Ceb37b18B283F7DeA1B614376D4A5C1d33F367,
        0x895802A41eb1E61F8Ea49Ca6281F2F4eAECE1c71,
        0x5Fe3A3FdaBbBcDbDD5c914F403f8428316338A3D,
        0xE41Cc125107cf0196e85FffA61d69C5A12D2693b,
        0xfC322C620e7c5D6d3E9543b42dFE820e15bA6Ab8,
        0xD7ec863643e06a548A6d9f0B0bd9Aa0AB2B80a8e,
        0x07aae53152f477AF1C62C22583FDED69b0A5382F,
        0x2B9858Dab41ea07249d58f82e566404bd1778e9b,
        0x73B5509bfa1107186C7705C9dE4887C79f230044,
        0x1276a8C0F81c2575e7435645b62766422B8399cb,
        0x036Dbf52BA4C6F58B0855d9c0fd3997d67180361,
        0x6b17bb77F8Bde7cBE21306BFB6E3969A9bA70841,
        0xa5335cC80cCC0a09d1657dceAf423C241793E9B5,
        0x321d57d82714bb173f40C134881590Eee4792E1F,
        0x1010fb622aD9D19F3B62cC82fEfC5cb95a71aA34, //test wallets
        0x0aEa3638B16633e970c7311f22635e6064559a70,
        0x92bb4074DF8250Ff5AEbCCBcFDA90A5a0165F849
    ];

    mapping(address => uint256) public lastTimeClaim;
    mapping(address => uint256) public timesClaimed;
    mapping(address => uint256) public totalClaimedAmount;
    uint256 public presaleStartDate;
    uint256 endDate = block.timestamp;
    uint256 public claimInterval;
    uint256 public claimValueByDay = 100000000000000000000;
    uint256 public maxClaimValue = 2500000000000000000000;
    uint256 public maxClaimTimes = 23;
    address public presaleWalletAddress =
        0xfbAA3c716dA6378A0840754185BFf6A05a20e1C8;
    address public tokenAddress;

    constructor() {
        presaleStartDate = block.timestamp;
        claimInterval = 86400;
        tokenAddress = address(0x5e8e3D7E2694b9335d313F118ad30B83974ae2A9);
    }

    function changeClaimValueByDay(uint256 value) external onlyOwner {
        claimValueByDay = value;
    }

    function changeClaimInterval(uint256 value) external onlyOwner {
        claimInterval = value;
    }

    function updatePresaleAddress(address value) external onlyOwner {
        presaleWalletAddress = value;
    }

    function findAddressOnPresaleList(address wallet)
        internal
        view
        returns (int256 index)
    {
        //lookup if address is in presale list
        for (uint256 i = 0; i < PRESALE_WALLETS.length; i++) {
            if (wallet == address(PRESALE_WALLETS[i])) {
                return int256(i);
            }
        }
        return -1;
    }

    function calculateClaimableAmount(address wallet)
        public
        returns (uint256 claimAmount)
    {
        uint256 totalClaimableValue = 0;
        uint256 lastClaimDate = lastTimeClaim[wallet];

        uint diff = (block.timestamp - lastClaimDate) / claimInterval;
        //calc if the address has claim before, or how many times left to claim
        if (diff > 0 && timesClaimed[msg.sender] != 0) {
            totalClaimableValue = diff * claimValueByDay;
            timesClaimed[msg.sender] = diff;
        } else if (timesClaimed[msg.sender] == 0) {
            timesClaimed[msg.sender] = 1;
            totalClaimableValue = 100000000000000000000;
        }
        return totalClaimableValue;
    }

    function claim() external {
        require(msg.sender != address(0), "SENDER CAN'T BE ZERO");
        require(
            findAddressOnPresaleList(msg.sender) != -1,
            "SENDER NOT FOUND ON PRESALE LIST"
        );
        require(
            (block.timestamp - lastTimeClaim[msg.sender]) >= claimInterval,
            "TOO EARLY TO CLAIM"
        );
        require(
            totalClaimedAmount[msg.sender] < maxClaimValue,
            "MAX TOKEN AMOUNT CLAIMED "
        );
        uint256 _amountToClaim = calculateClaimableAmount(msg.sender);
        require(_amountToClaim > 0, "AMOUNT TO CLAIM HAS TO BE GREATER THAN 0");
        require(
            ERC20(tokenAddress).balanceOf(presaleWalletAddress) >
                _amountToClaim,
            "PRESALES POOL EMPTY"
        );

        ERC20(tokenAddress).transferFrom(
            presaleWalletAddress,
            msg.sender,
            _amountToClaim
        );
        totalClaimedAmount[msg.sender] += _amountToClaim;
        lastTimeClaim[msg.sender] = block.timestamp;
    }
}
