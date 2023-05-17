
// Modificar o update
@Modifying
@Transactional
@Query(
  nativeQuery = true,
  value ="UPDATE table_name SET column_name = :name where id = :id"
)
void update(@Param("name") String name, @Param("id") Integer id);

// Pagination
    @GetMapping
    @ApiOperation("Listar todos os colaboradores.")
    @ApiResponses({
            @ApiResponse(code = 302, message = "Colaboradoes encontrados"),
            @ApiResponse(code = 204, message = "Colaboradores não encontrados.")
    })
    @ResponseStatus(HttpStatus.OK)
    public Page<ColaboradorDto> listarTodos(
            @PageableDefault(page = 0, size = 4, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {

        List<Colaborador> listaColaboradores = this.colaboradorService.listaColaborador();
        List<ColaboradorDto> listaColaboradoresDto = this.colaboradorConverter.paraColaboradorDto(listaColaboradores);

        int start = (int) (pageable.getOffset() > listaColaboradoresDto.size() ? listaColaboradoresDto.size()
                : pageable.getOffset());
        int end = (int) ((start + pageable.getPageSize()) > listaColaboradoresDto.size() ? listaColaboradoresDto.size()
                : (start + pageable.getPageSize()));
        Page<ColaboradorDto> rolesPageList = new PageImpl<>(listaColaboradoresDto.subList(start, end), pageable,
                listaColaboradoresDto.size());

        return rolesPageList;
    }
