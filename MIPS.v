`timescale 1ns / 1ps

module MIPS
	(
	input clk
	);
	
	//Fetch input wires
	wire PCSource;
	wire [31:0]BranchTarget;
	
	// Fetch module output wires
	wire Hit;
	wire [31:0]NextPC;
	wire [31:0]Instruction;
	
	
	//IF/ID outputs wires
	wire [31:0]instruction_out; // instruction khoroji IF/ID 
	wire hit_out;
	wire [31:0]nextPC_out;
	
	
	//Decode input wires 
	wire RegWrite_stage5;
	wire [4:0] WriteReg_stage5;
	wire [31:0] WriteData; //az stage 5
	
	
	//Decode output wires
	wire [5:0]opcode;
	wire [31:0]Read_Data_1;	//az decode be ID/EX
   wire [31:0]Read_Data_2;
	wire [31:0]Sign_Extended_Immediate;	//az decode be ID/EX
	wire [4:0]rd;
	wire [4:0]rt;
	
	
	//khoroji haye control unit
	wire RegWrite;
	wire ALUSrc;		//az control unit be id/ex
	wire RegDst;
	wire MemtoReg;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire [2:0]ALUOp;
	
	
	//ID/EX output wires 
	wire RegDstOut;
	wire [31:0] ReadData1Out;	//az ID/EX be execute 
	wire [31:0] ReadData2Out;
	wire [5:0] functOut;	
	wire [31:0]SignExtendImmediateOut; //khroji id_ex be execute 
	wire MemtoRegOut;
	wire ALUSrcOut;
	wire RegWriteOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire [2:0] ALUOpOut;
	wire [4:0]rdOut;
	wire [4:0]rtOut;
	wire hitOut;
	wire [31:0]nextPCOut_idex;
	
	
	
	//output of Execute module
	wire [31:0] ALUResult;	//ok
	wire Zero;	//ok
	

	wire [31:0] branchTarget_execute;
	assign branchTarget_execute = (SignExtendImmediateOut<<2) + nextPCOut_idex;
	
	wire [4:0] writeReg_ex;
	assign writeReg_ex = (RegDstOut == 0) ? rtOut : 
								(RegDstOut == 1) ? rdOut : 
								 5'bxxxxx;
	 



	//EX/MEM output wires
	wire [31:0] ALUResultOut;
	wire zeroFlagOut;
	wire [31:0] writeData_ex;
	wire BranchOut_exmem;
	wire [4:0] writeRegOut;
	wire hitOut_exmem;
	wire MemToRegOut_exmem;
	wire MemReadOut_exmem;
	wire MemWriteOut_exmem;
	wire RegWriteOut_exmem;
	
	
	assign PCSource = (zeroFlagOut && BranchOut_exmem );
	
	//DataMemory output wires
	wire [31:0] readData_mem;
	
	
	//MEM/WB output wires
	wire hitOut_memwb;
	wire MemToRegOut_memwb;
	wire [31:0] readDataOut_memwb;
	wire [31:0] ALUResultOut_memwb;
	
	
	

	//stage1 (fetch)
	Fetch fetch (
		.BranchTarget(BranchTarget), //ok
		.PCSource(PCSource), //ok
		.clk(clk), //ok
		
		.NextPC(NextPC), //ok
		.Instruction(Instruction), //ok
		.Hit(Hit)	//ok
	);
	



	
	//IF/ID pipeline register
	IFID ifid (
		.clk(clk), //ok
		.NextPC(NextPC), 	//ok
		.Instruction(Instruction), 	//ok
		.Hit(Hit), //ok
		
		.instruction_out(instruction_out), //ok
		.nextPC_out(nextPC_out), //ok
		.hit_out(hit_out)	//ok
	);
	

	
	
	
	
	
	
	
	
	//stage2 (decode)
	Decode decode (
		.clk(clk), //ok
		.Instruction(instruction_out), //ok
		.RegWrite(RegWrite_stage5), //ok
		.WriteReg(WriteReg_stage5), //ok	
		.WriteData(WriteData),	//ok
		
		.Opcode(opcode), //ok
		.Read_Data_1(Read_Data_1), //ok
		.Read_Data_2(Read_Data_2), 	//ok
		.Sign_Extended_Immediate(Sign_Extended_Immediate), 	//ok
		.rt(rt), 	//ok
		.rd(rd)	//ok
	);

	
	
	ControlUnit cu (	
		.opcode(opcode),	//ok 
		
		.RegDst(RegDst), //ok
		.ALUSrc(ALUSrc), //ok
		.MemtoReg(MemtoReg), //ok
		.RegWrite(RegWrite),  //ok
		.MemRead(MemRead), 	//ok
		.MemWrite(MemWrite), //ok
		.Branch(Branch), //ok
		.ALUOp(ALUOp)	//ok
	);

	
	
	
	
	
	
	
	
	//pipeline register ID/EX
	ID_EX id_ex  (
		.clk(clk), 	//ok
		.ReadData1(Read_Data_1), //ok
		.ReadData2(Read_Data_2), 	//ok
		.SignExtendImmediate(Sign_Extended_Immediate), //ok
		.RegDst(RegDst), //ok
		.ALUSrc(ALUSrc), //ok
		.MemtoReg(MemtoReg), //ok
		.RegWrite(RegWrite), //ok
		.MemRead(MemRead), //ok
		.MemWrite(MemWrite), //ok
		.Branch(Branch), //ok
		.ALUOp(ALUOp), //ok
		.rd(rd), //ok
		.rt(rt), //ok
		.funct(Sign_Extended_Immediate[5:0]), //ok
		.nextPC(nextPC_out),//ok 
		.hit(hit_out), //ok
		
		.ReadData1Out(ReadData1Out), //ok
		.ReadData2Out(ReadData2Out), 	//ok
		.SignExtendImmediateOut(SignExtendImmediateOut), //ok
		.RegDstOut(RegDstOut), 	//ok
		.ALUSrcOut(ALUSrcOut), //ok
		.MemtoRegOut(MemtoRegOut), //ok 
		.RegWriteOut(RegWriteOut), //ok
		.MemReadOut(MemReadOut), //ok
		.MemWriteOut(MemWriteOut), //ok
		.BranchOut(BranchOut), //ok
		.ALUOpOut(ALUOpOut), //ok
		.rdOut(rdOut), //ok
		.rtOut(rtOut), //ok
		.functOut(functOut), //ok
		.nextPCOut(nextPCOut_idex), 	//ok
		.hitOut(hitOut)	//ok
	);

	
	
	
	
	
	
	//stage3 (execute)
	Execute execute (
		.clk(clk), //ok
		.AluReadData1(ReadData1Out), //ok
		.AluReadData2(ReadData2Out), 	//ok
		.Immediate(SignExtendImmediateOut), //ok
		.funct(functOut), //ok
		.ALUOp(ALUOpOut), //ok
		.ALUSrc(ALUSrcOut), //ok
		
		.ALUResult(ALUResult), //ok
		.Zero(Zero)	//ok
	);
	


	
	
	
	
	//pipeline register EX/MEM
	EX_MEM ex_mem (
		.clk(clk), //ok
		.hit(hitOut), //ok
		.branchTarget(branchTarget_execute), //ok
		.zeroFlag(Zero),	//ok 
		.MemRead(MemReadOut), //ok
		.MemWrite(MemWriteOut),	//ok 
		.Branch(BranchOut),	//ok 
		.RegWrite(RegWriteOut), //ok
		.MemToReg(MemtoRegOut), 	//ok
		.ALUResult(ALUResult), //ok
		.readData2(ReadData2Out), //ok
		.writeReg(writeReg_ex),	//ok 
		
		.BranchTargetOut(BranchTarget), //ok
		.ALUResultOut(ALUResultOut), //ok
		.readData2Out(writeData_ex),	//ok 
		.writeRegOut(writeRegOut), //ok
		.hitOut(hitOut_exmem), //ok
		.zeroFlagOut(zeroFlagOut), //ok
		.MemReadOut(MemReadOut_exmem),	//ok 
		.MemWriteOut(MemWriteOut_exmem), //ok
		.BranchOut(BranchOut_exmem), //ok
		.RegWriteOut(RegWriteOut_exmem), //ok
		.MemToRegOut(MemToRegOut_exmem)//ok
	);

	
	
	
	
	
	
	//stage4	(DataMemory)
	DataMemory datamemory (
		.clk(clk), //ok
		.MemRead(MemReadOut_exmem), //ok
		.MemWrite(MemWriteOut_exmem), //ok
		.address(ALUResultOut), //ok
		.writeData(writeData_ex), //ok
		
		.readData(readData_mem)	//ok
	);
	
	
	
	//pipeline register MEM/WB
	MEM_WB mem_wb (
		.clk(clk), //ok
		.hit(hitOut_exmem), //ok
		.readData(readData_mem), //ok
		.ALUResult(ALUResultOut), //ok
		.writeReg(writeRegOut), //ok
		.RegWrite(RegWriteOut_exmem), //ok
		.MemToReg(MemToRegOut_exmem), //ok
		
		.hitOut(hitOut_memwb), 	//ok
		.readDataOut(readDataOut_memwb), //ok
		.ALUResultOut(ALUResultOut_memwb), //ok
		.writeRegOut(WriteReg_stage5), //ok
		.RegWriteOut(RegWrite_stage5), //ok
		.MemToRegOut(MemToRegOut_memwb)//ok
	);

	
	//stage5  (WriteBack)
	WriteBack writeback (
		.MemtoReg(MemToRegOut_memwb), //ok
		.readData(readDataOut_memwb), //ok
		.ALUResult(ALUResultOut_memwb), //ok
		
		.writeData(WriteData)//ok
	);


endmodule
