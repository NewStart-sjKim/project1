package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Member;

public interface MemberMapper {

	@Insert("insert into member" + " (member_id, pass, tel, email, exp, level) " + " values (#{member_id},#{pass},#{tel},"
			+ " #{email}, 0, 1)")
		int insert(Member mem);

//		@Select("select * from member where member_id=#{value}")
	    @Select("SELECT m.member_id, m.pass, m.tel,m.email, m.exp, l.level  "
	    		+ "FROM level l , member m WHERE member_id=#{value} and m.exp BETWEEN l.minexp and l.maxexp")
		Member selectOne(String member_id);

		@Update("update member set tel=#{tel}, email=#{email} where member_id =#{member_id}")
	int update(Member mem);

	@Select({"<script>",
				"select * from member",
					  "<if test='ids != null'> where member_id in "
					+ "<foreach collection='ids' item='member_id' "
					+ " separator=',' open='(' close=')' > #{member_id}"
					+ "</foreach></if>",
				"</script>"
	})
	List<Member> list(Map<String, Object > map);

	@Delete("delete from member where member_id=#{value}")
	int delete(String member_id);

	@Select("select member_id from member where email=#{email} and tel =#{tel}")
	String idSearch(@Param("email")String email, @Param("tel")String tel);

	@Select("select pass from member where member_id=#{member_id} and email=#{email} and tel=#{tel}")
	String pwSearch(Map<String, Object> map);

	@Update("update member set pass=#{pass} where member_id=#{member_id}")
	int updatePass(@Param("member_id") String member_id, @Param("pass") String pass);

	@Select("select * from board where member_id = #{value}")
	List<Board> boardlist(String member_id);
	
	@Update("UPDATE member set EXP = "
			+ "(SELECT "
			+ "(SELECT COUNT(*) * 10  bexp FROM board WHERE member_id=#{member_id}) "
			+ " + (SELECT COUNT(*) * 5 FROM comment WHERE member_id=#{member_id}) "
			+ " + (SELECT SUM(recommendcnt) FROM board WHERE member_id=#{member_id})) "
			+ " WHERE member_id=#{member_id} ")
	void exupdate(@Param("member_id") String member_id, @Param("exp") int exp);
	
	@Select("select ifnull(max(board_num),0) from board")
	int maxnum();

	@Select("select count(*) from board where boardid=#{boardid}")
	int boardCount(Map<String, Object> map);

} 
