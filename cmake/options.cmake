if (SAVE_TEMPS)
  add_compile_options(-save-temps)
endif()

if (ENABLE_ASAN)
  add_link_options(-fsanitize=address)
  add_compile_options(-fsanitize=address)
endif()