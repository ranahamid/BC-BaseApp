page 10352 "BC O365 Tax Settings"
{
    Caption = ' ';
    Editable = false;
    PageType = CardPart;

    layout
    {
        area(content)
        {
            group(Control1020001)
            {
                InstructionalText = 'You can manage tax rates and mark the default one.';
                ShowCaption = false;
            }
            field(TaxRate; TaxAreaDescription)
            {
                ApplicationArea = Basic, Suite, Invoicing;
                Caption = 'Tax rate';
                Editable = false;
                Importance = Promoted;
                ToolTip = 'Specifies the tax rate used to calculate tax on what you sell.';

                trigger OnAssistEdit()
                var
                    TaxArea: Record "Tax Area";
                begin
                    if TaxArea.Get(TaxAreaCode) then;
                    if PAGE.RunModal(PAGE::"BC O365 Tax Settings List", TaxArea) = ACTION::LookupOK then
                        O365TaxSettingsManagement.AssignDefaultTaxArea(TaxArea.Code);
                    UpdateFields;
                end;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateFields;
    end;

    trigger OnInit()
    begin
        UpdateFields;
    end;

    var
        O365TaxSettingsManagement: Codeunit "O365 Tax Settings Management";
        TaxAreaCode: Code[20];
        TaxAreaDescription: Text;

    local procedure UpdateFields()
    var
        TaxArea: Record "Tax Area";
    begin
        TaxAreaCode := O365TaxSettingsManagement.GetDefaultTaxArea;
        TaxArea.SetRange(Code, TaxAreaCode);
        if TaxArea.FindFirst then
            TaxAreaDescription := TaxArea.GetDescriptionInCurrentLanguage;
    end;
}

