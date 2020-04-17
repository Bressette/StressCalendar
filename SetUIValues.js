function setDefaultValues()
{
    setRadioButtonsFalse()
    userInputObjectId.physicalActivityTextFieldText = "0"
    userInputObjectId.notesTextAreaText = "Enter Notes here"
    dayPopupId.dataStatusText = "No data"
}

function setRadioButton(dbRadioButtonSelection)
{
    switch(dbRadioButtonSelection)
    {
        case 0:
            userInputObjectId.joyCheckedVal = true
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false
            break
        case 1:
            userInputObjectId.happyCheckedVal = true
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false

            break
        case 2:
            userInputObjectId.sadCheckedVal = true
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false

            break
        case 3:
            userInputObjectId.worriedCheckedVal = true
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false
            break;
        case 4:
            userInputObjectId.fearfulCheckedVal = true
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.angryCheckedVal = false
            break
        case 5:
            userInputObjectId.angryCheckedVal = true
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            break
        case 6:
            setRadioButtonsFalse()
            break
    }
}

function setValuesFromQuery(result)
{
    var dbRadioButtonSelection = result.rows.item(0).mood
    setRadioButton(dbRadioButtonSelection)
    userInputObjectId.physicalActivityTextFieldText = result.rows.item(0).physicalActivity
    userInputObjectId.notesTextAreaText = result.rows.item(0).notes
    dayPopupId.dataStatusText = "Holds data"
    console.log(dbRadioButtonSelection + " " + userInputObjectId.physicalActivityTextFieldText + " " + userInputObjectId.notesTextAreaText)
}

function setRadioButtonsFalse()
{
    userInputObjectId.joyCheckedVal = false
    userInputObjectId.happyCheckedVal = false
    userInputObjectId.sadCheckedVal = false
    userInputObjectId.worriedCheckedVal = false
    userInputObjectId.fearfulCheckedVal = false
    userInputObjectId.angryCheckedVal = false
}

function setDefaultEmoticonGraphValues()
{
    joyBarWidth = 0
    joyBarText = "0"
    happyBarWidth = 0
    happyBarText = "0"
    sadBarWidth = 0
    sadBarText = "0"
    worriedBarWidth = 0
    worriedBarText = "0"
    fearfulBarWidth = 0
    fearfulBarText = "0"
    angryBarWidth = 0
    angryBarText = "0"
}


