

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
    //rs = tx.executeSql("SELECT temperature_value FROM temperature t where date(t.date) = date('"+fullTargetDate+"')");
    console.log("In selectDayData")
    const isoDate = "\"" + date + "\""
    return tx.executeSql('SELECT * FROM day WHERE date = ' + isoDate)
}

function getDataForDate(isoDate)
{
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    createTable(tx)
                    var result = selectDayData(tx, enterInputRectId.isoDate)
                    console.log("after get date result")

                    if(!(result.rows.length > 0))
                    {
                        console.log("in if")
                        SetVals.setDefaultValues()
                    }

                    else
                    {
                        console.log("set custom vals")
                        SetVals.setValuesFromQuery(result)
                        console.log(result.rows.item(0).date)
                    }
                }
            )
}

function insertDataTransaction(isoDateString, moodNumber, physicalActivityNumber, notesString)
{
    console.log("in insert the iso date is: " + isoDateString + " The mood number is: " + moodNumber + " Physical Activity is: " + physicalActivityNumber + "notes: " + notesString)
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    insertData(tx, isoDateString, moodNumber, physicalActivityNumber, notesString)
                }
                    )
}


