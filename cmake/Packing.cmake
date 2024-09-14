# set package name  
    set(CPACK_PACKAGE_NAME 
        ${PROJECT_NAME}
    )

# set short-description field
    set(CPACK_PACKAGE_DESCRIPTION_SUMMARY
        "${PROJECT_DESCRIPTION}"
    )

# set description for start screen in the installing,
# this descr + to summary desc in the controll
# if not set - CPACK_PACKAGE_DESCRIPTION_FILE
    set(CPACK_PACKAGE_DESCRIPTION "Hello, this is an installation")

# set name of the company
    set(CPACK_PACKAGE_VENDOR "Home-organization")

# write values of variables as you write, "", and so on
    set(CPACK_VERBATIM_VARIABLES YES)

# all installed elements will be in the  /weight-0.1.13
    set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CPACK_PACKAGE_NAME}-${CMAKE_PROJECT_VERSION}")

    message("${CPACK_INSTALLED_DIRECTORIES}")

# path for out the result deb package 
    set(CPACK_OUTPUT_FILE_PREFIX 
        "${CMAKE_SOURCE_DIR}/result_package"
    )

# the directory of install must have 0755 permissions
    set(CPACK_INSTALL_DEFAULT_DIRECTORY_PERMISSIONS
        OWNER_READ OWNER_WRITE OWNER_EXECUTE
        GROUP_READ GROUP_EXECUTE
        WORLD_READ WORLD_EXECUTE
    )

# set version of package from project version
    set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
    set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
    set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# set mainteiner
    set(CPACK_PACKAGE_CONTACT "serisnull <domino-trk@yandex.ru>")

# clear binary files from all the unused symbold( DBG for example )
    set(CPACK_STRIP_FILES YES)

# set homepage
    set(CPACK_PACKAGE_HOMEPAGE_URL 
        ${PROJECT_HOMEPAGE_URL}
    )

    # set resource files for COPYRIGHT and DESCRIPTION
    set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/copyright")
    set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# set system name
    set(CPACK_SYSTEM_NAME "Linux")

#set name of package for generation, This name is the same if not define
    set(CPACK_PACKAGE_FILE_NAME
        ${CPACK_PACKAGE_NAME-${CPACK_PACKAGE_VERSION}-${CPACK_SYSTEM_NAME}}
    )
# set cpack generator
    set(CPACK_GENERATOR "DEB")

    # variable scpecific for DEB. fields control file
    if(CPACK_GENERATOR MATCHES "DEB")
        # name of package
        set(CPACK_DEBIAN_PACKAGE_NAME ${CPACK_PACKAGE_NAME})
        # full mainteiner
        set(CPACK_DEBIAN_PACKAGE_MAINTEINER, "${CPACK_PACKAGE_CONTACT}")
        # architecure
        set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
        # add depends for the control. It's add some depends into the CPACK_DEBIAN_PACKAGE_DEPENDS
        set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
        # sections
        set(CPACK_DEBIAN_PACKAGE_SECTION utils)
        # set URL
        set(CPACK_DEBIAN_PACKAGE_HOMEPAGE_URL ${CPACK_PACKAGE_HOMEPAGE_URL})

        # archive changelog and put it to doc directory
        add_custom_command(
            OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz"
            COMMAND gzip -c --best "${CMAKE_CURRENT_SOURCE_DIR}/changelog" > "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz"
            COMMENT "---Compressing changelog"
        )
        # run compress file
        add_custom_target(compress_file ALL DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz")

        # for using std path in GNU
        include(GNUInstallDirs)

        # move changelog.gz and copyrights into doc directory
        install(FILES 
            "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz"
            "${CPACK_RESOURCE_FILE_LICENSE}"
            DESTINATION "${CMAKE_INSTALL_DOCDIR}"
        )
    endif()

    # include cpack module
    include(CPack)

