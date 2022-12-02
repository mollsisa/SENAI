using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PatioDeAutomoveis
{
    public partial class TelaDetalhes : Form
    {
        public TelaDetalhes(string area)
        {
            InitializeComponent();

            Load += delegate
            {
                label1.Text = $"Area {area}"; ;
            };
        }
    }
}
