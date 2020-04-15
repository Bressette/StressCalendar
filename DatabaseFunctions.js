function getDatabaseConnection()
{
    var db = LocalStorage.openDatabaseSync("CalendarDB", "1.0", "CalendarDB", 1000000)
    return db
}

function createTable(tx)
{
    tx.executeSql('CREATE TABLE IF NOT EXISTS day(date Date PRIMARY KEY, mood INT, physicalActivity INT, notes TEXT)')
}

function insertData(tx, isoDateString, moodNumber, physicalActivityNumber, notesString)
{
    tx.executeSql('REPLACE INTO day (date, mood, physicalActivity, notes) VALUES(?,?,?,?);', [isoDateString, moodNumber, physicalActivityNumber, notesString])
}

function selectDayData(tx, date)
{
    var selectStatement = 'SELECT * FROM day WHERE date = ' + date
    return tx.executeSql(selectStatement)
}

function setDefaultValues()
{
    joyRadioButtonId.checked = false
    happyRadioButtonId.checked = false
    sadRadioButtonId.checked = false
    worriedRadioButtonId.checked = false
    fearfulRadioButtonId.checked = false
    angryRadioButtonId.checked = false
    physicalActivityInputTextFieldId.text = "0"
    notesTextAreaId.text = "Enter Notes here"
    dayPopupId.dataStatusText = "No data"
}

function setRadioButton(dbRadioButtonSelection)
{
    switch(dbRadioButtonSelection)
    {
        case 0:
            joyRadioButtonId.checked = true
            break
        case 1:
            happyRadioButtonId.checked = true
            break
        case 2:
            sadRadioButtonId.checked = true
            break
        case 3:
            worriedRadioButtonId.checked = true
            break;
        case 4:
            fearfulRadioButtonId.checked = true
            break
        case 5:
            angryRadioButtonId.checked = true
    }
}
