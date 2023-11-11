package com.project.project_team2.dao;

import java.util.*;

public interface DAO<T> {

    public List<T> selectAll();

    public List<T> selectById(int id);
    
    public void insert (T ob);
    
    public void update (T ob);
    
    public void delete (int id);
}
