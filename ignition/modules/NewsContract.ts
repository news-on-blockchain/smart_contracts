import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MedicalModule = buildModule("NewsModule", (m) => {

  const Medical = m.contract("NewsContract", [process.env.TOKEN_ADDRESS!]);

  return { Medical };
});

export default MedicalModule;
