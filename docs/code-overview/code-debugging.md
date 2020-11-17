<div align="center">

<a href="https://github.com/LABORA-INF-UFG/my5Gcore"><img width="20%" src="../figs/my5g-logo.png" alt="free5GC"/></a>

</div> 

# Debugging


## Setting a break-point

1. To start debugging some component since the beginning, you must set a breakpoint on the main function in the main package of the component.

    - For example, to start debugging the NRF, set a breakpoint in the first line of code of the main function of the `my5G-core/src/nrf/nrf.go` file.

![8](../../media/images/code-debugging/set-break-point-nrf.png)

1. package main
2. Entry point for the application (_main_ function).
3. Function _action_ is invoked in _main_.



## Running NF components in GoLand

1. On the Project View on the left, navigate through the component you want to run

![Select the Go lang file ".go" in the project](../../media/images/code-debugging/3.png)

2. Right click on the component (*.go) and choose Debug
    - Optional: Use the SHIFT + F9 (shortcut)

3. After this, the run window will show

![run](../../media/images/code-debugging/4.jpeg)


4. Now the “command” will be available on the toolbar

![5](../../media/images/code-debugging/5.png)

5. Next time just choose the command in the toolbar and run or debug clicking on the buttons

![6](../../media/images/code-debugging/6.png)

6. To stop a running or debugging component click the Stop button on the toolbar

![7](../../media/images/code-debugging/7.png)

Obs: Do the same for the other NF components. All the components are in `my5G-core/src/{component}/{component}.go`. For example, for SMF it's in `my5G-core/src/smf/smf.go`.

## Network traffic sniffing

1. Execute Wireshark 
   ```bash
   wireshark
   ````
2. Filters to use in Wireshark

    ```bash
    # monitor traffic going through UPF
    gtp

    # monitor traffic in NWu
    isakmp or gre or nas-5gs or esp

    # monitor traffic in N3
    pfcp

    # monitor traffic in N2
    ngap
    ```

    Here there is an overview of the most important protocols in service-based interfaces and reference points.

    ![5GS protocols](../../media/images/code-debugging/5gs-protocols.png)


3. Sample: monitoring PFCP traffic in N4 reference point.

    
    ```bash
    # stop all running NFs

    # start wireshark
    wireshark -kni any --display-filter pfcp &

    # apply display filter in wireshark: pfcp

    # run my5G-core
    ./run.sh
    ```

    ![PFCP wireshark sniffing](../../media/images/code-debugging/pfcp-wireshark.png)

    1. Establishing a PFCP Association between SMF and UPF. SMF will use this association to send rules to UPF, instructing how to process incomming packets.


## Monitoring  GTP5G tunnels

SMF uses the PFCP protocol to send rules to UPF and these rules instruct how UPF should process incomming packets.

1. Download and installing libgtp5gnl
    ```bash

    git clone https://github.com/PrinzOwO/libgtp5gnl.git ~/libgtp5gnl
    cd ~/libgtp5gnl
    autoreconf -iv
    ./configure --prefix=`pwd`
    make
    ```
2. Monitoring Current Rules
   ```bash
   cd ~/libgtp5gnl
   # monitoring Forwarding Action Rule (FAR) rules
   sudo watch -d -n 1 ./tools/gtp5g-tunnel list far

   # monitoring Packet Detection Rule (PDR) tunnels
   sudo watch -d -n 1 ./tools/gtp5g-tunnel list pdr
   ```
3. Testing (Split the terminal)
    ```bash
    # stop my5G-core if it's running (CTRL+C)

    # execute TestNon3GPP
    cd ~/my5G-core
    sudo ./test.sh TestNon3GPP

    # observe the rules being created in UPF
    # Tip: You can combine the wireshark monitoring (pfcp) and inspect the packets
    # to see how SMF sends the rules for packet processing to UPF
    ```