import '@nomiclabs/hardhat-ethers';
import "hardhat-deploy";
import "@nomiclabs/hardhat-waffle";

module.exports = {
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  namedAccounts: {
    deployer: 0,
    landTokenERC20Beneficiary: 1,
  },
  defaultNetwork: "localhost",
  networks: {
    localhost: {
      live: false,
      saveDeployments: true,
      tags: ["local"]
    },
    hardhat: {
      live: false,
      saveDeployments: true,
      tags: ["test", "local"]
    },
  }
};
