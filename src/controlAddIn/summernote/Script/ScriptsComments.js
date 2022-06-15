var controlAddIn;
function InitHtmlComments() {
    controlAddIn = document.getElementById('controlAddIn');
    controlAddIn.innerHTML = '';
}
function AddNewSummerNoteComments(Data) {
    controlAddIn.innerHTML +=
        `
        <button id="edit" class="btn btn-primary" onclick="edit()" type="button">Edit 1</button>
        <button id="save" class="btn btn-primary" onclick="save()" type="button">Save 2</button>
    `;
    controlAddIn.innerHTML += '<div class="summernoteText">' + Data + '</div>';
}
function FinishHtmlComments() {
    controlAddIn.innerHTML += '';
}
var edit = function () {

    $('.summernoteText').summernote(
        {
            height: 100,
            focus: true,


        }
    );
    $('.note-editable');
};

var save = function () {
    var txt = $('.summernoteText').summernote('code');
    $('.summernoteText').summernote('destroy');
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnChangeComments", [txt]);
};