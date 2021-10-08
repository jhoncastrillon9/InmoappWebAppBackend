using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Images
    {
        public int ImageId { get; set; }
        public string ImageName { get; set; }
        public string Path { get; set; }
        public bool? IsMain { get; set; }
        public int PropertyId { get; set; }

        public Property Property { get; set; }
    }
}
