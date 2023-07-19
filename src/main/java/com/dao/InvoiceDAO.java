package com.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entities.Account;
import com.entities.Invoice;

public interface InvoiceDAO extends JpaRepository<Invoice, Integer> {
//	Optional<Invoice> findByAccountId(Integer id);
	List<Invoice> findByAccountId(Integer id,Sort sort);
	@Query(value = "select *from invoice where datecreate between  DATE_SUB(curdate(), INTERVAL 24*7 HOUR) and current_timestamp() and status=true;",nativeQuery = true)
	List<Invoice> findByDate();
	@Query(value = "select id from invoice where datecreate between  DATE_SUB(curdate(), INTERVAL 24*7 HOUR) and current_timestamp() and status=true;",nativeQuery = true)
	List<Invoice> findIdbyDate();
	@Query(value = "select id from invoice where datecreate between  DATE_SUB(curdate(), INTERVAL 24*?1 HOUR) and current_timestamp() and status=true;",nativeQuery = true)
	List<Invoice> findIdbyInputDate(Integer input);
}
