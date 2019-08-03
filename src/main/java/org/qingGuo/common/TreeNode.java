package org.qingGuo.common;

import java.util.List;

public class TreeNode<T> {
    private T data;
    private List<TreeNode<T>> children;



    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<TreeNode<T>> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode<T>> children) {
        this.children = children;
    }
}
