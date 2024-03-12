using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_framework_core
{
    internal class Songs
    {
        public int Id { get; set; }
        public string Title { get; set; } = "";
        public int Rating { get; set; }
        public int Size { get; set; }
        public int Time { get; set; }
        public DateTime Date { get; set; }
        public ICollection<Songs> Compositions { get; set; } = new List<Songs>();
        public override string ToString() => Title;
    }
}