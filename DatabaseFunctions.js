

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

function getDataForDate()
{
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {

                    createTable(tx)
                    var result = selectDayData(tx, enterInputRectId.isoDate)

                    if(!(result.rows.length > 0))
                    {
                          SetVals.setDefaultValues()
                    }

                    else
                    {
                        SetVals.setValuesFromQuery(result)
                        console.log(result.rows.item(0).mood)
                    }
                }
            )
}

function insertDataTransaction(isoDateString, moodNumber, physicalActivityNumber, notesString)
{
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    insertData(tx, isoDateString, moodNumber, physicalActivityNumber, notesString)
                }
                    )
}


