report 10402 "Deposit Test Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './DepositTestReport.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Deposit Test Report';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Deposit Header"; "Deposit Header")
        {
            CalcFields = "Total Deposit Lines";
            RequestFilterFields = "No.", "Bank Account No.";
            column(Deposit_Header_No_; "No.")
            {
            }
            column(Deposit_Header_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Deposit_Header_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            dataitem(PageHeader; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(USERID; UserId)
                {
                }
                column(TIME; Time)
                {
                }
                column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                {
                }
                column(STRSUBSTNO_Text000__Deposit_Header___No___; StrSubstNo(Text000, "Deposit Header"."No."))
                {
                }
                column(CompanyInformation_Name; CompanyInformation.Name)
                {
                }
                column(Deposit_Header___Bank_Account_No__; "Deposit Header"."Bank Account No.")
                {
                }
                column(BankAccount_Name; BankAccount.Name)
                {
                }
                column(Deposit_Header___Document_Date_; "Deposit Header"."Document Date")
                {
                }
                column(Deposit_Header___Posting_Date_; "Deposit Header"."Posting Date")
                {
                }
                column(Deposit_Header___Posting_Description_; "Deposit Header"."Posting Description")
                {
                }
                column(Deposit_Header___Total_Deposit_Amount_; "Deposit Header"."Total Deposit Amount")
                {
                }
                column(ShowDim; ShowDim)
                {
                }
                column(PrintApplications; PrintApplications)
                {
                }
                column(ShowApplyToOutput; ShowApplyToOutput)
                {
                }
                column(Dim1Number; Dim1Number)
                {
                }
                column(Dim2Number; Dim2Number)
                {
                }
                column(PageHeader_Number; Number)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(To_Be_Deposited_InCaption; To_Be_Deposited_InCaptionLbl)
                {
                }
                column(Deposit_Header___Bank_Account_No__Caption; Deposit_Header___Bank_Account_No__CaptionLbl)
                {
                }
                column(Currency_CodeCaption; Currency_CodeCaptionLbl)
                {
                }
                column(Deposit_Header___Document_Date_Caption; Deposit_Header___Document_Date_CaptionLbl)
                {
                }
                column(Deposit_Header___Posting_Date_Caption; Deposit_Header___Posting_Date_CaptionLbl)
                {
                }
                column(Deposit_Header___Posting_Description_Caption; Deposit_Header___Posting_Description_CaptionLbl)
                {
                }
                column(Control1020023Caption; CaptionClassTranslate(GetCurrencyCaptionCode("Deposit Header"."Currency Code")))
                {
                }
                column(Control1020024Caption; CaptionClassTranslate(GetCurrencyCaptionDesc("Deposit Header"."Currency Code")))
                {
                }
                column(Deposit_Header___Total_Deposit_Amount_Caption; Deposit_Header___Total_Deposit_Amount_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Account_Type_Caption; "Gen. Journal Line".FieldCaption("Account Type"))
                {
                }
                column(Gen__Journal_Line__Document_Type_Caption; "Gen. Journal Line".FieldCaption("Document Type"))
                {
                }
                column(Gen__Journal_Line__Document_No__Caption; "Gen. Journal Line".FieldCaption("Document No."))
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(Gen__Journal_Line_DescriptionCaption; "Gen. Journal Line".FieldCaption(Description))
                {
                }
                column(Account_No_____________AccountNameCaption; Account_No_____________AccountNameCaptionLbl)
                {
                }
                column(Cust__Ledger_Entry__Due_Date_Caption; "Cust. Ledger Entry".FieldCaption("Due Date"))
                {
                }
                column(Gen__Journal_Line__Document_Date_Caption; Gen__Journal_Line__Document_Date_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Applies_to_Doc__Type_Caption; Gen__Journal_Line__Applies_to_Doc__Type_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Applies_to_Doc__No__Caption; Gen__Journal_Line__Applies_to_Doc__No__CaptionLbl)
                {
                }
                column(AmountDueCaption; AmountDueCaptionLbl)
                {
                }
                column(AmountDiscountedCaption; AmountDiscountedCaptionLbl)
                {
                }
                column(AmountPaidCaption; AmountPaidCaptionLbl)
                {
                }
                column(AmountAppliedCaption; AmountAppliedCaptionLbl)
                {
                }
                column(AmountPmtDiscToleranceCaption; AmountPmtDiscToleranceCaptionLbl)
                {
                }
                column(AmountPmtToleranceCaption; AmountPmtToleranceCaptionLbl)
                {
                }
                dataitem(DimensionLoop1; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(DimSetEntry__Dimension_Code_; DimSetEntry."Dimension Code")
                    {
                    }
                    column(DimSetEntry__Dimension_Value_Code_; DimSetEntry."Dimension Value Code")
                    {
                    }
                    column(DimSetEntry__Dimension_Value_Code__Control1020068; DimSetEntry."Dimension Value Code")
                    {
                    }
                    column(DimSetEntry__Dimension_Code__Control1020069; DimSetEntry."Dimension Code")
                    {
                    }
                    column(DimensionLoop1_Number; Number)
                    {
                    }
                    column(Header_DimensionsCaption; Header_DimensionsCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if Number = 1 then
                            DimSetEntry.Find('-')
                        else
                            DimSetEntry.Next;

                        Dim1Number := Number;
                    end;

                    trigger OnPreDataItem()
                    begin
                        if ShowDim then
                            SetRange(Number, 1, DimSetEntry.Count)
                        else
                            CurrReport.Break;
                    end;
                }
                dataitem(HeaderErrorLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(ErrorText_Number_; ErrorText[Number])
                    {
                    }
                    column(HeaderErrorLoop_Number; Number)
                    {
                    }
                    column(Warning_Caption; Warning_CaptionLbl)
                    {
                    }

                    trigger OnPostDataItem()
                    begin
                        ErrorCounter := 0;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, ErrorCounter);
                    end;
                }
                dataitem("Gen. Journal Line"; "Gen. Journal Line")
                {
                    DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"), "Journal Batch Name" = FIELD("Journal Batch Name");
                    DataItemLinkReference = "Deposit Header";
                    DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Line No.");
                    column(Gen__Journal_Line__Account_Type_; "Account Type")
                    {
                    }
                    column(Account_No_____________AccountName; "Account No." + ' - ' + AccountName)
                    {
                    }
                    column(Gen__Journal_Line__Document_Date_; "Document Date")
                    {
                    }
                    column(Gen__Journal_Line__Document_Type_; "Document Type")
                    {
                    }
                    column(Gen__Journal_Line__Document_No__; "Document No.")
                    {
                    }
                    column(Gen__Journal_Line_Description; Description)
                    {
                    }
                    column(Amount; -Amount)
                    {
                    }
                    column(Gen__Journal_Line__Applies_to_Doc__Type_; "Applies-to Doc. Type")
                    {
                    }
                    column(Gen__Journal_Line__Applies_to_Doc__No__; "Applies-to Doc. No.")
                    {
                    }
                    column(Gen__Journal_Line__Due_Date_; "Due Date")
                    {
                    }
                    column(AmountDue; AmountDue)
                    {
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AmountApplied; AmountApplied)
                    {
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AmountDiscounted; AmountDiscounted)
                    {
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AmountPaid; AmountPaid)
                    {
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AmountPmtDiscTolerance; AmountPmtDiscTolerance)
                    {
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AmountPmtTolerance; AmountPmtTolerance)
                    {
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                    }
                    column(ApplicationText; ApplicationText)
                    {
                    }
                    column(Gen__Journal_Line_Amount; Amount)
                    {
                    }
                    column(Deposit_Header___Total_Deposit_Amount__Control1000000000; "Deposit Header"."Total Deposit Amount")
                    {
                    }
                    column(Deposit_Header___Total_Deposit_Amount____Amount; "Deposit Header"."Total Deposit Amount" + Amount)
                    {
                    }
                    column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
                    {
                    }
                    column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
                    {
                    }
                    column(Gen__Journal_Line_Line_No_; "Line No.")
                    {
                    }
                    column(Gen__Journal_Line_Account_No_; "Account No.")
                    {
                    }
                    column(Gen__Journal_Line_Applies_to_ID; "Applies-to ID")
                    {
                    }
                    column(Gen__Journal_Line__Applies_to_Doc__No__Caption_Control2; Gen__Journal_Line__Applies_to_Doc__No__Caption_Control2Lbl)
                    {
                    }
                    column(AmountDueCaption_Control7; AmountDueCaption_Control7Lbl)
                    {
                    }
                    column(AmountDiscountedCaption_Control10; AmountDiscountedCaption_Control10Lbl)
                    {
                    }
                    column(AmountAppliedCaption_Control12; AmountAppliedCaption_Control12Lbl)
                    {
                    }
                    column(Gen__Journal_Line__Applies_to_Doc__Type_Caption_Control13; Gen__Journal_Line__Applies_to_Doc__Type_Caption_Control13Lbl)
                    {
                    }
                    column(Cust__Ledger_Entry__Due_Date_Caption_Control14; "Cust. Ledger Entry".FieldCaption("Due Date"))
                    {
                    }
                    column(Gen__Journal_Line_DescriptionCaption_Control15; FieldCaption(Description))
                    {
                    }
                    column(Account_TypeCaption; Account_TypeCaptionLbl)
                    {
                    }
                    column(Gen__Journal_Line__Document_Type_Caption_Control17; FieldCaption("Document Type"))
                    {
                    }
                    column(Gen__Journal_Line__Document_No__Caption_Control18; FieldCaption("Document No."))
                    {
                    }
                    column(Account_No_____________AccountNameCaption_Control20; Account_No_____________AccountNameCaption_Control20Lbl)
                    {
                    }
                    column(Gen__Journal_Line__Document_Date_Caption_Control21; Gen__Journal_Line__Document_Date_Caption_Control21Lbl)
                    {
                    }
                    column(AmountPaidCaption_Control11; AmountPaidCaption_Control11Lbl)
                    {
                    }
                    column(AmountCaption_Control19; AmountCaption_Control19Lbl)
                    {
                    }
                    column(AmountPmtDiscToleranceCaption_Control1020031; AmountPmtDiscToleranceCaption_Control1020031Lbl)
                    {
                    }
                    column(AmountPmtToleranceCaption_Control1020033; AmountPmtToleranceCaption_Control1020033Lbl)
                    {
                    }
                    column(Total_Deposit_AmountCaption; Total_Deposit_AmountCaptionLbl)
                    {
                    }
                    column(Total_Deposit_LinesCaption; Total_Deposit_LinesCaptionLbl)
                    {
                    }
                    column(DifferenceCaption; DifferenceCaptionLbl)
                    {
                    }
                    dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Customer No." = FIELD("Account No."), "Applies-to ID" = FIELD("Applies-to ID");
                        DataItemTableView = SORTING("Customer No.", "Applies-to ID", Open, Positive, "Due Date");
                        column(Cust__Ledger_Entry__Document_Type_; "Document Type")
                        {
                        }
                        column(Cust__Ledger_Entry__Document_No__; "Document No.")
                        {
                        }
                        column(Cust__Ledger_Entry__Due_Date_; "Due Date")
                        {
                        }
                        column(Cust__Ledger_Entry_Description; Description)
                        {
                        }
                        column(AmountDue_Control1480024; AmountDue)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountPaid_Control1480025; AmountPaid)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountDiscounted_Control1480026; AmountDiscounted)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountApplied_Control1480027; AmountApplied)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ApplicationText_Control24; ApplicationText)
                        {
                        }
                        column(AmountPmtDiscTolerance_Control1020035; AmountPmtDiscTolerance)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountPmtTolerance_Control1020036; AmountPmtTolerance)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                        {
                        }
                        column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                        {
                        }
                        column(Cust__Ledger_Entry_Applies_to_ID; "Applies-to ID")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if isShow then
                                isShow := false
                            else
                                ApplicationText := '';

                            CalcFields("Remaining Amount");
                            if "Currency Code" <> Currency.Code then begin
                                "Remaining Amount" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Remaining Amount"),
                                    Currency."Amount Rounding Precision");
                                "Amount to Apply" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Amount to Apply"),
                                    Currency."Amount Rounding Precision");
                                "Accepted Payment Tolerance" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Accepted Payment Tolerance"),
                                    Currency."Amount Rounding Precision");
                                "Remaining Pmt. Disc. Possible" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Remaining Pmt. Disc. Possible"),
                                    Currency."Amount Rounding Precision");
                            end;
                            AmountDue := "Remaining Amount";
                            AmountPmtTolerance := "Accepted Payment Tolerance";
                            AmountDiscounted := 0;
                            AmountPmtDiscTolerance := 0;
                            if ("Remaining Pmt. Disc. Possible" <> 0) and
                               (("Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date") or "Accepted Pmt. Disc. Tolerance") and
                               (RemainingAmountToApply + AmountPmtTolerance + "Remaining Pmt. Disc. Possible" >= AmountDue)
                            then begin
                                if "Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date" then
                                    AmountDiscounted := "Remaining Pmt. Disc. Possible"
                                else
                                    AmountPmtDiscTolerance := "Remaining Pmt. Disc. Possible";
                            end;
                            AmountApplied := RemainingAmountToApply + AmountPmtTolerance + AmountDiscounted + AmountPmtDiscTolerance;
                            if AmountApplied > "Amount to Apply" then
                                AmountApplied := "Amount to Apply";
                            AmountPaid := AmountApplied - AmountPmtTolerance - AmountDiscounted - AmountPmtDiscTolerance;
                            if AmountApplied > AmountDue then
                                AmountApplied := AmountDue;
                            RemainingAmountToApply := RemainingAmountToApply - AmountPaid;
                            TotalAmountApplied := TotalAmountApplied + AmountApplied;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not PrintApplications or
                               ("Gen. Journal Line"."Account Type" <> "Gen. Journal Line"."Account Type"::Customer) or
                               ("Gen. Journal Line"."Applies-to ID" = '')
                            then
                                CurrReport.Break;
                            GetCurrencyRecord(Currency, "Deposit Header"."Currency Code");
                        end;
                    }
                    dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Vendor No." = FIELD("Account No."), "Applies-to ID" = FIELD("Applies-to ID");
                        DataItemTableView = SORTING("Vendor No.", "Applies-to ID", Open, Positive, "Due Date");
                        column(AmountDue_Control1480028; AmountDue)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Vendor_Ledger_Entry__Document_Type_; "Document Type")
                        {
                        }
                        column(Vendor_Ledger_Entry__Document_No__; "Document No.")
                        {
                        }
                        column(Vendor_Ledger_Entry__Due_Date_; "Due Date")
                        {
                        }
                        column(Vendor_Ledger_Entry_Description; Description)
                        {
                        }
                        column(AmountPaid_Control1480033; AmountPaid)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountDiscounted_Control1480034; AmountDiscounted)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountApplied_Control1480035; AmountApplied)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ApplicationText_Control1020040; ApplicationText)
                        {
                        }
                        column(AmountPmtTolerance_Control1020041; AmountPmtTolerance)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountPmtDiscTolerance_Control1020042; AmountPmtDiscTolerance)
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                        {
                        }
                        column(Vendor_Ledger_Entry_Vendor_No_; "Vendor No.")
                        {
                        }
                        column(Vendor_Ledger_Entry_Applies_to_ID; "Applies-to ID")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            CalcFields("Remaining Amount");
                            if "Currency Code" <> Currency.Code then begin
                                "Remaining Amount" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Remaining Amount"),
                                    Currency."Amount Rounding Precision");
                                "Amount to Apply" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Amount to Apply"),
                                    Currency."Amount Rounding Precision");
                                "Accepted Payment Tolerance" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Accepted Payment Tolerance"),
                                    Currency."Amount Rounding Precision");
                                "Remaining Pmt. Disc. Possible" :=
                                  Round(
                                    CurrExchRate.ExchangeAmtFCYToFCY(
                                      "Gen. Journal Line"."Posting Date",
                                      "Currency Code",
                                      Currency.Code,
                                      "Remaining Pmt. Disc. Possible"),
                                    Currency."Amount Rounding Precision");
                            end;
                            AmountDue := "Remaining Amount";
                            AmountPmtTolerance := "Accepted Payment Tolerance";
                            AmountDiscounted := 0;
                            AmountPmtDiscTolerance := 0;
                            if ("Remaining Pmt. Disc. Possible" <> 0) and
                               (("Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date") or "Accepted Pmt. Disc. Tolerance") and
                               (RemainingAmountToApply + AmountPmtTolerance + "Remaining Pmt. Disc. Possible" >= AmountDue)
                            then begin
                                if "Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date" then
                                    AmountDiscounted := "Remaining Pmt. Disc. Possible"
                                else
                                    AmountPmtDiscTolerance := "Remaining Pmt. Disc. Possible";
                            end;
                            AmountApplied := RemainingAmountToApply + AmountPmtTolerance + AmountDiscounted + AmountPmtDiscTolerance;
                            if AmountApplied > "Amount to Apply" then
                                AmountApplied := "Amount to Apply";
                            AmountPaid := AmountApplied - AmountPmtTolerance - AmountDiscounted - AmountPmtDiscTolerance;
                            if AmountApplied > AmountDue then
                                AmountApplied := AmountDue;
                            RemainingAmountToApply := RemainingAmountToApply - AmountPaid;
                            TotalAmountApplied := TotalAmountApplied + AmountApplied;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not PrintApplications or
                               ("Gen. Journal Line"."Account Type" <> "Gen. Journal Line"."Account Type"::Vendor) or
                               ("Gen. Journal Line"."Applies-to ID" = '')
                            then
                                CurrReport.Break;
                            RemainingAmountToApply := -"Gen. Journal Line".Amount;
                            GetCurrencyRecord(Currency, "Deposit Header"."Currency Code");
                        end;
                    }
                    dataitem(TotalApplicationLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(TotalAmountApplied; TotalAmountApplied)
                        {
                            AutoFormatExpression = "Gen. Journal Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(RemainingAmountToApply; RemainingAmountToApply)
                        {
                            AutoFormatExpression = "Gen. Journal Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalApplicationLoop_Number; Number)
                        {
                        }
                        column(Total_AppliedCaption; Total_AppliedCaptionLbl)
                        {
                        }
                        column(Remaining_UnappliedCaption; Remaining_UnappliedCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if isShow then
                                CurrReport.Break;
                        end;
                    }
                    dataitem(DimensionLoop2; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(DimSetEntry2__Dimension_Value_Code_; DimSetEntry2."Dimension Value Code")
                        {
                        }
                        column(DimSetEntry2__Dimension_Code_; DimSetEntry2."Dimension Code")
                        {
                        }
                        column(DimSetEntry2__Dimension_Value_Code__Control1020075; DimSetEntry2."Dimension Value Code")
                        {
                        }
                        column(DimSetEntry2__Dimension_Code__Control1020076; DimSetEntry2."Dimension Code")
                        {
                        }
                        column(DimensionLoop2_Number; Number)
                        {
                        }
                        column(Line_DimensionsCaption; Line_DimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                DimSetEntry2.Find('-')
                            else
                                DimSetEntry2.Next;

                            Dim2Number := Number;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if ShowDim then
                                SetRange(Number, 1, DimSetEntry2.Count)
                            else
                                CurrReport.Break;
                        end;
                    }
                    dataitem(LineErrorCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(ErrorText_Number__Control1020070; ErrorText[Number])
                        {
                        }
                        column(LineErrorCounter_Number; Number)
                        {
                        }
                        column(Warning_Caption_Control1020071; Warning_Caption_Control1020071Lbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, ErrorCounter);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ErrorCounter := 0;

                        if "Account No." = '' then
                            AddError(
                              StrSubstNo(Text005, FieldCaption("Account No.")));

                        isShow := true;
                        ApplicationText := Text016;
                        RemainingAmountToApply := -Amount;
                        TotalAmountApplied := 0;

                        ApplyAccountTypeLogic("Gen. Journal Line");

                        if "Document Date" = 0D then
                            AddError(
                              StrSubstNo(Text005, FieldCaption("Document Date")))
                        else
                            if "Document Date" <> NormalDate("Document Date") then
                                AddError(
                                  StrSubstNo(Text010, FieldCaption("Document Date")));

                        if "Document No." = '' then
                            AddError(
                              StrSubstNo(Text005, FieldCaption("Document No.")));

                        if Amount = 0 then
                            AddError(
                              StrSubstNo(Text005, FieldCaption(Amount)))
                        else
                            if Amount > 0 then
                                AddError(
                                  StrSubstNo(Text014, FieldCaption("Credit Amount")));

                        if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                            AddError(DimMgt.GetDimCombErr);

                        TableID[1] := DimMgt.TypeToTableID1("Account Type");
                        No[1] := "Account No.";
                        if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                            AddError(DimMgt.GetDimValuePostingErr);

                        ShowApplyToOutput := false;
                        if PrintApplications and ("Applies-to Doc. No." <> '') then begin
                            ShowApplyToOutput := true;
                            case "Account Type" of
                                "Account Type"::Customer:
                                    with CustLedgEntry do begin
                                        Reset;
                                        SetCurrentKey("Document No.", "Document Type");
                                        SetRange("Document Type", "Gen. Journal Line"."Applies-to Doc. Type");
                                        SetRange("Document No.", "Gen. Journal Line"."Applies-to Doc. No.");
                                        SetRange("Customer No.", "Gen. Journal Line"."Account No.");
                                        if FindFirst then begin
                                            CalcFields("Remaining Amount");
                                            "Gen. Journal Line"."Due Date" := "Due Date";
                                            "Gen. Journal Line".Description := Description;
                                            AmountDue := "Remaining Amount";
                                            AmountPaid := -"Gen. Journal Line".Amount;
                                            AmountPmtTolerance := "Accepted Payment Tolerance";
                                            AmountDiscounted := 0;
                                            AmountPmtDiscTolerance := 0;
                                            if ("Remaining Pmt. Disc. Possible" <> 0) and
                                               (("Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date") or "Accepted Pmt. Disc. Tolerance") and
                                               (AmountPaid + AmountPmtTolerance + "Remaining Pmt. Disc. Possible" >= AmountDue)
                                            then begin
                                                if "Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date" then
                                                    AmountDiscounted := "Remaining Pmt. Disc. Possible"
                                                else
                                                    AmountPmtDiscTolerance := "Remaining Pmt. Disc. Possible";
                                            end;
                                            AmountApplied := AmountPaid + AmountPmtTolerance + AmountDiscounted + AmountPmtDiscTolerance;
                                            if AmountApplied > AmountDue then
                                                AmountApplied := AmountDue;
                                            RemainingAmountToApply := RemainingAmountToApply - AmountPaid;
                                            TotalAmountApplied := TotalAmountApplied + AmountApplied;
                                            if isShow then
                                                isShow := false
                                            else
                                                ApplicationText := '';
                                        end else
                                            ShowApplyToOutput := false;
                                    end;
                                "Account Type"::Vendor:
                                    with VendLedgEntry do begin
                                        Reset;
                                        SetCurrentKey("Document No.", "Document Type");
                                        SetRange("Document Type", "Gen. Journal Line"."Applies-to Doc. Type");
                                        SetRange("Document No.", "Gen. Journal Line"."Applies-to Doc. No.");
                                        SetRange("Vendor No.", "Gen. Journal Line"."Account No.");
                                        if FindFirst then begin
                                            CalcFields("Remaining Amount");
                                            "Gen. Journal Line"."Due Date" := "Due Date";
                                            "Gen. Journal Line".Description := Description;
                                            AmountDue := "Remaining Amount";
                                            AmountPaid := -"Gen. Journal Line".Amount;
                                            AmountPmtTolerance := "Accepted Payment Tolerance";
                                            AmountDiscounted := 0;
                                            AmountPmtDiscTolerance := 0;
                                            if ("Remaining Pmt. Disc. Possible" <> 0) and
                                               (("Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date") or "Accepted Pmt. Disc. Tolerance") and
                                               (AmountPaid + AmountPmtTolerance + "Remaining Pmt. Disc. Possible" >= AmountDue)
                                            then begin
                                                if "Pmt. Discount Date" >= "Gen. Journal Line"."Posting Date" then
                                                    AmountDiscounted := "Remaining Pmt. Disc. Possible"
                                                else
                                                    AmountPmtDiscTolerance := "Remaining Pmt. Disc. Possible";
                                            end;
                                            AmountApplied := AmountPaid + AmountPmtTolerance + AmountDiscounted + AmountPmtDiscTolerance;
                                            if AmountApplied > AmountDue then
                                                AmountApplied := AmountDue;
                                            RemainingAmountToApply := RemainingAmountToApply - AmountPaid;
                                            TotalAmountApplied := TotalAmountApplied + AmountApplied;
                                            if isShow then
                                                isShow := false
                                            else
                                                ApplicationText := '';
                                        end else
                                            ShowApplyToOutput := false;
                                    end;
                                else
                                    ShowApplyToOutput := false;
                            end;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        Clear(TableID);
                        Clear(No);
                        DimSetEntry2.SetRange("Dimension Set ID", "Dimension Set ID");
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                ErrorCounter := 0;

                if "Bank Account No." = '' then
                    AddError(
                      StrSubstNo(Text005, FieldCaption("Bank Account No.")))
                else
                    if not BankAccount.Get("Bank Account No.") then begin
                        AddError(
                          StrSubstNo(Text006, "Bank Account No.", FieldCaption("Bank Account No.")));
                        BankAccount.Name := StrSubstNo(Text001, BankAccount.TableCaption);
                    end else
                        if BankAccount.Blocked then
                            AddError(
                              StrSubstNo(BankAccountBlockedErr, "Bank Account No."));

                if "Posting Date" = 0D then
                    AddError(
                      StrSubstNo(Text005, FieldCaption("Posting Date")))
                else
                    if "Posting Date" <> NormalDate("Posting Date") then
                        AddError(
                          StrSubstNo(Text010, FieldCaption("Posting Date")))
                    else begin
                        if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                            if UserId <> '' then
                                if UserSetup.Get(UserId) then begin
                                    AllowPostingFrom := UserSetup."Allow Posting From";
                                    AllowPostingTo := UserSetup."Allow Posting To";
                                end;
                            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                AllowPostingFrom := GLSetup."Allow Posting From";
                                AllowPostingTo := GLSetup."Allow Posting To";
                            end;
                            if AllowPostingTo = 0D then
                                AllowPostingTo := 99991231D;
                        end;
                        if ("Posting Date" < AllowPostingFrom) or ("Posting Date" > AllowPostingTo) then
                            AddError(
                              StrSubstNo(Text011, FieldCaption("Posting Date")));
                    end;

                if "Document Date" = 0D then
                    AddError(
                      StrSubstNo(Text005, FieldCaption("Document Date")))
                else
                    if "Document Date" <> NormalDate("Document Date") then
                        AddError(
                          StrSubstNo(Text010, FieldCaption("Document Date")));

                if "Total Deposit Amount" = 0 then
                    AddError(
                      StrSubstNo(Text005, FieldCaption("Total Deposit Amount")));

                if "Total Deposit Amount" <> "Total Deposit Lines" then
                    AddError(
                      StrSubstNo(Text009, FieldCaption("Total Deposit Amount"), FieldCaption("Total Deposit Lines")));

                DimSetEntry.SetRange("Dimension Set ID", "Dimension Set ID");
                if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                    AddError(DimMgt.GetDimCombErr);

                TableID[1] := DATABASE::"Bank Account";
                No[1] := "Bank Account No.";
                if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                    AddError(DimMgt.GetDimValuePostingErr);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowApplications; PrintApplications)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Applications';
                        ToolTip = 'Specifies if application information is included in the report.';
                    }
                    field(ShowDimensions; ShowDim)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Show Dimensions';
                        ToolTip = 'Specifies if you want if you want the report to show dimensions.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get;
        GLSetup.Get;
    end;

    var
        CompanyInformation: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        BankAccount: Record "Bank Account";
        Text000: Label 'Deposit %1 - Test Report';
        Text001: Label '<Invalid %1>';
        Currency: Record Currency;
        Customer: Record Customer;
        Vendor: Record Vendor;
        ICPartner: Record "IC Partner";
        GLAccount: Record "G/L Account";
        DimSetEntry: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        BankAccount2: Record "Bank Account";
        UserSetup: Record "User Setup";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        CurrExchRate: Record "Currency Exchange Rate";
        DimMgt: Codeunit DimensionManagement;
        AccountName: Text;
        ErrorText: array[100] of Text[250];
        ErrorCounter: Integer;
        PrintApplications: Boolean;
        Text005: Label 'You must enter the %1.';
        Text006: Label '%1 is not a valid %2.';
        Text009: Label 'The %1 must be equal to the %2.';
        ShowDim: Boolean;
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        Text010: Label '%1 must not be a closing date.';
        Text011: Label '%1 is not within your allowed range of posting dates.';
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
        Text012: Label '%1 %2 is not a direct posting account.';
        Text013: Label '%1 %2 is not a posting account.';
        Text014: Label '%1 must be a positive number.';
        AmountPaid: Decimal;
        AmountDue: Decimal;
        AmountDiscounted: Decimal;
        AmountPmtTolerance: Decimal;
        AmountPmtDiscTolerance: Decimal;
        AmountApplied: Decimal;
        RemainingAmountToApply: Decimal;
        TotalAmountApplied: Decimal;
        ShowApplyToOutput: Boolean;
        ApplicationText: Text[30];
        isShow: Boolean;
        Text016: Label 'Application';
        Dim1Number: Integer;
        Dim2Number: Integer;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        To_Be_Deposited_InCaptionLbl: Label 'To Be Deposited In';
        Deposit_Header___Bank_Account_No__CaptionLbl: Label 'Bank Account No.';
        Currency_CodeCaptionLbl: Label 'Currency Code';
        Deposit_Header___Document_Date_CaptionLbl: Label 'Document Date';
        Deposit_Header___Posting_Date_CaptionLbl: Label 'Posting Date';
        Deposit_Header___Posting_Description_CaptionLbl: Label 'Posting Description';
        Deposit_Header___Total_Deposit_Amount_CaptionLbl: Label 'Total Deposit Amount';
        AmountCaptionLbl: Label 'Credit Amount';
        Account_No_____________AccountNameCaptionLbl: Label 'Account No. / Name';
        Gen__Journal_Line__Document_Date_CaptionLbl: Label 'Doc. Date';
        Gen__Journal_Line__Applies_to_Doc__Type_CaptionLbl: Label 'Applies-to';
        Gen__Journal_Line__Applies_to_Doc__No__CaptionLbl: Label 'Applies-to';
        AmountDueCaptionLbl: Label 'Amount Due';
        AmountDiscountedCaptionLbl: Label 'Payment Discount';
        AmountPaidCaptionLbl: Label 'Amount Paid';
        AmountAppliedCaptionLbl: Label 'Total Amount Applied';
        AmountPmtDiscToleranceCaptionLbl: Label 'Pmt. Discount Tolerance';
        AmountPmtToleranceCaptionLbl: Label 'Payment Tolerance';
        Header_DimensionsCaptionLbl: Label 'Header Dimensions';
        Warning_CaptionLbl: Label 'Warning:';
        Gen__Journal_Line__Applies_to_Doc__No__Caption_Control2Lbl: Label 'Applies-to';
        AmountDueCaption_Control7Lbl: Label 'Amount Due';
        AmountDiscountedCaption_Control10Lbl: Label 'Payment Discount';
        AmountAppliedCaption_Control12Lbl: Label 'Total Amount Applied';
        Gen__Journal_Line__Applies_to_Doc__Type_Caption_Control13Lbl: Label 'Applies-to';
        Account_TypeCaptionLbl: Label 'Account Type';
        Account_No_____________AccountNameCaption_Control20Lbl: Label 'Account No. / Name';
        Gen__Journal_Line__Document_Date_Caption_Control21Lbl: Label 'Doc. Date';
        AmountPaidCaption_Control11Lbl: Label 'Amount Paid';
        AmountCaption_Control19Lbl: Label 'Credit Amount';
        AmountPmtDiscToleranceCaption_Control1020031Lbl: Label 'Pmt. Discount Tolerance';
        AmountPmtToleranceCaption_Control1020033Lbl: Label 'Payment Tolerance';
        Total_Deposit_AmountCaptionLbl: Label 'Total Deposit Amount';
        Total_Deposit_LinesCaptionLbl: Label 'Total Deposit Lines';
        DifferenceCaptionLbl: Label 'Difference';
        Total_AppliedCaptionLbl: Label 'Total Applied';
        Remaining_UnappliedCaptionLbl: Label 'Remaining Unapplied';
        Line_DimensionsCaptionLbl: Label 'Line Dimensions';
        Warning_Caption_Control1020071Lbl: Label 'Warning:';
        CustomerBlockedErr: Label 'Customer %1 is blocked for processing.';
        VendorBlockedErr: Label 'Vendor %1 is blocked for processing.';
        CustomerPrivacyBlockedErr: Label 'Customer %1 is blocked for privacy.', Comment = '%1 = customer code';
        VendorPrivacyBlockedErr: Label 'Vendor %1 is blocked for privacy.', Comment = '%1 = vendor code';
        GLAccountBlockedErr: Label 'G/L Account %1 is blocked for processing.';
        BankAccountBlockedErr: Label 'Bank Account %1 is blocked for processing.';
        ICPartnerBlockedErr: Label 'IC Partner %1 is blocked for processing.';

    local procedure AddError(Text: Text[250])
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    local procedure GetCurrencyRecord(var Currency: Record Currency; CurrencyCode: Code[10])
    begin
        if CurrencyCode = '' then begin
            Clear(Currency);
            Currency.Description := GLSetup."LCY Code";
            Currency."Amount Rounding Precision" := GLSetup."Amount Rounding Precision";
        end else
            if Currency.Code <> CurrencyCode then
                if not Currency.Get(CurrencyCode) then
                    AddError(
                      StrSubstNo(Text006, CurrencyCode, "Deposit Header".FieldCaption("Currency Code")));
    end;

    local procedure GetCurrencyCaptionCode(CurrencyCode: Code[10]): Text[80]
    begin
        if CurrencyCode = '' then
            exit('101,0,%1');

        GetCurrencyRecord(Currency, CurrencyCode);
        exit('101,4,' + Currency.Code);
    end;

    local procedure GetCurrencyCaptionDesc(CurrencyCode: Code[10]): Text[80]
    begin
        if CurrencyCode = '' then
            exit('101,1,%1');

        GetCurrencyRecord(Currency, CurrencyCode);
        exit('101,4,' + Currency.Description);
    end;

    local procedure UpdateFromAccountTypeEmployee(var GenJournalLine: Record "Gen. Journal Line")
    var
        Employee: Record Employee;
    begin
        if Employee.Get(GenJournalLine."Account No.") then
            AccountName := Employee.FullName
        else begin
            AddError(
              StrSubstNo(Text006, GenJournalLine."Account No.", GenJournalLine."Account Type"));
            AccountName := StrSubstNo(Text001, Employee.TableCaption);
        end;
        if GenJournalLine.Description = AccountName then
            GenJournalLine.Description := '';
    end;

    local procedure ApplyAccountTypeLogic(var GenJournalLine: Record "Gen. Journal Line")
    begin
        with GenJournalLine do
            case "Account Type" of
                "Account Type"::"G/L Account":
                    begin
                        if GLAccount.Get("Account No.") then begin
                            AccountName := GLAccount.Name;
                            if GLAccount.Blocked then
                                AddError(
                                  StrSubstNo(GLAccountBlockedErr, "Account No."));
                            if GLAccount."Account Type" <> GLAccount."Account Type"::Posting then
                                AddError(
                                  StrSubstNo(Text013, GLAccount.TableCaption, "Account No."))
                            else
                                if not GLAccount."Direct Posting" then
                                    AddError(
                                      StrSubstNo(Text012, GLAccount.TableCaption, "Account No."));
                        end else begin
                            AddError(
                              StrSubstNo(Text006, "Account No.", "Account Type"));
                            AccountName := StrSubstNo(Text001, GLAccount.TableCaption);
                        end;
                        if Description = AccountName then
                            Description := '';
                    end;
                "Account Type"::Customer:
                    begin
                        if Customer.Get("Account No.") then begin
                            if Customer."Privacy Blocked" then
                                AddError(
                                  StrSubstNo(CustomerPrivacyBlockedErr, "Account No."));
                            if Customer.Blocked <> Customer.Blocked::" " then
                                AddError(
                                  StrSubstNo(CustomerBlockedErr, "Account No."));
                            AccountName := Customer.Name;
                        end else begin
                            AddError(
                              StrSubstNo(Text006, "Account No.", "Account Type"));
                            AccountName := StrSubstNo(Text001, Customer.TableCaption);
                        end;
                        if Description = AccountName then
                            Description := '';
                    end;
                "Account Type"::Vendor:
                    begin
                        if Vendor.Get("Account No.") then begin
                            AccountName := Vendor.Name;
                            if Vendor."Privacy Blocked" then
                                AddError(
                                  StrSubstNo(VendorPrivacyBlockedErr, "Account No."));
                            if Vendor.Blocked <> Vendor.Blocked::" " then
                                AddError(
                                  StrSubstNo(VendorBlockedErr, "Account No."));
                        end else begin
                            AddError(
                              StrSubstNo(Text006, "Account No.", "Account Type"));
                            AccountName := StrSubstNo(Text001, Vendor.TableCaption);
                        end;
                        if Description = AccountName then
                            Description := '';
                    end;
                "Account Type"::"Bank Account":
                    begin
                        if BankAccount2.Get("Account No.") then begin
                            AccountName := BankAccount2.Name;
                            if BankAccount2.Blocked then
                                AddError(
                                  StrSubstNo(BankAccountBlockedErr, "Account No."));
                        end else begin
                            AddError(
                              StrSubstNo(Text006, "Account No.", "Account Type"));
                            AccountName := StrSubstNo(Text001, BankAccount2.TableCaption);
                        end;
                        if Description = AccountName then
                            Description := '';
                    end;
                "Account Type"::"IC Partner":
                    if not ICPartner.Get("Account No.") then
                        AddError(
                          StrSubstNo(Text006, "Account No.", "Account Type"))
                    else begin
                        AccountName := ICPartner.Name;
                        if ICPartner.Blocked then
                            AddError(
                              StrSubstNo(ICPartnerBlockedErr, "Account No."));
                    end;
                "Account Type"::Employee:
                    UpdateFromAccountTypeEmployee("Gen. Journal Line");
                else
                    AddError(
                      StrSubstNo(Text006, "Account Type", FieldCaption("Account Type")));
            end;
    end;
}

