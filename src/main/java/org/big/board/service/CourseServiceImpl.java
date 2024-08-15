package org.big.board.service;

import java.util.List;
import org.big.board.dto.CourseDto;
import org.big.board.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<CourseDto> selectCourseList() throws Exception {
        return courseMapper.selectCourseList();
    }

    @Override
    public void insertCourse(CourseDto course) throws Exception {
        courseMapper.insertCourse(course);
    }

    @Override
    public CourseDto selectCourseDetail(int cno) throws Exception {
        return courseMapper.selectCourseDetail(cno);
    }

    @Override
    public void updateCourse(CourseDto course) throws Exception {
        courseMapper.updateCourse(course);
    }

    @Override
    public void deleteCourse(int cno) throws Exception {
        courseMapper.deleteCourse(cno);
    }
}
