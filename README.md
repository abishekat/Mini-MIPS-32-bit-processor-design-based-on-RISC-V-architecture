# CAD_PROJECT
Source code for Simulation CAD Project - Concordia U

Steps for executing the code
------------------------------

1. In order to run the code we need to create the project in ModelSim Simulator SE-64 6.6g, to do that:

1.1. Go to the Menu Bar and clic on >> File >> New >> Project, then a popup window will appear (Windows's name: Create Project)

We have to enter: 
Project Name: MINI_MIPS
Project Location: /nfs/home/{first-character-useraccount}/{useraccount}/{projectfolder}
Default library name: work

1.2. Once it's created, you need to create the same structure of folders inside the new project for a better understanding, below the structure:
1.3. Please proceed to create following folders:

>> ALU

>> DATA_MEM_STAGE

>> ID_STAGE

>> IF_STAGE

>> REGISTER_STAGE_2

>> STAGE_BUFFERS

>> WB_STAGE


1.4. Go to the Menu Bar and clic on >> Project Menu >> add to project >> existing file, then window popup will appear to browse and select all the contained files in the project folder.
While adding each file, make sure to enable "copy to project directory" in the "Add File to Project" window popup, after adding all the necessary files to the project click compile all.

Below you can find the list of project files (all of them must be added to the project) along with a brief description
------------------------------------------------------------------------------------------------------------------------

 ALU\ALU.v  --> this module is in charge of processing the instructions supported by the MIPS, it will receive the operands and the ALU operation control as inputs to compute the result depending on which type of instruction is being proccessed such as: ORI, SLL.

 ALU\ALU_A_FWD.v  --> this module is part of the ALU block and will compute the first operand for the main ALU (ALU A Operand), this module will no compute the final result of ALU.

 ALU\ALU_B_FWD.v  --> this module is part of the ALU block and will compute the second operand for the main ALU (ALU B Operand), this module will no compute the final result of ALU.

 ALU\ALU_BLOCK.v  --> this module is in charge of invoking all the sub modules of the alu pipeline such as: ALU.v, ALU_A_FWD.v, ALU_B_FWD.v.

 ALU\ALU_CONTROLLER.v  --> this module receives the instruction from ID stage and return the ALU operation control and a value depending if the instruction is branch if equal.

 ALU\BEQ_ALU.v  -->  this module calculates the sum operation of PC value and Signed Extended operation.

 ALU\BEQ_MODULE.v  --> this modules calculates the and operation of branch not equal (BNE) and the value of Branch if Equal computed previously in ALU, if ALU outcome is equal to 0, the Branch if Equal value will be b1 otherwise will ne b1.

 ALU\R_IN_MUX_SEL.v  --> this module calculates the register mux value 

 ALU\SIGNED_EXT.v  --> this module in charge of assigning either sign extended value or rt value therefore the outcome 

 ALU\TB_ALU_BLOCK.v  --> this module is to test the functionality of alu block

DATA_MEM_STAGE\DATA_MEM.v  --> this module will be in charge of reading and writing the data in the data memory

DATA_MEM_STAGE\DM_ADDR_SEL_MUX.v  --> this module oversees assigning the data which will be written on data memory according to the fwd data memory control valuethis module supervises the allocation of the data to be written in the data memory according to the control value of the forward data memory

DATA_MEM_STAGE\DM_PIPELINE.v  --> This module is responsible for invoking all the other modules in the data memory.

DATA_MEM_STAGE\TB_DM_PIPELINE.v  --> This module has the purpose of executing the data memory pipeline and sending test data to test its operation.

 ID_STAGE\BUB_CONTROLLER.v  --> This module for sending stall signals.

 ID_STAGE\BUBLE.v  --> This module performs store operations.

 ID_STAGE\CONTROLLER.v  --> This module helps in actuation the other units to allow data flow correctly in the pipeline.

 ID_STAGE\ID_STAGE.v  -->  This module helps to decode the instruction from the stage buffer and also send the data and control signals to the following stage buffer located between Instruction Decode and Execution Stage, it also is responsible for invoking all the other modules in the ID Stage such as BUBLE, CONTROLLER etc.

 IF_STAGE\IF_STAGE.v  --> This module is responsible for fetching the instruction and setting the program counter for next instruction, it also invokes all the other modules in Instruction Fetch Stage such as INSTRUCTION_MEMORY, PROGRAM_COUNTER, PC_ADDER_4 etc.

 IF_STAGE\INSTRUCTION_MEMORY.v  --> This module is a subsystem of IF stage, and contains the 32-bit instructions for performing the operations.

 IF_STAGE\PC_ADDER_4.v  --> This module increments the Program Counter by 4 for fetching the next instruction.

 IF_STAGE\PC_ADDER_BEQ_MUX.v  --> This module selects whether the program counter will points to the next Program counter or branch address.


 IF_STAGE\PC_TEST_BENCH.v  -->  This module is responsible to test the program counter module sending test data values.

 IF_STAGE\PROGRAM_COUNTER.v  -->

 IF_STAGE\TEST_BENCH_IF.v  -->

 REGISTER_STAGE_2\RD_ADDR_MUX.v  -->

 REGISTER_STAGE_2\REGISTERS_STAGE2.v  -->

 REGISTER_STAGE_2\TB_REG_STAGE2.v  -->

 STAGE_BUFFERS\DM_WB_SB.v  -->

 STAGE_BUFFERS\EX_DM_SB.v  -->

 STAGE_BUFFERS\ID_EX_SB.v  -->

 STAGE_BUFFERS\IF_ID_SB.v  -->

 STAGE_BUFFERS\TB_IF_ID.v  -->

 WB_STAGE\WB_MUX.v  -->

 MIPS32.v  -->





