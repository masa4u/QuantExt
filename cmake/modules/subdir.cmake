MACRO(SUBDIRLIST result curdir)
    FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
    SET(dirlist "")
    FOREACH(child ${children})
        IF(IS_DIRECTORY ${curdir}/${child})
            LIST(APPEND dirlist ${child})
        ENDIF()
    ENDFOREACH()
    SET(${result} ${dirlist})
ENDMACRO()

MACRO(SUBDIRLISTR result curdir)
    FILE(GLOB_RECURSE children RELATIVE ${curdir} ${curdir}/*)
    SET(dirlist "")
    FOREACH(child ${children})
        GET_FILENAME_COMPONENT(dir_path ${child} PATH)
        LIST(APPEND dirlist ${dir_path})
    ENDFOREACH()
    list(REMOVE_DUPLICATES dirlist)
    SET(${result} ${dirlist})
ENDMACRO()
