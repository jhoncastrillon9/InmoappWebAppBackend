namespace CodeMono.Entities
{
    public class PostModel
    {
        public string InsertedId { get; set; }
        public string Message { get; set; }
        public int ErrorId { get; set; }

        public PostModel()
        {
            InsertedId = string.Empty;
            Message = string.Empty;
            ErrorId = 0;
        }

        public PostModel(string _id = "", string _m = "", int _e = 0)
        {
            InsertedId = _id;
            Message = _m;
            ErrorId = _e;
        }
    }
}