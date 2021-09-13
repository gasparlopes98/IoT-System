# 1 "mcc_generated_files/CoAP/coap_transmit.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/Mateo/.mchp_packs/Microchip/PIC18F-K_DFP/1.1.58/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "mcc_generated_files/CoAP/coap_transmit.c" 2
# 40 "mcc_generated_files/CoAP/coap_transmit.c"
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 2 3






# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\features.h" 1 3
# 10 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 2 3
# 24 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3





typedef void * va_list[1];




typedef void * __isoc_va_list[1];
# 122 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned size_t;
# 137 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long ssize_t;
# 168 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __int24 int24_t;
# 204 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 246 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long off_t;
# 399 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct _IO_FILE FILE;
# 24 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 2 3
# 52 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 3
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern FILE *const stdin;
extern FILE *const stdout;
extern FILE *const stderr;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);
int ungetc(int, FILE *);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);

char *fgets(char *restrict, int, FILE *restrict);

char *gets(char *);


int fputs(const char *restrict, FILE *restrict);
int puts(const char *);

#pragma printf_check(printf) const
#pragma printf_check(vprintf) const
#pragma printf_check(sprintf) const
#pragma printf_check(snprintf) const
#pragma printf_check(vsprintf) const
#pragma printf_check(vsnprintf) const

int printf(const char *restrict, ...);
int fprintf(FILE *restrict, const char *restrict, ...);
int sprintf(char *restrict, const char *restrict, ...);
int snprintf(char *restrict, size_t, const char *restrict, ...);

int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

int scanf(const char *restrict, ...);
int fscanf(FILE *restrict, const char *restrict, ...);
int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *open_memstream(char **, size_t *);
FILE *fdopen(int, const char *);
FILE *popen(const char *, const char *);
int pclose(FILE *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int dprintf(int, const char *restrict, ...);
int vdprintf(int, const char *restrict, __isoc_va_list);
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
ssize_t getdelim(char **restrict, size_t *restrict, int, FILE *restrict);
ssize_t getline(char **restrict, size_t *restrict, FILE *restrict);
int renameat(int, const char *, int, const char *);
char *ctermid(char *);







char *tempnam(const char *, const char *);
# 40 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdlib.h" 1 3
# 21 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdlib.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 18 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int wchar_t;
# 21 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdlib.h" 2 3


int atoi (const char *);
long atol (const char *);
long long atoll (const char *);
double atof (const char *);

float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);



long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);
long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);

int rand (void);
void srand (unsigned);

          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));

__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);
long long llabs (long long);

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
typedef struct { long long quot, rem; } lldiv_t;

div_t div (int, int);
ldiv_t ldiv (long, long);
lldiv_t lldiv (long long, long long);

typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);





size_t __ctype_get_mb_cur_max(void);
# 41 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\string.h" 1 3
# 25 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\string.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 411 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct __locale_struct * locale_t;
# 25 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\string.h" 2 3


void *memcpy (void *restrict, const void *restrict, size_t);
void *memmove (void *, const void *, size_t);
void *memset (void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void *memchr (const void *, int, size_t);

char *strcpy (char *restrict, const char *restrict);
char *strncpy (char *restrict, const char *restrict, size_t);

char *strcat (char *restrict, const char *restrict);
char *strncat (char *restrict, const char *restrict, size_t);

int strcmp (const char *, const char *);
int strncmp (const char *, const char *, size_t);

int strcoll (const char *, const char *);
size_t strxfrm (char *restrict, const char *restrict, size_t);

char *strchr (const char *, int);
char *strrchr (const char *, int);

size_t strcspn (const char *, const char *);
size_t strspn (const char *, const char *);
char *strpbrk (const char *, const char *);
char *strstr (const char *, const char *);
char *strtok (char *restrict, const char *restrict);

size_t strlen (const char *);

char *strerror (int);
# 65 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\string.h" 3
char *strtok_r (char *restrict, const char *restrict, char **restrict);
int strerror_r (int, char *, size_t);
char *stpcpy(char *restrict, const char *restrict);
char *stpncpy(char *restrict, const char *restrict, size_t);
size_t strnlen (const char *, size_t);
char *strdup (const char *);
char *strndup (const char *, size_t);
char *strsignal(int);
char *strerror_l (int, locale_t);
int strcoll_l (const char *, const char *, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);




void *memccpy (void *restrict, const void *restrict, int, size_t);
# 42 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\time.h" 1 3
# 33 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\time.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 76 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long time_t;
# 293 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef void * timer_t;




typedef int clockid_t;




typedef unsigned long clock_t;
# 313 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
struct timespec { time_t tv_sec; long tv_nsec; };





typedef int pid_t;
# 33 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\time.h" 2 3







struct tm {
 int tm_sec;
 int tm_min;
 int tm_hour;
 int tm_mday;
 int tm_mon;
 int tm_year;
 int tm_wday;
 int tm_yday;
 int tm_isdst;
 long __tm_gmtoff;
 const char *__tm_zone;
};

clock_t clock (void);
time_t time (time_t *);
double difftime (time_t, time_t);
time_t mktime (struct tm *);
size_t strftime (char *restrict, size_t, const char *restrict, const struct tm *restrict);
struct tm *gmtime (const time_t *);
struct tm *localtime (const time_t *);
char *asctime (const struct tm *);
char *ctime (const time_t *);
int timespec_get(struct timespec *, int);
# 73 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\time.h" 3
size_t strftime_l (char * restrict, size_t, const char * restrict, const struct tm * restrict, locale_t);

struct tm *gmtime_r (const time_t *restrict, struct tm *restrict);
struct tm *localtime_r (const time_t *restrict, struct tm *restrict);
char *asctime_r (const struct tm *restrict, char *restrict);
char *ctime_r (const time_t *, char *);

void tzset (void);

struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 102 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\time.h" 3
int nanosleep (const struct timespec *, struct timespec *);
int clock_getres (clockid_t, struct timespec *);
int clock_gettime (clockid_t, struct timespec *);
int clock_settime (clockid_t, const struct timespec *);
int clock_nanosleep (clockid_t, int, const struct timespec *, struct timespec *);
int clock_getcpuclockid (pid_t, clockid_t *);

struct sigevent;
int timer_create (clockid_t, struct sigevent *restrict, timer_t *restrict);
int timer_delete (timer_t);
int timer_settime (timer_t, int, const struct itimerspec *restrict, struct itimerspec *restrict);
int timer_gettime (timer_t, struct itimerspec *);
int timer_getoverrun (timer_t);

extern char *tzname[2];





char *strptime (const char *restrict, const char *restrict, struct tm *restrict);
extern int daylight;
extern long timezone;
extern int getdate_err;
struct tm *getdate (const char *);
# 43 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/tcpip_types.h" 1
# 47 "mcc_generated_files/CoAP/../TCPIPLibrary/tcpip_types.h"
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 1 3
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 127 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 142 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 158 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;
# 173 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int32_t;





typedef long long int64_t;
# 188 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;
# 209 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 229 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 2 3
# 47 "mcc_generated_files/CoAP/../TCPIPLibrary/tcpip_types.h" 2


typedef enum {TCB_ERROR = -1, TCB_NO_ERROR = 0} tcbError_t;

typedef struct
{
    uint8_t destinationMAC[6];
    uint8_t sourceMAC[6];
    union
    {
        uint16_t type;
        uint16_t length;
        uint16_t tpid;
    }id;




} ethernetFrame_t;
# 120 "mcc_generated_files/CoAP/../TCPIPLibrary/tcpip_types.h"
typedef struct
{
    unsigned ihl:4;
    unsigned version:4;
    unsigned ecn:2;
    unsigned dscp:6;
    uint16_t length;
    uint16_t identifcation;
    unsigned fragmentOffsetHigh:5;
    unsigned :1;
    unsigned dontFragment:1;
    unsigned moreFragments:1;
    uint8_t fragmentOffsetLow;
    uint8_t timeToLive;
    uint8_t protocol;
    uint16_t headerCksm;
    uint32_t srcIpAddress;
    uint32_t dstIpAddress;


} ipv4Header_t;


typedef struct
{
    uint32_t srcIpAddress;
    uint32_t dstIpAddress;
    uint8_t protocol;
    uint8_t z;
    uint16_t length;
} ipv4_pseudo_header_t;

typedef struct
{
    union
    {
        uint16_t typeCode;
        struct
        {
            uint8_t code;
            uint8_t type;
        };
    };
    uint16_t checksum;
} icmpHeader_t;



typedef enum
{
    ECHO_REPLY = 0x0000,

    DEST_NETWORK_UNREACHABLE = 0x0300,
    DEST_HOST_UNREACHABLE = 0x0301,
    DEST_PROTOCOL_UNREACHABLE = 0x0302,
    DEST_PORT_UNREACHABLE = 0x0303,
    FRAGMENTATION_REQUIRED = 0x0304,
    SOURCE_ROUTE_FAILED = 0x0305,
    DESTINATION_NETWORK_UNKNOWN = 0x0306,
    SOURCE_HOST_ISOLATED = 0x0307,
    NETWORK_ADMINISTRATIVELY_PROHIBITED = 0x0308,
    HOST_ADMINISTRATIVELY_PROHIBITED = 0x0309,
    NETWORK_UNREACHABLE_FOR_TOS = 0x030A,
    HOST_UNREACHABLE_FOR_TOS = 0x030B,
    COMMUNICATION_ADMINISTRATIVELY_PROHIBITED = 0x030C,
    HOST_PRECEDENCE_VIOLATION = 0x030D,
    PRECEDENCE_CUTOFF_IN_EFFECT = 0x030E,

    SOURCE_QUENCH = 0x0400,

    REDIRECT_DATAGRAM_FOR_THE_NETWORK = 0x0500,
    REDIRECT_DATAGRAM_FOR_THE_HOST = 0x0501,
    REDIRECT_DATAGRAM_FOR_THE_TOS_AND_NETWORK = 0x0502,
    REDIRECT_DATAGRAM_FOR_THE_TOS_AND_HOST = 0x0503,

    ALTERNATE_HOST_ADDRESS = 0x0600,

    ECHO_REQUEST = 0x0800,


    UNASSIGNED_ECHO_TYPE_CODE_REQUEST_1 = 0x082A,
    UNASSIGNED_ECHO_TYPE_CODE_REQUEST_2 = 0x08FC,

    ROUTER_ADVERTISEMENT = 0x0900,
    ROUTER_SOLICITATION = 0x0A00,
    TRACEROUTE = 0x3000
} icmpTypeCodes_t;

typedef struct
{
    uint16_t srcPort;
    uint16_t dstPort;
    uint16_t length;
    uint16_t checksum;
} udpHeader_t;

typedef struct
{
    uint16_t sourcePort;
    uint16_t destPort;
    uint32_t sequenceNumber;
    uint32_t ackNumber;
    union{
        uint8_t byte13;
        struct{
            uint8_t ns:1;
            uint8_t reserved:3;
            uint8_t dataOffset:4;
        };
    };

    union{
        uint8_t flags;
        struct{
            uint8_t fin:1;
            uint8_t syn:1;
            uint8_t rst:1;
            uint8_t psh:1;
            uint8_t ack:1;
            uint8_t urg:1;
            uint8_t ece:1;
            uint8_t cwr:1;
        };
    };

    uint16_t windowSize;
    uint16_t checksum;
    uint16_t urgentPtr;



} tcpHeader_t;



typedef enum
{
    HOPOPT_TCPIP = 0,
    ICMP_TCPIP = 1,
    IGMP_TCPIP = 2,
    GGP_TCPIP = 3,
    IPV4_TCPIP = 4,
    ST_TCPIP = 5,
    TCP_TCPIP = 6,
    CBT_TCPIP = 7,
    EGP_TCPIP = 8,
    IGP_TCPIP = 9,
    BBN_RCC_MON_TCPIP = 10,
    NVP_II_TCPIP = 11,
    PUP_TCPIP = 12,
    ARGUS_TCPIP = 13,
    EMCON_TCPIP = 14,
    XNET_TCPIP = 15,
    CHAOS_TCPIP = 16,
    UDP_TCPIP = 17,
    MUX_TCPIP = 18,
    DCN_MEAS_TCPIP = 19,
    HMP_TCPIP = 20,
    PRM_TCPIP = 21,
    XNS_IDP_TCPIP = 22,
    TRUNK_1_TCPIP = 23,
    TRUNK_2_TCPIP = 24,
    LEAF_1_TCPIP = 25,
    LEAF_2_TCPIP = 26,
    RDP_TCPIP = 27,
    IRTP_TCPIP = 28,
    ISO_TP4_TCPIP = 29,
    NETBLT_TCPIP = 30,
    MFE_NSP_TCPIP = 31,
    MERIT_INP_TCPIP = 32,
    DCCP_TCPIP = 33,
    THREEPC_TCPIP = 34,
    IDPR_TCPIP = 35,
    XTP_TCPIP = 36,
    DDP_TCPIP = 37,
    IDPR_CMTP_TCPIP = 38,
    TPpp_TCPIP = 39,
    IL_TCPIP = 40,
    IPV6_TUNNEL_TCPIP = 41,
    SDRP_TCPIP = 42,
    IPV6_Route_TCPIP = 43,
    IPV6_Frag_TCPIP = 44,
    IDRP_TCPIP = 45,
    RSVP_TCPIP = 46,
    GRE_TCPIP = 47,
    DSR_TCPIP = 48,
    BNA_TCPIP = 49,
    ESP_TCPIP = 50,
    AH_TCPIP = 51,
    I_NLSP_TCPIP = 52,
    SWIPE_TCPIP = 53,
    NARP_TCPIP = 54,
    MOBILE_TCPIP = 55,
    TLSP_TCPIP = 56,
    SKIP_TCPIP = 57,
    IPV6_ICMP_TCPIP = 58,
    IPV6_NoNxt_TCPIP = 59,
    IPV6_Opts_TCPIP = 60,
    CFTP_TCPIP = 62,
    SAT_EXPAK_TCPIP = 64,
    KRYPTOLAN_TCPIP = 65,
    RVD_TCPIP = 66,
    IPPC_TCPIP = 67,
    SAT_MON_TCPIP = 69,
    VISA_TCPIP = 70,
    IPCV_TCPIP = 71,
    CPNX_TCPIP = 72,
    CPHB_TCPIP = 73,
    WSN_TCPIP = 74,
    PVP_TCPIP = 75,
    BR_SAT_MON_TCPIP = 76,
    SUN_ND_TCPIP = 77,
    WB_MON_TCPIP = 78,
    WB_EXPAK_TCPIP = 79,
    ISO_IP_TCPIP = 80,
    VMTP_TCPIP = 81,
    SECURE_VMTP_TCPIP = 82,
    VINES_TCPIP = 83,
    TTP_TCPIP = 84,
    IPTM_TCPIP = 84,
    NSFNET_IGP_TCPIP = 85,
    DGP_TCPIP = 86,
    TCF_TCPIP = 87,
    EIGRP_TCPIP = 88,
    OSPFIGP_TCPIP = 89,
    Sprite_RPC_TCPIP = 90,
    LARP_TCPIP = 91,
    MTP_TCPIP = 92,
    AX25_TCPIP = 93,
    IPIP_TCPIP = 94,
    MICP_TCPIP = 95,
    SCC_SP_TCPIP = 96,
    ETHERIP_TCPIP = 97,
    ENCAP_TCPIP = 98,
    GMTP_TCPIP = 100,
    IFMP_TCPIP = 101,
    PNNI_TCPIP = 102,
    PIM_TCPIP = 103,
    ARIS_TCPIP = 104,
    SCPS_TCPIP = 105,
    QNX_TCPIP = 106,
    A_N_TCPIP = 107,
    IPComp_TCPIP = 108,
    SNP_TCPIP = 109,
    Compaq_Peer_TCPIP = 110,
    IPX_in_IP_TCPIP = 111,
    VRRP_TCPIP = 112,
    PGM_TCPIP = 113,
    L2TP_TCPIP = 115,
    DDX_TCPIP = 116,
    IATP_TCPIP = 117,
    STP_TCPIP = 118,
    SRP_TCPIP = 119,
    UTI_TCPIP = 120,
    SMP_TCPIP = 121,
    SM_TCPIP = 122,
    PTP_TCPIP = 123,
    ISIS_TCPIP = 124,
    FIRE_TCPIP = 125,
    CRTP_TCPIP = 126,
    CRUDP_TCPIP = 127,
    SSCOPMCE_TCPIP = 128,
    IPLT_TCPIP = 129,
    SPS_TCPIP = 130,
    PIPE_TCPIP = 131,
    SCTP_TCPIP = 132,
    FC_TCPIP = 133
} ipProtocolNumbers;

typedef struct
{
    union{
        uint32_t s_addr;
        uint8_t s_addr_byte[4];
    };
}inAddr_t;


typedef struct
{
    uint16_t port;
    inAddr_t addr;
}sockaddr_in4_t;


extern const char *network_errors[];

typedef enum
{
    ERROR =0,
    SUCCESS,
    LINK_NOT_FOUND,
    BUFFER_BUSY,
    TX_LOGIC_NOT_IDLE,
    MAC_NOT_FOUND,
    IP_WRONG_VERSION,
    IPV4_CHECKSUM_FAILS,
    DEST_IP_NOT_MATCHED,
    ICMP_CHECKSUM_FAILS,
    UDP_CHECKSUM_FAILS,
    TCP_CHECKSUM_FAILS,
    DMA_TIMEOUT,
    PORT_NOT_AVAILABLE,
    ARP_IP_NOT_MATCHED,
    EAPoL_PACKET_FAILURE,
    INCORRECT_IPV4_HLEN,
    IPV4_NO_OPTIONS,
    TX_QUEUED,
    IPV6_CHECKSUM_FAILS,
    IPV6_LOCAL_ADDR_RESOLVE,
    IPV6_LOCAL_ADDR_INVALID,
    NO_GATEWAY,
    ADDRESS_RESOLUTION,
    GLOBAL_DESTINATION,
    ARP_WRONG_HARDWARE_ADDR_TYPE,
    ARP_WRONG_PROTOCOL_TYPE,
    ARP_WRONG_HARDWARE_ADDR_LEN,
    ARP_WRONG_PROTOCOL_LEN
}error_msg;

typedef struct
{
    inAddr_t dest_addr;
}destIP_t;


typedef int8_t socklistsize_t;

typedef void (*ip_receive_function_ptr)(int16_t);
# 44 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/tcpip_config.h" 1
# 62 "mcc_generated_files/CoAP/../TCPIPLibrary/tcpip_config.h"
const char dhcpName[] = "PIC18F26K40CoAP_G10";
# 45 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/udpv4.h" 1
# 56 "mcc_generated_files/CoAP/../TCPIPLibrary/udpv4.h"
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdbool.h" 1 3
# 56 "mcc_generated_files/CoAP/../TCPIPLibrary/udpv4.h" 2

# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/ethernet_driver.h" 1
# 47 "mcc_generated_files/CoAP/../TCPIPLibrary/ethernet_driver.h"
# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/mac_address.h" 1
# 48 "mcc_generated_files/CoAP/../TCPIPLibrary/mac_address.h"
typedef union
{
    uint8_t mac_array[6];
    struct { uint8_t byte1,byte2,byte3,byte4,byte5,byte6; } s;
} mac48Address_t;

typedef union
{
    uint8_t mac_array[8];
    struct { uint8_t byte1,byte2,byte3,byte4,byte5,byte6,byte7,byte8; } s;
} mac64Address_t;

extern const mac48Address_t broadcastMAC;
extern mac48Address_t hostMacAddress;

const mac48Address_t *MAC_getAddress(void);
# 47 "mcc_generated_files/CoAP/../TCPIPLibrary/ethernet_driver.h" 2



typedef union
{
    uint8_t v[4];
    struct
    {
        uint16_t byteCount;
        unsigned long_drop_event:1;
        unsigned :1;
        unsigned excessCarrierEvent:1;
        unsigned :1;
        unsigned crcError:1;
        unsigned lengthCheckError:1;
        unsigned lengthLongError:1;
        unsigned rxOK:1;
        unsigned rxMulticast:1;
        unsigned rxBroadcast:1;
        unsigned dribbleNibble:1;
        unsigned controlFrame:1;
        unsigned pauseControlFrame:1;
        unsigned unknownContrlFrame:1;
        unsigned vlanTagPresent:1;
        unsigned zero:1;
    };
}receiveStatusVector_t;


typedef struct
{
 unsigned error:1;
 unsigned pktReady:1;
 unsigned up:1;
 unsigned idle:1;
 unsigned linkChange:1;
        unsigned bufferBusy:1;
        unsigned :3;
        uint16_t saveRDPT;
        uint16_t saveWRPT;
} ethernetDriver_t;

typedef struct
{
    uint16_t flags;
    uint16_t packetStart;
    uint16_t packetEnd;

    void *prevPacket;
    void *nextPacket;
} txPacket_t;

extern volatile ethernetDriver_t ethData;





void ETH_CloseSPI(void);
void ETH_OpenSPI(void);

void ETH_Init(void);
void ETH_EventHandler(void);
void ETH_NextPacketUpdate(void);
void ETH_ResetReceiver(void);
void ETH_SendSystemReset(void);


uint16_t ETH_ReadBlock(void*, uint16_t);
uint8_t ETH_Read8(void);
uint16_t ETH_Read16(void);
uint32_t ETH_Read24(void);
uint32_t ETH_Read32(void);
void ETH_Dump(uint16_t);
void ETH_Flush(void);

uint16_t ETH_GetFreeTxBufferSize(void);

error_msg ETH_WriteStart(const mac48Address_t *dest_mac, uint16_t type);
uint16_t ETH_WriteString(const char *string);
uint16_t ETH_WriteBlock(const char *, uint16_t);
void ETH_Write8(uint8_t);
void ETH_Write16(uint16_t);
void ETH_Write24(uint32_t data);
void ETH_Write32(uint32_t);
void ETH_Insert(char *,uint16_t, uint16_t);
error_msg ETH_Copy(uint16_t);
error_msg ETH_Send(void);

uint16_t ETH_TxComputeChecksum(uint16_t position, uint16_t len, uint16_t seed);
uint16_t ETH_RxComputeChecksum(uint16_t len, uint16_t seed);

void ETH_GetMAC(uint8_t *);
void ETH_SetMAC(uint8_t *);
uint16_t ETH_GetWritePtr();
void ETH_SaveRDPT(void);
void ETH_ResetReadPtr();
uint16_t ETH_GetReadPtr(void);
void ETH_SetReadPtr(uint16_t);
uint16_t ETH_GetStatusVectorByteCount(void);
void ETH_SetStatusVectorByteCount(uint16_t);

void ETH_ResetByteCount(void);
uint16_t ETH_GetByteCount(void);

uint16_t ETH_ReadSavedWRPT(void);
void ETH_SaveWRPT(void);
void ETH_SetRxByteCount(uint16_t count);
uint16_t ETH_GetRxByteCount(void);

_Bool ETH_CheckLinkUp(void);

void ETH_TxReset(void);
void ETH_MoveBackReadPtr(uint16_t offset);
# 57 "mcc_generated_files/CoAP/../TCPIPLibrary/udpv4.h" 2


extern uint16_t destPort;
extern udpHeader_t udpHeader;
extern ipv4Header_t ipv4Header;
# 82 "mcc_generated_files/CoAP/../TCPIPLibrary/udpv4.h"
error_msg UDP_Start(uint32_t destIP, uint16_t srcPort, uint16_t dstPort);
error_msg UDP_Send(void);
error_msg UDP_Receive(uint16_t udpcksm);
void udp_test(int len);
# 46 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "mcc_generated_files/CoAP/coap.h" 1
# 50 "mcc_generated_files/CoAP/coap.h"
# 1 "mcc_generated_files/CoAP/coap_options.h" 1
# 44 "mcc_generated_files/CoAP/coap_options.h"
# 1 "mcc_generated_files/CoAP/coap_dataInterface.h" 1
# 47 "mcc_generated_files/CoAP/coap_dataInterface.h"
# 1 "mcc_generated_files/CoAP/../content_type/contentFormat.h" 1
# 30 "mcc_generated_files/CoAP/../content_type/contentFormat.h"
typedef enum
{
    SIGNED_INTEGER=0,
    UNSIGNED_INTEGER,
    BYTE_STRING,
    TEXT_STRING,
    BOOLEAN
}ContentDataType_t;

typedef enum
{
    TEXT_PLAIN = 0,
    LINK_FORMAT = 40,
    APPLICATION_JSON = 50,
    CBOR = 60,
}content_format_t;

typedef enum
{
     MAP, ARRAY, UN_KNOWN }cFMenuItems;

typedef void (*contentFormatFunctionPointer)(long,ContentDataType_t);
typedef void (*contentFormatDecodeFunctionPointer)(char *,void *,ContentDataType_t);
typedef uint8_t (*parseFunctionPointer)(char *);
typedef void (*writeFunctionPointer)(void *, cFMenuItems);

typedef struct
{
    contentFormatFunctionPointer encodeFormatter;
    contentFormatDecodeFunctionPointer decodeFormatter;
    parseFunctionPointer parseDataHandler;
    writeFunctionPointer writeDataHandler;
}contentFormatHandlers_t;


typedef struct
{
    uint8_t object_map_elements;
    uint8_t array_map_elements;
    uint8_t array_elements;
}elements_t;


extern elements_t CfElements;

void Get_ToEthernet(long data, ContentDataType_t type);
void Put_ToResource(char *data, void *variable, ContentDataType_t type);
uint8_t parseData(char *data,uint8_t sizeOfData);
void writeAuxData(void *data,cFMenuItems items);
void setContentFormatDataHandlers(uint8_t index);
_Bool iscfMatched(content_format_t cfType);
# 47 "mcc_generated_files/CoAP/coap_dataInterface.h" 2
# 56 "mcc_generated_files/CoAP/coap_dataInterface.h"
uint8_t getResourceType();


int setURIPath(char *);

void setURIQuery(char *);

_Bool isURIPathValid(int8_t *uri_path, uint8_t count);

_Bool isURIQueryValid(void);

uint8_t getRootToLeafPathCount(void);

char *getDiscoveryPath(uint8_t idx);

uint8_t getPathLength(uint8_t idx);

void resetOptions(void);

void addPayloadOverHead(uint8_t idx, uint8_t numOfResources);

int16_t processPayloadOverHead( uint8_t receivedPayloadLength, content_format_t cfType);

uint8_t getResourceDataID(void);

uint32_t getDiscoveryLength(void);

int8_t getPathResourceIdx(void);

int8_t getLeafResourceIdx(void);

void resetLeafAndPathResourceIdices(void);
# 44 "mcc_generated_files/CoAP/coap_options.h" 2
# 53 "mcc_generated_files/CoAP/coap_options.h"
void COAP_AddWellKnownURIPathOptions(void);
void COAP_AddBlock2Options(char *str);
void COAP_AddAcceptOption(content_format_t acceptFormat);
void COAP_AddContentFormatOption(content_format_t contentFormat);
void COAP_AddURIPathOption(const char *uriPathStr);
void COAP_AddURIQueryOption(const char *uriQueryStr);

void COAP_ResetLastOptionNumber(void);
uint8_t COAP_GetNumberOfOptionsAdded(void);
uint8_t COAP_GetLengthOfIntegerOptionValue(uint32_t val);
# 50 "mcc_generated_files/CoAP/coap.h" 2
# 77 "mcc_generated_files/CoAP/coap.h"
typedef void (*OptionHandler_fuction_ptr)(void);
typedef void (*payloadHandler_fuction_ptr)(void);
typedef void (*observePayloadHandler_fuction_ptr)(int16_t vIdx,content_format_t acceptFormat);

typedef struct
{
    OptionHandler_fuction_ptr addOptions;
}OptionTypeHandler_t;

typedef struct
{
    payloadHandler_fuction_ptr addPayload;
}payload_t;

typedef struct
{
    observePayloadHandler_fuction_ptr addObservePayload;
}ObservePayload_t;

typedef enum
{
    CON_TYPE =0,
    NON_TYPE =1,
    ACK_TYPE =2,
    RST_TYPE =3
}coapTypes;

typedef enum
{
    EMPTY=0,
    GET =1,
    POST =2,
    PUT =3,
    DELETE =4,
    PATCH =5,
    CREATED=65,
    DELETED =66,
    VALID = 67,
    CHANGED = 68,
    CONTENT = 69,
    CONTINUE = 95,


    BAD_REQUEST = 128,
    UNAUTHORIZED = 129,
    BAD_OPTION = 130,
    FORBIDDEN = 131,
    NOT_FOUND = 132,
    METHOD_NOT_ALLOWED = 133,
    NOT_ACCEPTABLE =134,
    REQUEST_ENTITY_INCOMPLETE = 136,
    PRECONDITION_FAILED = 140,
    REQUEST_ENTITY_TOO_LARGE = 141,
    UNSUPPORTED_CONTENT_FORMAT = 143,


    INTERNAL_SERVER_ERROR =160,
    NOT_IMPLEMENTED = 161,
    BAD_GATEWAY = 162,
    SERVICE_UNAVAILABLE = 163,
    GATEWAY_TIMEOUT = 164,
    PROXY_NOT_SUPPORTED = 165
}coapCodes;


typedef struct
{
    unsigned tkl:4;
    unsigned t:2;
    unsigned ver:2;
    uint8_t code;
}coapHeader_t;

typedef union
{
    uint8_t length_8;
    uint16_t length_16;
}Length;

typedef struct
{
    uint8_t type;
    Length len;
    char opt_value[(32)];
}Option_t;

typedef struct
{
     uint8_t name;
     uint32_t value;
}queryNameValuePair;

typedef struct
{
    _Bool isObserveServerFlag;
    int16_t observedVertexIndex;
    content_format_t observedAcceptFormat;
}observeNotify_t;

typedef struct
{
    uint8_t uri_host[7];
    uint8_t uri_path[(10)];
    uint16_t uri_port;
    content_format_t content_format;
    content_format_t accept_format;
    queryNameValuePair queryList[(5)];
    uint8_t uripath_count;
    uint8_t uriquery_count;
}Option_List;

typedef struct
{
    uint32_t destIP;
    uint8_t clientToken[(8)];
    OptionTypeHandler_t *clientOption;
    payload_t *clientPayload;
    ObservePayload_t *observePayload;
    uint16_t destPort;
    uint16_t srcPort;
   observeNotify_t observeNotifiers;
}coapTransmit_t;

typedef struct
{
    uint16_t messageID;
    char token[(8)];
    uint32_t destIP;
    uint8_t code;
    uint8_t type;
    uint16_t destPort;
    uint16_t srcPort;
    Option_List optlist;
    uint8_t opt_count;
    _Bool payload_waiting;
    int16_t payload_length;
    coapTypes retCode;
}coapReceive_t;


void COAP_Init(void);
void COAP_Manage(void);

error_msg COAP_Transmit(coapTransmit_t *ptr,coapTypes Type, coapCodes Code, _Bool Retransmission);
void COAP_Discover(coapTransmit_t *ptr);
error_msg COAP_StartDiscover(void);
_Bool COAP_FreeEndpointMessageIDTokenPairIfMatched(uint32_t receviedIPAddress, uint16_t messageID, char *token, uint8_t tokenLength, coapTypes type);

_Bool COAP_IsEndpointTokenPairMatched(uint32_t receviedIPAddress, char *token);
void COAP_EndofOptions(void);
error_msg COAP_Send(void);
void COAP_InsertLastOptionValue(coapReceive_t *ptr,char *optionValue,uint16_t optionLength);
_Bool COAP_ParseOptions(coapReceive_t *ptr, int16_t length);
_Bool COAP_TraverseToResource(coapReceive_t *ptr);
void COAP_Receive(int16_t length);
_Bool COAP_MessageResponse(coapReceive_t *ptr);
_Bool COAP_ErrorResponse(coapReceive_t *ptr);
char * COAP_getReceivedClientToken(void);


void COAP_CL_deviceRegistry(int16_t length);

typedef enum
{
    Bad_Request = 400,
    Unauthorized = 401,
    Payment_Required = 402,
    Forbidden = 403,
    Not_Found = 404,
    Method_Not_Allowed = 405,
    Not_Acceptable = 406,
    Proxy_Authentication_Required = 407,
    Request_Timeout = 408,
    Conflict = 409,
    Gone = 410,
    Length_Required = 411,
    Precondition_Failed = 412,
    Payload_Too_Large = 413,
    Request_URI_Too_Long = 414,
    Unsupported_Media_Type = 415,
    Requested_Range_Not_Satisfiable = 416,
    Expectation_Failed = 417,
    Im_a_teapot = 418,
    Authentication_Timeout = 419,
    Method_Failure = 420,
    Enhance_Your_Calm = 420,
    Misdirected_Request = 421,
    Unprocessable_Entity = 422,
    Locked = 423,
    Failed_Dependency = 424,
    Upgrade_Required = 426,
    Precondition_Required = 428,
    Too_Many_Requests = 429,
    Request_Header_Fields_Too_Large = 431,
    Login_Timeout = 440,
    No_Response = 444,
    Retry_With = 449,
    Blocked_by_Windows_Parental_Controls = 450,
    Unavailable_For_Legal_Reasons = 451,
    Request_Header_Too_Large = 494,
    Cert_Error = 495,
    No_Cert = 496,
    HTTP_to_HTTPS = 497,
    Token_expired_invalid = 498,
    Client_Closed_Request = 499,
    Token_required = 499
}COAPERRORS_t;
# 47 "mcc_generated_files/CoAP/coap_transmit.c" 2


# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/lfsr.h" 1
# 44 "mcc_generated_files/CoAP/../TCPIPLibrary/lfsr.h"
typedef uint8_t lfsr_t;
int lfsr_getSequenceCount(void);
lfsr_t lfsr_getSequence(void);
void lfsr_reset(void);
void lfsr_setSequence(uint16_t s);
lfsr_t lfsr(void);
lfsr_t lfsrWithSeed(uint8_t lfsrSeed);
# 49 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "mcc_generated_files/CoAP/../TCPIPLibrary/ip_database.h" 1
# 40 "mcc_generated_files/CoAP/../TCPIPLibrary/ip_database.h"
 typedef struct {
    uint32_t ipv4_myAddress;
    uint32_t ipv4_dns[2];
    uint32_t ipv4_subnetMask;
    uint32_t ipv4_router;
    uint32_t ipv4_gateway;
    uint32_t ipv4_ntpAddress[2];
    uint32_t ipv4_tftpAddress;
} ip_db_info_t;


extern ip_db_info_t ip_database_info;
# 72 "mcc_generated_files/CoAP/../TCPIPLibrary/ip_database.h"
void ipdb_init(void);
uint32_t makeStrToIpv4Address(char *str);
char *makeIpv4AddresstoStr(uint32_t addr);
# 50 "mcc_generated_files/CoAP/coap_transmit.c" 2

# 1 "mcc_generated_files/CoAP/coap_blockwise.h" 1
# 39 "mcc_generated_files/CoAP/coap_blockwise.h"
void COAP_DiscoveryBlockTransmit(coapReceive_t *ptr);
_Bool COAP_ProcessBlock2Option(uint32_t destinationAddress, char *block2OptionValue,uint16_t length);
void COAP_ConfigDefaultBlockParams(void);
void COAP_BlockClientManage(void);
_Bool isBlockOptionRequired(void);




_Bool isResourceDataDirty(void);
# 51 "mcc_generated_files/CoAP/coap_transmit.c" 2







typedef enum
{
    INIT =0,
    RETRANSMISSION,
    MAX_RETRANSMISSION,
    LIFETIME,
    RESET
}coap_timerState_t;


typedef struct
{
    time_t init_time;
    time_t COAP_Timeout;
    time_t COAP_MaxRetransmit;
    time_t COAP_Lifetime;
    time_t ret_counter;
    time_t init_retcounter;
}coap_timers_t;


typedef struct
{
    coapHeader_t coapHeader;
    OptionTypeHandler_t *option;
    payload_t *payload;
    ObservePayload_t *observePayload;
    uint16_t messageID;
    uint8_t token[(8)];
    uint32_t destIP;
    coap_timers_t coapTime;
    coap_timerState_t coapTimerState;
    uint16_t destPort;
    uint16_t srcPort;
    observeNotify_t observeNotifiers;
    uint8_t retransmission;
    uint8_t ackReceived;
    uint8_t rstReceived;
    uint8_t isMaxAge;
}coap_t;


static coapHeader_t coapHeader,recvheader;
static coap_t coapRetransmitClients[(2)];
static coap_t txCoapClient;

coap_t *coapClientList = ((void*)0);
static uint8_t timerIdx = 1;

static int16_t COAP_AllocateClient();
static void COAP_FreeClient(coap_t *ptr);

static void CreateNewToken(coap_t *ptr);
static void CreateNewMID(coap_t *ptr);
static _Bool COAP_InitTimers(coap_t *ptr, time_t now);
static void COAP_TransmitInit(void);
static void COAP_TransmitMessageManage(void);

static error_msg COAP_SendMessage(coapTransmit_t *ptr, _Bool Retransmission);
static error_msg COAP_Request(coap_t *ptr);
static void COAP_Options(coap_t *ptr);
static void CoAP_Payload(coap_t *ptr);
static void CoAP_ObservePayload(coap_t *ptr);
char null[] ={0};
coapTransmit_t coapDiscPtr;

const OptionTypeHandler_t CoAPWellKnownOptions[] =
{
    {COAP_AddWellKnownURIPathOptions}
};

void COAP_Init(void)
{
    COAP_TransmitInit();
    COAP_ConfigDefaultBlockParams();
}

void COAP_Manage(void)
{
    COAP_TransmitMessageManage();
    COAP_BlockClientManage();
}

static void COAP_TransmitInit(void)
{
    uint8_t i =0;
    memset(&coapHeader,0,sizeof(coapHeader));
    memset(&txCoapClient,0,sizeof(txCoapClient));
    memset(coapRetransmitClients,0,sizeof(coapRetransmitClients));
    memset(&coapClientList,0,sizeof(coapClientList));
    for(i =0; i< (2); i++)
    {
        coapRetransmitClients[i].coapTimerState = RESET;
    }
}

static void CreateNewToken(coap_t *ptr)
{
    if(strncmp(ptr->token,null,sizeof(ptr->token))==0)
    {
        ptr->token[3] = lfsr();
        ptr->token[2] = lfsr();
        ptr->token[1] = lfsr();
        ptr->token[0] = lfsr();

    }
    ptr->coapHeader.tkl = strlen(ptr->token);
}

static void CreateNewMID(coap_t *ptr)
{
    if(ptr->messageID==0)
    {
        ptr->messageID = lfsr();
    }
}

static int16_t COAP_AllocateClient()
{
    uint8_t i=0;
    for(i=0; i< (2); i++)
    {
        if(coapRetransmitClients[i].coapTimerState == RESET)
        {
            coapRetransmitClients[i].coapTimerState = INIT;
            return i;
        }
    }
    return -1;

}

static void COAP_FreeClient(coap_t *ptr)
{
    memset(ptr,0,sizeof(coap_t));
    timerIdx = 1;
    ptr->coapTimerState = RESET;
    ptr->observeNotifiers.isObserveServerFlag = 0;
}

_Bool COAP_FreeEndpointMessageIDTokenPairIfMatched(uint32_t receviedIPAddress, uint16_t messageID, char *token, uint8_t tokenLength, coapTypes type)
{
    _Bool ret = 0;

    uint8_t i=0;
    for(i=0; i< (2); i++)
    {
        if(tokenLength > 0)
        {
            if(coapRetransmitClients[i].messageID == messageID && coapRetransmitClients[i].destIP == receviedIPAddress && (strncmp(coapRetransmitClients[i].token,token,(8)) == 0))
            {
                if(type == ACK_TYPE)
                {
                    coapRetransmitClients[i].ackReceived = 1;
                }
                else if(type == RST_TYPE)
                {
                    coapRetransmitClients[i].rstReceived = 1;
                }
                COAP_FreeClient(&coapRetransmitClients[i]);
                return 1;
            }
        }
        else
        {
            if(coapRetransmitClients[i].messageID == messageID && coapRetransmitClients[i].destIP == receviedIPAddress)
            {
                if(type == ACK_TYPE)
                {
                    coapRetransmitClients[i].ackReceived = 1;

                }
                else if(type == RST_TYPE)
                {
                    coapRetransmitClients[i].rstReceived = 1;
                }
                COAP_FreeClient(&coapRetransmitClients[i]);
                return 1;
            }
        }
    }
    return ret;
}

_Bool COAP_IsEndpointTokenPairMatched(uint32_t receviedIPAddress, char *token)
{
    _Bool ret = 0;

    return ret;
}

static _Bool COAP_InitTimers(coap_t *ptr,time_t now)
{
    _Bool ret = 0;

    switch(ptr->coapTimerState)
    {
        case INIT:
            ptr->coapTime.init_time = now;
            ptr->coapTime.COAP_Timeout = now + (2);
            ptr->coapTime.COAP_MaxRetransmit = now + (45);
            if(ptr->coapHeader.t == CON_TYPE)
            {
                ptr->coapTime.COAP_Lifetime = now + (247);
            }
            else
            {
                ptr->coapTime.COAP_Lifetime = now + (145);
            }
            ptr->coapTimerState = RETRANSMISSION;
            ret = 1;
            break;
        case RETRANSMISSION:
            if(now==ptr->coapTime.COAP_Lifetime)
            {
                ptr->coapTimerState = LIFETIME;
                ret = 0;
            }
            else if(now==ptr->coapTime.COAP_MaxRetransmit)
            {
                ptr->coapTimerState = MAX_RETRANSMISSION;
                ret = 0;
            }
            else if(now == ptr->coapTime.COAP_Timeout)
            {
                timerIdx = timerIdx * (2);
                ptr->coapTime.COAP_Timeout = ptr->coapTime.COAP_Timeout + (timerIdx * (2));
                ptr->coapTimerState = RETRANSMISSION;
                ret = 1;
            }
            break;
        case MAX_RETRANSMISSION:
            COAP_FreeClient(ptr);
            ret = 0;
            break;
        case LIFETIME:
            ptr->coapTimerState = RESET;
            ret = 0;
            break;
        case RESET:
            break;
        default:
            break;
    }
    return ret;
}

static void COAP_TransmitMessageManage(void)
{
    time_t now;
    uint8_t i=0;

    for(i =0; i< (2); i++)
    {
        if(coapRetransmitClients[i].coapTimerState != RESET)
        {
            time(&now);
            if(COAP_InitTimers(&coapRetransmitClients[i], now))
            {
                if((coapRetransmitClients[i].retransmission == 1) && (coapRetransmitClients[i].ackReceived == 0) && (coapRetransmitClients[i].rstReceived == 0))
                {
                    if(COAP_Request(&coapRetransmitClients[i])==(1))
                    {
                        COAP_Options(&coapRetransmitClients[i]);
                        if(coapRetransmitClients[i].observeNotifiers.isObserveServerFlag == 1)
                        {
                            CoAP_ObservePayload(&coapRetransmitClients[i]);
                        }
                        else
                        {
                            CoAP_Payload(&coapRetransmitClients[i]);
                        }
                        COAP_Send();
                    }
                }
            }
        }
    }
}


error_msg COAP_Transmit(coapTransmit_t *ptr,coapTypes Type, coapCodes Code, _Bool Retransmission)
{
    error_msg ret = (0);

    coapHeader.ver = 1;
    coapHeader.t = Type;
    coapHeader.code = Code;


    switch(Type)
    {
        case CON_TYPE:
            ret = COAP_SendMessage(ptr,Retransmission);
            break;
        case NON_TYPE:
             ret = COAP_SendMessage(ptr,0);
            break;
        case ACK_TYPE:
            break;
        default:
            break;
    }
    return ret;
}

static error_msg COAP_SendMessage(coapTransmit_t *ptr, _Bool Retransmission)
{
    error_msg ret = (0);
    time_t now;
    int16_t idx = -1;

    idx = COAP_AllocateClient();
    if(coapHeader.t == NON_TYPE && coapHeader.code == CONTENT && idx == -1
            || (ptr->destIP == (ip_database_info.ipv4_myAddress|0x00FFFFFF))
            || (ptr->destIP == (ip_database_info.ipv4_myAddress|0x0000FFFF))
            || (ptr->destIP == (ip_database_info.ipv4_myAddress|0X000000FF))
            || (ptr->destIP == 0xFFFFFFFF))
    {
        memset(&txCoapClient,0,sizeof(txCoapClient));
        coapHeader.t = NON_TYPE;
        memcpy(&txCoapClient.coapHeader,&coapHeader,sizeof(txCoapClient.coapHeader));
        txCoapClient.destIP = ptr->destIP;
        txCoapClient.option = ptr->clientOption;
        txCoapClient.observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
        txCoapClient.destPort = ptr->destPort;
        txCoapClient.srcPort = ptr->srcPort;
        txCoapClient.observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
        txCoapClient.observeNotifiers.observedVertexIndex = ptr->observeNotifiers.observedVertexIndex;
        txCoapClient.observeNotifiers.observedAcceptFormat = ptr->observeNotifiers.observedAcceptFormat;
        txCoapClient.retransmission = 0;
        txCoapClient.ackReceived = 0;
        strncpy(txCoapClient.token, ptr->clientToken, strlen(ptr->clientToken));
        CreateNewMID(&txCoapClient);
        CreateNewToken(&txCoapClient);
        strncpy(ptr->clientToken,txCoapClient.token, strlen(txCoapClient.token));
        ret = COAP_Request(&txCoapClient);
        if(ret==(1))
        {
            COAP_Options(&txCoapClient);
            if(txCoapClient.observeNotifiers.isObserveServerFlag == 1)
            {
                txCoapClient.observePayload = ptr->observePayload;
                CoAP_ObservePayload(&txCoapClient);
            }
            else
            {
                txCoapClient.payload = ptr->clientPayload;
                CoAP_Payload(&txCoapClient);
            }
        }
    }
    else
    {
        time(&now);
        if(idx != -1)
        {
            coapRetransmitClients[idx].coapHeader = coapHeader;
            coapRetransmitClients[idx].destIP = ptr->destIP;
            coapRetransmitClients[idx].option = ptr->clientOption;
            coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
            if(coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag == 1)
            {
                coapRetransmitClients[idx].observePayload = ptr->observePayload;
            }
            else
            {
                coapRetransmitClients[idx].payload = ptr->clientPayload;
            }
            coapRetransmitClients[idx].destPort = ptr->destPort;
            coapRetransmitClients[idx].srcPort = ptr->srcPort;
            coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
            coapRetransmitClients[idx].observeNotifiers.observedVertexIndex = ptr->observeNotifiers.observedVertexIndex;
            coapRetransmitClients[idx].observeNotifiers.observedAcceptFormat = ptr->observeNotifiers.observedAcceptFormat;
            coapRetransmitClients[idx].retransmission = Retransmission;
            coapRetransmitClients[idx].ackReceived = 0;
            strncpy(coapRetransmitClients[idx].token, ptr->clientToken, strlen(ptr->clientToken));
            CreateNewMID(&coapRetransmitClients[idx]);
            CreateNewToken(&coapRetransmitClients[idx]);
            strncpy(ptr->clientToken,coapRetransmitClients[idx].token, strlen(coapRetransmitClients[idx].token));
            if(COAP_InitTimers(&coapRetransmitClients[idx], now))
            {
                ret = COAP_Request(&coapRetransmitClients[idx]);
                if(ret==(1))
                {
                    COAP_Options(&coapRetransmitClients[idx]);
                    if(coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag == 1)
                    {
                        CoAP_ObservePayload(&coapRetransmitClients[idx]);
                    }
                    else
                    {
                        CoAP_Payload(&coapRetransmitClients[idx]);
                    }

                }
            }
        }
    }
    return ret;
}

static error_msg COAP_Request(coap_t *ptr)
{
    error_msg ret = (0);


    ret = UDP_Start(ptr->destIP, ptr->srcPort, ptr->destPort);

    if(ret == (1))
    {
        ETH_WriteBlock((char*)&ptr->coapHeader,sizeof(coapHeader));
        ETH_Write16(ptr->messageID);
        ETH_WriteBlock((char*)ptr->token,strlen((char*)ptr->token));
    }
    else
    {
        COAP_FreeClient(ptr);
    }

    return ret;
}

static void COAP_Options(coap_t *ptr)
{
    OptionTypeHandler_t *hptr;

    COAP_ResetLastOptionNumber();
    if(ptr->option != 0)
    {
        hptr = ptr->option;
        if(hptr->addOptions != ((void*)0))
        {
            hptr->addOptions();
        }
    }
}

static void CoAP_Payload(coap_t *ptr)
{
    payload_t *hptr;

   if(ptr->payload != 0)
   {
        hptr = ptr->payload;
        if(hptr->addPayload != ((void*)0))
        {
            COAP_EndofOptions();
            hptr->addPayload();
        }
   }

}

static void CoAP_ObservePayload(coap_t *ptr)
{
    ObservePayload_t *hptr;

   if(ptr->observePayload != 0)
   {
        hptr = ptr->observePayload;
        if(hptr->addObservePayload != ((void*)0))
        {
            hptr->addObservePayload(ptr->observeNotifiers.observedVertexIndex,ptr->observeNotifiers.observedAcceptFormat);
        }
   }

}

void COAP_EndofOptions()
{
    ETH_Write8(0xFF);
}

error_msg COAP_Send()
{
    error_msg ret = (0);
    ret = UDP_Send();

   return ret;
}


void COAP_Discover(coapTransmit_t *ptr)
{
    error_msg ret = (0);

    ptr->destPort = (5683);
    ptr->srcPort = (65520);
    ptr->clientOption = CoAPWellKnownOptions;
    ret = COAP_Transmit(ptr,CON_TYPE,GET,1);
    if(ret==(1))
    {
        COAP_Send();
    }
}


error_msg COAP_StartDiscover(void)
{
    error_msg ret = (0);

    if((ip_database_info.ipv4_myAddress)==0)
        return (0);

    memset(&coapDiscPtr,0,sizeof(coapDiscPtr));
    coapDiscPtr.destIP = ((uint32_t)(((uint32_t)255 << 24) | ((uint32_t)255<<16) | ((uint32_t)255 << 8) | (uint32_t)255));
    coapDiscPtr.destPort = (5683);
    coapDiscPtr.srcPort = (65520);
    coapDiscPtr.clientOption = CoAPWellKnownOptions;
    ret = COAP_Transmit(&coapDiscPtr,NON_TYPE,POST,0);
    if(ret==(1))
    {
        COAP_Send();
    }
    return ret;

}
