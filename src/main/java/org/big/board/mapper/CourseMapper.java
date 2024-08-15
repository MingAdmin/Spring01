package org.big.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.big.board.dto.CourseDto;

@Mapper
public interface CourseMapper {

    // 모든 수강정보 조회
    List<CourseDto> selectCourseList() throws Exception;

    // 수강정보 등록
    void insertCourse(CourseDto course) throws Exception;

    // 수강정보 상세 조회
    CourseDto selectCourseDetail(int cno) throws Exception;

    // 수강정보 수정
    void updateCourse(CourseDto course) throws Exception;

    // 수강정보 삭제
    void deleteCourse(int cno) throws Exception;

}
