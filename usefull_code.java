
## Modificar o update
@Modifying
@Transactional
@Query(
  nativeQuery = true,
  value ="UPDATE table_name SET column_name = :name where id = :id"
)
void update(@Param("name") String name, @Param("id") Integer id);
