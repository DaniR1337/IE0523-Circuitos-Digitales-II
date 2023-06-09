/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "sumador4.v:9" *)
module sumador4(CLK, ENB, RCI, MODO, A, B, Q, RCO);
  (* src = "sumador4.v:20" *)
  wire [3:0] _000_;
  (* src = "sumador4.v:20" *)
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  (* src = "sumador4.v:13" *)
  input [3:0] A;
  (* src = "sumador4.v:14" *)
  input [3:0] B;
  (* src = "sumador4.v:9" *)
  input CLK;
  (* src = "sumador4.v:10" *)
  input ENB;
  (* src = "sumador4.v:12" *)
  input [1:0] MODO;
  (* src = "sumador4.v:15" *)
  output [3:0] Q;
  (* src = "sumador4.v:11" *)
  input RCI;
  (* src = "sumador4.v:16" *)
  output RCO;
  NOT _126_ (
    .A(RCI),
    .Y(_051_)
  );
  NOT _127_ (
    .A(MODO[0]),
    .Y(_052_)
  );
  NOT _128_ (
    .A(MODO[1]),
    .Y(_053_)
  );
  NOT _129_ (
    .A(B[1]),
    .Y(_054_)
  );
  NOT _130_ (
    .A(B[2]),
    .Y(_055_)
  );
  NOT _131_ (
    .A(B[0]),
    .Y(_056_)
  );
  NOT _132_ (
    .A(A[0]),
    .Y(_057_)
  );
  NOT _133_ (
    .A(A[1]),
    .Y(_058_)
  );
  NOT _134_ (
    .A(A[2]),
    .Y(_059_)
  );
  NOT _135_ (
    .A(A[3]),
    .Y(_060_)
  );
  NOR _136_ (
    .A(_052_),
    .B(MODO[1]),
    .Y(_061_)
  );
  NAND _137_ (
    .A(MODO[0]),
    .B(_053_),
    .Y(_062_)
  );
  NOR _138_ (
    .A(MODO[0]),
    .B(_053_),
    .Y(_063_)
  );
  NAND _139_ (
    .A(_052_),
    .B(MODO[1]),
    .Y(_064_)
  );
  NAND _140_ (
    .A(_062_),
    .B(_064_),
    .Y(_065_)
  );
  NAND _141_ (
    .A(ENB),
    .B(_065_),
    .Y(_066_)
  );
  NOR _142_ (
    .A(RCI),
    .B(_053_),
    .Y(_067_)
  );
  NOR _143_ (
    .A(_063_),
    .B(_067_),
    .Y(_068_)
  );
  NAND _144_ (
    .A(_062_),
    .B(_068_),
    .Y(_069_)
  );
  NAND _145_ (
    .A(ENB),
    .B(_069_),
    .Y(_070_)
  );
  NAND _146_ (
    .A(Q[0]),
    .B(_070_),
    .Y(_071_)
  );
  NOR _147_ (
    .A(B[0]),
    .B(A[0]),
    .Y(_072_)
  );
  NOR _148_ (
    .A(_056_),
    .B(_057_),
    .Y(_073_)
  );
  NAND _149_ (
    .A(B[0]),
    .B(A[0]),
    .Y(_074_)
  );
  NOR _150_ (
    .A(_072_),
    .B(_073_),
    .Y(_075_)
  );
  NAND _151_ (
    .A(_065_),
    .B(_075_),
    .Y(_076_)
  );
  NOR _152_ (
    .A(RCI),
    .B(_076_),
    .Y(_077_)
  );
  NOR _153_ (
    .A(_051_),
    .B(_064_),
    .Y(_078_)
  );
  NAND _154_ (
    .A(RCI),
    .B(_063_),
    .Y(_079_)
  );
  NAND _155_ (
    .A(RCI),
    .B(_061_),
    .Y(_080_)
  );
  NOR _156_ (
    .A(_075_),
    .B(_080_),
    .Y(_081_)
  );
  NOR _157_ (
    .A(_077_),
    .B(_081_),
    .Y(_082_)
  );
  NAND _158_ (
    .A(_079_),
    .B(_082_),
    .Y(_083_)
  );
  NAND _159_ (
    .A(ENB),
    .B(_083_),
    .Y(_084_)
  );
  NAND _160_ (
    .A(_071_),
    .B(_084_),
    .Y(_000_[0])
  );
  NAND _161_ (
    .A(Q[1]),
    .B(_070_),
    .Y(_085_)
  );
  NOR _162_ (
    .A(B[1]),
    .B(A[1]),
    .Y(_086_)
  );
  NOT _163_ (
    .A(_086_),
    .Y(_087_)
  );
  NOR _164_ (
    .A(_054_),
    .B(_058_),
    .Y(_088_)
  );
  NAND _165_ (
    .A(B[1]),
    .B(A[1]),
    .Y(_089_)
  );
  NOR _166_ (
    .A(_086_),
    .B(_088_),
    .Y(_090_)
  );
  NAND _167_ (
    .A(_087_),
    .B(_089_),
    .Y(_091_)
  );
  NOR _168_ (
    .A(_074_),
    .B(_091_),
    .Y(_092_)
  );
  NAND _169_ (
    .A(_073_),
    .B(_090_),
    .Y(_093_)
  );
  NOR _170_ (
    .A(_073_),
    .B(_090_),
    .Y(_094_)
  );
  NOR _171_ (
    .A(_092_),
    .B(_094_),
    .Y(_095_)
  );
  NOR _172_ (
    .A(_075_),
    .B(_095_),
    .Y(_096_)
  );
  NAND _173_ (
    .A(_075_),
    .B(_090_),
    .Y(_097_)
  );
  NOT _174_ (
    .A(_097_),
    .Y(_098_)
  );
  NOR _175_ (
    .A(_080_),
    .B(_096_),
    .Y(_099_)
  );
  NAND _176_ (
    .A(_097_),
    .B(_099_),
    .Y(_100_)
  );
  NAND _177_ (
    .A(_061_),
    .B(_095_),
    .Y(_101_)
  );
  NOR _178_ (
    .A(RCI),
    .B(_101_),
    .Y(_102_)
  );
  NOR _179_ (
    .A(_056_),
    .B(A[0]),
    .Y(_103_)
  );
  NAND _180_ (
    .A(B[0]),
    .B(_057_),
    .Y(_104_)
  );
  NOR _181_ (
    .A(_091_),
    .B(_104_),
    .Y(_105_)
  );
  NOR _182_ (
    .A(_090_),
    .B(_103_),
    .Y(_106_)
  );
  NOR _183_ (
    .A(_105_),
    .B(_106_),
    .Y(_107_)
  );
  NOR _184_ (
    .A(RCI),
    .B(_107_),
    .Y(_108_)
  );
  NOR _185_ (
    .A(_064_),
    .B(_108_),
    .Y(_109_)
  );
  NOR _186_ (
    .A(_102_),
    .B(_109_),
    .Y(_110_)
  );
  NAND _187_ (
    .A(_100_),
    .B(_110_),
    .Y(_111_)
  );
  NAND _188_ (
    .A(ENB),
    .B(_111_),
    .Y(_112_)
  );
  NAND _189_ (
    .A(_085_),
    .B(_112_),
    .Y(_000_[1])
  );
  NAND _190_ (
    .A(Q[2]),
    .B(_070_),
    .Y(_113_)
  );
  NOR _191_ (
    .A(B[2]),
    .B(A[2]),
    .Y(_114_)
  );
  NOT _192_ (
    .A(_114_),
    .Y(_115_)
  );
  NOR _193_ (
    .A(_055_),
    .B(_059_),
    .Y(_116_)
  );
  NAND _194_ (
    .A(B[2]),
    .B(A[2]),
    .Y(_117_)
  );
  NOR _195_ (
    .A(_114_),
    .B(_116_),
    .Y(_118_)
  );
  NAND _196_ (
    .A(_115_),
    .B(_117_),
    .Y(_119_)
  );
  NOR _197_ (
    .A(B[1]),
    .B(_058_),
    .Y(_120_)
  );
  NOR _198_ (
    .A(_106_),
    .B(_120_),
    .Y(_121_)
  );
  NOT _199_ (
    .A(_121_),
    .Y(_122_)
  );
  NAND _200_ (
    .A(_118_),
    .B(_121_),
    .Y(_123_)
  );
  NAND _201_ (
    .A(_119_),
    .B(_122_),
    .Y(_124_)
  );
  NAND _202_ (
    .A(_123_),
    .B(_124_),
    .Y(_125_)
  );
  NAND _203_ (
    .A(_051_),
    .B(_125_),
    .Y(_002_)
  );
  NAND _204_ (
    .A(_063_),
    .B(_002_),
    .Y(_003_)
  );
  NOR _205_ (
    .A(_088_),
    .B(_092_),
    .Y(_004_)
  );
  NAND _206_ (
    .A(_089_),
    .B(_093_),
    .Y(_005_)
  );
  NOR _207_ (
    .A(_119_),
    .B(_004_),
    .Y(_006_)
  );
  NAND _208_ (
    .A(_118_),
    .B(_005_),
    .Y(_007_)
  );
  NAND _209_ (
    .A(_119_),
    .B(_004_),
    .Y(_008_)
  );
  NAND _210_ (
    .A(_007_),
    .B(_008_),
    .Y(_009_)
  );
  NAND _211_ (
    .A(RCI),
    .B(_098_),
    .Y(_010_)
  );
  NAND _212_ (
    .A(_009_),
    .B(_010_),
    .Y(_011_)
  );
  NOR _213_ (
    .A(_009_),
    .B(_010_),
    .Y(_012_)
  );
  NOR _214_ (
    .A(_062_),
    .B(_012_),
    .Y(_013_)
  );
  NAND _215_ (
    .A(_011_),
    .B(_013_),
    .Y(_014_)
  );
  NAND _216_ (
    .A(_003_),
    .B(_014_),
    .Y(_015_)
  );
  NAND _217_ (
    .A(ENB),
    .B(_015_),
    .Y(_016_)
  );
  NAND _218_ (
    .A(_113_),
    .B(_016_),
    .Y(_000_[2])
  );
  NAND _219_ (
    .A(Q[3]),
    .B(_070_),
    .Y(_017_)
  );
  NOR _220_ (
    .A(B[3]),
    .B(A[3]),
    .Y(_018_)
  );
  NOT _221_ (
    .A(_018_),
    .Y(_019_)
  );
  NAND _222_ (
    .A(B[3]),
    .B(A[3]),
    .Y(_020_)
  );
  NAND _223_ (
    .A(_019_),
    .B(_020_),
    .Y(_021_)
  );
  NOT _224_ (
    .A(_021_),
    .Y(_022_)
  );
  NOR _225_ (
    .A(_116_),
    .B(_006_),
    .Y(_023_)
  );
  NAND _226_ (
    .A(_117_),
    .B(_007_),
    .Y(_024_)
  );
  NAND _227_ (
    .A(_021_),
    .B(_024_),
    .Y(_025_)
  );
  NAND _228_ (
    .A(_022_),
    .B(_023_),
    .Y(_026_)
  );
  NAND _229_ (
    .A(_025_),
    .B(_026_),
    .Y(_027_)
  );
  NAND _230_ (
    .A(_012_),
    .B(_027_),
    .Y(_028_)
  );
  NOR _231_ (
    .A(_012_),
    .B(_027_),
    .Y(_029_)
  );
  NOR _232_ (
    .A(_062_),
    .B(_029_),
    .Y(_030_)
  );
  NAND _233_ (
    .A(_028_),
    .B(_030_),
    .Y(_031_)
  );
  NAND _234_ (
    .A(_055_),
    .B(A[2]),
    .Y(_032_)
  );
  NAND _235_ (
    .A(_124_),
    .B(_032_),
    .Y(_033_)
  );
  NOR _236_ (
    .A(_021_),
    .B(_033_),
    .Y(_034_)
  );
  NAND _237_ (
    .A(_021_),
    .B(_033_),
    .Y(_035_)
  );
  NAND _238_ (
    .A(_063_),
    .B(_035_),
    .Y(_036_)
  );
  NOR _239_ (
    .A(_034_),
    .B(_036_),
    .Y(_037_)
  );
  NOR _240_ (
    .A(_078_),
    .B(_037_),
    .Y(_038_)
  );
  NAND _241_ (
    .A(_031_),
    .B(_038_),
    .Y(_039_)
  );
  NAND _242_ (
    .A(ENB),
    .B(_039_),
    .Y(_040_)
  );
  NAND _243_ (
    .A(_017_),
    .B(_040_),
    .Y(_000_[3])
  );
  NAND _244_ (
    .A(RCO),
    .B(_066_),
    .Y(_041_)
  );
  NAND _245_ (
    .A(_020_),
    .B(_023_),
    .Y(_042_)
  );
  NAND _246_ (
    .A(_019_),
    .B(_042_),
    .Y(_043_)
  );
  NAND _247_ (
    .A(_028_),
    .B(_043_),
    .Y(_044_)
  );
  NAND _248_ (
    .A(_061_),
    .B(_044_),
    .Y(_045_)
  );
  NOR _249_ (
    .A(B[3]),
    .B(_060_),
    .Y(_046_)
  );
  NOR _250_ (
    .A(_036_),
    .B(_046_),
    .Y(_047_)
  );
  NOR _251_ (
    .A(_078_),
    .B(_047_),
    .Y(_048_)
  );
  NAND _252_ (
    .A(_045_),
    .B(_048_),
    .Y(_049_)
  );
  NAND _253_ (
    .A(ENB),
    .B(_049_),
    .Y(_050_)
  );
  NAND _254_ (
    .A(_041_),
    .B(_050_),
    .Y(_001_)
  );
  (* src = "sumador4.v:20" *)
  DFF _255_ (
    .C(CLK),
    .D(_000_[0]),
    .Q(Q[0])
  );
  (* src = "sumador4.v:20" *)
  DFF _256_ (
    .C(CLK),
    .D(_000_[1]),
    .Q(Q[1])
  );
  (* src = "sumador4.v:20" *)
  DFF _257_ (
    .C(CLK),
    .D(_000_[2]),
    .Q(Q[2])
  );
  (* src = "sumador4.v:20" *)
  DFF _258_ (
    .C(CLK),
    .D(_000_[3]),
    .Q(Q[3])
  );
  (* src = "sumador4.v:20" *)
  DFF _259_ (
    .C(CLK),
    .D(_001_),
    .Q(RCO)
  );
endmodule
