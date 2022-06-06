var confirmWindow = null;
var btnGenerate = null;
var btnYes = null;

//Custom RadWindow Confirm
function CustomRadWindowConfirm(sender, args) {
    //Open the window
    confirmWindow.show();
    //Focus the Yes button
    btnYes.focus();
    //Cancel the postback
    args.set_cancel(true);
}

function YesOrNoClicked(sender, args) {
    confirmWindow.close();
    //determine which button was clicked and initiate the original postback again
    if (sender.get_text() == "Si") {
        btnGenerate.click();
    }
}

function OpenWindow() {
    DisplayNewBlade.show();
}
