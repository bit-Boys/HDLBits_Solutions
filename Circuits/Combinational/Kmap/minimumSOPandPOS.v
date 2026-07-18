module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    
    
    assign out_sop = (~d & c & ~b & ~a) | (d & c & b & ~a) | (d & c & b & a) | (d & c & ~b & ~a) | (d & c & ~b & a);
    assign out_pos = (d | c | b | a) & (~d | c | b | a) & (d | c | ~b | a) & (~d | c | ~b | a) & (d | ~c | ~b | a) & (~d | c | b | ~a) & (d | ~c | b | ~a) & (~d | c | ~b | ~a) & (d | ~c | ~b | ~a)  & (d | c | b | ~a) & (d | c | ~b | ~a);
    
    // please NEVER do this
    

endmodule
