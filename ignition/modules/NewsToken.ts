import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const HealthTokenModule = buildModule("NewsTokenModule", (m) => {

  const HealthToken = m.contract("NewsToken", []);

  return { HealthToken };
});

export default HealthTokenModule;
