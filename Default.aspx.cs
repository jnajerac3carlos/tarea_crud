using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_umg_bd
{
    public partial class _Default : Page
    {
        Estudiantes estudiantes;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                estudiantes = new Estudiantes();
                estudiantes.drop_sangre(drop_sangre);
                estudiantes.grid_estudiantes(grid_estudiantes);
            }
        }

        protected void grid_estudiantes_SelectedIndexChanged(object sender, EventArgs e)
        {

            txt_carne.Text = grid_estudiantes.SelectedRow.Cells[2].Text;
            txt_nombres.Text = grid_estudiantes.SelectedRow.Cells[3].Text;
            txt_apellidos.Text = grid_estudiantes.SelectedRow.Cells[4].Text;
            txt_direccion.Text = grid_estudiantes.SelectedRow.Cells[5].Text;
            txt_telefono.Text = grid_estudiantes.SelectedRow.Cells[6].Text;
            txt_correo.Text = grid_estudiantes.SelectedRow.Cells[7].Text;
            DateTime fecha = Convert.ToDateTime(grid_estudiantes.SelectedRow.Cells[8].Text);
            txt_fn.Text = fecha.ToString("yyyy-MM-dd");
            int indice = grid_estudiantes.SelectedRow.RowIndex;
            drop_sangre.SelectedValue = grid_estudiantes.DataKeys[indice].Values["id_tipo_sangre"].ToString();

            btn_modificar.Visible = true;
        }

        protected void grid_estudiantes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            estudiantes = new Estudiantes();
            if (estudiantes.eliminar(Convert.ToInt32(e.Keys["id"])) > 0)
            {
                lbl_mensaje.Text = "Eliminacion Exitoso...";
                estudiantes.grid_estudiantes(grid_estudiantes);
                btn_modificar.Visible = false;
            }
        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            estudiantes = new Estudiantes();
            if (estudiantes.modificar(Convert.ToInt32(grid_estudiantes.SelectedValue), txt_carne.Text, txt_nombres.Text, txt_apellidos.Text, txt_direccion.Text, txt_telefono.Text,txt_correo.Text, txt_fn.Text, Convert.ToInt32(drop_sangre.SelectedValue)) > 0)
            {
                lbl_mensaje.Text = "Modifacacion Exitoso...";
                estudiantes.grid_estudiantes(grid_estudiantes);
                btn_modificar.Visible = false;
            }
            limpiar();
        }

        protected void btn_agregarE_Click(object sender, EventArgs e)
        {
            estudiantes = new Estudiantes();
            if (estudiantes.agregar(txt_carne.Text, txt_nombres.Text, txt_apellidos.Text, txt_direccion.Text, txt_telefono.Text, txt_correo.Text, txt_fn.Text, Convert.ToInt32(drop_sangre.SelectedValue)) > 0)
            {
                lbl_mensaje.Text = "Ingreso Exitoso";
                estudiantes.grid_estudiantes(grid_estudiantes);

            }
            limpiar();
        }

        protected void limpiar()
        {
            txt_carne.Text = "";
            txt_nombres.Text = "";
            txt_apellidos.Text = "";
            txt_direccion.Text = "";
            txt_telefono.Text = "";
            txt_correo.Text = "";
            txt_fn.Text = "";
            drop_sangre.SelectedIndex = 0;
        }
    }
}