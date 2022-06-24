using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ClubeDoPaiva
{
    public partial class Form1 : Form
    {
        static Helper con = new Helper();
        static SqlConnection CN = new SqlConnection("Data Source = " + "tcp:mednat.ieeta.pt" + @"\" + "SQLSERVER,8101" + " ;" + "Initial Catalog = " + con.Initcat + "; uid = " + con.Uid + ";" + "password = " + con.Pass);


        public Form1()
        {
            InitializeComponent();
            FillCLientDropdown();
            FillClientsList();
            textNome.Text = "Nome";
            textEmail.Text = "E-mail";
            textTelefone.Text = "Telefone";
            textNIF.Text = "NIF";
            text_SelectName.ReadOnly = true;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void FillClientsList()
        {
            listBox_Clientes.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.getClientes", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader();
            cmd.CommandType = CommandType.StoredProcedure;
            while (reader.Read())
            {
                listBox_Clientes.Items.Add("Nome: " + reader["nome"] + ", " + "Telefone: " + reader["telefone"] + ", " + "NIF: " + reader["NIF"].ToString());
            }
            CN.Close();
        }

        private void FillCLientDropdown() {
            comboBox_Clientes.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.NIFclientes", CN);
            SqlDataReader reader = cmd.ExecuteReader();
            comboBox_Clientes.Items.Add("");
            while (reader.Read())
            {
                comboBox_Clientes.Items.Add(reader["NIF"]);
            }
            CN.Close();
        }


      

        private void submitCLient_Click(object sender, EventArgs e)
        {
            String nome = textNome.Text;
            String telefone = textTelefone.Text;
            String email = textEmail.Text;
            String nif = textNIF.Text;
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.insertCliente", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nome", nome.ToString()));
            cmd.Parameters.Add(new SqlParameter("@telefone", telefone.ToString()));
            cmd.Parameters.Add(new SqlParameter("@email", email.ToString()));
            cmd.Parameters.Add(new SqlParameter("@NIF", nif.ToString()));
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            textNome.Text = "Nome";
            textTelefone.Text = "Telefone";
            textEmail.Text = "Email";
            textNIF.Text = "NIF";
            FillCLientDropdown();
            FillClientsList();
        }

        private void DeleteClient_Click(object sender, EventArgs e)
        {
            String nif = comboBox_Clientes.SelectedItem.ToString();
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.removeCliente", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@NIF", nif));
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            comboBox_Clientes.Text = "";
            FillCLientDropdown();
            FillClientsList();
        }


        private void buttonClick_SearchActivities(object sender, EventArgs e)
        {
            listBox_AtividadesCliente.Items.Clear();
            text_SelectName.Text = "";
            String cliente = comboBox_Clientes.SelectedItem.ToString();
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.ClienteAtividades(@cliente)", CN);
            cmd.Parameters.AddWithValue("@cliente", cliente);
            SqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read()) {
                listBox_AtividadesCliente.Items.Add("Id: " + reader["idAtividade"] + ","+"Atividade: " + reader["tipo"] + ", " + "Num Pessoas: " + reader["numPessoas"] + ", " + "Data: " + reader["dataAtividade"] + ", " + "Preço: " + reader["preco"]);
                text_SelectName.Text = reader["nome"].ToString();
            }

            
            
            CN.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ActivityForm actform = new ActivityForm();
            actform.setForm(this);
            actform.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
