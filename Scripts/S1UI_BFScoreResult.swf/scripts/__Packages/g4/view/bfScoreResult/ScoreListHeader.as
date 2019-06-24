class g4.view.bfScoreResult.ScoreListHeader extends g4.core.SimpleView
{
   function ScoreListHeader(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.__get__targetMovieClip().text_blue.verticalAlign = "center";
      this.__get__targetMovieClip().text_blue.autoSize = "center";
      this.__get__targetMovieClip().text_blue.text = lib.util.UIString.getUIString("$271040");
      this.__get__targetMovieClip().text_red.verticalAlign = "center";
      this.__get__targetMovieClip().text_red.autoSize = "center";
      this.__get__targetMovieClip().text_red.text = lib.util.UIString.getUIString("$271041");
      this.configHeader(this.__get__targetMovieClip().mc_header_blue);
      this.configHeader(this.__get__targetMovieClip().mc_header_red);
   }
   function configHeader(mc_header)
   {
      this.configHeaderText(mc_header.text_ranking,lib.util.UIString.getUIString("$271042"));
      this.configHeaderText(mc_header.text_clazz,lib.util.UIString.getUIString("$271043"));
      this.configHeaderText(mc_header.text_name,lib.util.UIString.getUIString("$271044"));
      this.configHeaderText(mc_header.text_score_0,lib.util.UIString.getUIString("$271033"));
      this.configHeaderText(mc_header.text_score_1,lib.util.UIString.getUIString("$271034"));
      this.configHeaderText(mc_header.text_score_2,lib.util.UIString.getUIString("$271035"));
      this.configHeaderText(mc_header.text_score_3,lib.util.UIString.getUIString("$271036"));
      this.configHeaderText(mc_header.text_score_4,lib.util.UIString.getUIString("$271037"));
   }
   function configHeaderText(textField, text)
   {
      textField.verticalAlign = "center";
      textField.multiline = true;
      textField.wordWrap = true;
      textField.textAutoSize = "shrink";
      textField.text = text;
   }
}
