package backend;

interface IKeyable<T> {
    function getFromKey(key:String):T;
}