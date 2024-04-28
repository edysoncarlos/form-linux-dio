#!/bin/bash
# Create directories
create_dirs () {
    echo "Creating Directories..."
    mkdir /public
    mkdir /adm
    mkdir /ven
    mkdir /sec
}

# Create Groups
create_groups (){ 
    echo "Creating Groups..."
    groupadd GRP_ADM
    groupadd GRP_VEN
    groupadd GRP_SEC
}

# Create Users
create_users(){

    echo "Creating users..."
    # Define the list of usernames
    admins=(carlos maria joao)
    vens=(debora sebastiana roberto)
    secs=(josefina amanda rogerio)

    # Loop through the usernames array
    for user in "${admins[@]}"; do
    #   Create the users
        useradd -m -s /bin/bash $user -G GRP_ADM
    done

    for user in "${vens[@]}"; do
        useradd -m -s /bin/bash $user -G GRP_VEN
    done

    for user in "${secs[@]}"; do
        useradd -m -s /bin/bash  $user -G GRP_SEC
    done
 
}

setup(){

    create_dirs
    create_groups
    create_users

    echo "Change dirs permissions..."
    chown root:GRP_ADM /adm
    chown root:GRP_VEN /ven
    chown root:GRP_SEC /sec

    chmod 777 /public
    chmod 770 /adm
    chmod 770 /ven
    chmod 770 /sec

    echo "End..."

}
    

setup