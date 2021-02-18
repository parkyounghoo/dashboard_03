using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ionpolis.View
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Sdate = DateTime.Now.ToString("yyyy-MM");

            if (!IsPostBack)
            {
                ViewState["MyVar"] = "1";
            }
            Search("data1", "DESC");
            drSido.SelectedValue = ViewState["MyVar"].ToString();
        }

        private void Search(string field, string sort)
        {
            if (field != "")
            {
                string connectionString = "server = localhost; uid = sa; pwd = 1111; database = PrivateData;";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    StringBuilder sb = new StringBuilder();
                    sb.Append(" select * from edu_data ");
                    sb.Append(" order by " + field + " " + sort);

                    SqlDataAdapter adpt = new SqlDataAdapter(sb.ToString(), conn);
                    adpt.Fill(ds);

                    grdDetail.DataSource = ds;
                    grdDetail.DataBind();
                }
            }
        }

        protected void grdDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.grdDetail.PageIndex = e.NewPageIndex;

            Search(SortColumn, SortDirection);
        }

        protected void grdDetail_Sorting(object sender, GridViewSortEventArgs e)
        {
            SortDirection = (SortDirection == "ASC") ? "DESC" : "ASC";
            SortColumn = e.SortExpression;

            Search(SortColumn, SortDirection);
        }

        public string SortColumn
        {
            get { return Convert.ToString(ViewState["SortColumn"]); }
            set { ViewState["SortColumn"] = value; }
        }

        public string SortDirection
        {
            get { return Convert.ToString(ViewState["SortDirection"]); }
            set { ViewState["SortDirection"] = value; }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            string connectionString = "server = localhost; uid = sa; pwd = 1111; database = PrivateData;";
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                StringBuilder sb = new StringBuilder();
                sb.Append(" select * from edu_data ");

                SqlDataAdapter adpt = new SqlDataAdapter(sb.ToString(), conn);
                adpt.Fill(ds);

                grdExcel.DataSource = ds;
                grdExcel.DataBind();
            }

            grdExcel.DataSource = ds;
            grdExcel.DataBind();

            ExportGridToExcel();
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "eduData_" + DateTime.Now.ToString("yyyyMMdd") + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "appllication/vnd.ms-excel";
            Response.CacheControl = "public";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grdExcel.GridLines = GridLines.Both;
            grdExcel.HeaderStyle.Font.Bold = true;
            grdExcel.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
        }

        protected void drSido_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((DropDownList)sender).SelectedValue == "1")
            {
                drSido.SelectedValue = "2";
            }
            else
            {
                drSido.SelectedValue = "1";
            }
        }
    }
}
