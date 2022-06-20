pageextension 62000 "Esanpons Sales Order" extends "Sales Order"
{

    layout
    {
        addafter(General)
        {

            group(ControlAddins2)
            {
                Caption = 'Comments';
                usercontrol(SummernoteComments; "SummerNote")
                {
                    trigger ControlAddInReady()
                    begin
                        NewData := Rec.GetWorkDescription();
                        CurrPage.SummernoteComments.InitHtmlComments(CreateJson());
                        CurrPage.SummernoteComments.AddNewSummerNoteComments(NewData + '1', 1);
                        CurrPage.SummernoteComments.AddNewSummerNoteComments(NewData + '2', 2);
                        CurrPage.SummernoteComments.FinishHtmlComments();
                    end;

                    trigger OnChangeComments(Data: Text; EntryNo: Integer)
                    begin
                        Rec.SetWorkDescription(Data);
                    end;

                    trigger MentionComments(UserMention: JsonObject; EntryNo: Integer)
                    var
                        JToken: JsonToken;
                        JValue: JsonValue;
                    begin
                        UserMention.Get('code', JToken);
                        JValue := JToken.AsValue();
                        Message(JValue.AsText());
                    end;
                }
            }




            group(ControlAddins1)
            {
                Caption = 'Description';
                usercontrol(SummernoteDescription; "SummerNote")
                {

                    ApplicationArea = All;

                    trigger ControlAddInReady()
                    begin
                        NewData := Rec.GetWorkDescription();
                        CurrPage.SummernoteDescription.AddNewSummerNoteDescription(NewData, CreateJson());
                    end;

                    trigger OnChangeDescription(Data: Text)
                    begin
                        NewData := Data;
                        Rec.SetWorkDescription(NewData);
                    end;

                    trigger MentionDescription(UserMention: JsonObject)
                    var
                        JToken: JsonToken;
                        JValue: JsonValue;
                    begin
                        UserMention.Get('code', JToken);
                        JValue := JToken.AsValue();
                        Message(JValue.AsText());
                    end;
                }
            }

        }
    }

    trigger OnAfterGetRecord()
    begin

        NewData := '';
        NewData := Rec.GetWorkDescription();
        /*
                CurrPage.SummernoteDescription.SetDataDescription(NewData);
                if CurrPage.Editable then
                    CurrPage.SummernoteDescription.EnableDescription()
                else
                    CurrPage.SummernoteDescription.DisableDescription();
        */
    end;

    local procedure CreateJson() ReturnArrayJson: JsonArray
    var
        JObject: JsonObject;
    begin
        Clear(JObject);
        JObject.Add('name', 'Esteve Sanpons');
        JObject.Add('code', 'esanpons');

        ReturnArrayJson.Add(JObject);

        Clear(JObject);
        JObject.Add('name', 'Inda Mañas');
        JObject.Add('code', 'imanas');

        ReturnArrayJson.Add(JObject);
    end;



    var
        NewData: Text;
}
