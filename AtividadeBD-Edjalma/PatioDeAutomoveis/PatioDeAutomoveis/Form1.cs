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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            Colorir();

            foreach(Button b in this.Controls)
            {
                b.MouseClick += delegate
                {
                    Clique(b);
                };
            }
        }

        public void Colorir()
        {
            PatioEntities patioEntities = new PatioEntities();

            var area = patioEntities.alocacao.Select(s => s.area).ToList();
            var quantidade = patioEntities.alocacao.Select(s => s.quantidade).ToList();


            int i = 0;
            foreach (Control c in this.Controls)
            {
                if (int.Parse(c.Text) == area.ElementAt(i) && quantidade.ElementAt(i) > 0)
                {
                    Console.WriteLine(c.Text);
                    c.BackColor = Color.Blue;
                }
                else
                {
                    c.BackColor = Color.White;
                }
                i++;
            }
        }

        public void Clique(Button b)
        {
            TelaDetalhes telaDetalhes = new TelaDetalhes(b.Text);
            telaDetalhes.Show();
        }
    }
}
