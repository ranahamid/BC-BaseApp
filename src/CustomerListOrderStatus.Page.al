page 36631 "Customer List - Order Status"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Customer Order Status';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Customer;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the record.';
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the name of the customer.';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    Editable = false;
                    ToolTip = 'Specifies the responsibility center related to the order.';
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the location code relating to the customer.';
                    Visible = false;
                }
                field("Post Code"; "Post Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the postal code relating to the customer.';
                    Visible = false;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies a country/region code for the customer. This field is mostly used for registering EU VAT and reporting INTRASTAT.';
                    Visible = false;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ToolTip = 'Specifies the code for the payment method.';
                    Visible = false;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount on sales documents. By default, the payment term from the customer card is entered.';
                }
                field("Reminder Terms Code"; "Reminder Terms Code")
                {
                    ToolTip = 'Specifies the code for the reminder terms.';
                    Visible = false;
                }
                field("Fin. Charge Terms Code"; "Fin. Charge Terms Code")
                {
                    ToolTip = 'Specifies the code for the finance charge terms calculated for the customer.';
                    Visible = false;
                }
                field("Credit Limit (LCY)"; "Credit Limit (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the maximum credit (in LCY) that can be extended to the customer.';
                }
                field("Balance Due (LCY)"; "Balance Due (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies payments from the customer that are overdue per today''s date.';
                }
                field("Balance on Date (LCY)"; "Balance on Date (LCY)")
                {
                    Editable = false;
                    ToolTip = 'Specifies a balance amount in local currency.';
                    Visible = false;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the customer is blocked from posting.';
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the customer''s phone number.';
                }
                field("E-Mail"; "E-Mail")
                {
                    ToolTip = 'Specifies the email address.';
                    Visible = false;
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the contact person at the customer.';
                }
                field("Collection Method"; "Collection Method")
                {
                    ToolTip = 'Specifies the method you normally use to collect payment from this customer, such as bank transfer or check.';
                    Visible = false;
                }
                field("Fax No."; "Fax No.")
                {
                    ToolTip = 'Specifies the fax number for the customer.';
                    Visible = false;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the code for the company''s intercompany (IC) partner.';
                    Visible = false;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the code for the salesperson.';
                    Visible = false;
                }
                field("Customer Price Group"; "Customer Price Group")
                {
                    Editable = false;
                    ToolTip = 'Specifies the bill-to customer''s customer discount group. When you enter an item on the sales line, the code is used to check whether the bill-to customer should receive a sales line discount on the item.';
                    Visible = false;
                }
                field("Customer Disc. Group"; "Customer Disc. Group")
                {
                    Editable = false;
                    ToolTip = 'Specifies the bill-to customer''s customer discount group. When you enter an item on the sales line, the code is used to check whether the bill-to customer should receive a sales line discount on the item.';
                    Visible = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the customer''s default currency.';
                    Visible = false;
                }
                field("Language Code"; "Language Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the code for the language.';
                    Visible = false;
                }
                field("Sales (LCY)"; "Sales (LCY)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the sales, in local currency.';
                    Visible = false;
                }
                field("Profit (LCY)"; "Profit (LCY)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the profit, in local currency.';
                    Visible = false;
                }
                field("Search Name"; "Search Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the search name.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(Control1901235907; "Comment Sheet")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "Table Name" = CONST(Customer),
                              "No." = FIELD("No.");
                Visible = true;
            }
            part(Control1904036707; "Order Header Status Factbox")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "Bill-to Customer No." = FIELD("No.");
                Visible = true;
            }
            part(Control1904036807; "Order Lines Status Factbox")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "Bill-to Customer No." = FIELD("No.");
                Visible = true;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            part(Control1903720907; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Editable = false;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = FIELD("No."),
                                  "Posting Date" = FIELD(UPPERLIMIT("Date Filter")),
                                  "Date Filter" = FIELD("Date Filter");
                    RunPageView = SORTING("Customer No.");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = History;
                    action("Issued &Reminders")
                    {
                        Caption = 'Issued &Reminders';
                        Image = OrderReminder;
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No." = FIELD("No."),
                                      "Document Date" = FIELD("Date Filter");
                        RunPageView = SORTING("Customer No.", "Posting Date");
                        ToolTip = 'View the list of issued reminders.';
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        Caption = 'Issued &Finance Charge Memos';
                        Image = FinChargeMemo;
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No." = FIELD("No."),
                                      "Document Date" = FIELD("Date Filter");
                        RunPageView = SORTING("Customer No.", "Posting Date");
                        ToolTip = 'View the list of issued finance charge memos.';
                    }
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Customer),
                                  "No." = FIELD("No.");
                    ToolTip = 'View comments that apply.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'View or set up the customer''s bank accounts. You can set up any number of bank accounts for each customer.';
                }
                action("C&ontact")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&ontact';
                    Image = ContactPerson;
                    ToolTip = 'Open the card for the contact person at the customer.';

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
                separator(Action1020026)
                {
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Customer Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
                action("Statistics by C&urrencies")
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics by C&urrencies';
                    Image = Currencies;
                    RunObject = Page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter" = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Date Filter" = FIELD("Date Filter");
                    ToolTip = 'View the customer''s statistics for each currency for which there are transactions.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = Page "Customer Entry Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                    ToolTip = 'View statistics for customer ledger entries.';
                }
                action("S&ales")
                {
                    ApplicationArea = Suite;
                    Caption = 'S&ales';
                    Image = Sales;
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No." = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Date Filter" = FIELD("Date Filter");
                    ToolTip = 'View your sales to the customer by different periods.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetRange("Date Filter", 0D, WorkDate - 1);
    end;

    procedure GetSelectionFilter(): Code[80]
    var
        Cust: Record Customer;
        FirstCust: Code[30];
        LastCust: Code[30];
        SelectionFilter: Code[250];
        CustCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(Cust);
        CustCount := Cust.Count;
        if CustCount > 0 then begin
            Cust.Find('-');
            while CustCount > 0 do begin
                CustCount := CustCount - 1;
                Cust.MarkedOnly(false);
                FirstCust := Cust."No.";
                LastCust := FirstCust;
                More := (CustCount > 0);
                while More do
                    if Cust.Next = 0 then
                        More := false
                    else
                        if not Cust.Mark then
                            More := false
                        else begin
                            LastCust := Cust."No.";
                            CustCount := CustCount - 1;
                            if CustCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstCust = LastCust then
                    SelectionFilter := SelectionFilter + FirstCust
                else
                    SelectionFilter := SelectionFilter + FirstCust + '..' + LastCust;
                if CustCount > 0 then begin
                    Cust.MarkedOnly(true);
                    Cust.Next;
                end;
            end;
        end;
        exit(SelectionFilter);
    end;

    procedure SetSelection(var Cust: Record Customer)
    begin
        CurrPage.SetSelectionFilter(Cust);
    end;
}

