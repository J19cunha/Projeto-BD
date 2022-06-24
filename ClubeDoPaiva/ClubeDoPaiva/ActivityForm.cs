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
    public partial class ActivityForm : Form
    {
        private Form1 form1;
        static Helper con = new Helper();
        static SqlConnection CN = new SqlConnection("Data Source = " + "tcp:mednat.ieeta.pt" + @"\" + "SQLSERVER,8101" + " ;" + "Initial Catalog = " + con.Initcat + "; uid = " + con.Uid + ";" + "password = " + con.Pass);
        public ActivityForm()
        {
            InitializeComponent();
            FillCLientDropdown();
            FillTipoDropdown();
            FillGuiaDropdown();
            FillAtividadesList();
            FillEquipamento();
            FillStockList();
        }

        public void setForm(Form1 _form1)
        {
            form1 = _form1;
        }

        private void Activity_Load(object sender, EventArgs e)
        {

        }

        private void FillCLientDropdown()
        {
            comboBox_Cliente.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.NIFclientes", CN);
            SqlDataReader reader = cmd.ExecuteReader();
            comboBox_Cliente.Items.Add("");
            while (reader.Read())
            {
                comboBox_Cliente.Items.Add(reader["NIF"]);
            }
            CN.Close();
        }

        private void FillTipoDropdown()
        {
            comboBox_preco.Items.Clear();
            comboBox_tipo.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.NomeAtividades", CN);
            SqlDataReader reader = cmd.ExecuteReader();
            List<String> tiposList = new List<String>();
            comboBox_tipo.Items.Add("");
            comboBox_preco.Items.Add("");
            while (reader.Read())
            {
                tiposList.Add(reader["nome_atividade"].ToString());
                comboBox_tipo2.Items.Add(reader["tipoID"]);
                comboBox_preco.Items.Add(reader["preco"]);
            }
            tiposList = tiposList.Distinct().ToList();
            foreach (String s in tiposList)
            {
                comboBox_tipo.Items.Add(s);
            }
            CN.Close();
        }


        private void FillGuiaDropdown()
        {
            CN.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.Guia", CN);
            SqlDataReader reader = cmd.ExecuteReader();
            comboBox_guia.Items.Add("");
            while (reader.Read())
            {
                comboBox_guia.Items.Add(reader["numFunc"]);
            }
            CN.Close();
        }

        private void FillAtividadesList()
        {
            listBox_Atividades.Items.Clear();
            comboBox_ID.Items.Clear();
            comboBoxAtividade.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.getAtividades", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read()) {
                listBox_Atividades.Items.Add("ID da Atividade:" + reader["idAtividade"] + ", " + "Data Atividade: " + reader["dataAtividade"] + ", " + "Cliente: " + reader["cliente"].ToString() + ", " + "Tipo: " + reader["tipo"] + ", " + "Preço: " + reader["preco"] + ", " + "Numero de Pessoas: " + reader["numPessoas"] + ", " + "Guia: " + reader["guia"]);
                comboBox_ID.Items.Add(reader["idAtividade"]);
                comboBoxAtividade.Items.Add(reader["idAtividade"]);

            }

            CN.Close();
        }
    
       

        private void FillEquipamento() {
            
            CN.Open();
            SqlCommand cmd = new SqlCommand("select * from dbo.equipamento", CN);

            SqlDataReader reader = cmd.ExecuteReader();
            List<String> nomesList = new List<String>();
            List<String> tamanhosList = new List<String>();
            while (reader.Read())
            {
                tamanhosList.Add(reader["tamanho"].ToString());
                
                nomesList.Add(reader["nomeEquipamento"].ToString());
            }
            nomesList = nomesList.Distinct().ToList();
            foreach (String s in nomesList) {
                comboBox_Equipamento.Items.Add(s);
            }
            tamanhosList = tamanhosList.Distinct().ToList();
            foreach (String s in tamanhosList) {
                comboBox_tamanho.Items.Add(s);
            }
            CN.Close();
        }

        private void FillStockList() {
            listBox_Stock.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("select * from dbo.stock", CN);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                listBox_Stock.Items.Add(reader["nomeEquipamento"] + ", " + "Tamanho: " + reader["tamanho"] + ", " + "Stock: " + reader["stock"]);
            }

            CN.Close();
        }

        private void btn_SubmitAtividade_Click(object sender, EventArgs e)
        {
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.addAtividade", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@idAtividade", SqlDbType.BigInt).Direction = ParameterDirection.Output;
            cmd.Parameters.Add(new SqlParameter("@dataReserva", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@dataAtividade", dataAtividade.Value));
            cmd.Parameters.Add(new SqlParameter("@cliente", comboBox_Cliente.SelectedItem));
            cmd.Parameters.Add(new SqlParameter("@tipo", comboBox_tipo.SelectedItem));
            cmd.Parameters.Add(new SqlParameter("@preco", comboBox_preco.SelectedItem));
            cmd.Parameters.Add(new SqlParameter("@numPessoas", textBox_numPessoas.Text.ToString()));
            cmd.Parameters.Add(new SqlParameter("@guia", comboBox_guia.SelectedItem));
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            comboBox_Cliente.SelectedIndex = -1;
            comboBox_guia.SelectedIndex = -1;
            comboBox_preco.SelectedIndex = -1;
            comboBox_tipo.SelectedIndex = -1;
            textBox_numPessoas.Text = " ";
            FillAtividadesList();

        }

        private void btn_createPromotion_Click(object sender, EventArgs e)
        {
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.editPrice", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", comboBox_tipo2.SelectedItem));
            cmd.Parameters.Add(new SqlParameter("@preco", Int32.Parse(textBox_promocao.Text)));
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            comboBox_tipo2.SelectedIndex = -1;
            textBox_promocao.Text = " ";
            FillTipoDropdown();
        }

        private void btn_deleteAtividade_Click(object sender, EventArgs e)
        {
            
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.deleteAtividade", CN);
            cmd.Parameters.Add(new SqlParameter("@idAtividade", comboBoxAtividade.SelectedItem));
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            comboBoxAtividade.SelectedIndex = -1;
            FillAtividadesList();
        }

        


        private void btn_Equipment_Click(object sender, EventArgs e)
        {
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.addEquipamento", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@idReserva", SqlDbType.BigInt).Direction = ParameterDirection.Output;
            cmd.Parameters.Add(new SqlParameter("@idAtividade", comboBox_ID.SelectedItem));
            cmd.Parameters.Add(new SqlParameter("@nomeEquipamento", comboBox_Equipamento.SelectedItem.ToString()));
            cmd.Parameters.Add(new SqlParameter("@quantidade", Int32.Parse(textBox_quantidade.Text)));
            cmd.Parameters.Add(new SqlParameter("@tamanho", comboBox_tamanho.SelectedItem.ToString()));
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            comboBox_ID.SelectedIndex = -1;
            comboBox_Equipamento.SelectedIndex = -1;
            comboBox_tamanho.SelectedIndex = -1;
            textBox_quantidade.Text = " ";
            FillEquipamento();
            FillStockList();
        }

        private void btn_terminate_Click(object sender, EventArgs e)
        {
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.freeEquipamento", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@idAtividade", comboBox_ID.SelectedItem));
            SqlDataReader reader = cmd.ExecuteReader();
            CN.Close();
            comboBox_ID.SelectedIndex = -1;
            FillStockList();
        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void btn_ShowStockActivity_Click(object sender, EventArgs e)
        {
            listBox_StockActivity.Items.Clear();
            CN.Open();
            SqlCommand cmd = new SqlCommand("dbo.searchEquipamento", CN);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@idAtividade", comboBox_ID.SelectedItem));
            SqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read()) {
                listBox_StockActivity.Items.Add(reader["nomeEquipamento"] + ", " + "Tamanho: " + reader["tamanho"] + ", " + "Quantidade: " + reader["quantidade"]);
            }
            CN.Close();
            comboBox_ID.SelectedIndex = -1;
        }
    }
}
