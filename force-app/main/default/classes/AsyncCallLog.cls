public class AsyncCallLog {

    @future
    public static void asyncLog (String message) {
        System.debug('debug - ' + message);
    }

}