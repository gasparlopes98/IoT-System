# 1 "mcc_generated_files/TCPIPLibrary/dhcp_client.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/Mateo/.mchp_packs/Microchip/PIC18F-K_DFP/1.1.58/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2
# 42 "mcc_generated_files/TCPIPLibrary/dhcp_client.c"
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
# 42 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

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
# 43 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

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
# 44 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdbool.h" 1 3
# 45 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\limits.h" 1 3
# 10 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\limits.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/limits.h" 1 3
# 10 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\limits.h" 2 3
# 46 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/log.h" 1
# 42 "mcc_generated_files/TCPIPLibrary/log.h"
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
# 42 "mcc_generated_files/TCPIPLibrary/log.h" 2
# 58 "mcc_generated_files/TCPIPLibrary/log.h"
typedef enum { LOG_EMERGENCY =0,
                LOG_ALERTS =1,
                LOG_CRITICAL =2,
                LOG_ERROR =3,
                LOG_WARNING =4,
                LOG_NOTICE =5,
                LOG_INFO =6,
                LOG_DEBUG =7
} LOG_SEVERITY;




typedef enum {
 LOG_KERN,
 LOG_DTLS,
 LOG_ECC,
 LOG_DAEMON,
 LOG_AUTH,
 LOG_SYSLOG,
 LOG_LPR,
 LOG_NEWS,
 LOG_TFTP,
 LOG_UUID,
    LOG_COAP,
 LOG_FTP,
 LOG_NTP,
 LOG_HTTP,
 LOG_SNMP,
 LOG_RTCC,
    LOG_CBOR,
 LOG_UDP,
 LOG_TCP,
 LOG_DHCP,
 LOG_DNS,
 LOG_LLDP,
 LOG_LINK,

    LOG_LAST
} LOG_FACILITY;


typedef struct
{
    LOG_FACILITY logFacility;
    LOG_SEVERITY severityThreshold;
} logFields_t;


extern const char *LOG_Month[];


extern const logFields_t severityThresholdTable[];
# 119 "mcc_generated_files/TCPIPLibrary/log.h"
void LOG_Init(void);
# 141 "mcc_generated_files/TCPIPLibrary/log.h"
void logMessage(const char *message, LOG_FACILITY facility, LOG_SEVERITY severity, uint8_t logDest);
# 47 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/ethernet_driver.h" 1
# 44 "mcc_generated_files/TCPIPLibrary/ethernet_driver.h"
# 1 "mcc_generated_files/TCPIPLibrary/tcpip_types.h" 1
# 49 "mcc_generated_files/TCPIPLibrary/tcpip_types.h"
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
# 120 "mcc_generated_files/TCPIPLibrary/tcpip_types.h"
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
# 44 "mcc_generated_files/TCPIPLibrary/ethernet_driver.h" 2



# 1 "mcc_generated_files/TCPIPLibrary/mac_address.h" 1
# 48 "mcc_generated_files/TCPIPLibrary/mac_address.h"
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
# 47 "mcc_generated_files/TCPIPLibrary/ethernet_driver.h" 2



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
# 48 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2


# 1 "mcc_generated_files/TCPIPLibrary/network.h" 1
# 80 "mcc_generated_files/TCPIPLibrary/network.h"
void Network_Init(void);
# 92 "mcc_generated_files/TCPIPLibrary/network.h"
void Network_Read(void);
# 104 "mcc_generated_files/TCPIPLibrary/network.h"
void Network_Manage(void);
# 116 "mcc_generated_files/TCPIPLibrary/network.h"
void Network_WaitForLink(void);
uint16_t Network_GetStartPosition(void);

void timersInit(void);
# 50 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/udpv4.h" 1
# 59 "mcc_generated_files/TCPIPLibrary/udpv4.h"
extern uint16_t destPort;
extern udpHeader_t udpHeader;
extern ipv4Header_t ipv4Header;
# 82 "mcc_generated_files/TCPIPLibrary/udpv4.h"
error_msg UDP_Start(uint32_t destIP, uint16_t srcPort, uint16_t dstPort);
error_msg UDP_Send(void);
error_msg UDP_Receive(uint16_t udpcksm);
void udp_test(int len);
# 51 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/udpv4_port_handler_table.h" 1
# 46 "mcc_generated_files/TCPIPLibrary/udpv4_port_handler_table.h"
typedef struct
{
    uint16_t portNumber;
    ip_receive_function_ptr callBack;
} udp_handler_t;

typedef udp_handler_t * udp_table_iterator_t;

udp_table_iterator_t udp_table_getIterator(void);
udp_table_iterator_t udp_table_nextEntry(udp_table_iterator_t i);
# 52 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/ipv4.h" 1
# 66 "mcc_generated_files/TCPIPLibrary/ipv4.h"
void IPV4_Init(void);






error_msg IPV4_Packet(void);
# 90 "mcc_generated_files/TCPIPLibrary/ipv4.h"
error_msg IPv4_Start(uint32_t dstAddress, ipProtocolNumbers protocol);
# 101 "mcc_generated_files/TCPIPLibrary/ipv4.h"
uint16_t IPV4_PseudoHeaderChecksum(uint16_t payloadLen);
# 115 "mcc_generated_files/TCPIPLibrary/ipv4.h"
error_msg IPV4_Send(uint16_t payloadLength);






uint16_t IPV4_GetDatagramLength(void);
# 53 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/arpv4.h" 1
# 47 "mcc_generated_files/TCPIPLibrary/arpv4.h"
# 1 "mcc_generated_files/TCPIPLibrary/tcpip_config.h" 1
# 62 "mcc_generated_files/TCPIPLibrary/tcpip_config.h"
const char dhcpName[] = "PIC18F26K40CoAP_G10";
# 47 "mcc_generated_files/TCPIPLibrary/arpv4.h" 2
# 57 "mcc_generated_files/TCPIPLibrary/arpv4.h"
void ARPV4_Init(void);
# 69 "mcc_generated_files/TCPIPLibrary/arpv4.h"
error_msg ARPV4_Packet(void);





void ARPV4_Update(void);
# 86 "mcc_generated_files/TCPIPLibrary/arpv4.h"
mac48Address_t* ARPV4_Lookup(uint32_t ipAddress);
# 99 "mcc_generated_files/TCPIPLibrary/arpv4.h"
error_msg ARPV4_Request(uint32_t destAddress);
# 54 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/dhcp_client.h" 1
# 64 "mcc_generated_files/TCPIPLibrary/dhcp_client.h"
void DHCP_init(void);
# 75 "mcc_generated_files/TCPIPLibrary/dhcp_client.h"
void DHCP_Handler(int16_t);
# 86 "mcc_generated_files/TCPIPLibrary/dhcp_client.h"
void DHCP_Manage(void);
# 98 "mcc_generated_files/TCPIPLibrary/dhcp_client.h"
void DHCP_WriteZeros(uint16_t length);
# 55 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/ip_database.h" 1
# 40 "mcc_generated_files/TCPIPLibrary/ip_database.h"
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
# 72 "mcc_generated_files/TCPIPLibrary/ip_database.h"
void ipdb_init(void);
uint32_t makeStrToIpv4Address(char *str);
char *makeIpv4AddresstoStr(uint32_t addr);
# 56 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2

# 1 "mcc_generated_files/TCPIPLibrary/lfsr.h" 1
# 44 "mcc_generated_files/TCPIPLibrary/lfsr.h"
typedef uint8_t lfsr_t;
int lfsr_getSequenceCount(void);
lfsr_t lfsr_getSequence(void);
void lfsr_reset(void);
void lfsr_setSequence(uint16_t s);
lfsr_t lfsr(void);
lfsr_t lfsrWithSeed(uint8_t lfsrSeed);
# 57 "mcc_generated_files/TCPIPLibrary/dhcp_client.c" 2
# 74 "mcc_generated_files/TCPIPLibrary/dhcp_client.c"
 static mac48Address_t ethMAC;




typedef enum
{
    DHCP_DISCOVER = 1,
    DHCP_OFFER, DHCP_REQUEST, DHCP_DECLINE, DHCP_ACK, DHCP_NACK, DHCP_RELEASE,
    DHCP_INFORM, DHCP_FORCERENEW, DHCP_LEASEQUERY, DHCP_LEASEUNASSIGNED, DHCP_LEASEUNKNOWN,
    DHCP_LEASEACTIVE, DHCP_BULKLEASEQUERY, DHCP_LEASEQUERYDONE
}dhcp_type;

typedef enum
{
    SELECTING, REQUESTING, RENEWLEASE, BOUND
}dhcp_rx_client_state;
typedef enum
{
    INIT_TIMER, WAITFORTIMER, STARTDISCOVER, STARTREQUEST
}dhcp_timer_client_state;


typedef struct
{

    uint32_t dhcpIPAddress;
    uint32_t subnetMask;
    uint32_t routerAddress;
    uint32_t dnsAddress[2];
    uint32_t ntpAddress[2];
    uint32_t gatewayAddress;
    uint32_t xidValue;
    uint32_t t1;
    uint32_t t2;
    uint32_t dhcpServerIdentifier;
} dhcp_data_t;

typedef struct
{

    dhcp_rx_client_state rxClientState;
    dhcp_timer_client_state tmrClientState;
} dhcp_state_t;

dhcp_data_t dhcpData = {0,0,0,0,0,0,0,0,0,10,3600,0};
dhcp_state_t dhcpState = {SELECTING,INIT_TIMER};

_Bool sendRequest(dhcp_type type);

_Bool sendDHCPDISCOVER(void)
{
    dhcpData.dhcpIPAddress = (ip_database_info.ipv4_myAddress);
    dhcpData.xidValue = lfsrWithSeed(ethMAC.mac_array[2]);
    dhcpData.xidValue <<= 8;
    dhcpData.xidValue |= lfsrWithSeed(ethMAC.mac_array[3]);
    dhcpData.xidValue <<= 8;
    dhcpData.xidValue |= lfsrWithSeed(ethMAC.mac_array[4]);
    dhcpData.xidValue <<= 8;
    dhcpData.xidValue |= lfsrWithSeed(ethMAC.mac_array[5]);
    return sendRequest(DHCP_DISCOVER);
}

_Bool sendDHCPREQUEST(void)
{
                                                                        ;
    return sendRequest(DHCP_REQUEST);
}

_Bool sendDHCPDECLINE(void)
{
    return sendRequest(DHCP_DECLINE);
}

_Bool sendRequest(dhcp_type type)
{

    error_msg started;


    started = UDP_Start(0xFFFFFFFF,68,67);
    if(started==SUCCESS)
    {
        ETH_Write32(0x01010600);
        ETH_Write32(dhcpData.xidValue);
        ETH_Write32(0x00008000);
        if(type == DHCP_REQUEST)
        {
            ETH_Write32(0);
        }
        else
        {
            ETH_Write32(dhcpData.dhcpIPAddress);
        }
        ETH_Write32(0);
        ETH_Write32(0);
        ETH_Write32(0);
        ETH_WriteBlock((char *)&hostMacAddress,6);
        DHCP_WriteZeros(202);
        ETH_Write32(0x63825363);


        ETH_Write8(12); ETH_Write8(strlen(dhcpName)); ETH_WriteString(dhcpName);

        ETH_Write8(42); ETH_Write8(4); ETH_Write32(0);

        ETH_Write8(53); ETH_Write8(1); ETH_Write8(type);
        if(type == DHCP_REQUEST)
        {

            ETH_Write8(50);ETH_Write8(4);ETH_Write32(dhcpData.dhcpIPAddress);

            ETH_Write8(54);ETH_Write8(4);ETH_Write32(dhcpData.dhcpServerIdentifier);
        }

        ETH_Write8(55); ETH_Write8(4); ETH_Write8(1); ETH_Write8(3); ETH_Write8(6); ETH_Write8(15);

        ETH_Write8(57); ETH_Write8(2); ETH_Write16(512);

        ETH_Write8(61); ETH_Write8(7); ETH_Write8(1); ETH_WriteBlock((char *)&hostMacAddress,6);
        ETH_Write8(255);




        UDP_Send();
        return 1;
    }
    return 0;
}

void DHCP_init(void)
{
    ETH_GetMAC((uint8_t *) &ethMAC);
}

void DHCP_Manage(void)
{
    static time_t managementTimer = 0;
    time_t now;
    now = time(0);

    if(managementTimer <= now)
    {
        switch(dhcpState.tmrClientState)
        {
            case INIT_TIMER:
                dhcpData.t1 = 4;
                dhcpData.t2 = 2;
                dhcpState.tmrClientState = WAITFORTIMER;
                break;
            case WAITFORTIMER:
                if(!ETH_CheckLinkUp())
                {
                    dhcpData.t1 = 2;
                    dhcpData.t2 = 4;
                }
                if(dhcpData.t1 == 2)
                {
                    do{ ip_database_info.ipv4_myAddress = 0; } while(0);
                    dhcpState.tmrClientState = STARTREQUEST;
                }
                else dhcpData.t1 --;
                if(dhcpData.t2 == 2)
                {
                    dhcpState.tmrClientState = STARTDISCOVER;
                }
                else dhcpData.t2 --;
                break;
            case STARTDISCOVER:
                if(sendDHCPDISCOVER())
                {
                    dhcpData.t2 = 10;
                    dhcpData.t1 = 0x7fffffffL;
                    dhcpState.rxClientState = SELECTING;
                    dhcpState.tmrClientState = WAITFORTIMER;
                }
                break;
            case STARTREQUEST:
                if(ETH_CheckLinkUp())
                {
                    if(sendDHCPREQUEST())
                    {
                            dhcpData.t1 = 15;
                        if(dhcpState.rxClientState == BOUND )dhcpState.rxClientState = RENEWLEASE;
                        else dhcpState.rxClientState = REQUESTING;
                        dhcpState.tmrClientState = WAITFORTIMER;
                    }
                }
                break;
            default:
                                                                                                ;
                dhcpState.tmrClientState = INIT_TIMER;
                break;
        }
    }
    managementTimer = now + 1;
}

void DHCP_Handler(int16_t length)
{

    uint8_t chaddr[16];
    uint8_t messageType=0;

    _Bool acceptOffers;
    _Bool declineOffers;
    _Bool acceptNACK;
    _Bool acceptACK;

    uint32_t siaddr;


                                                                          ;

    switch(dhcpState.rxClientState)
    {
        default:
        case SELECTING:
                                                                                    ;
            acceptOffers = 1;
            declineOffers = 0;
            acceptNACK = 0;
            acceptACK = 0;
            break;
        case REQUESTING:
                                                                                     ;
            acceptOffers = 0;
            declineOffers = 1;
            acceptNACK = 1;
            acceptACK = 1;
            break;
        case RENEWLEASE:
                                                                                      ;
            acceptOffers = 0;
            acceptNACK = 1;
            acceptACK = 1;
            break;
        case BOUND:
                                                                                ;
            acceptOffers = 0;
            acceptNACK = 0;
            acceptACK = 0;
            break;
    }

    if(acceptOffers || declineOffers || acceptNACK || acceptACK)
    {
        dhcp_data_t localData = {0,0,0,0,0,0,0,0,0,3600,3600,0};
        localData.xidValue = dhcpData.xidValue;

        if(length > 240)
        {
                                                                                     ;
            if(0x0201 == ETH_Read16())
            {
                if(0x06 == ETH_Read8())
                {
                    ETH_Read8();
                    if(dhcpData.xidValue == ETH_Read32())
                    {
                        ETH_Read16();
                        ETH_Read16();
                        ETH_Read32();
                        localData.dhcpIPAddress = ETH_Read32();
                            if((localData.dhcpIPAddress != 0xFFFFFFFF) && (localData.dhcpIPAddress != 0x7F000001))
                            {
                                siaddr = ETH_Read32();
                                if((siaddr != 0xFFFFFFFF) && (siaddr != 0x7F000001))
                                {
                        ETH_Read32();
                        ETH_ReadBlock(chaddr,sizeof(chaddr));
                        if(memcmp(chaddr, &hostMacAddress.s, 6)== 0 || memcmp(chaddr, &broadcastMAC.s, 6)== 0 || (strlen((char *)chaddr)== 0))
                        {
                            ETH_Dump(64);
                            ETH_Dump(128);
                            if(ETH_Read32() == 0x63825363)
                            {
                                length -= 240;
                                while(length>0)
                                {

                                    uint8_t option, optionLength;
                                    option = ETH_Read8();
                                    optionLength = ETH_Read8();
                                    length -= 2 + optionLength;
                                    switch(option)
                                    {
                                        case 1:
                                                                                                                   ;
                                            localData.subnetMask = ETH_Read32();
                                            break;
                                        case 3:
                                                                                                                   ;
                                            localData.routerAddress = ETH_Read32();
                                            break;
                                        case 6:
                                            {
                                                uint8_t count=0;
                                                                                                                   ;
                                                while(optionLength >= 4)
                                                {
                                                    uint32_t a = ETH_Read32();
                                                    if(count < 2)
                                                        localData.dnsAddress[count++] = a;

                                                    optionLength -= 4;
                                                }
                                            }
                                            break;
                                        case 42:
                                            {
                                                uint8_t count=0;
                                                                                                                        ;
                                                while(optionLength >= 4)
                                                {
                                                    uint32_t a = ETH_Read32();
                                                    if(count < 2)
                                                        localData.ntpAddress[count++] = a;

                                                    optionLength -= 4;
                                                }
                                            }
                                            break;
                                        case 51:
                                                                                                                    ;
                                            if(optionLength >= 4)
                                            {
                                                uint32_t origLeaseTime;

                                                origLeaseTime = ETH_Read32();

                                                localData.t1 = origLeaseTime >> 1;
                                                localData.t2 = localData.t1;
                                                origLeaseTime = localData.t1 >> 1;
                                                localData.t2 += origLeaseTime;
                                                localData.t2 += origLeaseTime >> 1;

                                                optionLength -= 4;
                                            }
                                            break;
                                        case 54:
                                                                                                                    ;
                                            localData.dhcpServerIdentifier = ETH_Read32();

                                            optionLength -= 4;
                                            break;
                                        case 53:
                                                                                                                    ;
                                            messageType=ETH_Read8();
                                            optionLength -=1;
                                            break;
                                        default:
                                            ETH_Dump(optionLength);
                                            break;
                                    }
                                }
                            }
                            else
                            {
                                                                                                                         ;
                            }
                        }
                        else
                        {
                                                                                                                    ;
                            return;
                        }
                                }
                                else
                                {
                                                                                                     ;
                                }
                            }
                            else
                            {
                                                                                                 ;
                            }
                    }
                    else
                    {
                                                                                                        ;
                    }
                }
                else
                {
                                                                                        ;
                }
            }
            else
            {
                                                                                            ;
            }
        }
        else
        {
                                                                                                     ;
        }
        switch(messageType)
        {
            case DHCP_OFFER:
                if(acceptOffers)
                {
                    dhcpData = localData;
                    sendDHCPREQUEST();
                    dhcpState.rxClientState = REQUESTING;
                }
                if(declineOffers)
                {
                    sendDHCPDECLINE();
                }
                break;
            case DHCP_ACK:
                if(acceptACK)
                {
                    dhcpData.t1 = localData.t1;
                    dhcpData.t2 = localData.t2;
                    do{ ip_database_info.ipv4_myAddress = dhcpData.dhcpIPAddress; } while(0);
                    do{ if(0 < 2) ip_database_info.ipv4_dns[0] = dhcpData.dnsAddress[0]; } while(0);
                    do{ if(1 < 2) ip_database_info.ipv4_dns[1] = dhcpData.dnsAddress[1]; } while(0);
                    do{ ip_database_info.ipv4_router = dhcpData.routerAddress; } while(0);
                    do{ ip_database_info.ipv4_gateway = dhcpData.gatewayAddress; } while(0);
                    do{ ip_database_info.ipv4_subnetMask = dhcpData.subnetMask; } while(0);
                    if(dhcpData.ntpAddress[0])
                    {
                        do{ if(0 < 2) ip_database_info.ipv4_ntpAddress[0] = dhcpData.ntpAddress[0]; } while(0);
                        if(dhcpData.ntpAddress[1])
                            do{ if(1 < 2) ip_database_info.ipv4_ntpAddress[1] = dhcpData.ntpAddress[1]; } while(0);
                    }
                    dhcpState.rxClientState = BOUND;
                }
                break;
            case DHCP_NACK:
                if(acceptNACK)
                {
                    dhcpData.t1 = 4;
                    dhcpData.t2 = 2;
                    dhcpState.rxClientState = SELECTING;
                }
                break;
            default:
                break;
        }
    }
    else
    {
                                                                                               ;
    }
}

void DHCP_WriteZeros(uint16_t length)
{
    while(length--)
    {
        ETH_Write8(0);
    }
}
