package com.haige.schedule.repository;

import com.haige.schedule.sql.model.SqlQueryItem;
import com.haige.schedule.sql.model.SqlSortItem;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;
import java.util.List;

/**
 * ȫ�ֻ�����⣬�ṩ�˶�̬��ѯ�������Զ���Sql��JPQL����ִ�з�������SpringData��JpaRepository���������չ
 *
 * @param <T>
 * @param <ID>
 * @author xwang
 */
@NoRepositoryBean
public interface CommonRepository<T, ID extends Serializable> extends JpaRepository<T, ID> {

    /**
     * ��̬������ѯ�������ṩ����������̬ƴװSQLִ�в�ѯ�Ĺ���
     * ��Ҫ��;��ҵ���ܵĶ�̬����������������
     *
     * @param _paramList ��ѯ����
     * @param _sortList  ��Ҫ���������
     * @param _pageable  �����¼��ʼλ�á�ҳ����ÿҳ����
     * @return ��ѯ����ʵ����󼯺�
     */

    public Page<T> queryResult(List<SqlQueryItem> _paramList, List<SqlSortItem> _sortList, Pageable _pageable);

    public Page<T> queryNativeSqlPageEntity(String _nativeSql, Object[] _params, Pageable _pageable);

    public Page<T> queryNativeSqlPageEntity(String _nativeSql, String[] _items, Object[] _params, Pageable _pageable);

    /**
     * ִ��ָ����JQPL,��ѯһ��ʵ�����
     * �����ѯ������Ψһ���׳��쳣
     * SQL EXAMPLE: select t from Table t where t.name = ?1 and t.id = ?2
     *
     * @param _jpql   ִ�еĲ�ѯJPQL
     * @param _params JQPL�������Ĳ��������������������ָ��ΪNull
     * @return ��ѯ����ʵ�����
     */
    public T find(String _jpql, Object[] _params);

    /**
     * ִ��ָ����JQPL,��ѯ�������
     * SQL EXAMPLE: select t from Table t where t.name = ?1 and t.id = ?2
     *
     * @param _jpql   ִ�еĲ�ѯJPQL
     * @param _params JQPL�������Ĳ��������������������ָ��ΪNull
     * @return ��ѯ����ʵ����󼯺�
     */
    public List<T> findList(String _jpql, Object[] _params);

    /**
     * ִ�����ݿ���¶�����ִ��JPQL Sql
     *
     * @param _jpql   ��Ҫִ�е�JQPL����
     * @param _params JQPL�������Ĳ��������������������ָ��ΪNull
     * @return
     */
    public int excute(String _jpql, Object[] _params);

    /**
     * ִ��ԭ��̬sql��䣬��SQLӦ���Ƕ����ݵĲ�������SQL
     *
     * @param _nativeSql ԭ��̬sql
     * @param params     ԭ��̬�������Ĳ��������������������ָ��ΪNull
     * @return ��sql���ִ�к���Ӱ������ݼ�¼����
     */
    public int excuteNativeSql(String _nativeSql, Object[] params);

    /**
     * ִ��ԭ��̬sql��ѯ��䣬��ѯһ����¼
     * ����ǹ����ڶ�����¼�����׳��쳣
     *
     * @param _nativeSql ԭ��̬sql
     * @param _params    ԭ��̬�������Ĳ��������������������ָ��ΪNull
     * @return ���ز�ѯ���, Object[]��ÿ��Ԫ��Ϊ��¼��ÿ���ֶ�ֵ
     */
    public Object queryNativeSql(String _nativeSql, Object[] _params);


    /**
     * ִ��ԭ��̬sql��ѯ���,�������ת��Ϊ���ݶ���
     *
     * @param _nativeSql ԭ��̬sql
     * @param _params    ԭ��̬�������Ĳ��������������������ָ��ΪNull
     * @return ���ز�ѯ���ݶ��󣬶�������Ϊ���ɸýӿڵ��ϲ�ӿڷ���ʱָ���ľ������ʵ������
     */
    public T queryNativeSqlEntity(String _nativeSql, Object[] _params);

    /**
     * ִ��ԭ��̬sql��ѯ��䣬���ز�ѯ�����
     *
     * @param _nativeSql ԭ��̬sql
     * @param _params    ԭ��̬�������Ĳ��������������������ָ��ΪNull
     * @return ���ز�ѯ����ļ������飬List<Object> ,����ObjectΪObject[]��ÿ��Ԫ��Ϊ��¼��ÿ���ֶ�ֵ
     */
    public List<?> queryNativeSqlList(String _nativeSql, Object[] _params);

    /**
     * ִ��ԭ��̬sql��ѯ��䣬���ز�ѯ�������
     *
     * @param _nativeSql ԭ��̬sql
     * @param _params    ԭ��̬�������Ĳ��������������������ָ��ΪNull
     * @return ���ز�ѯ��������ݶ��󼯺�
     */
    public List<T> queryNativeSqlListEntity(String _nativeSql, Object[] _params, Pageable _pageable);

    public List<T> queryNativeSqlListEntity(String _nativeSql, String[] _items, Object[] _params, Pageable _pageable);

}
