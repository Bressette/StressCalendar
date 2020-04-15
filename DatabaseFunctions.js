function getDatabaseConnection()
{
    var db = LocalStorage.openDatabaseSync("CalendarDB", "1.0", "CalendarDB", 1000000)
    return db
}
