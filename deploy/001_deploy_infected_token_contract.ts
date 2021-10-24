import {HardhatRuntimeEnvironment} from 'hardhat/types';
import {DeployFunction} from 'hardhat-deploy/types';
import holyAddresses from '../config/holyAddresses.json';
import infectedAddresses from '../config/infectedAddresses.json';

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const {deployments, getNamedAccounts} = hre;
  const {deploy} = deployments;

  const {deployer} = await getNamedAccounts();

  await deploy('InfectedToken', {
    from: deployer,
    args: [holyAddresses, infectedAddresses],
    log: true,
    gasLimit: 4000000
  });
};

export default func;
func.tags = ['Infected'];