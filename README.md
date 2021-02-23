# AcceleratorNoC
The Verilog library for various types of accelerator NoC design.

# Citing
If you use the project in your work, please consider citing it with:

```
@misc{AcceleratorNoCLib,
  author = {Tong, Jianming and Krishna, Tushar},
  title = {NoC Library for Accelerator},
  year = {2021},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/georgia-tech-synergy-lab/AcceleratorNoC}},
}
```

# Terminology

Consistency Note: the same key stands for the same meaning in all directories, e.g. **comb**, **seq** and **simple** etc. in all directories have the same meaning.

## primitive switches (PrimitiveSwitch directory)

name template is following:

```<type>_<control>_<pipeline>```

```<type>```: **distribute_1x2** or **distribute_2x2** or **merge_2x1**

```<control>```: **simple** or **dst_tag** or **dst_tag_multicast** or **autopick** or **autopick_multi_output**

```<pipeline>```: **comb** or **seq**

Where,

In ```<type>```

**distribute_1x2**: means *1 input & 2 output switch (support unicast & multicast)*.

**distribute_2x2**: means *2 input & 2 output switch (support unicast & multicast)*, Note: three versions are supported in this switch depends on the length of command, and they could be used by setting different ``` `define``` in the verilog file. Check the illustration in verilog file out for functionality description. 

**merge_2x1**: means *2 input & 1 output switch*.

In ```<control>```:

**simple**: means *simple control*; only feed an individual switch with the command belonging to itself. Cannot feed redundent command.

**dst_tag**: means *destination tag control* ; could feed an individual switch with longer command than it needs. It consumes the command it needs and output the remaining command for following switches. Only *unicast* is supported in this switch, including "Branch_high" and "Branch_Low". 

**dst_tag_multicast**: means *destination tag control with multicasting support*; add *multicast* to the **dst_tag**.

**autopick**: means automatically pick and output *1* valid input. So no command for this module. High input has higher priority when multiple inputs are valid.   

**autopick_multi_output**: same meaning as **autopick** but support picking and outputing *multiple* valid input.

In ```<pipeline>```:

**comb**: means "combinational circuit". Output changes immediately when input changes. 

**seq**: means "sequential circuit". Output changes only at the positive edge of clock signal.


## topology (Topology directory)

name template is following:

```<type>_<control>_<pipeline>```

```<type>```: **benes**, **benes_merge**, **butterfly**, **butterfly_merge**, **unfoldedbutterfly_merge** (i.e., William’s distribute NoC topology), **cube**
**benes**: is the typical [BENES network](http://homepages.inf.ed.ac.uk/cgi/rni/comp-arch.pl?Networks/benes.html,Networks/benes-f.html,Networks/menu-dyn.html) enhanced with multicast control. The unicast control method could be found at to enhance BENES with multicast control could be found in [PIT](https://ieeexplore.ieee.org/abstract/document/9311185) paper and [COCOA](https://dl.acm.org/doi/abs/10.1145/3386263.3406924) paper.
**butterfly**: the typical Butterfly network, could be found in [On-chip Networks](https://ieeexplore.ieee.org/document/7987470) and [Principles and Practices of Interconnection Networks](https://books.google.com.hk/books?hl=zh-CN&lr=&id=Rz7pCY8gIq0C&oi=fnd&pg=PP2&dq=Principles+and+Practices+of+Interconnection+Networks&ots=9hyttbtQze&sig=n0bYVOHFq6juqcBMX_fEwGJc4-w&redir_esc=y#v=onepage&q=Principles%20and%20Practices%20of%20Interconnection%20Networks&f=false).

**benes_merge**: add the merge network after BENES (with the last stage eliminated) to enhance BENES for the scenario where # input & # output are different, such as "8 input to 4 output". Note: input number and output number should be power of 2. ["#" stands for "number of"]

**butterfly_merge**: add the merge network after Butterfly (with the last stage eliminated). 

**unfoldedbutterfly_merge**: the specifically designed topology for scenarios where # inputs and # outputs are different. The first stage of **butterfly_merge** is changed into *distribute_1x2 switch*.

**cube**: is the typical [cube-connected-cubes network](https://www.sciencedirect.com/science/article/pii/016560749290012V)

## Utility Module (Util directory)

name template is following:

```<type>_<control>_<pipeline>```

```<type>```: **mux** or **adder** or **adder_var**

```<control>```: **blank** or **simple**

```<pipeline>```: **comb** or **seq**

**adder** means the module to sum two input data up. Two input data share the same length and the output data also has the same length with input data.

**adder_var** also refers to the module to add two input data up. The output should be 1 bit longer than input data.

**mux** picks 1 data from 2 input data according to the validity of input data and control command.

**blank** means that the module doesn't need control. And inner functionality is deterministic and independent to the input.


# Functionality

Functionality of each switch or topology is illustrated in the top of corresponding verilog file. 

For example, the functionality of destination tag based butterfly network could be viewed from butterfly_dst_tag_comb.v file like following.
```
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                                              
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|----->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\    /->|___|-\ /->|___|-->
//                                                     \  /          X                                  
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\/--->|¯¯¯|-/ \->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|----->|___|-->
//                                                     X  X                               
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|----->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|---/\--->|___|-\ /->|___|-->
//                                                     /  \          X              
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/    \->|¯¯¯|-/ \->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|----->|___|-->
//                                                        
//              
//        CONNECTION FUNCTION                        BUTTERFLY    BUTTERFLY  
//       CONNECTION GROUP SIZE                          8            4 
``` 