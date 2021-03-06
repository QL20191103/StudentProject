package com.project.service.impl;

import com.project.domain.Student;
import com.project.mapper.StudentMapper;
import com.project.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    private StudentMapper mapper;

    @Override
    public boolean InsertStu(Student student) {
        try{
            mapper.insert(student);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
