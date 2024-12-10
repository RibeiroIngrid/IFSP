public class FakeDatabase
{
    private static readonly Lazy<FakeDatabase> instance = new Lazy<FakeDatabase>(() => new FakeDatabase());

    public static FakeDatabase Instance => instance.Value;

    public List<User> Users { get; }
    public List<int> LoggedOn { get; } 

    private FakeDatabase()
    {
        Users = new List<User>
        {
            new User(1, "Ingrid Ribeiro", "11111", "1234"),
            new User(2, "Oani Costa", "22222", "1234"),
            new User(3, "Tathy", "33333", "1234")
        };

        LoggedOn = new List<int>(); 
    }
}
