using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_framework_core
{
    internal class VMOfSongs
    {
        public Songs Compositions { get; }
        public Action LoadData { get; }
        public VMOfSongs() => throw new NotSupportedException();
        public VMOfSongs(Songs compositions, Action loadData)
        {
            Compositions = compositions;
            LoadData = loadData;
        }
    }
}