#!/bin/sed -f

/UNIX$/{
    N
    /\nSystem/{
        s// Operating &/
        P
        D
        }
    }
