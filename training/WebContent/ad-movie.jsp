<? include_once("connect.php");?>
<div  style="width:80%;height:440px;margin:auto;padding:10px;background:#DDD;border:3px solid #AAA;">
<input type="button" name="new-movie" value="新增電影"  onclick="lo('#content','new-movie.php')"/>
<hr>
<div style="height:380px;overflow:auto;">
<?
$sql="SELECT * FROM MOVIE ORDER BY rank,seq";
$ro=mysqli_query($link,$sql);
$row=mysqli_fetch_array($ro);
$tt=mysqli_num_rows($ro);
do{
?>
<table style="margin:3px auto;color:black;width:99%;background:#FFF;" id="row<?=$row['rank'];?>">
  <tr>
    <td  rowspan="3" width="15%"><img src="./poster/<?=$row['poster'];?>" style="width:100%;hight:100%;padding:3px;"></td>
    <td rowspan="3"  width="15%" class="ct">分級:<img src="./icon/<?=$row['level'];?>.png" style="width:20px;vertical-align:middle;"></td>
    <td  width="20%">片名:<?=$row['name'];?></td>
    <td width="20%">片長:<?=$row['length'];?></td>
    <td width="30%">上映時間:<?=$row['ondate'];?></td>
  </tr>
  <tr class="rt">
    <td colspan="3">
      <input type="button" name="show" id="show<?=$row['seq'];?>" value="<?=($row['up']==1)?"顯示":"隱藏";?>" onclick="showMovie('movie',0,<?=$row['seq'];?>)"/>
      <input type="button" name="up" value="往上" id="up<?=$row['seq'];?>" onclick="rank('movie',1,<?=$row['seq'];?>,<?=$row['rank'];?>)"/>
      <input type="button" name="dn" value="往下" id="dn<?=$row['seq'];?>" onclick="rank('movie',2,<?=$row['seq'];?>,<?=$row['rank'];?>)">
      <input type="button" name="edit" value="編輯電影" onclick="lo('#content','edit-movie.php?seq=<?=$row['seq'];?>')"/>
      <input type="button" name="del" value="刪除電影" onclick="del('movie',<?=$row['seq'];?>)"/>
    </td>
  </tr>  
  <tr>
    <td colspan="3">
      劇情介紹:<?=$row['intro'];?>
    </td>
  </tr>    
</table>
<?
}while($row=mysqli_fetch_array($ro));
?>
</div>
</div>
<script>
  function del(table,seq){
    $.post("api.php?do=del",{table,seq},function(){
      $("#row"+seq).remove();
    })
  }
  function showMovie(table,type,seq){
    $.post("api.php?do=show",{table,seq,type},function(){
      if(type==0){
        $("#show"+seq).val("隱藏");
        $("#show"+seq).attr("onclick","showMovie('movie',1,"+seq+")");
      }else{
        $("#show"+seq).val("顯示");
        $("#show"+seq).attr("onclick","showMovie('movie',0,"+seq+")");        
      }
    })
  }
  function rank(table,type,seq,rank){
      $.post("api.php?do=rank",{table,seq,rank,type},function(back){
        console.log(back);
       location.href="admin.php?do=movie";
      });

  }
</script>