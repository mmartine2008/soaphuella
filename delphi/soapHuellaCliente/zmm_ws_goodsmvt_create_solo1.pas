// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://srv-s4-asq.pdm.local:8000/sap/bc/srt/wsdl/flv_10002A111AD1/bndg_url/sap/bc/srt/rfc/sap/zmm_ws_goodsmvt_create_solo/400/zmm_ws_goodsmvt_create_solo/zmm_ws_goodsmvt_create_solo?sap-client=400
// Encoding : utf-8
// Codegen  : [wfDebug,wfAmbiguousComplexTypesAsArray,wfUseSerializerClassForAttrs]
// Version  : 1.0
// (02/05/2019 02:36:34 a.m. - 1.33.2.5)
// ************************************************************************ //

unit zmm_ws_goodsmvt_create_solo1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"

  BAPI2017_GM_HEAD_01  = class;                 { "urn:sap-com:document:sap:rfc:functions" }
  BAPI2017_GM_ITEM_CREATE = class;              { "urn:sap-com:document:sap:rfc:functions" }
  BAPIRET2             = class;                 { "urn:sap-com:document:sap:rfc:functions" }

  char1           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char10          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char12          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char14          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char15          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char16          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char18          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char2           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char20          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char220         =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char24          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char25          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char3           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char30          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char32          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char35          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char4           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char40          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char50          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char6           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  char8           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  date10          =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  decimal23_4     = TXSDecimal;      { "urn:sap-com:document:sap:rfc:functions" }
  decimal3_0      = TXSDecimal;      { "urn:sap-com:document:sap:rfc:functions" }
  numeric10       =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  numeric2        =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  numeric3        =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  numeric4        =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  numeric5        =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  numeric6        =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }
  quantum13_3     = TXSDecimal;      { "urn:sap-com:document:sap:rfc:functions" }
  unit3           =  type WideString;      { "urn:sap-com:document:sap:rfc:functions" }


  // ************************************************************************ //
  // Namespace : urn:sap-com:document:sap:rfc:functions
  // ************************************************************************ //
  BAPI2017_GM_HEAD_01 = class(TRemotable)
  private
    FPSTNG_DATE: date10;
    FDOC_DATE: date10;
    FREF_DOC_NO: char16;
    FBILL_OF_LADING: char16;
    FGR_GI_SLIP_NO: char10;
    FPR_UNAME: char12;
    FHEADER_TXT: char25;
    FVER_GR_GI_SLIP: char1;
    FVER_GR_GI_SLIPX: char1;
    FEXT_WMS: char1;
    FREF_DOC_NO_LONG: char35;
    FBILL_OF_LADING_LONG: char35;
    FBAR_CODE: char40;
  published
    property PSTNG_DATE: date10 read FPSTNG_DATE write FPSTNG_DATE;
    property DOC_DATE: date10 read FDOC_DATE write FDOC_DATE;
    property REF_DOC_NO: char16 read FREF_DOC_NO write FREF_DOC_NO;
    property BILL_OF_LADING: char16 read FBILL_OF_LADING write FBILL_OF_LADING;
    property GR_GI_SLIP_NO: char10 read FGR_GI_SLIP_NO write FGR_GI_SLIP_NO;
    property PR_UNAME: char12 read FPR_UNAME write FPR_UNAME;
    property HEADER_TXT: char25 read FHEADER_TXT write FHEADER_TXT;
    property VER_GR_GI_SLIP: char1 read FVER_GR_GI_SLIP write FVER_GR_GI_SLIP;
    property VER_GR_GI_SLIPX: char1 read FVER_GR_GI_SLIPX write FVER_GR_GI_SLIPX;
    property EXT_WMS: char1 read FEXT_WMS write FEXT_WMS;
    property REF_DOC_NO_LONG: char35 read FREF_DOC_NO_LONG write FREF_DOC_NO_LONG;
    property BILL_OF_LADING_LONG: char35 read FBILL_OF_LADING_LONG write FBILL_OF_LADING_LONG;
    property BAR_CODE: char40 read FBAR_CODE write FBAR_CODE;
  end;



  // ************************************************************************ //
  // Namespace : urn:sap-com:document:sap:rfc:functions
  // ************************************************************************ //
  BAPI2017_GM_ITEM_CREATE = class(TRemotable)
  private
    FMATERIAL: char18;
    FPLANT: char4;
    FSTGE_LOC: char4;
    FBATCH: char10;
    FMOVE_TYPE: char3;
    FSTCK_TYPE: char1;
    FSPEC_STOCK: char1;
    FVENDOR: char10;
    FCUSTOMER: char10;
    FSALES_ORD: char10;
    FS_ORD_ITEM: numeric6;
    FSCHED_LINE: numeric4;
    FVAL_TYPE: char10;
    FENTRY_QNT: quantum13_3;
    FENTRY_UOM: unit3;
    FENTRY_UOM_ISO: char3;
    FPO_PR_QNT: quantum13_3;
    FORDERPR_UN: unit3;
    FORDERPR_UN_ISO: char3;
    FPO_NUMBER: char10;
    FPO_ITEM: numeric5;
    FSHIPPING: char2;
    FCOMP_SHIP: char2;
    FNO_MORE_GR: char1;
    FITEM_TEXT: char50;
    FGR_RCPT: char12;
    FUNLOAD_PT: char25;
    FCOSTCENTER: char10;
    FORDERID: char12;
    FORDER_ITNO: numeric4;
    FCALC_MOTIVE: char2;
    FASSET_NO: char12;
    FSUB_NUMBER: char4;
    FRESERV_NO: numeric10;
    FRES_ITEM: numeric4;
    FRES_TYPE: char1;
    FWITHDRAWN: char1;
    FMOVE_MAT: char18;
    FMOVE_PLANT: char4;
    FMOVE_STLOC: char4;
    FMOVE_BATCH: char10;
    FMOVE_VAL_TYPE: char10;
    FMVT_IND: char1;
    FMOVE_REAS: numeric4;
    FRL_EST_KEY: char8;
    FREF_DATE: date10;
    FCOST_OBJ: char12;
    FPROFIT_SEGM_NO: numeric10;
    FPROFIT_CTR: char10;
    FWBS_ELEM: char24;
    FNETWORK: char12;
    FACTIVITY: char4;
    FPART_ACCT: char10;
    FAMOUNT_LC: decimal23_4;
    FAMOUNT_SV: decimal23_4;
    FREF_DOC_YR: numeric4;
    FREF_DOC: char10;
    FREF_DOC_IT: numeric4;
    FEXPIRYDATE: date10;
    FPROD_DATE: date10;
    FFUND: char10;
    FFUNDS_CTR: char16;
    FCMMT_ITEM: char14;
    FVAL_SALES_ORD: char10;
    FVAL_S_ORD_ITEM: numeric6;
    FVAL_WBS_ELEM: char24;
    FGL_ACCOUNT: char10;
    FIND_PROPOSE_QUANX: char1;
    FXSTOB: char1;
    FEAN_UPC: char18;
    FDELIV_NUMB_TO_SEARCH: char10;
    FDELIV_ITEM_TO_SEARCH: numeric6;
    FSERIALNO_AUTO_NUMBERASSIGNMENT: char1;
    FVENDRBATCH: char15;
    FSTGE_TYPE: char3;
    FSTGE_BIN: char10;
    FSU_PL_STCK_1: decimal3_0;
    FST_UN_QTYY_1: quantum13_3;
    FST_UN_QTYY_1_ISO: char3;
    FUNITTYPE_1: char3;
    FSU_PL_STCK_2: decimal3_0;
    FST_UN_QTYY_2: quantum13_3;
    FST_UN_QTYY_2_ISO: char3;
    FUNITTYPE_2: char3;
    FSTGE_TYPE_PC: char3;
    FSTGE_BIN_PC: char10;
    FNO_PST_CHGNT: char1;
    FGR_NUMBER: char10;
    FSTGE_TYPE_ST: char3;
    FSTGE_BIN_ST: char10;
    FMATDOC_TR_CANCEL: char10;
    FMATITEM_TR_CANCEL: numeric4;
    FMATYEAR_TR_CANCEL: numeric4;
    FNO_TRANSFER_REQ: char1;
    FCO_BUSPROC: char12;
    FACTTYPE: char6;
    FSUPPL_VEND: char10;
    FMATERIAL_EXTERNAL: char40;
    FMATERIAL_GUID: char32;
    FMATERIAL_VERSION: char10;
    FMOVE_MAT_EXTERNAL: char40;
    FMOVE_MAT_GUID: char32;
    FMOVE_MAT_VERSION: char10;
    FFUNC_AREA: char4;
    FTR_PART_BA: char4;
    FPAR_COMPCO: char4;
    FDELIV_NUMB: char10;
    FDELIV_ITEM: numeric6;
    FNB_SLIPS: numeric3;
    FNB_SLIPSX: char1;
    FGR_RCPTX: char1;
    FUNLOAD_PTX: char1;
    FSPEC_MVMT: char1;
    FGRANT_NBR: char20;
    FCMMT_ITEM_LONG: char24;
    FFUNC_AREA_LONG: char16;
    FLINE_ID: numeric6;
    FPARENT_ID: numeric6;
    FLINE_DEPTH: numeric2;
    FQUANTITY: quantum13_3;
    FBASE_UOM: unit3;
    FLONGNUM: char40;
    FBUDGET_PERIOD: char10;
    FEARMARKED_NUMBER: char10;
    FEARMARKED_ITEM: numeric3;
    FSTK_SEGMENT: char16;
    FMOVE_SEGMENT: char16;
    FMATERIAL_LONG: char40;
    FMOVE_MAT_LONG: char40;
    FSTK_SEG_LONG: char40;
    FMOV_SEG_LONG: char40;
    FCREATE_DELIVERY: char1;
  published
    property MATERIAL: char18 read FMATERIAL write FMATERIAL;
    property PLANT: char4 read FPLANT write FPLANT;
    property STGE_LOC: char4 read FSTGE_LOC write FSTGE_LOC;
    property BATCH: char10 read FBATCH write FBATCH;
    property MOVE_TYPE: char3 read FMOVE_TYPE write FMOVE_TYPE;
    property STCK_TYPE: char1 read FSTCK_TYPE write FSTCK_TYPE;
    property SPEC_STOCK: char1 read FSPEC_STOCK write FSPEC_STOCK;
    property VENDOR: char10 read FVENDOR write FVENDOR;
    property CUSTOMER: char10 read FCUSTOMER write FCUSTOMER;
    property SALES_ORD: char10 read FSALES_ORD write FSALES_ORD;
    property S_ORD_ITEM: numeric6 read FS_ORD_ITEM write FS_ORD_ITEM;
    property SCHED_LINE: numeric4 read FSCHED_LINE write FSCHED_LINE;
    property VAL_TYPE: char10 read FVAL_TYPE write FVAL_TYPE;
    property ENTRY_QNT: quantum13_3 read FENTRY_QNT write FENTRY_QNT;
    property ENTRY_UOM: unit3 read FENTRY_UOM write FENTRY_UOM;
    property ENTRY_UOM_ISO: char3 read FENTRY_UOM_ISO write FENTRY_UOM_ISO;
    property PO_PR_QNT: quantum13_3 read FPO_PR_QNT write FPO_PR_QNT;
    property ORDERPR_UN: unit3 read FORDERPR_UN write FORDERPR_UN;
    property ORDERPR_UN_ISO: char3 read FORDERPR_UN_ISO write FORDERPR_UN_ISO;
    property PO_NUMBER: char10 read FPO_NUMBER write FPO_NUMBER;
    property PO_ITEM: numeric5 read FPO_ITEM write FPO_ITEM;
    property SHIPPING: char2 read FSHIPPING write FSHIPPING;
    property COMP_SHIP: char2 read FCOMP_SHIP write FCOMP_SHIP;
    property NO_MORE_GR: char1 read FNO_MORE_GR write FNO_MORE_GR;
    property ITEM_TEXT: char50 read FITEM_TEXT write FITEM_TEXT;
    property GR_RCPT: char12 read FGR_RCPT write FGR_RCPT;
    property UNLOAD_PT: char25 read FUNLOAD_PT write FUNLOAD_PT;
    property COSTCENTER: char10 read FCOSTCENTER write FCOSTCENTER;
    property ORDERID: char12 read FORDERID write FORDERID;
    property ORDER_ITNO: numeric4 read FORDER_ITNO write FORDER_ITNO;
    property CALC_MOTIVE: char2 read FCALC_MOTIVE write FCALC_MOTIVE;
    property ASSET_NO: char12 read FASSET_NO write FASSET_NO;
    property SUB_NUMBER: char4 read FSUB_NUMBER write FSUB_NUMBER;
    property RESERV_NO: numeric10 read FRESERV_NO write FRESERV_NO;
    property RES_ITEM: numeric4 read FRES_ITEM write FRES_ITEM;
    property RES_TYPE: char1 read FRES_TYPE write FRES_TYPE;
    property WITHDRAWN: char1 read FWITHDRAWN write FWITHDRAWN;
    property MOVE_MAT: char18 read FMOVE_MAT write FMOVE_MAT;
    property MOVE_PLANT: char4 read FMOVE_PLANT write FMOVE_PLANT;
    property MOVE_STLOC: char4 read FMOVE_STLOC write FMOVE_STLOC;
    property MOVE_BATCH: char10 read FMOVE_BATCH write FMOVE_BATCH;
    property MOVE_VAL_TYPE: char10 read FMOVE_VAL_TYPE write FMOVE_VAL_TYPE;
    property MVT_IND: char1 read FMVT_IND write FMVT_IND;
    property MOVE_REAS: numeric4 read FMOVE_REAS write FMOVE_REAS;
    property RL_EST_KEY: char8 read FRL_EST_KEY write FRL_EST_KEY;
    property REF_DATE: date10 read FREF_DATE write FREF_DATE;
    property COST_OBJ: char12 read FCOST_OBJ write FCOST_OBJ;
    property PROFIT_SEGM_NO: numeric10 read FPROFIT_SEGM_NO write FPROFIT_SEGM_NO;
    property PROFIT_CTR: char10 read FPROFIT_CTR write FPROFIT_CTR;
    property WBS_ELEM: char24 read FWBS_ELEM write FWBS_ELEM;
    property NETWORK: char12 read FNETWORK write FNETWORK;
    property ACTIVITY: char4 read FACTIVITY write FACTIVITY;
    property PART_ACCT: char10 read FPART_ACCT write FPART_ACCT;
    property AMOUNT_LC: decimal23_4 read FAMOUNT_LC write FAMOUNT_LC;
    property AMOUNT_SV: decimal23_4 read FAMOUNT_SV write FAMOUNT_SV;
    property REF_DOC_YR: numeric4 read FREF_DOC_YR write FREF_DOC_YR;
    property REF_DOC: char10 read FREF_DOC write FREF_DOC;
    property REF_DOC_IT: numeric4 read FREF_DOC_IT write FREF_DOC_IT;
    property EXPIRYDATE: date10 read FEXPIRYDATE write FEXPIRYDATE;
    property PROD_DATE: date10 read FPROD_DATE write FPROD_DATE;
    property FUND: char10 read FFUND write FFUND;
    property FUNDS_CTR: char16 read FFUNDS_CTR write FFUNDS_CTR;
    property CMMT_ITEM: char14 read FCMMT_ITEM write FCMMT_ITEM;
    property VAL_SALES_ORD: char10 read FVAL_SALES_ORD write FVAL_SALES_ORD;
    property VAL_S_ORD_ITEM: numeric6 read FVAL_S_ORD_ITEM write FVAL_S_ORD_ITEM;
    property VAL_WBS_ELEM: char24 read FVAL_WBS_ELEM write FVAL_WBS_ELEM;
    property GL_ACCOUNT: char10 read FGL_ACCOUNT write FGL_ACCOUNT;
    property IND_PROPOSE_QUANX: char1 read FIND_PROPOSE_QUANX write FIND_PROPOSE_QUANX;
    property XSTOB: char1 read FXSTOB write FXSTOB;
    property EAN_UPC: char18 read FEAN_UPC write FEAN_UPC;
    property DELIV_NUMB_TO_SEARCH: char10 read FDELIV_NUMB_TO_SEARCH write FDELIV_NUMB_TO_SEARCH;
    property DELIV_ITEM_TO_SEARCH: numeric6 read FDELIV_ITEM_TO_SEARCH write FDELIV_ITEM_TO_SEARCH;
    property SERIALNO_AUTO_NUMBERASSIGNMENT: char1 read FSERIALNO_AUTO_NUMBERASSIGNMENT write FSERIALNO_AUTO_NUMBERASSIGNMENT;
    property VENDRBATCH: char15 read FVENDRBATCH write FVENDRBATCH;
    property STGE_TYPE: char3 read FSTGE_TYPE write FSTGE_TYPE;
    property STGE_BIN: char10 read FSTGE_BIN write FSTGE_BIN;
    property SU_PL_STCK_1: decimal3_0 read FSU_PL_STCK_1 write FSU_PL_STCK_1;
    property ST_UN_QTYY_1: quantum13_3 read FST_UN_QTYY_1 write FST_UN_QTYY_1;
    property ST_UN_QTYY_1_ISO: char3 read FST_UN_QTYY_1_ISO write FST_UN_QTYY_1_ISO;
    property UNITTYPE_1: char3 read FUNITTYPE_1 write FUNITTYPE_1;
    property SU_PL_STCK_2: decimal3_0 read FSU_PL_STCK_2 write FSU_PL_STCK_2;
    property ST_UN_QTYY_2: quantum13_3 read FST_UN_QTYY_2 write FST_UN_QTYY_2;
    property ST_UN_QTYY_2_ISO: char3 read FST_UN_QTYY_2_ISO write FST_UN_QTYY_2_ISO;
    property UNITTYPE_2: char3 read FUNITTYPE_2 write FUNITTYPE_2;
    property STGE_TYPE_PC: char3 read FSTGE_TYPE_PC write FSTGE_TYPE_PC;
    property STGE_BIN_PC: char10 read FSTGE_BIN_PC write FSTGE_BIN_PC;
    property NO_PST_CHGNT: char1 read FNO_PST_CHGNT write FNO_PST_CHGNT;
    property GR_NUMBER: char10 read FGR_NUMBER write FGR_NUMBER;
    property STGE_TYPE_ST: char3 read FSTGE_TYPE_ST write FSTGE_TYPE_ST;
    property STGE_BIN_ST: char10 read FSTGE_BIN_ST write FSTGE_BIN_ST;
    property MATDOC_TR_CANCEL: char10 read FMATDOC_TR_CANCEL write FMATDOC_TR_CANCEL;
    property MATITEM_TR_CANCEL: numeric4 read FMATITEM_TR_CANCEL write FMATITEM_TR_CANCEL;
    property MATYEAR_TR_CANCEL: numeric4 read FMATYEAR_TR_CANCEL write FMATYEAR_TR_CANCEL;
    property NO_TRANSFER_REQ: char1 read FNO_TRANSFER_REQ write FNO_TRANSFER_REQ;
    property CO_BUSPROC: char12 read FCO_BUSPROC write FCO_BUSPROC;
    property ACTTYPE: char6 read FACTTYPE write FACTTYPE;
    property SUPPL_VEND: char10 read FSUPPL_VEND write FSUPPL_VEND;
    property MATERIAL_EXTERNAL: char40 read FMATERIAL_EXTERNAL write FMATERIAL_EXTERNAL;
    property MATERIAL_GUID: char32 read FMATERIAL_GUID write FMATERIAL_GUID;
    property MATERIAL_VERSION: char10 read FMATERIAL_VERSION write FMATERIAL_VERSION;
    property MOVE_MAT_EXTERNAL: char40 read FMOVE_MAT_EXTERNAL write FMOVE_MAT_EXTERNAL;
    property MOVE_MAT_GUID: char32 read FMOVE_MAT_GUID write FMOVE_MAT_GUID;
    property MOVE_MAT_VERSION: char10 read FMOVE_MAT_VERSION write FMOVE_MAT_VERSION;
    property FUNC_AREA: char4 read FFUNC_AREA write FFUNC_AREA;
    property TR_PART_BA: char4 read FTR_PART_BA write FTR_PART_BA;
    property PAR_COMPCO: char4 read FPAR_COMPCO write FPAR_COMPCO;
    property DELIV_NUMB: char10 read FDELIV_NUMB write FDELIV_NUMB;
    property DELIV_ITEM: numeric6 read FDELIV_ITEM write FDELIV_ITEM;
    property NB_SLIPS: numeric3 read FNB_SLIPS write FNB_SLIPS;
    property NB_SLIPSX: char1 read FNB_SLIPSX write FNB_SLIPSX;
    property GR_RCPTX: char1 read FGR_RCPTX write FGR_RCPTX;
    property UNLOAD_PTX: char1 read FUNLOAD_PTX write FUNLOAD_PTX;
    property SPEC_MVMT: char1 read FSPEC_MVMT write FSPEC_MVMT;
    property GRANT_NBR: char20 read FGRANT_NBR write FGRANT_NBR;
    property CMMT_ITEM_LONG: char24 read FCMMT_ITEM_LONG write FCMMT_ITEM_LONG;
    property FUNC_AREA_LONG: char16 read FFUNC_AREA_LONG write FFUNC_AREA_LONG;
    property LINE_ID: numeric6 read FLINE_ID write FLINE_ID;
    property PARENT_ID: numeric6 read FPARENT_ID write FPARENT_ID;
    property LINE_DEPTH: numeric2 read FLINE_DEPTH write FLINE_DEPTH;
    property QUANTITY: quantum13_3 read FQUANTITY write FQUANTITY;
    property BASE_UOM: unit3 read FBASE_UOM write FBASE_UOM;
    property LONGNUM: char40 read FLONGNUM write FLONGNUM;
    property BUDGET_PERIOD: char10 read FBUDGET_PERIOD write FBUDGET_PERIOD;
    property EARMARKED_NUMBER: char10 read FEARMARKED_NUMBER write FEARMARKED_NUMBER;
    property EARMARKED_ITEM: numeric3 read FEARMARKED_ITEM write FEARMARKED_ITEM;
    property STK_SEGMENT: char16 read FSTK_SEGMENT write FSTK_SEGMENT;
    property MOVE_SEGMENT: char16 read FMOVE_SEGMENT write FMOVE_SEGMENT;
    property MATERIAL_LONG: char40 read FMATERIAL_LONG write FMATERIAL_LONG;
    property MOVE_MAT_LONG: char40 read FMOVE_MAT_LONG write FMOVE_MAT_LONG;
    property STK_SEG_LONG: char40 read FSTK_SEG_LONG write FSTK_SEG_LONG;
    property MOV_SEG_LONG: char40 read FMOV_SEG_LONG write FMOV_SEG_LONG;
    property CREATE_DELIVERY: char1 read FCREATE_DELIVERY write FCREATE_DELIVERY;
  end;

  BAPI2017_GM_ITEM_CREATE_T = array of BAPI2017_GM_ITEM_CREATE;   { "urn:sap-com:document:sap:rfc:functions" }


  // ************************************************************************ //
  // Namespace : urn:sap-com:document:sap:rfc:functions
  // ************************************************************************ //
  BAPIRET2 = class(TRemotable)
  private
    FTYPE_: char1;
    FID: char20;
    FNUMBER: numeric3;
    FMESSAGE: char220;
    FLOG_NO: char20;
    FLOG_MSG_NO: numeric6;
    FMESSAGE_V1: char50;
    FMESSAGE_V2: char50;
    FMESSAGE_V3: char50;
    FMESSAGE_V4: char50;
    FPARAMETER: char32;
    FROW: Integer;
    FFIELD: char30;
    FSYSTEM: char10;
  published
    property TYPE_: char1 read FTYPE_ write FTYPE_;
    property ID: char20 read FID write FID;
    property NUMBER: numeric3 read FNUMBER write FNUMBER;
    property MESSAGE: char220 read FMESSAGE write FMESSAGE;
    property LOG_NO: char20 read FLOG_NO write FLOG_NO;
    property LOG_MSG_NO: numeric6 read FLOG_MSG_NO write FLOG_MSG_NO;
    property MESSAGE_V1: char50 read FMESSAGE_V1 write FMESSAGE_V1;
    property MESSAGE_V2: char50 read FMESSAGE_V2 write FMESSAGE_V2;
    property MESSAGE_V3: char50 read FMESSAGE_V3 write FMESSAGE_V3;
    property MESSAGE_V4: char50 read FMESSAGE_V4 write FMESSAGE_V4;
    property PARAMETER: char32 read FPARAMETER write FPARAMETER;
    property ROW: Integer read FROW write FROW;
    property FIELD: char30 read FFIELD write FFIELD;
    property SYSTEM: char10 read FSYSTEM write FSYSTEM;
  end;

  BAPIRET2_T = array of BAPIRET2;               { "urn:sap-com:document:sap:rfc:functions" }

  // ************************************************************************ //
  // Namespace : urn:sap-com:document:sap:rfc:functions
  // soapAction: urn:sap-com:document:sap:rfc:functions:ZMM_WS_GOODSMVT_CREATE_SOLO:ZMM_GOODSMVT_CREATE_SOLORequest
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : zmm_ws_goodsmvt_create_solo
  // service   : zmm_ws_goodsmvt_create_solo
  // port      : zmm_ws_goodsmvt_create_solo
  // URL       : http://srv-s4-asq.pdm.local:8000/sap/bc/srt/rfc/sap/zmm_ws_goodsmvt_create_solo/400/zmm_ws_goodsmvt_create_solo/zmm_ws_goodsmvt_create_solo
  // ************************************************************************ //
  ZMM_WS_GOODSMVT_CREATE_SOLO = interface(IInvokable)
  ['{741ED251-B7EA-F9ED-3736-6C22BE8A5B28}']
    function  ZMM_GOODSMVT_CREATE_SOLO(const FI_HEADER: BAPI2017_GM_HEAD_01; const FI_ITEM: BAPI2017_GM_ITEM_CREATE_T): BAPIRET2_T; stdcall;
  end;

function GetZMM_WS_GOODSMVT_CREATE_SOLO(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ZMM_WS_GOODSMVT_CREATE_SOLO;


implementation

function GetZMM_WS_GOODSMVT_CREATE_SOLO(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ZMM_WS_GOODSMVT_CREATE_SOLO;
const
  defWSDL = 'http://srv-s4-asq.pdm.local:8000/sap/bc/srt/wsdl/flv_10002A111AD1/bndg_url/sap/bc/srt/rfc/sap/zmm_ws_goodsmvt_create_solo/400/zmm_ws_goodsmvt_create_solo/zmm_ws_goodsmvt_create_solo?sap-client=400';
  defURL  = 'http://srv-s4-asq.pdm.local:8000/sap/bc/srt/rfc/sap/zmm_ws_goodsmvt_create_solo/400/zmm_ws_goodsmvt_create_solo/zmm_ws_goodsmvt_create_solo';
  defSvc  = 'zmm_ws_goodsmvt_create_solo';
  defPrt  = 'zmm_ws_goodsmvt_create_solo';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ZMM_WS_GOODSMVT_CREATE_SOLO);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ZMM_WS_GOODSMVT_CREATE_SOLO), 'urn:sap-com:document:sap:rfc:functions', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ZMM_WS_GOODSMVT_CREATE_SOLO), 'urn:sap-com:document:sap:rfc:functions:ZMM_WS_GOODSMVT_CREATE_SOLO:ZMM_GOODSMVT_CREATE_SOLORequest');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ZMM_WS_GOODSMVT_CREATE_SOLO), ioDocument);
  RemClassRegistry.RegisterXSInfo(TypeInfo(char1), 'urn:sap-com:document:sap:rfc:functions', 'char1');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char10), 'urn:sap-com:document:sap:rfc:functions', 'char10');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char12), 'urn:sap-com:document:sap:rfc:functions', 'char12');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char14), 'urn:sap-com:document:sap:rfc:functions', 'char14');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char15), 'urn:sap-com:document:sap:rfc:functions', 'char15');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char16), 'urn:sap-com:document:sap:rfc:functions', 'char16');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char18), 'urn:sap-com:document:sap:rfc:functions', 'char18');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char2), 'urn:sap-com:document:sap:rfc:functions', 'char2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char20), 'urn:sap-com:document:sap:rfc:functions', 'char20');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char220), 'urn:sap-com:document:sap:rfc:functions', 'char220');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char24), 'urn:sap-com:document:sap:rfc:functions', 'char24');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char25), 'urn:sap-com:document:sap:rfc:functions', 'char25');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char3), 'urn:sap-com:document:sap:rfc:functions', 'char3');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char30), 'urn:sap-com:document:sap:rfc:functions', 'char30');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char32), 'urn:sap-com:document:sap:rfc:functions', 'char32');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char35), 'urn:sap-com:document:sap:rfc:functions', 'char35');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char4), 'urn:sap-com:document:sap:rfc:functions', 'char4');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char40), 'urn:sap-com:document:sap:rfc:functions', 'char40');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char50), 'urn:sap-com:document:sap:rfc:functions', 'char50');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char6), 'urn:sap-com:document:sap:rfc:functions', 'char6');
  RemClassRegistry.RegisterXSInfo(TypeInfo(char8), 'urn:sap-com:document:sap:rfc:functions', 'char8');
  RemClassRegistry.RegisterXSInfo(TypeInfo(date10), 'urn:sap-com:document:sap:rfc:functions', 'date10');
  RemClassRegistry.RegisterXSInfo(TypeInfo(decimal23_4), 'urn:sap-com:document:sap:rfc:functions', 'decimal23_4', 'decimal23.4');
  RemClassRegistry.RegisterXSInfo(TypeInfo(decimal3_0), 'urn:sap-com:document:sap:rfc:functions', 'decimal3_0', 'decimal3.0');
  RemClassRegistry.RegisterXSInfo(TypeInfo(numeric10), 'urn:sap-com:document:sap:rfc:functions', 'numeric10');
  RemClassRegistry.RegisterXSInfo(TypeInfo(numeric2), 'urn:sap-com:document:sap:rfc:functions', 'numeric2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(numeric3), 'urn:sap-com:document:sap:rfc:functions', 'numeric3');
  RemClassRegistry.RegisterXSInfo(TypeInfo(numeric4), 'urn:sap-com:document:sap:rfc:functions', 'numeric4');
  RemClassRegistry.RegisterXSInfo(TypeInfo(numeric5), 'urn:sap-com:document:sap:rfc:functions', 'numeric5');
  RemClassRegistry.RegisterXSInfo(TypeInfo(numeric6), 'urn:sap-com:document:sap:rfc:functions', 'numeric6');
  RemClassRegistry.RegisterXSInfo(TypeInfo(quantum13_3), 'urn:sap-com:document:sap:rfc:functions', 'quantum13_3', 'quantum13.3');
  RemClassRegistry.RegisterXSInfo(TypeInfo(unit3), 'urn:sap-com:document:sap:rfc:functions', 'unit3');
  RemClassRegistry.RegisterXSClass(BAPI2017_GM_HEAD_01, 'urn:sap-com:document:sap:rfc:functions', 'BAPI2017_GM_HEAD_01');
  RemClassRegistry.RegisterXSClass(BAPI2017_GM_ITEM_CREATE, 'urn:sap-com:document:sap:rfc:functions', 'BAPI2017_GM_ITEM_CREATE');
  RemClassRegistry.RegisterXSInfo(TypeInfo(BAPI2017_GM_ITEM_CREATE_T), 'urn:sap-com:document:sap:rfc:functions', 'BAPI2017_GM_ITEM_CREATE_T');
  RemClassRegistry.RegisterXSClass(BAPIRET2, 'urn:sap-com:document:sap:rfc:functions', 'BAPIRET2');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(BAPIRET2), 'TYPE_', 'TYPE');
  RemClassRegistry.RegisterXSInfo(TypeInfo(BAPIRET2_T), 'urn:sap-com:document:sap:rfc:functions', 'BAPIRET2_T');

end.