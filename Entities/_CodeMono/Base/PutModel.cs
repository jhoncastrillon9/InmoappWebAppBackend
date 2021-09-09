namespace CodeMono.Entities
{
    public class PutModel
    {
        public string UpdatedId { get; set; }
        public string Message { get; set; }
        public int ErrorId { get; set; }

        public PutModel()
        {
            UpdatedId = string.Empty;
            Message = string.Empty;
            ErrorId = 0;
        }

        public PutModel(string _id = "", string _m = "", int _e = 0)
        {
            UpdatedId = _id;
            Message = _m;
            ErrorId = _e;
        }
    }
}