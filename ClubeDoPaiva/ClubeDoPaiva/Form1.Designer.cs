namespace ClubeDoPaiva
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_DltClient = new System.Windows.Forms.Button();
            this.listBox_Clientes = new System.Windows.Forms.ListBox();
            this.comboBox_Clientes = new System.Windows.Forms.ComboBox();
            this.textNome = new System.Windows.Forms.TextBox();
            this.textEmail = new System.Windows.Forms.TextBox();
            this.textTelefone = new System.Windows.Forms.TextBox();
            this.textNIF = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.submitCLient = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btn_activitySearch = new System.Windows.Forms.Button();
            this.listBox_AtividadesCliente = new System.Windows.Forms.ListBox();
            this.label4 = new System.Windows.Forms.Label();
            this.text_SelectName = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btn_DltClient
            // 
            this.btn_DltClient.Location = new System.Drawing.Point(12, 361);
            this.btn_DltClient.Name = "btn_DltClient";
            this.btn_DltClient.Size = new System.Drawing.Size(117, 27);
            this.btn_DltClient.TabIndex = 0;
            this.btn_DltClient.Text = "Apagar cliente";
            this.btn_DltClient.UseVisualStyleBackColor = true;
            this.btn_DltClient.Click += new System.EventHandler(this.DeleteClient_Click);
            // 
            // listBox_Clientes
            // 
            this.listBox_Clientes.FormattingEnabled = true;
            this.listBox_Clientes.ItemHeight = 16;
            this.listBox_Clientes.Location = new System.Drawing.Point(306, 76);
            this.listBox_Clientes.Name = "listBox_Clientes";
            this.listBox_Clientes.Size = new System.Drawing.Size(603, 292);
            this.listBox_Clientes.TabIndex = 2;
            // 
            // comboBox_Clientes
            // 
            this.comboBox_Clientes.FormattingEnabled = true;
            this.comboBox_Clientes.Location = new System.Drawing.Point(125, 408);
            this.comboBox_Clientes.Name = "comboBox_Clientes";
            this.comboBox_Clientes.Size = new System.Drawing.Size(121, 24);
            this.comboBox_Clientes.TabIndex = 3;
            // 
            // textNome
            // 
            this.textNome.Location = new System.Drawing.Point(14, 88);
            this.textNome.Name = "textNome";
            this.textNome.Size = new System.Drawing.Size(152, 22);
            this.textNome.TabIndex = 4;
            // 
            // textEmail
            // 
            this.textEmail.Location = new System.Drawing.Point(14, 168);
            this.textEmail.Name = "textEmail";
            this.textEmail.Size = new System.Drawing.Size(152, 22);
            this.textEmail.TabIndex = 5;
            // 
            // textTelefone
            // 
            this.textTelefone.Location = new System.Drawing.Point(14, 126);
            this.textTelefone.Name = "textTelefone";
            this.textTelefone.Size = new System.Drawing.Size(152, 22);
            this.textTelefone.TabIndex = 6;
            // 
            // textNIF
            // 
            this.textNIF.Location = new System.Drawing.Point(14, 208);
            this.textNIF.Name = "textNIF";
            this.textNIF.Size = new System.Drawing.Size(152, 22);
            this.textNIF.TabIndex = 7;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 59);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 17);
            this.label1.TabIndex = 8;
            this.label1.Text = "Criar cliente";
            // 
            // submitCLient
            // 
            this.submitCLient.Location = new System.Drawing.Point(39, 246);
            this.submitCLient.Name = "submitCLient";
            this.submitCLient.Size = new System.Drawing.Size(92, 23);
            this.submitCLient.TabIndex = 9;
            this.submitCLient.Text = "Submeter";
            this.submitCLient.UseVisualStyleBackColor = true;
            this.submitCLient.Click += new System.EventHandler(this.submitCLient_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(145, 388);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 17);
            this.label2.TabIndex = 10;
            this.label2.Text = "NIF Clientes";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(303, 47);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 17);
            this.label3.TabIndex = 11;
            this.label3.Text = "Clientes";
            // 
            // btn_activitySearch
            // 
            this.btn_activitySearch.Location = new System.Drawing.Point(12, 434);
            this.btn_activitySearch.Name = "btn_activitySearch";
            this.btn_activitySearch.Size = new System.Drawing.Size(84, 46);
            this.btn_activitySearch.TabIndex = 12;
            this.btn_activitySearch.Text = "Procurar atividades";
            this.btn_activitySearch.UseVisualStyleBackColor = true;
            this.btn_activitySearch.Click += new System.EventHandler(this.buttonClick_SearchActivities);
            // 
            // listBox_AtividadesCliente
            // 
            this.listBox_AtividadesCliente.FormattingEnabled = true;
            this.listBox_AtividadesCliente.ItemHeight = 16;
            this.listBox_AtividadesCliente.Location = new System.Drawing.Point(306, 408);
            this.listBox_AtividadesCliente.Name = "listBox_AtividadesCliente";
            this.listBox_AtividadesCliente.Size = new System.Drawing.Size(603, 84);
            this.listBox_AtividadesCliente.TabIndex = 13;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(303, 388);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(140, 17);
            this.label4.TabIndex = 14;
            this.label4.Text = "Atividades do Cliente";
            // 
            // text_SelectName
            // 
            this.text_SelectName.Location = new System.Drawing.Point(112, 458);
            this.text_SelectName.Name = "text_SelectName";
            this.text_SelectName.Size = new System.Drawing.Size(146, 22);
            this.text_SelectName.TabIndex = 15;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(961, 88);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(111, 65);
            this.button1.TabIndex = 16;
            this.button1.Text = "Atividades";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(961, 194);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(111, 68);
            this.button2.TabIndex = 17;
            this.button2.Text = "Funcionario";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(190, 33);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(0, 17);
            this.label5.TabIndex = 18;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(15, 18);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(126, 17);
            this.label6.TabIndex = 19;
            this.label6.Text = "Gestao de clientes";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1137, 540);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.text_SelectName);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.listBox_AtividadesCliente);
            this.Controls.Add(this.btn_activitySearch);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.submitCLient);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textNIF);
            this.Controls.Add(this.textTelefone);
            this.Controls.Add(this.textEmail);
            this.Controls.Add(this.textNome);
            this.Controls.Add(this.comboBox_Clientes);
            this.Controls.Add(this.listBox_Clientes);
            this.Controls.Add(this.btn_DltClient);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_DltClient;
        private System.Windows.Forms.ListBox listBox_Clientes;
        private System.Windows.Forms.ComboBox comboBox_Clientes;
        private System.Windows.Forms.TextBox textNome;
        private System.Windows.Forms.TextBox textEmail;
        private System.Windows.Forms.TextBox textTelefone;
        private System.Windows.Forms.TextBox textNIF;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button submitCLient;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btn_activitySearch;
        private System.Windows.Forms.ListBox listBox_AtividadesCliente;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox text_SelectName;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
    }
}

