page 10010 "Customer Order Lines Status"
{
    Caption = 'Customer Order Lines Status';
    Editable = false;
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = SORTING("Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Shipment Date")
                      WHERE("Document Type" = FILTER(Order | "Return Order"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; "Document Type")
                {
                    ToolTip = 'Specifies the type of the document.';
                    Visible = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of the record on the document line. ';
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the record.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a description of the order line.';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Order No.';
                    Lookup = false;
                    ToolTip = 'Specifies the number of the order.';

                    trigger OnDrillDown()
                    begin
                        GetOrder;
                        case "Document Type" of
                            "Document Type"::Order:
                                if PAGE.RunModal(PAGE::"Sales Order", SalesHeader) = ACTION::LookupOK then
                                    ;
                            "Document Type"::"Return Order":
                                if PAGE.RunModal(PAGE::"Sales Return Order", SalesHeader) = ACTION::LookupOK then
                                    ;
                        end;
                    end;
                }
                field("SalesHeader.""Order Date"""; SalesHeader."Order Date")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Order Date';
                    ToolTip = 'Specifies the data when the order was created.';
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ToolTip = 'Specifies the requested delivery date for the customer order.';
                    Visible = false;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    ToolTip = 'Specifies the promised delivery date for the customer order.';
                    Visible = false;
                }
                field("Planned Delivery Date"; "Planned Delivery Date")
                {
                    ToolTip = 'Specifies the planned date that the shipment will be delivered at the customer''s address.';
                    Visible = false;
                }
                field("Planned Shipment Date"; "Planned Shipment Date")
                {
                    ToolTip = 'Specifies the date that the shipment should ship from the warehouse.';
                    Visible = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Next Shipment Date';
                    ToolTip = 'Specifies the next data a shipment is planned for the order.';
                }
                field("Shipping Time"; "Shipping Time")
                {
                    ToolTip = 'Specifies the shipping time for the order. This is the time it takes from when the order is shipped from the warehouse, to when the order is delivered to the customer''s address.';
                    Visible = false;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the item''s unit of measure. ';
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the quantity of items on document line.';
                }
                field("Outstanding Quantity"; "Outstanding Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how many units on the order line have not yet been shipped.';
                }
                field("Reserved Quantity"; "Reserved Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how many of the units in the Quantity field are reserved.';
                }
                field("Quantity Shipped"; "Quantity Shipped")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how many of the units in the Quantity field have been posted as shipped.';
                }
                field("Completely Shipped"; "Completely Shipped")
                {
                    ToolTip = 'Specifies whether all the items on the order have been shipped or, in the case of inbound items, completely received.';
                    Visible = false;
                }
                field(LastShipmentDate; LastShipmentDate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Last Shipment Date';
                    ToolTip = 'Specifies the date when the order was last posted as shipped.';

                    trigger OnDrillDown()
                    begin
                        case "Document Type" of
                            "Document Type"::Order:
                                begin
                                    GetLastShipment;
                                    if PAGE.RunModal(PAGE::"Posted Sales Shipments", SalesShipmentHeader) = ACTION::LookupOK then;
                                end;
                            "Document Type"::"Return Order":
                                begin
                                    GetLastRetReceipt;
                                    if PAGE.RunModal(PAGE::"Posted Return Receipts", RetReceiptHeader) = ACTION::LookupOK then;
                                end;
                        end;
                    end;
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how many of the units in the Quantity field have been posted as invoiced.';
                }
                field(LastInvoiceDate; LastInvoiceDate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Last Invoice Date';
                    ToolTip = 'Specifies the date when the order was last posted as invoiced.';

                    trigger OnDrillDown()
                    begin
                        case "Document Type" of
                            "Document Type"::Order:
                                begin
                                    GetLastInvoice;
                                    if PAGE.RunModal(PAGE::"Posted Sales Invoices", SalesInvoiceHeader) = ACTION::LookupOK then;
                                end;
                            "Document Type"::"Return Order":
                                begin
                                    GetLastCrMemo;
                                    if PAGE.RunModal(PAGE::"Posted Sales Credit Memos", RetCreditMemoHeader) = ACTION::LookupOK then;
                                end;
                        end;
                    end;
                }
                field("SalesHeader.Status"; SalesHeader.Status)
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the order: Open or Released.';
                    Visible = false;
                }
                field("SalesHeader.""On Hold"""; SalesHeader."On Hold")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'On Hold';
                    ToolTip = 'Specifies lines that are on orders that are on hold.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        GetLastShipmentInvoice;
        DefaultFromSalesHeader;
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        RetReceiptHeader: Record "Return Receipt Header";
        RetCreditMemoHeader: Record "Sales Cr.Memo Header";
        LastShipmentDate: Date;
        LastInvoiceDate: Date;
        Text000: Label 'Warning:  There are orphan sales line records for %1 %2.';

    procedure DefaultFromSalesHeader()
    begin
        GetOrder;
        if "Shipment Date" = 0D then
            "Shipment Date" := SalesHeader."Shipment Date";
        if "Requested Delivery Date" = 0D then
            "Requested Delivery Date" := SalesHeader."Requested Delivery Date";
        if "Promised Delivery Date" = 0D then
            "Promised Delivery Date" := SalesHeader."Promised Delivery Date";
        if CalcDate("Shipping Time", WorkDate) = WorkDate then
            "Shipping Time" := SalesHeader."Shipping Time";
    end;

    procedure GetLastShipmentInvoice()
    begin
        // Calculate values for this row
        // Get order first
        GetOrder;
        // Get shipment and Invoice if they exist
        case "Document Type" of
            "Document Type"::Order:
                begin
                    if GetLastShipment then
                        LastShipmentDate := SalesShipmentHeader."Shipment Date"
                    else
                        LastShipmentDate := 0D;
                    if GetLastInvoice then
                        LastInvoiceDate := SalesInvoiceHeader."Posting Date"
                    else
                        LastInvoiceDate := 0D;
                end;
            "Document Type"::"Return Order":
                begin
                    if GetLastRetReceipt then
                        LastShipmentDate := RetReceiptHeader."Posting Date"
                    else
                        LastShipmentDate := 0D;
                    if GetLastCrMemo then
                        LastInvoiceDate := RetCreditMemoHeader."Posting Date"
                    else
                        LastInvoiceDate := 0D;
                end;
            else begin
                    LastShipmentDate := 0D;
                    LastInvoiceDate := 0D;
                end;
        end;
    end;

    procedure GetOrder()
    begin
        if (SalesHeader."Document Type" <> "Document Type") or (SalesHeader."No." <> "Document No.") then
            if not SalesHeader.Get("Document Type", "Document No.") then
                Message(Text000, "Document Type", "Document No.");
    end;

    procedure GetLastShipment(): Boolean
    begin
        SalesShipmentHeader.SetCurrentKey("Order No."/*, "Shipment Date"*/); // may want to create this key
        SalesShipmentHeader.SetRange("Order No.", "Document No.");
        exit(SalesShipmentHeader.FindLast);

    end;

    procedure GetLastInvoice(): Boolean
    begin
        SalesInvoiceHeader.SetCurrentKey("Order No."/*, "Shipment Date"*/); // may want to create this key
        SalesInvoiceHeader.SetRange("Order No.", "Document No.");
        exit(SalesInvoiceHeader.FindLast);

    end;

    procedure GetLastRetReceipt(): Boolean
    begin
        RetReceiptHeader.SetCurrentKey("Return Order No."/*, "Shipment Date"*/); // may want to create this key
        RetReceiptHeader.SetRange("Return Order No.", "Document No.");
        exit(RetReceiptHeader.FindLast);

    end;

    procedure GetLastCrMemo(): Boolean
    begin
        RetCreditMemoHeader.SetCurrentKey("Return Order No."/*, "Shipment Date"*/); // may want to create this key
        RetCreditMemoHeader.SetRange("Return Order No.", "Document No.");
        exit(RetCreditMemoHeader.FindLast);

    end;
}

