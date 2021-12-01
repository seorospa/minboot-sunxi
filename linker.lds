ENTRY(_start)
SECTIONS {
  .text : {
    *(.stub);
    *(.text);
  }
  .data : {*(.rodata .data)}
  _size_ = ALIGN(512);
  _bss_start_ = ALIGN(4);
  .bss : {*(.bss .bss*)}
  _bss_size_ = ALIGN(4) - _bss_start_;
}