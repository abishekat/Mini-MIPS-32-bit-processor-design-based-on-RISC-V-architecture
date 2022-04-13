module CONTROLLER(
  input [31:0] if_id_inst, id_ex_inst, ex_dm_inst,
  input [4:0] id_ex_wb_addr, ex_dm_wb_addr, 
  output reg r_enable, w_enable, alu_ctrl, buble_mux_ctrl, if_id_reg_ctrl, pcw_ctrl, rd_addr_ctrl, rd_enable_ctrl, 
  r_i_sel_ctrl, rd_ctrl, wd_ctrl, wb_mux_ctrl, fwd_dm_ctrl, beq_and_in, 
  output reg [1:0] fwd_ctrl_a, fwd_ctrl_b
  );
  
  initial 
  begin
    if_id_reg_ctrl = 1'b1;
    pcw_ctrl = 1'b1;
  end
  
  always @(*)
  begin
  if((id_ex_inst[31:26]==6'b100001)
  &&
  ((((if_id_inst[31:26]==6'b000000) || (if_id_inst[31:26]==6'b000101))&&((id_ex_inst[20:16]==if_id_inst[25:21]) || (id_ex_inst[20:16]==if_id_inst[20:16])))
  ||
  ((id_ex_inst[20:16]==if_id_inst[25:21])
  &&
  ((if_id_inst[31:26] == (6'b000000) || (if_id_inst[31:26] ==(6'b000001)) || (if_id_inst[31:26] ==(6'b100010)) 
    || (if_id_inst[31:26] ==(6'b001001)) || (if_id_inst[31:26] ==(6'b000101)) || (if_id_inst[31:26] ==(6'b100001)) 
      || (if_id_inst[31:26] ==(6'b101000)) || (if_id_inst[31:26] ==(6'b001000)) || (if_id_inst[31:26] ==(6'b000010)))))))
    
         begin
           buble_mux_ctrl = 1'b0;
           if_id_reg_ctrl = 1'b0;
           pcw_ctrl = 1'b0;				
         end 
  else
    begin
      r_enable = 1'b1;
      pcw_ctrl = 1'b1;
      alu_ctrl = 1'b1;
      buble_mux_ctrl = 1'b1;
      if_id_reg_ctrl = 1'b1;
        
      if((if_id_inst[31:26]==(6'b000000)) ||(if_id_inst[31:26]==(6'b001101))||(if_id_inst[31:26]==(6'b100010))||(if_id_inst[31:26]==(6'b100001))||(if_id_inst[31:26]==(6'b001001)))
        begin
          w_enable = 1'b1;
          rd_enable_ctrl = 1'b1;
          wd_ctrl = 1'b0;
        end
      
      else if((if_id_inst[31:26]==(6'b101000)))
        begin
          w_enable = 1'b0;
          rd_enable_ctrl = 1'b0;
          wd_ctrl = 1'b1;
        end
        
      else if((if_id_inst[31:26]==(6'b000101)))
        begin
          w_enable = 1'b0;
          rd_enable_ctrl = 1'b0;
          wd_ctrl = 1'b0;
        end
        
      else
        
        $display("INVALID INSTRUCTION");
        
        if((if_id_inst[31:26]==6'b000000)||(if_id_inst[31:26]==6'b000101))  // R type and beq
            begin
              r_i_sel_ctrl = 1'b0;    //RT
              rd_ctrl = 1'b0;      /// RD, WD Not needed for R type
            end
        else if((if_id_inst[31:26]==6'b100001)) //LD
           begin
             r_i_sel_ctrl = 1'b1;   
             rd_ctrl = 1'b1; 
            
           end
          
        else if((if_id_inst[31:26]==6'b101000) || (if_id_inst[31:26]==6'b001101) || (if_id_inst[31:26]==6'b100010) || (if_id_inst[31:26]==6'b001001))
          // SW and I Type
           begin
             r_i_sel_ctrl = 1'b1;
             rd_ctrl = 1'b0;
           end
        
       else
         $display("INVALID INSTRUCTION");
         
         if((if_id_inst[31:26]==6'b000000)) // r type
           rd_addr_ctrl =1'b1; 
           
         else if((if_id_inst[31:26]==6'b100001) || (if_id_inst[31:26]==6'b001101) || (if_id_inst[31:26]==6'b100010) || (if_id_inst[31:26]==6'b001001)) //LD I Type
           rd_addr_ctrl = 1'b0;
           
         else if((if_id_inst[31:26]==6'b101000) || (if_id_inst[31:26]==6'b000101)) // ST, BNE
           rd_addr_ctrl = 1'bX;
          
         else
          $display("INVALID INSTRUCTION");
          
        if((if_id_inst[31:26]==6'b000000) || (if_id_inst[31:26]==6'b001101) || (if_id_inst[31:26]==6'b100010) || (if_id_inst[31:26]==6'b001001)) //R,I TYPE
          wb_mux_ctrl = 1'b1; //wb mux sel alu op  
          
        else if(if_id_inst[31:26]==6'b100001) // dm out LOAD
          wb_mux_ctrl = 1'b0;
          
       else if((if_id_inst[31:26]==6'b101000) || (if_id_inst[31:26]==6'b000101)) // ST, BNE
          wb_mux_ctrl = 1'bX;
       else
          $display("INVALID INSTRUCTION");
        
        if((if_id_inst[31:26]==6'b000101)) // BNE
          beq_and_in = 1'b1; 
        else
          beq_and_in = 1'b0;
          
        // FWD UNIT
        if((if_id_inst[31:26]==6'b000000)||(if_id_inst[31:26]==6'b000101)) // R type and beq
          begin
            //FWD A
            if(if_id_inst[25:21]==id_ex_wb_addr)
              fwd_ctrl_a = 2'b00;
            else if(id_ex_wb_addr != ex_dm_wb_addr)
              begin
                if(if_id_inst[25:21] == ex_dm_wb_addr) //ID_RS=DM_RD
                  fwd_ctrl_a = 2'b01;
              end
            else 
              fwd_ctrl_a = 2'b10;
              
              //FWD B
              
              if(if_id_inst[20:16]==id_ex_wb_addr) //ID_RT=EX_RD
                 fwd_ctrl_b = 2'b00;
                
              else if(id_ex_wb_addr != ex_dm_wb_addr)
                 begin
                    if(if_id_inst[20:16] == ex_dm_wb_addr) //ID_RT=DM_RD
                        fwd_ctrl_a = 2'b01;
                 end
                 
              else
                 fwd_ctrl_b=2'b10;
          end
          
          if((if_id_inst[31:26]==6'b001101) || (if_id_inst[31:26]==6'b100010) || (if_id_inst[31:26]==6'b001001)) //R,I TYPE
             
             begin
             // FWD UNIT CHECK
              if(if_id_inst[25:21]==id_ex_wb_addr)
                begin
                  fwd_ctrl_a = 2'b00;
                  fwd_ctrl_b = 2'b10;
                end
              else if(id_ex_wb_addr != ex_dm_wb_addr)
                 begin
                   if(if_id_inst[25:21]==ex_dm_wb_addr)
                     begin
                      fwd_ctrl_a = 2'b01;
                      fwd_ctrl_b = 2'b10;
                     end
                 end  
                 
              else 
                begin
                  fwd_ctrl_a = 2'b10;
                  fwd_ctrl_b = 2'b10;
                end
              
                
             end      
          
          if(if_id_inst[31:26]==6'b100001)    ////// for LOAD
            begin
              // FWD Unit check
              if(if_id_inst[25:21]==id_ex_wb_addr)
                begin
                  fwd_ctrl_a = 2'b00;
                  fwd_ctrl_b = 2'b10;
                end
              else if(id_ex_wb_addr != ex_dm_wb_addr)
                 begin
                   if(if_id_inst[25:21]==ex_dm_wb_addr)
                     begin
                      fwd_ctrl_a = 2'b01;
                      fwd_ctrl_b = 2'b10;
                    end
                 end  
                 
              else 
                begin
                  fwd_ctrl_a = 2'b10;
                  fwd_ctrl_b = 2'b10;
                end
              
            end
            
            
            if(if_id_inst[31:26]==6'b101000)    ////// for STORE
            begin
              // FWD Unit A
              if(if_id_inst[25:21]==id_ex_wb_addr)
                begin
                  fwd_ctrl_a = 2'b00;
                  fwd_ctrl_b = 2'b10;
                end
              else if(id_ex_wb_addr != ex_dm_wb_addr)
                 begin
                   if(if_id_inst[25:21]==ex_dm_wb_addr)
                     begin
                      fwd_ctrl_a = 2'b01;
                      fwd_ctrl_b = 2'b10;
                    end
                 end  
                 
              else 
                begin
                  fwd_ctrl_a = 2'b10;
                  fwd_ctrl_b = 2'b10;
                end
                
            // FWD UNIT B
            if(if_id_inst[20:16]==id_ex_wb_addr)  /// if RT_ID= RT_Ex
               fwd_dm_ctrl = 1'b1;
            else
               fwd_dm_ctrl = 1'b0;
              
            end         
    end
  end
  
endmodule
  
