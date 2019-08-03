package org.qingGuo.service;

import java.util.List;
import java.util.Map;

public interface BaseService<E> {
    List<E> get(Map<String,Object> map);
    boolean insert(Map<String,Object> map);
    boolean delete(Map<String,Object> map);
    boolean update(Map<String,Object> map);

}


