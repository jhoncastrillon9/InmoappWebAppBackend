using System;

namespace Entities.Properties
{
    public class ImagesModel
    {
		public Int32 ImageId { get; set; }
		public String ImageName { get; set; }
		public String Path { get; set; }
		public Boolean? IsMain { get; set; }
		public Int32 PropertyId { get; set; }

    }

    public class ImagesListModel
    {
		public Int32 ImagesId { get; set; }
		public String ImagesName { get; set; }

    }

    public class ImagesPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ImageId { get; set; }

    }

    public class ImagesPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ImageId { get; set; }

    }


    public class ImagesDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ImageId { get; set; }

    }

}
