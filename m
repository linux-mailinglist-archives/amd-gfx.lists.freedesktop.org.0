Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62012E978A
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Jan 2021 15:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B78689F8E;
	Mon,  4 Jan 2021 14:46:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81CE89F8E
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Jan 2021 14:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGaenmN3Kw5pd5VQr3tIakzNIfT0vN96HCLhORMQ7v3CTVB/SxhoreYIufs77l/PzXzDCuZucbn0k1g9WxOPrtkkYrvCsoBDB+Vz1w2urJaPb6IRxVd+KudND/QGN2HgPnKP+GmDEqf1YU/0vbWcaX0EmvuBrWhxg9GAUovueHO4RZZAkpnrGfox3Vr+9dx5wQBNALg+hYxpmg0JkkcViA5Dmdq8NubnByR4RAc9d8MMhRLyNDgd2Xco32GiEbfIUlB9g+VtO98tu0oI8IDyYVbaKRMsF2EUZh5ndGhzswKoJM3dXi9MhrNCaqxG//3dj30esPxho08GePpnehYoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUEMORCtZyLOtNEiSJ8B4fS7YXW0Dg4uCvF480jZeSQ=;
 b=PCPQgDAzKcWItVUpe5xMbMZKKU/b1LLYhInsBysU0C5tIOUARsKkxSviB0VsXQVJSxDkpLbqlIfAcWIznPme+2cvSq1pLmfyArugf/H1ElHpYdn63XHLJdoQOmc5daK9v697TlnMzAQYDE6QnCjXkofPHsjcCMlf78UOGpQ73cDkRgEWVA3MhorkIG2OpBK4gF+2jiAPsWFcZtx98nsPq5fmD5v0LqIqxX4w3Okwc+OuNlYkkyQkFG08IKvlmtmNKt5b6lBbdxUXYXzxOXSRYsJwgzgcukeLpq7UJ3z7O2z+5iEO0c8TkSgUoXEFnJbm8Gdj1p8AM8SFy0CG3nmNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUEMORCtZyLOtNEiSJ8B4fS7YXW0Dg4uCvF480jZeSQ=;
 b=MMX8CkEEFfCVZ7Yv04dvb2dyIugTnQuyQ4W55zsPZ6UTvdGKiheDzcwowKrgweQK0CAWDyLVGQmpPxcQBxWGsc3YoMYkdFBgRFcnLRDMur9KcSrj6Z/GEUks3RjRZb9rVczS/D0dDrtiHsu4wn+Vy+w/9z7xYm8OVIUnoznZ3h4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0206.namprd12.prod.outlook.com (2603:10b6:301:55::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Mon, 4 Jan
 2021 14:46:15 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::95e:3860:8b43:1a35]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::95e:3860:8b43:1a35%5]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 14:46:15 +0000
Subject: Re: Bug: RX 580 screen goes dark after switching monitor to different
 input and back
To: Davin McCall <davmac@davmac.org>, Leo Li <sunpeng.li@amd.com>,
 "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
References: <7d0b5fbb-a89a-d936-c8ac-2d3131f7b0b5@davmac.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <8199bf1f-f9d7-91c1-6c9c-90272a896286@amd.com>
Date: Mon, 4 Jan 2021 09:46:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <7d0b5fbb-a89a-d936-c8ac-2d3131f7b0b5@davmac.org>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Mon, 4 Jan 2021 14:46:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36975923-4c7f-4266-07ac-08d8b0bf7d2e
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0206B609162B0B4CF7790F648CD20@MWHPR1201MB0206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koCFl4/ND7P+LI8TN6Iprg4duih0eZgigYQESpO9XF4bvg2owbMT+5SbMkQr3JGezM46KYBtSvOFl5+eICZl2ulUi559F+6xNigUN7TPy+frTowtDToIOjFbb2hVtGAg7nMhi59w/SrYb4f9jC/AUPddJyUIYRDCyV0sv8ikOfpKqljGrlT63U7mrvlT5Pg0CduvtPILwB3B7386Pho9iH+cV0tHp2SM/nKNxm82iS1ThubQByvufakz17ebTE+sphA5zEvFZxtckX4dqSxiD1y642/uqUFJ861fEQ2WXIxzds5O5aacpX463HUX0p2ZyBRogB1/ANupGY0ffuWD/7ARX2z5ldMnW3BKkX1+YDCivZihogecKeBU5yBA1J4wVgdd0454p5T04doE6qyzs+bQXUXd6lyPzZ6XA9kok7H+86m19YDhxf9EbgO/PtBlEfWNllmp7zt73OLqxI2lQK1x8zQsqgwNsO4ZkPrCTYnuzvSmzCa+QCTYfQQFGMGOL0bsoWL0oWEZeU4VUz0EGmzITZlCggONY+11tKygJ1YUCrUX0keSBJgf4D5xD2DkBpBh00OxqhOTDpG9YcV+Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(478600001)(8936002)(966005)(19627235002)(33964004)(186003)(110136005)(66946007)(53546011)(66476007)(6486002)(66556008)(8676002)(6636002)(26005)(83380400001)(31686004)(52116002)(956004)(30864003)(2616005)(166002)(316002)(86362001)(16576012)(5660300002)(44832011)(16526019)(2906002)(36756003)(4326008)(31696002)(43740500002)(45980500001)(579004)(559001)(473944003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RDNYbS9xeFFlL1B2UVdzSHNNRXRLWTZOYkFBaTJrR0FiSElCUDVTYm8vcWFI?=
 =?utf-8?B?TUpTWVFqbmZPeTB3RGNUTFhIcjNTc2ZIU0tDUHA5T21MVDFnZ2phK1NERjk5?=
 =?utf-8?B?UmN4bDBRbDkwa2ViODZLK0k1bmVhV3ljaFNnRlJ0SHFER1d1eWwybllhTGhj?=
 =?utf-8?B?NGxxZlJYMkY2R2FkdHlDR1dYTVVPNkMyMnFsQWFPb3ZGUXNZZ1Z6YU43aEpB?=
 =?utf-8?B?dGxWRTBKUkM1a3VpdFV6Z2RqVzE5cFRMQ0h0Q3FBY3NGeGtTd2MzcmZNemgx?=
 =?utf-8?B?VWVVaDl4L3U3cHFaQjgrTFJxNC9MMVUxb3N2cWViMSthbGxRT3lHbHo1Yy9J?=
 =?utf-8?B?REpFYlVMM1RXaWt2eGRMcU1aZWI1enowVmdLYnFwVHRqTlZ3THVWbTlFd3NR?=
 =?utf-8?B?YlJDaUtCSVpVMmRNV2xscjhzc21GbWVwRkNkeDZWa3FqZ0VWUkNqVno2ak96?=
 =?utf-8?B?d1cwcTlydVdNaCtOVnMrL3JMZHdyUlNhSDJMZVdRM0sxOHY0a0dKL1Q4eWxv?=
 =?utf-8?B?VzFkc0xqTlJqYUk0Rk5HdFA0YWZreDROMU51WHpnbUc0RHhCZExHWDduUVhk?=
 =?utf-8?B?Qm8vcWtsdXNVZjY5Tk54SHVtdy9zOXJtL1RtcEZhQ0JFRnFrbUoyWXVLakFZ?=
 =?utf-8?B?aWxoeGozLzF4RmxLdVEwRS9pSXdCdUwzM1VTSWNKbDVqSnhnQzNSeitXQTFs?=
 =?utf-8?B?TWJFUk0vNnVtWk1CQXhXU2FrZ3RlcjlBWXovckpUYzk0dXVlOWpJS3Bkc245?=
 =?utf-8?B?eEd5d1BaSkVwK0VaTWppaEZaUEZXeEpIZkViMEQ1bmRRUTRqc0VzSmtYU0RE?=
 =?utf-8?B?dVpxZHMrTXFlYlo1M1VGSmZzWUQvcW1sU0pnTFp3RTdFWXU2aWVvVVVaY0Nt?=
 =?utf-8?B?bGtlSklYWU8wd2pjUEVMYlQyUy9TMGVVaWJSbHAwVVE3cWh1eXpiZjlIQWlN?=
 =?utf-8?B?TG9wRGVRa3c3cUNKaVlJWW1mTU03Ymo2ZVp1WHU3SkhLSjY3UDdRYklpMDQz?=
 =?utf-8?B?ZmZZcktzWUFQWHhqZXVGYmduWER5dEdML1RjSURoWHlNLzlvYm1sVVRnNExh?=
 =?utf-8?B?MDhQS3dxSDIrV1ZDcWVCT2xNR1lCS0FaMHVuUGNkYVY4bE8xZ2RPbytCWThH?=
 =?utf-8?B?akZEWnNLNDNKcG1jQ0JBZ3UwSjlVUTc2NVlpY2lNWVJnbmtBR2duVWMxaTNW?=
 =?utf-8?B?cUhwZ3lLaE45Ri9BejVKelRwSG5NUVdkK3dXWFhJcUx0N1JaRU4wUHo4V2I4?=
 =?utf-8?B?b3k5aHZGbmUyVUxYTzJrYnJuNFNQQk54WFpNVXpIaXA5Y1B4SS9JY1RyWmdL?=
 =?utf-8?Q?FcNJFplgjWNmwSE2lS0fhhjBRnpChpAZsC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 14:46:15.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 36975923-4c7f-4266-07ac-08d8b0bf7d2e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hgjdi9cvwPA0KPegS2nLukJZngxVpVEqmEj3rpQK5/Aq6Hk++exoCgAUT5eZ4kxOl2qsZNIBpVolRUZy9hThcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0206
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1162300626=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1162300626==
Content-Type: multipart/alternative;
 boundary="------------BFAC371A5B27B4925B5C2198"
Content-Language: en-US

--------------BFAC371A5B27B4925B5C2198
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Davin,

thanks for your report. Please open a ticket at 
https://gitlab.freedesktop.org/drm/amd/-/issues

I added Stylon in case he has some ideas why his patch regressed this.

Thanks,
Harry

On 2021-01-04 12:06 a.m., Davin McCall wrote:
>
> Hi, I would like to report the following issue which begain with 
> kernel 5.4.86.
>
> Please let me know if I should also file a bug in bugzilla.
>
> Note that I have narrowed it down to the change which causes the issue 
> (e1b1f10c3404c8d40c45c3a6846d304fd403fa2c in linux-5.4 series, 
> upstream a135a1b4c4db1f3b8cbed9676a40ede39feb3362).
>
> I am happy to try patches and help debug in any way I can.
>
> Regards,
>
> Davin McCall
>
>
> [1.] One line summary of the problem:
>
> RX 580 screen goes dark after switching monitor to different input and 
> back
>
> [2.] Full description of the problem/report:
>
> I have an RX 580 graphics adapter connected via displayport to my 
> monitor. When I switch the monitor to a different input and then back, 
> the display remains dark. The following appears in the dmesg output:
>
> Jan  4 10:28:04 localhost vmunix: [drm:dce112_get_pix_clk_dividers 
> [amdgpu]] *ERROR* dce112_get_pix_clk_dividers: Invalid parameters!!
> Jan  4 10:28:04 localhost vmunix: [drm:dm_restore_drm_connector_state 
> [amdgpu]] *ERROR* Restoring old state failed with -22
>
> This happens with kernel 5.4.86 but not 5.4.85 and can be reproduced 
> reliably.
>
> I have narrowed it down to the following change:
>
>     commit e1b1f10c3404c8d40c45c3a6846d304fd403fa2c
>     Author: Stylon Wang<stylon.wang@amd.com>
>     Date:   Tue Nov 10 15:40:06 2020 +0800
>
>          drm/amd/display: Fix memory leaks in S3 resume
>          
>          commit a135a1b4c4db1f3b8cbed9676a40ede39feb3362 upstream.
>          
>          EDID parsing in S3 resume pushes new display modes
>          to probed_modes list but doesn't consolidate to actual
>          mode list. This creates a race condition when
>          amdgpu_dm_connector_ddc_get_modes() re-initializes the
>          list head without walking the list and results in  memory leak.
>          
>          Bug:https://bugzilla.kernel.org/show_bug.cgi?id=209987
>          Acked-by: Harry Wentland<harry.wentland@amd.com>
>          Acked-by: Alex Deucher<alexander.deucher@amd.com>
>          Reviewed-by: Nicholas Kazlauskas<nicholas.kazlauskas@amd.com>
>          Signed-off-by: Stylon Wang<stylon.wang@amd.com>
>          Signed-off-by: Alex Deucher<alexander.deucher@amd.com>
>          Cc:stable@vger.kernel.org
>          Signed-off-by: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
>
>
> [3.] Keywords (i.e., modules, networking, kernel):
>
> amdgpu
>
> [4.] Kernel information
>
> kernel compiled from source with custom configuration
>
> [4.1.] Kernel version (from /proc/version):
>
> Linux version 5.4.86 (root@dragon) (gcc version 9.3.0 (GCC)) #1 SMP 
> PREEMPT Mon Jan 4 13:06:47 AEST 2021
>
> [4.2.] Kernel .config file:
>
> ... Is 4k lines long. I'm going to assume it's not really wanted here? 
> Can supply on request.
>
> [5.] Most recent kernel version which did not have the bug:
>
> 5.4.85
>
> [6.] Output of Oops.. message (if applicable) with symbolic information
>      resolved (see Documentation/admin-guide/oops-tracing.rst)
>
> N/A
>
> [7.] A small shell script or example program which triggers the
>      problem (if possible)
>
> N/A
>
> [8.] Environment
> [8.1.] Software (add the output of the ver_linux script here)
>
> Linux dragon 5.4.86 #1 SMP PREEMPT Mon Jan 4 13:06:47 AEST 2021 x86_64 
> GNU/Linux
>
> GNU C                   9.3.0
> GNU Make                4.2.1
> Binutils                2.35.1
> Util-linux              2.36.1
> Mount                   2.36.1
> Module-init-tools       21
> E2fsprogs               1.44.4
> PPP                     2.4.4
> Linux C Library         2.32
> Dynamic linker (ldd)    2.32
> Linux C++ Library       9.3.0
> Procps                  3.2.7
> Net-tools               1.9.4
> Kbd                     2.0.4
> Console-tools           2.0.4
> Sh-utils                8.32
> Udev                    228
> Wireless-tools          29
> Modules Loaded          aesni_intel amdgpu backlight cfbcopyarea 
> cfbfillrect cfbimgblt cfg80211 cryptd crypto_simd drm drm_kms_helper 
> drm_panel_orientation_quirks fb fbdev fb_sys_fops font glue_helper 
> gpu_sched i2c_algo_bit i2c_core snd_hda_codec snd_hda_codec_generic 
> snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_core snd_hda_intel 
> snd_intel_nhlt syscopyarea sysfillrect sysimgblt ttm video
>
> [8.2.] Processor information (from /proc/cpuinfo):
>
> processor    : 0
> vendor_id    : GenuineIntel
> cpu family    : 6
> model        : 60
> model name    : Intel(R) Core(TM) i7-4790K CPU @ 4.00GHz
> stepping    : 3
> microcode    : 0x24
> cpu MHz        : 4389.681
> cache size    : 8192 KB
> physical id    : 0
> siblings    : 8
> core id        : 0
> cpu cores    : 4
> apicid        : 0
> initial apicid    : 0
> fpu        : yes
> fpu_exception    : yes
> cpuid level    : 13
> wp        : yes
> flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
> mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe 
> syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts 
> rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq 
> dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
> sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm 
> abm cpuid_fault invpcid_single tpr_shadow vnmi flexpriority ept vpid 
> ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt 
> dtherm ida arat pln pts
> bugs        : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass 
> l1tf mds swapgs itlb_multihit srbds
> bogomips    : 7981.84
> clflush size    : 64
> cache_alignment    : 64
> address sizes    : 39 bits physical, 48 bits virtual
> power management:
>
> above x 8 (processor 1, 2, 3, 4, 5, 6, 7).
>
> [8.3.] Module information (from /proc/modules):
>
> cfg80211 290816 0 - Live 0x0000000000000000
> amdgpu 3063808 7 - Live 0x0000000000000000
> gpu_sched 20480 1 amdgpu, Live 0x0000000000000000
> i2c_algo_bit 16384 1 amdgpu, Live 0x0000000000000000
> drm_kms_helper 135168 1 amdgpu, Live 0x0000000000000000
> cfbfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000
> syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
> cfbimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
> sysfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000
> sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
> snd_hda_codec_realtek 98304 1 - Live 0x0000000000000000
> fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
> cfbcopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
> snd_hda_codec_generic 61440 1 snd_hda_codec_realtek, Live 
> 0x0000000000000000
> fb 77824 73 amdgpu,drm_kms_helper, Live 0x0000000000000000
> font 20480 1 fb, Live 0x0000000000000000
> fbdev 16384 1 fb, Live 0x0000000000000000
> snd_hda_codec_hdmi 49152 1 - Live 0x0000000000000000
> ttm 73728 1 amdgpu, Live 0x0000000000000000
> drm 323584 9 amdgpu,gpu_sched,drm_kms_helper,ttm, Live 0x0000000000000000
> drm_panel_orientation_quirks 20480 1 drm, Live 0x0000000000000000
> i2c_core 40960 4 amdgpu,i2c_algo_bit,drm_kms_helper,drm, Live 
> 0x0000000000000000
> snd_hda_intel 28672 5 - Live 0x0000000000000000
> aesni_intel 364544 0 - Live 0x0000000000000000
> snd_intel_nhlt 16384 1 snd_hda_intel, Live 0x0000000000000000
> video 40960 0 - Live 0x0000000000000000
> glue_helper 16384 1 aesni_intel, Live 0x0000000000000000
> snd_hda_codec 86016 4 
> snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel, 
> Live 0x0000000000000000
> crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
> snd_hda_core 53248 5 
> snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec, 
> Live 0x0000000000000000
> cryptd 16384 1 crypto_simd, Live 0x0000000000000000
> backlight 16384 2 amdgpu,video, Live 0x0000000000000000
>
> [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
>
> /proc/ioports:
>
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : dma1
>   0000-0000 : pic1
>   0000-0000 : timer0
>   0000-0000 : timer1
>   0000-0000 : keyboard
>   0000-0000 : keyboard
>   0000-0000 : rtc0
>   0000-0000 : dma page reg
>   0000-0000 : pic2
>   0000-0000 : dma2
>   0000-0000 : fpu
>     0000-0000 : PNP0C04:00
>   0000-0000 : vga+
>   0000-0000 : serial
>   0000-0000 : pnp 00:06
>   0000-0000 : pnp 00:01
>   0000-0000 : pnp 00:04
>   0000-0000 : pnp 00:04
>   0000-0000 : pnp 00:04
>     0000-0000 : it87
>       0000-0000 : it87
> 0000-0000 : PCI conf1
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : ACPI PM1a_EVT_BLK
>   0000-0000 : ACPI PM1a_CNT_BLK
>   0000-0000 : ACPI PM_TMR
>   0000-0000 : ACPI GPE0_BLK
>   0000-0000 : ACPI PM2_CNT_BLK
>   0000-0000 : pnp 00:03
>   0000-0000 : PCI Bus 0000:06
>     0000-0000 : 0000:06:00.0
>       0000-0000 : ahci
>     0000-0000 : 0000:06:00.0
>       0000-0000 : ahci
>     0000-0000 : 0000:06:00.0
>       0000-0000 : ahci
>     0000-0000 : 0000:06:00.0
>       0000-0000 : ahci
>     0000-0000 : 0000:06:00.0
>       0000-0000 : ahci
>   0000-0000 : PCI Bus 0000:03
>     0000-0000 : 0000:03:00.0
>   0000-0000 : PCI Bus 0000:01
>     0000-0000 : 0000:01:00.0
>   0000-0000 : 0000:00:1f.3
>   0000-0000 : 0000:00:1f.2
>     0000-0000 : ahci
>   0000-0000 : 0000:00:19.0
>   0000-0000 : 0000:00:1f.2
>     0000-0000 : ahci
>   0000-0000 : 0000:00:1f.2
>     0000-0000 : ahci
>   0000-0000 : 0000:00:1f.2
>     0000-0000 : ahci
>   0000-0000 : 0000:00:1f.2
>     0000-0000 : ahci
>
> /proc/iomem:
>
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : PCI Bus 0000:00
> 00000000-00000000 : Video ROM
> 00000000-00000000 : PCI Bus 0000:00
> 00000000-00000000 : PCI Bus 0000:00
> 00000000-00000000 : PCI Bus 0000:00
> 00000000-00000000 : PCI Bus 0000:00
> 00000000-00000000 : Reserved
>   00000000-00000000 : PCI Bus 0000:00
>   00000000-00000000 : PCI Bus 0000:00
>   00000000-00000000 : System ROM
> 00000000-00000000 : System RAM
>   00000000-00000000 : Kernel code
>   00000000-00000000 : Kernel data
>   00000000-00000000 : Kernel bss
> 00000000-00000000 : ACPI Non-volatile Storage
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : ACPI Non-volatile Storage
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : RAM buffer
> 00000000-00000000 : PCI Bus 0000:00
>   00000000-00000000 : PCI Bus 0000:01
>     00000000-00000000 : 0000:01:00.0
>     00000000-00000000 : 0000:01:00.0
>   00000000-00000000 : PCI Bus 0000:06
>     00000000-00000000 : 0000:06:00.0
>     00000000-00000000 : 0000:06:00.0
>       00000000-00000000 : ahci
>   00000000-00000000 : PCI Bus 0000:03
>     00000000-00000000 : 0000:03:00.0
>       00000000-00000000 : alx
>   00000000-00000000 : PCI Bus 0000:01
>     00000000-00000000 : 0000:01:00.0
>     00000000-00000000 : 0000:01:00.1
>       00000000-00000000 : ICH HD audio
>   00000000-00000000 : 0000:00:19.0
>     00000000-00000000 : e1000e
>   00000000-00000000 : 0000:00:14.0
>     00000000-00000000 : xhci-hcd
>   00000000-00000000 : 0000:00:1b.0
>     00000000-00000000 : ICH HD audio
>   00000000-00000000 : 0000:00:1f.3
>   00000000-00000000 : 0000:00:1f.2
>     00000000-00000000 : ahci
>   00000000-00000000 : 0000:00:1d.0
>     00000000-00000000 : ehci_hcd
>   00000000-00000000 : 0000:00:1a.0
>     00000000-00000000 : ehci_hcd
>   00000000-00000000 : 0000:00:19.0
>     00000000-00000000 : e1000e
>   00000000-00000000 : 0000:00:16.0
>   00000000-00000000 : pnp 00:07
>   00000000-00000000 : PCI MMCONFIG 0000 [bus 00-3f]
>     00000000-00000000 : Reserved
>       00000000-00000000 : pnp 00:07
> 00000000-00000000 : Reserved
>   00000000-00000000 : IOAPIC 0
> 00000000-00000000 : Reserved
>   00000000-00000000 : HPET 0
>     00000000-00000000 : PNP0103:00
> 00000000-00000000 : pnp 00:07
> 00000000-00000000 : pnp 00:07
> 00000000-00000000 : pnp 00:07
> 00000000-00000000 : Reserved
>   00000000-00000000 : pnp 00:07
> 00000000-00000000 : pnp 00:07
> 00000000-00000000 : pnp 00:00
> 00000000-00000000 : pnp 00:07
> 00000000-00000000 : dmar0
> 00000000-00000000 : Local APIC
>   00000000-00000000 : Reserved
> 00000000-00000000 : Reserved
>   00000000-00000000 : INT0800:00
>     00000000-00000000 : pnp 00:07
> 00000000-00000000 : System RAM
> 00000000-00000000 : RAM buffer
>
> [8.5.] PCI information ('lspci -vvv' as root)
>
> 00:00.0 Host bridge: Intel Corporation 4th Gen Core Processor DRAM 
> Controller (rev 06)
>     Subsystem: Gigabyte Technology Co., Ltd 4th Gen Core Processor 
> DRAM Controller
>     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort+ >SERR- <PERR- INTx-
>     Latency: 0
>     Capabilities: [e0] Vendor Specific Information: Len=0c <?>
>
> 00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core 
> Processor PCI Express x16 Controller (rev 06) (prog-if 00 [Normal decode])
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 25
>     Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
>     I/O behind bridge: 0000e000-0000efff [size=4K]
>     Memory behind bridge: f7e00000-f7efffff [size=1M]
>     Prefetchable memory behind bridge: 
> 00000000e0000000-00000000f01fffff [size=258M]
>     Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort+ <SERR- <PERR-
>     BridgeCtl: Parity- SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
>         PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     Capabilities: [88] Subsystem: Gigabyte Technology Co., Ltd Xeon 
> E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller
>     Capabilities: [80] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee00218  Data: 0000
>     Capabilities: [a0] Express (v2) Root Port (Slot+), MSI 00
>         DevCap:    MaxPayload 256 bytes, PhantFunc 0
>             ExtTag- RBE+
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 256 bytes, MaxReadReq 128 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- 
> TransPend-
>         LnkCap:    Port #2, Speed 8GT/s, Width x16, ASPM L0s L1, Exit 
> Latency L0s <256ns, L1 <8us
>             ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 8GT/s, Width x16, TrErr- Train- SlotClk+ 
> DLActive- BWMgmt+ ABWMgmt+
>         SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- 
> Surprise-
>             Slot #1, PowerLimit 75.000W; Interlock- NoCompl+
>         SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
> HPIrq- LinkChg-
>             Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
>         SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ 
> Interlock-
>             Changed: MRL- PresDet- LinkState-
>         RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- 
> CRSVisible-
>         RootCap: CRSVisible-
>         RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>         DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+, 
> OBFF Via WAKE# ARIFwd-
>              AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS+
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
> OBFF Via WAKE# ARIFwd-
>              AtomicOpsCtl: ReqEn- EgressBlck-
>         LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -6dB, 
> EqualizationComplete+, EqualizationPhase1+
>              EqualizationPhase2+, EqualizationPhase3+, 
> LinkEqualizationRequest-
>     Capabilities: [100 v1] Virtual Channel
>         Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
>         Arb:    Fixed- WRR32- WRR64- WRR128-
>         Ctrl:    ArbSelect=Fixed
>         Status:    InProgress-
>         VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>             Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
>             Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>             Status:    NegoPending- InProgress-
>     Capabilities: [140 v1] Root Complex Link
>         Desc:    PortNumber=02 ComponentID=01 EltType=Config
>         Link0:    Desc:    TargetPort=00 TargetComponent=01 AssocRCRB- 
> LinkType=MemMapped LinkValid+
>             Addr:    00000000fed19000
>     Capabilities: [d94 v1] #19
>     Kernel driver in use: pcieport
>
> 00:14.0 USB controller: Intel Corporation 9 Series Chipset Family USB 
> xHCI Controller (prog-if 30 [XHCI])
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family 
> USB xHCI Controller
>     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Interrupt: pin A routed to IRQ 33
>     Region 0: Memory at f7f20000 (64-bit, non-prefetchable) [size=64K]
>     Capabilities: [70] Power Management version 2
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
> PME(D0-,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
>         Address: 00000000fee00398  Data: 0000
>     Kernel driver in use: xhci_hcd
>
> 00:16.0 Communication controller: Intel Corporation 9 Series Chipset 
> Family ME Interface #1
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family ME 
> Interface
>     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Interrupt: pin A routed to IRQ 11
>     Region 0: Memory at f7f39000 (64-bit, non-prefetchable) [size=16]
>     Capabilities: [50] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [8c] MSI: Enable- Count=1/1 Maskable- 64bit+
>         Address: 0000000000000000  Data: 0000
>
> 00:19.0 Ethernet controller: Intel Corporation Ethernet Connection I217-V
>     Subsystem: Gigabyte Technology Co., Ltd Ethernet Connection I217-V
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Interrupt: pin A routed to IRQ 32
>     Region 0: Memory at f7f00000 (32-bit, non-prefetchable) [size=128K]
>     Region 1: Memory at f7f38000 (32-bit, non-prefetchable) [size=4K]
>     Region 2: I/O ports at f040 [size=32]
>     Capabilities: [c8] Power Management version 2
>         Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-
>     Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Address: 00000000fee00358  Data: 0000
>     Capabilities: [e0] PCI Advanced Features
>         AFCap: TP+ FLR+
>         AFCtrl: FLR-
>         AFStatus: TP-
>     Kernel driver in use: e1000e
>
> 00:1a.0 USB controller: Intel Corporation 9 Series Chipset Family USB 
> EHCI Controller #2 (prog-if 20 [EHCI])
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family 
> USB EHCI Controller
>     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Interrupt: pin A routed to IRQ 16
>     Region 0: Memory at f7f37000 (32-bit, non-prefetchable) [size=1K]
>     Capabilities: [50] Power Management version 2
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [58] Debug port: BAR=1 offset=00a0
>     Capabilities: [98] PCI Advanced Features
>         AFCap: TP+ FLR+
>         AFCtrl: FLR-
>         AFStatus: TP-
>     Kernel driver in use: ehci-pci
>
> 00:1b.0 Audio device: Intel Corporation 9 Series Chipset Family HD 
> Audio Controller
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family HD 
> Audio Controller
>     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 34
>     Region 0: Memory at f7f30000 (64-bit, non-prefetchable) [size=16K]
>     Capabilities: [50] Power Management version 2
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Address: 00000000fee003f8  Data: 0000
>     Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, 
> MSI 00
>         DevCap:    MaxPayload 128 bytes, PhantFunc 0
>             ExtTag- RBE-
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 128 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
> TransPend-
>     Capabilities: [100 v1] Virtual Channel
>         Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
>         Arb:    Fixed- WRR32- WRR64- WRR128-
>         Ctrl:    ArbSelect=Fixed
>         Status:    InProgress-
>         VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>             Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>             Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>             Status:    NegoPending- InProgress-
>         VC1:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>             Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>             Ctrl:    Enable+ ID=2 ArbSelect=Fixed TC/VC=04
>             Status:    NegoPending- InProgress-
>     Kernel driver in use: snd_hda_intel
>     Kernel modules: snd_hda_intel
>
> 00:1c.0 PCI bridge: Intel Corporation 9 Series Chipset Family PCI 
> Express Root Port 1 (rev d0) (prog-if 00 [Normal decode])
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 26
>     Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
>     I/O behind bridge: 0000f000-00000fff [empty]
>     Memory behind bridge: fff00000-000fffff [empty]
>     Prefetchable memory behind bridge: 
> 00000000fff00000-00000000000fffff [empty]
>     Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort+ <SERR- <PERR-
>     BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
>         PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     Capabilities: [40] Express (v2) Root Port (Slot-), MSI 00
>         DevCap:    MaxPayload 128 bytes, PhantFunc 0
>             ExtTag- RBE+
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 128 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
> TransPend-
>         LnkCap:    Port #1, Speed 5GT/s, Width x2, ASPM L0s L1, Exit 
> Latency L0s <1us, L1 <4us
>             ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk-
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 2.5GT/s, Width x0, TrErr- Train+ SlotClk+ 
> DLActive- BWMgmt- ABWMgmt-
>         RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- 
> CRSVisible-
>         RootCap: CRSVisible-
>         RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>         DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, 
> OBFF Via WAKE# ARIFwd-
>              AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
> OBFF Disabled ARIFwd-
>              AtomicOpsCtl: ReqEn- EgressBlck-
>         LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -3.5dB, 
> EqualizationComplete-, EqualizationPhase1-
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee00238  Data: 0000
>     Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd 9 
> Series Chipset Family PCI Express Root Port 1
>     Capabilities: [a0] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
>     Kernel driver in use: pcieport
>
> 00:1c.2 PCI bridge: Intel Corporation 9 Series Chipset Family PCI 
> Express Root Port 3 (rev d0) (prog-if 00 [Normal decode])
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin C routed to IRQ 27
>     Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
>     I/O behind bridge: 0000d000-0000dfff [size=4K]
>     Memory behind bridge: f7d00000-f7dfffff [size=1M]
>     Prefetchable memory behind bridge: 
> 00000000fff00000-00000000000fffff [empty]
>     Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- <SERR- <PERR-
>     BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
>         PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
>         DevCap:    MaxPayload 128 bytes, PhantFunc 0
>             ExtTag- RBE+
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 128 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
> TransPend-
>         LnkCap:    Port #3, Speed 5GT/s, Width x1, ASPM L0s L1, Exit 
> Latency L0s <512ns, L1 <16us
>             ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ 
> DLActive+ BWMgmt+ ABWMgmt-
>         SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- 
> Surprise-
>             Slot #2, PowerLimit 10.000W; Interlock- NoCompl+
>         SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
> HPIrq- LinkChg-
>             Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
>         SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ 
> Interlock-
>             Changed: MRL- PresDet- LinkState-
>         RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- 
> CRSVisible-
>         RootCap: CRSVisible-
>         RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>         DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, 
> OBFF Not Supported ARIFwd-
>              AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
> OBFF Disabled ARIFwd-
>              AtomicOpsCtl: ReqEn- EgressBlck-
>         LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -3.5dB, 
> EqualizationComplete-, EqualizationPhase1-
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee00278  Data: 0000
>     Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd 9 
> Series Chipset Family PCI Express Root Port 3
>     Capabilities: [a0] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Kernel driver in use: pcieport
>
> 00:1c.3 PCI bridge: Intel Corporation 9 Series Chipset Family PCI 
> Express Root Port 4 (rev d0) (prog-if 00 [Normal decode])
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin D routed to IRQ 28
>     Bus: primary=00, secondary=04, subordinate=05, sec-latency=0
>     I/O behind bridge: 0000f000-00000fff [empty]
>     Memory behind bridge: fff00000-000fffff [empty]
>     Prefetchable memory behind bridge: 
> 00000000fff00000-00000000000fffff [empty]
>     Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort+ <SERR- <PERR-
>     BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
>         PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
>         DevCap:    MaxPayload 128 bytes, PhantFunc 0
>             ExtTag- RBE+
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 128 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
> TransPend-
>         LnkCap:    Port #4, Speed 5GT/s, Width x1, ASPM L0s L1, Exit 
> Latency L0s <1us, L1 <16us
>             ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk-
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ 
> DLActive+ BWMgmt+ ABWMgmt-
>         SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- 
> Surprise-
>             Slot #3, PowerLimit 10.000W; Interlock- NoCompl+
>         SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
> HPIrq- LinkChg-
>             Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
>         SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ 
> Interlock-
>             Changed: MRL- PresDet- LinkState-
>         RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- 
> CRSVisible-
>         RootCap: CRSVisible-
>         RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>         DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, 
> OBFF Not Supported ARIFwd-
>              AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
> OBFF Disabled ARIFwd-
>              AtomicOpsCtl: ReqEn- EgressBlck-
>         LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -3.5dB, 
> EqualizationComplete-, EqualizationPhase1-
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee002b8  Data: 0000
>     Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd 9 
> Series Chipset Family PCI Express Root Port 4
>     Capabilities: [a0] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Kernel driver in use: pcieport
>
> 00:1c.6 PCI bridge: Intel Corporation 9 Series Chipset Family PCI 
> Express Root Port 7 (rev d0) (prog-if 00 [Normal decode])
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin C routed to IRQ 29
>     Bus: primary=00, secondary=06, subordinate=06, sec-latency=0
>     I/O behind bridge: 0000c000-0000cfff [size=4K]
>     Memory behind bridge: f7c00000-f7cfffff [size=1M]
>     Prefetchable memory behind bridge: 
> 00000000fff00000-00000000000fffff [empty]
>     Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- <SERR- <PERR-
>     BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
>         PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
>         DevCap:    MaxPayload 128 bytes, PhantFunc 0
>             ExtTag- RBE+
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 128 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
> TransPend-
>         LnkCap:    Port #7, Speed 5GT/s, Width x1, ASPM L0s L1, Exit 
> Latency L0s <512ns, L1 <16us
>             ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 5GT/s, Width x1, TrErr- Train- SlotClk+ 
> DLActive+ BWMgmt+ ABWMgmt+
>         SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- 
> Surprise-
>             Slot #6, PowerLimit 10.000W; Interlock- NoCompl+
>         SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
> HPIrq- LinkChg-
>             Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
>         SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ 
> Interlock-
>             Changed: MRL- PresDet- LinkState-
>         RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- 
> CRSVisible-
>         RootCap: CRSVisible-
>         RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>         DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, 
> OBFF Not Supported ARIFwd-
>              AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
> OBFF Disabled ARIFwd-
>              AtomicOpsCtl: ReqEn- EgressBlck-
>         LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -6dB, 
> EqualizationComplete-, EqualizationPhase1-
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee002d8  Data: 0000
>     Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd 9 
> Series Chipset Family PCI Express Root Port 7
>     Capabilities: [a0] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Kernel driver in use: pcieport
>
> 00:1d.0 USB controller: Intel Corporation 9 Series Chipset Family USB 
> EHCI Controller #1 (prog-if 20 [EHCI])
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family 
> USB EHCI Controller
>     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Interrupt: pin A routed to IRQ 23
>     Region 0: Memory at f7f36000 (32-bit, non-prefetchable) [size=1K]
>     Capabilities: [50] Power Management version 2
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [58] Debug port: BAR=1 offset=00a0
>     Capabilities: [98] PCI Advanced Features
>         AFCap: TP+ FLR+
>         AFCtrl: FLR-
>         AFStatus: TP-
>     Kernel driver in use: ehci-pci
>
> 00:1f.0 ISA bridge: Intel Corporation 9 Series Chipset Family Z97 LPC 
> Controller
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family 
> Z97 LPC Controller
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Capabilities: [e0] Vendor Specific Information: Len=0c <?>
>
> 00:1f.2 SATA controller: Intel Corporation 9 Series Chipset Family 
> SATA Controller [AHCI Mode] (prog-if 01 [AHCI 1.0])
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family 
> SATA Controller [AHCI Mode]
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0
>     Interrupt: pin B routed to IRQ 30
>     Region 0: I/O ports at f090 [size=8]
>     Region 1: I/O ports at f080 [size=4]
>     Region 2: I/O ports at f070 [size=8]
>     Region 3: I/O ports at f060 [size=4]
>     Region 4: I/O ports at f020 [size=32]
>     Region 5: Memory at f7f35000 (32-bit, non-prefetchable) [size=2K]
>     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee002f8  Data: 0000
>     Capabilities: [70] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0-,D1-,D2-,D3hot+,D3cold-)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004
>     Kernel driver in use: ahci
>
> 00:1f.3 SMBus: Intel Corporation 9 Series Chipset Family SMBus Controller
>     Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset Family 
> SMBus Controller
>     Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Interrupt: pin C routed to IRQ 11
>     Region 0: Memory at f7f34000 (64-bit, non-prefetchable) [disabled] 
> [size=256]
>     Region 4: I/O ports at f000 [size=32]
>
> 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
> [AMD/ATI] Ellesmere [Radeon RX 470/480/570/580] (rev e1) (prog-if 00 
> [VGA controller])
>     Subsystem: Gigabyte Technology Co., Ltd Device 2311
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 36
>     Region 0: Memory at e0000000 (64-bit, prefetchable) [size=256M]
>     Region 2: Memory at f0000000 (64-bit, prefetchable) [size=2M]
>     Region 4: I/O ports at e000 [size=256]
>     Region 5: Memory at f7e00000 (32-bit, non-prefetchable) [size=256K]
>     Expansion ROM at 000c0000 [disabled] [size=128K]
>     Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     Capabilities: [50] Power Management version 3
>         Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA 
> PME(D0-,D1+,D2+,D3hot+,D3cold+)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00
>         DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
> <4us, L1 unlimited
>             ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>             MaxPayload 256 bytes, MaxReadReq 512 bytes
>         DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr- 
> TransPend-
>         LnkCap:    Port #0, Speed 8GT/s, Width x16, ASPM L1, Exit 
> Latency L1 <1us
>             ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 8GT/s, Width x16, TrErr- Train- SlotClk+ 
> DLActive- BWMgmt- ABWMgmt-
>         DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+, 
> OBFF Not Supported
>              AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
> OBFF Disabled
>              AtomicOpsCtl: ReqEn+
>         LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -3.5dB, 
> EqualizationComplete+, EqualizationPhase1+
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Address: 00000000fee00438  Data: 0000
>     Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 
> Len=010 <?>
>     Capabilities: [150 v2] Advanced Error Reporting
>         UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
>         CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
>         CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
>         AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
> ECRCChkCap+ ECRCChkEn-
>             MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>         HeaderLog: 00000000 00000000 00000000 00000000
>     Capabilities: [200 v1] #15
>     Capabilities: [270 v1] #19
>     Capabilities: [2b0 v1] Address Translation Service (ATS)
>         ATSCap:    Invalidate Queue Depth: 00
>         ATSCtl:    Enable-, Smallest Translation Unit: 00
>     Capabilities: [2c0 v1] Page Request Interface (PRI)
>         PRICtl: Enable- Reset-
>         PRISta: RF- UPRGI- Stopped+
>         Page Request Capacity: 00000020, Page Request Allocation: 00000000
>     Capabilities: [2d0 v1] Process Address Space ID (PASID)
>         PASIDCap: Exec+ Priv+, Max PASID Width: 10
>         PASIDCtl: Enable- Exec- Priv-
>     Capabilities: [320 v1] Latency Tolerance Reporting
>         Max snoop latency: 71680ns
>         Max no snoop latency: 71680ns
>     Capabilities: [328 v1] Alternative Routing-ID Interpretation (ARI)
>         ARICap:    MFVC- ACS-, Next Function: 1
>         ARICtl:    MFVC- ACS-, Function Group: 0
>     Capabilities: [370 v1] L1 PM Substates
>         L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ 
> L1_PM_Substates+
>               PortCommonModeRestoreTime=0us PortTPowerOnTime=170us
>         L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>                T_CommonMode=0us LTR1.2_Threshold=0ns
>         L1SubCtl2: T_PwrOn=10us
>     Kernel driver in use: amdgpu
>     Kernel modules: amdgpu
>
> 01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Ellesmere 
> [Radeon RX 580]
>     Subsystem: Gigabyte Technology Co., Ltd Device aaf0
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin B routed to IRQ 35
>     Region 0: Memory at f7e60000 (64-bit, non-prefetchable) [size=16K]
>     Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     Capabilities: [50] Power Management version 3
>         Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA 
> PME(D0-,D1-,D2-,D3hot-,D3cold-)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00
>         DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
> <4us, L1 unlimited
>             ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>             MaxPayload 256 bytes, MaxReadReq 512 bytes
>         DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr- 
> TransPend-
>         LnkCap:    Port #0, Speed 8GT/s, Width x16, ASPM L1, Exit 
> Latency L1 <1us
>             ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 8GT/s, Width x16, TrErr- Train- SlotClk+ 
> DLActive- BWMgmt- ABWMgmt-
>         DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+, 
> OBFF Not Supported
>              AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, 
> OBFF Disabled
>              AtomicOpsCtl: ReqEn-
>         LnkSta2: Current De-emphasis Level: -3.5dB, 
> EqualizationComplete-, EqualizationPhase1-
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Address: 00000000fee00418  Data: 0000
>     Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 
> Len=010 <?>
>     Capabilities: [150 v2] Advanced Error Reporting
>         UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
>         CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
>         CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
>         AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
> ECRCChkCap+ ECRCChkEn-
>             MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>         HeaderLog: 00000000 00000000 00000000 00000000
>     Capabilities: [328 v1] Alternative Routing-ID Interpretation (ARI)
>         ARICap:    MFVC- ACS-, Next Function: 0
>         ARICtl:    MFVC- ACS-, Function Group: 0
>     Kernel driver in use: snd_hda_intel
>     Kernel modules: snd_hda_intel
>
> 03:00.0 Ethernet controller: Qualcomm Atheros Killer E220x Gigabit 
> Ethernet Controller (rev 10)
>     Subsystem: Gigabyte Technology Co., Ltd Killer E220x Gigabit 
> Ethernet Controller
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 18
>     Region 0: Memory at f7d00000 (64-bit, non-prefetchable) [size=256K]
>     Region 2: I/O ports at d000 [size=128]
>     Capabilities: [40] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
> PME(D0+,D1+,D2+,D3hot+,D3cold+)
>         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [58] Express (v1) Endpoint, MSI 00
>         DevCap:    MaxPayload 4096 bytes, PhantFunc 0, Latency L0s 
> unlimited, L1 unlimited
>             ExtTag- AttnBtn+ AttnInd+ PwrInd+ RBE+ FLReset- 
> SlotPowerLimit 10.000W
>         DevCtl:    Report errors: Correctable+ Non-Fatal+ Fatal+ 
> Unsupported+
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 512 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
> TransPend-
>         LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit 
> Latency L0s unlimited, L1 unlimited
>             ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ 
> DLActive- BWMgmt- ABWMgmt-
>     Capabilities: [c0] MSI: Enable- Count=1/16 Maskable+ 64bit+
>         Address: 0000000000000000  Data: 0000
>         Masking: 00000000  Pending: 00000000
>     Capabilities: [d8] MSI-X: Enable+ Count=16 Masked-
>         Vector table: BAR=0 offset=00002000
>         PBA: BAR=0 offset=00003000
>     Capabilities: [100 v1] Advanced Error Reporting
>         UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UESvrt:    DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
>         CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
>         CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
>         AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
> ECRCChkCap+ ECRCChkEn-
>             MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>         HeaderLog: 00000000 00000000 00000000 00000000
>     Capabilities: [180 v1] Device Serial Number ff-ec-0a-e8-74-d4-35-ff
>     Kernel driver in use: alx
>
> 04:00.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 41) 
> (prog-if 01 [Subtractive decode])
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 10
>     Bus: primary=04, secondary=05, subordinate=05, sec-latency=32
>     I/O behind bridge: 0000f000-00000fff [empty]
>     Memory behind bridge: fff00000-000fffff [empty]
>     Prefetchable memory behind bridge: 
> 00000000fff00000-00000000000fffff [empty]
>     Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=medium >TAbort- 
> <TAbort- <MAbort+ <SERR- <PERR-
>     BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
>         PriDiscTmr- SecDiscTmr+ DiscTmrStat- DiscTmrSERREn-
>     Capabilities: [90] Power Management version 2
>         Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=55mA 
> PME(D0+,D1+,D2+,D3hot+,D3cold+)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [a0] Subsystem: Gigabyte Technology Co., Ltd 82801 
> PCI Bridge
>
> 06:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9172 SATA 
> 6Gb/s Controller (rev 12) (prog-if 01 [AHCI 1.0])
>     Subsystem: Gigabyte Technology Co., Ltd 88SE9172 SATA 6Gb/s Controller
>     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Latency: 0, Cache Line Size: 64 bytes
>     Interrupt: pin A routed to IRQ 31
>     Region 0: I/O ports at c040 [size=8]
>     Region 1: I/O ports at c030 [size=4]
>     Region 2: I/O ports at c020 [size=8]
>     Region 3: I/O ports at c010 [size=4]
>     Region 4: I/O ports at c000 [size=16]
>     Region 5: Memory at f7c10000 (32-bit, non-prefetchable) [size=512]
>     Expansion ROM at f7c00000 [disabled] [size=64K]
>     Capabilities: [40] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
> PME(D0-,D1-,D2-,D3hot+,D3cold-)
>         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit-
>         Address: fee00318  Data: 0000
>     Capabilities: [70] Express (v2) Legacy Endpoint, MSI 00
>         DevCap:    MaxPayload 512 bytes, PhantFunc 0, Latency L0s 
> <1us, L1 <8us
>             ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
> Unsupported-
>             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>             MaxPayload 128 bytes, MaxReadReq 512 bytes
>         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- 
> TransPend-
>         LnkCap:    Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit 
> Latency L0s <512ns, L1 <64us
>             ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
>         LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>         LnkSta:    Speed 5GT/s, Width x1, TrErr- Train- SlotClk+ 
> DLActive- BWMgmt- ABWMgmt-
>         DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, 
> OBFF Not Supported
>              AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, 
> OBFF Disabled
>              AtomicOpsCtl: ReqEn-
>         LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>              Transmit Margin: Normal Operating Range, 
> EnterModifiedCompliance- ComplianceSOS-
>              Compliance De-emphasis: -6dB
>         LnkSta2: Current De-emphasis Level: -6dB, 
> EqualizationComplete-, EqualizationPhase1-
>              EqualizationPhase2-, EqualizationPhase3-, 
> LinkEqualizationRequest-
>     Capabilities: [100 v1] Advanced Error Reporting
>         UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>         UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- 
> RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
>         CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
>         CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
>         AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
> ECRCChkCap- ECRCChkEn-
>             MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>         HeaderLog: 00000000 00000000 00000000 00000000
>     Kernel driver in use: ahci
>
> [8.6.] SCSI information (from /proc/scsi/scsi)
>
> Not applicable
>
> [8.7.] Other information that might be relevant to the problem
>        (please look in /proc and include all information that you
>        think to be relevant):
>
> N/A
>
> [X.] Other notes, patches, fixes, workarounds:
>
> N/A
>
>


--------------BFAC371A5B27B4925B5C2198
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Davin,<br>
    <br>
    thanks for your report. Please open a ticket at
    <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues">https://gitlab.freedesktop.org/drm/amd/-/issues</a><br>
    <br>
    I added Stylon in case he has some ideas why his patch regressed
    this.<br>
    <br>
    Thanks,<br>
    Harry<br>
    <br>
    <div class="moz-cite-prefix">On 2021-01-04 12:06 a.m., Davin McCall
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:7d0b5fbb-a89a-d936-c8ac-2d3131f7b0b5@davmac.org">
      
      <p>Hi, I would like to report the following issue which begain
        with kernel 5.4.86.</p>
      <p>Please let me know if I should also file a bug in bugzilla.</p>
      <p>Note that I have narrowed it down to the change which causes
        the issue (e1b1f10c3404c8d40c45c3a6846d304fd403fa2c in linux-5.4
        series, upstream a135a1b4c4db1f3b8cbed9676a40ede39feb3362).</p>
      <p>I am happy to try patches and help debug in any way I can.<br>
      </p>
      <p>Regards,</p>
      <p>Davin McCall<br>
      </p>
      <p><br>
      </p>
      <p>[1.] One line summary of the problem:<br>
        <br>
        RX 580 screen goes dark after switching monitor to different
        input and back<br>
        <br>
        [2.] Full description of the problem/report:<br>
      </p>
      <p>I have an RX 580 graphics adapter connected via displayport to
        my monitor. When I switch the monitor to a different input and
        then back, the display remains dark. The following appears in
        the dmesg output:</p>
      <p>Jan&nbsp; 4 10:28:04 localhost vmunix:
        [drm:dce112_get_pix_clk_dividers [amdgpu]] *ERROR*
        dce112_get_pix_clk_dividers: Invalid parameters!!<br>
        Jan&nbsp; 4 10:28:04 localhost vmunix:
        [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
        old state failed with -22<br>
      </p>
      <p>This happens with kernel 5.4.86 but not 5.4.85 and can be
        reproduced reliably.<br>
      </p>
      <p>I have narrowed it down to the following change:</p>
      <blockquote>
        <pre>commit e1b1f10c3404c8d40c45c3a6846d304fd403fa2c
Author: Stylon Wang <a class="moz-txt-link-rfc2396E" href="mailto:stylon.wang@amd.com" moz-do-not-send="true">&lt;stylon.wang@amd.com&gt;</a>
Date:   Tue Nov 10 15:40:06 2020 +0800

    drm/amd/display: Fix memory leaks in S3 resume
    
    commit a135a1b4c4db1f3b8cbed9676a40ede39feb3362 upstream.
    
    EDID parsing in S3 resume pushes new display modes
    to probed_modes list but doesn't consolidate to actual
    mode list. This creates a race condition when
    amdgpu_dm_connector_ddc_get_modes() re-initializes the
    list head without walking the list and results in  memory leak.
    
    Bug: <a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D209987&amp;data=04%7C01%7Charry.wentland%40amd.com%7C1cf13e0bf9674d8ce9a208d8b06e5992%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637453335637038312%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=sNTMqLQHFdTwpYpo8dllI2EwA%2BlOm1EVCDZY%2FJezpX8%3D&amp;reserved=0" originalsrc="https://bugzilla.kernel.org/show_bug.cgi?id=209987" shash="fIoHc95b3742NDuMvp5pwPkzYpUX20Sa8VaObidsBhtHR3L0JdVe8FcxzfPgjMcp8wSf7iDviqSpv6Gicr3F9+gvlSO2AN5OZcAznF9rEM0CIFm9lgndBxfwpGFBPGjrZQGwBx/k8mnkIe2CIug8JtRJCAOKXx0lbZzUxkcOrMU=" moz-do-not-send="true">https://bugzilla.kernel.org/show_bug.cgi?id=209987</a>
    Acked-by: Harry Wentland <a class="moz-txt-link-rfc2396E" href="mailto:harry.wentland@amd.com" moz-do-not-send="true">&lt;harry.wentland@amd.com&gt;</a>
    Acked-by: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com" moz-do-not-send="true">&lt;alexander.deucher@amd.com&gt;</a>
    Reviewed-by: Nicholas Kazlauskas <a class="moz-txt-link-rfc2396E" href="mailto:nicholas.kazlauskas@amd.com" moz-do-not-send="true">&lt;nicholas.kazlauskas@amd.com&gt;</a>
    Signed-off-by: Stylon Wang <a class="moz-txt-link-rfc2396E" href="mailto:stylon.wang@amd.com" moz-do-not-send="true">&lt;stylon.wang@amd.com&gt;</a>
    Signed-off-by: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com" moz-do-not-send="true">&lt;alexander.deucher@amd.com&gt;</a>
    Cc: <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org" moz-do-not-send="true">stable@vger.kernel.org</a>
    Signed-off-by: Greg Kroah-Hartman <a class="moz-txt-link-rfc2396E" href="mailto:gregkh@linuxfoundation.org" moz-do-not-send="true">&lt;gregkh@linuxfoundation.org&gt;</a>
</pre>
      </blockquote>
      <p><br>
        [3.] Keywords (i.e., modules, networking, kernel):</p>
      <p>amdgpu<br>
      </p>
      <p>[4.] Kernel information</p>
      <p>kernel compiled from source with custom configuration<br>
      </p>
      <p>[4.1.] Kernel version (from /proc/version):</p>
      <p>Linux version 5.4.86 (root@dragon) (gcc version 9.3.0 (GCC)) #1
        SMP PREEMPT Mon Jan 4 13:06:47 AEST 2021<br>
      </p>
      <p>[4.2.] Kernel .config file:</p>
      <p>... Is 4k lines long. I'm going to assume it's not really
        wanted here? Can supply on request.<br>
      </p>
      <p>[5.] Most recent kernel version which did not have the bug:</p>
      <p>5.4.85<br>
      </p>
      <p>[6.] Output of Oops.. message (if applicable) with symbolic
        information<br>
        &nbsp;&nbsp;&nbsp;&nbsp; resolved (see Documentation/admin-guide/oops-tracing.rst)</p>
      <p>N/A<br>
      </p>
      <p>[7.] A small shell script or example program which triggers the<br>
        &nbsp;&nbsp;&nbsp;&nbsp; problem (if possible)</p>
      <p>N/A<br>
      </p>
      <p>[8.] Environment<br>
        [8.1.] Software (add the output of the ver_linux script here)</p>
      <p><tt>Linux dragon 5.4.86 #1 SMP PREEMPT Mon Jan 4 13:06:47 AEST
          2021 x86_64 GNU/Linux</tt><tt><br>
        </tt><tt><br>
        </tt><tt>GNU C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 9.3.0</tt><tt><br>
        </tt><tt>GNU Make&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 4.2.1</tt><tt><br>
        </tt><tt>Binutils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.35.1</tt><tt><br>
        </tt><tt>Util-linux&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.36.1</tt><tt><br>
        </tt><tt>Mount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.36.1</tt><tt><br>
        </tt><tt>Module-init-tools&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 21</tt><tt><br>
        </tt><tt>E2fsprogs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 1.44.4</tt><tt><br>
        </tt><tt>PPP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.4.4</tt><tt><br>
        </tt><tt>Linux C Library&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.32</tt><tt><br>
        </tt><tt>Dynamic linker (ldd)&nbsp;&nbsp;&nbsp; 2.32</tt><tt><br>
        </tt><tt>Linux C++ Library&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 9.3.0</tt><tt><br>
        </tt><tt>Procps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 3.2.7</tt><tt><br>
        </tt><tt>Net-tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 1.9.4</tt><tt><br>
        </tt><tt>Kbd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.0.4</tt><tt><br>
        </tt><tt>Console-tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 2.0.4</tt><tt><br>
        </tt><tt>Sh-utils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 8.32</tt><tt><br>
        </tt><tt>Udev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 228</tt><tt><br>
        </tt><tt>Wireless-tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 29</tt><tt><br>
        </tt><tt>Modules Loaded&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; aesni_intel amdgpu backlight
          cfbcopyarea cfbfillrect cfbimgblt cfg80211 cryptd crypto_simd
          drm drm_kms_helper drm_panel_orientation_quirks fb fbdev
          fb_sys_fops font glue_helper gpu_sched i2c_algo_bit i2c_core
          snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi
          snd_hda_codec_realtek snd_hda_core snd_hda_intel
          snd_intel_nhlt syscopyarea sysfillrect sysimgblt ttm video</tt><br>
      </p>
      <p>[8.2.] Processor information (from /proc/cpuinfo):</p>
      <p><tt>processor&nbsp;&nbsp;&nbsp; : 0</tt><tt><br>
        </tt><tt>vendor_id&nbsp;&nbsp;&nbsp; : GenuineIntel</tt><tt><br>
        </tt><tt>cpu family&nbsp;&nbsp;&nbsp; : 6</tt><tt><br>
        </tt><tt>model&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : 60</tt><tt><br>
        </tt><tt>model name&nbsp;&nbsp;&nbsp; : Intel(R) Core(TM) i7-4790K CPU @
          4.00GHz</tt><tt><br>
        </tt><tt>stepping&nbsp;&nbsp;&nbsp; : 3</tt><tt><br>
        </tt><tt>microcode&nbsp;&nbsp;&nbsp; : 0x24</tt><tt><br>
        </tt><tt>cpu MHz&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : 4389.681</tt><tt><br>
        </tt><tt>cache size&nbsp;&nbsp;&nbsp; : 8192 KB</tt><tt><br>
        </tt><tt>physical id&nbsp;&nbsp;&nbsp; : 0</tt><tt><br>
        </tt><tt>siblings&nbsp;&nbsp;&nbsp; : 8</tt><tt><br>
        </tt><tt>core id&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : 0</tt><tt><br>
        </tt><tt>cpu cores&nbsp;&nbsp;&nbsp; : 4</tt><tt><br>
        </tt><tt>apicid&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : 0</tt><tt><br>
        </tt><tt>initial apicid&nbsp;&nbsp;&nbsp; : 0</tt><tt><br>
        </tt><tt>fpu&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : yes</tt><tt><br>
        </tt><tt>fpu_exception&nbsp;&nbsp;&nbsp; : yes</tt><tt><br>
        </tt><tt>cpuid level&nbsp;&nbsp;&nbsp; : 13</tt><tt><br>
        </tt><tt>wp&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : yes</tt><tt><br>
        </tt><tt>flags&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : fpu vme de pse tsc msr pae mce cx8 apic
          sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse
          sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc
          arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
          cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est
          tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic
          movbe popcnt aes xsave avx f16c rdrand lahf_lm abm cpuid_fault
          invpcid_single tpr_shadow vnmi flexpriority ept vpid ept_ad
          fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt
          dtherm ida arat pln pts</tt><tt><br>
        </tt><tt>bugs&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : cpu_meltdown spectre_v1 spectre_v2
          spec_store_bypass l1tf mds swapgs itlb_multihit srbds</tt><tt><br>
        </tt><tt>bogomips&nbsp;&nbsp;&nbsp; : 7981.84</tt><tt><br>
        </tt><tt>clflush size&nbsp;&nbsp;&nbsp; : 64</tt><tt><br>
        </tt><tt>cache_alignment&nbsp;&nbsp;&nbsp; : 64</tt><tt><br>
        </tt><tt>address sizes&nbsp;&nbsp;&nbsp; : 39 bits physical, 48 bits virtual</tt><tt><br>
        </tt><tt>power management:</tt><tt><br>
        </tt></p>
      <p>above x 8 (processor 1, 2, 3, 4, 5, 6, 7).<br>
      </p>
      <p>[8.3.] Module information (from /proc/modules):</p>
      <p><tt>cfg80211 290816 0 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>amdgpu 3063808 7 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>gpu_sched 20480 1 amdgpu, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>i2c_algo_bit 16384 1 amdgpu, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>drm_kms_helper 135168 1 amdgpu, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>cfbfillrect 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>syscopyarea 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>cfbimgblt 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>sysfillrect 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>sysimgblt 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>snd_hda_codec_realtek 98304 1 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>fb_sys_fops 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>cfbcopyarea 16384 1 drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>snd_hda_codec_generic 61440 1 snd_hda_codec_realtek,
          Live 0x0000000000000000</tt><tt><br>
        </tt><tt>fb 77824 73 amdgpu,drm_kms_helper, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>font 20480 1 fb, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>fbdev 16384 1 fb, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>snd_hda_codec_hdmi 49152 1 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>ttm 73728 1 amdgpu, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>drm 323584 9 amdgpu,gpu_sched,drm_kms_helper,ttm, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>drm_panel_orientation_quirks 20480 1 drm, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>i2c_core 40960 4
          amdgpu,i2c_algo_bit,drm_kms_helper,drm, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>snd_hda_intel 28672 5 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>aesni_intel 364544 0 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>snd_intel_nhlt 16384 1 snd_hda_intel, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>video 40960 0 - Live 0x0000000000000000</tt><tt><br>
        </tt><tt>glue_helper 16384 1 aesni_intel, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>snd_hda_codec 86016 4
snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,
          Live 0x0000000000000000</tt><tt><br>
        </tt><tt>crypto_simd 16384 1 aesni_intel, Live
          0x0000000000000000</tt><tt><br>
        </tt><tt>snd_hda_core 53248 5
snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,
          Live 0x0000000000000000</tt><tt><br>
        </tt><tt>cryptd 16384 1 crypto_simd, Live 0x0000000000000000</tt><tt><br>
        </tt><tt>backlight 16384 2 amdgpu,video, Live 0x0000000000000000</tt><br>
      </p>
      <p>[8.4.] Loaded driver and hardware information (/proc/ioports,
        /proc/iomem)</p>
      <p>/proc/ioports:</p>
      <p><tt>0000-0000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : dma1</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pic1</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : timer0</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : timer1</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : keyboard</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : keyboard</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : rtc0</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : dma page reg</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pic2</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : dma2</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : fpu</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : PNP0C04:00</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : vga+</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : serial</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pnp 00:06</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pnp 00:01</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pnp 00:04</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pnp 00:04</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pnp 00:04</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : it87</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000-0000 : it87</tt><tt><br>
        </tt><tt>0000-0000 : PCI conf1</tt><tt><br>
        </tt><tt>0000-0000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : ACPI PM1a_EVT_BLK</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : ACPI PM1a_CNT_BLK</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : ACPI PM_TMR</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : ACPI GPE0_BLK</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : ACPI PM2_CNT_BLK</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : pnp 00:03</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : PCI Bus 0000:06</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : PCI Bus 0000:03</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:03:00.0</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : PCI Bus 0000:01</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : 0000:01:00.0</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:1f.3</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:1f.2</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:19.0</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:1f.2</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:1f.2</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:1f.2</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 0000-0000 : 0000:00:1f.2</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 0000-0000 : ahci</tt><tt><br>
        </tt></p>
      <p>/proc/iomem:</p>
      <p><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>00000000-00000000 : Video ROM</tt><tt><br>
        </tt><tt>00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : System ROM</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : Kernel code</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : Kernel data</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : Kernel bss</tt><tt><br>
        </tt><tt>00000000-00000000 : ACPI Non-volatile Storage</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>00000000-00000000 : ACPI Non-volatile Storage</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>00000000-00000000 : RAM buffer</tt><tt><br>
        </tt><tt>00000000-00000000 : PCI Bus 0000:00</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI Bus 0000:01</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:01:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:01:00.0</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI Bus 0000:06</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:06:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000-00000000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI Bus 0000:03</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:03:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000-00000000 : alx</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI Bus 0000:01</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:01:00.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : 0000:01:00.1</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000-00000000 : ICH HD audio</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:19.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : e1000e</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:14.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : xhci-hcd</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:1b.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : ICH HD audio</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:1f.3</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:1f.2</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : ahci</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:1d.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : ehci_hcd</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:1a.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : ehci_hcd</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:19.0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : e1000e</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : 0000:00:16.0</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : PCI MMCONFIG 0000 [bus 00-3f]</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : IOAPIC 0</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : HPET 0</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : PNP0103:00</tt><tt><br>
        </tt><tt>00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : pnp 00:00</tt><tt><br>
        </tt><tt>00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : dmar0</tt><tt><br>
        </tt><tt>00000000-00000000 : Local APIC</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>00000000-00000000 : Reserved</tt><tt><br>
        </tt><tt>&nbsp; 00000000-00000000 : INT0800:00</tt><tt><br>
        </tt><tt>&nbsp;&nbsp;&nbsp; 00000000-00000000 : pnp 00:07</tt><tt><br>
        </tt><tt>00000000-00000000 : System RAM</tt><tt><br>
        </tt><tt>00000000-00000000 : RAM buffer</tt><br>
      </p>
      <p>[8.5.] PCI information ('lspci -vvv' as root)</p>
      <p><tt>00:00.0 Host bridge: Intel Corporation 4th Gen Core
          Processor DRAM Controller (rev 06)<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 4th Gen Core
          Processor DRAM Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort+ &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [e0] Vendor Specific Information: Len=0c
          &lt;?&gt;<br>
          <br>
          00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen
          Core Processor PCI Express x16 Controller (rev 06) (prog-if 00
          [Normal decode])<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 25<br>
          &nbsp;&nbsp;&nbsp; Bus: primary=00, secondary=01, subordinate=01,
          sec-latency=0<br>
          &nbsp;&nbsp;&nbsp; I/O behind bridge: 0000e000-0000efff [size=4K]<br>
          &nbsp;&nbsp;&nbsp; Memory behind bridge: f7e00000-f7efffff [size=1M]<br>
          &nbsp;&nbsp;&nbsp; Prefetchable memory behind bridge:
          00000000e0000000-00000000f01fffff [size=258M]<br>
          &nbsp;&nbsp;&nbsp; Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort+ &lt;SERR- &lt;PERR-<br>
          &nbsp;&nbsp;&nbsp; BridgeCtl: Parity- SERR+ NoISA- VGA+ MAbort- &gt;Reset-
          FastB2B-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [88] Subsystem: Gigabyte Technology Co., Ltd
          Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16
          Controller<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee00218&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] Express (v2) Root Port (Slot+), MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 256 bytes, PhantFunc 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- RBE+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 256 bytes, MaxReadReq 128 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr- TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #2, Speed 8GT/s, Width x16, ASPM L0s
          L1, Exit Latency L0s &lt;256ns, L1 &lt;8us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 8GT/s, Width x16, TrErr- Train-
          SlotClk+ DLActive- BWMgmt+ ABWMgmt+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCap:&nbsp;&nbsp;&nbsp; AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
          HotPlug- Surprise-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Slot #1, PowerLimit 75.000W; Interlock- NoCompl+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCtl:&nbsp;&nbsp;&nbsp; Enable: AttnBtn- PwrFlt- MRL- PresDet-
          CmdCplt- HPIrq- LinkChg-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Control: AttnInd Unknown, PwrInd Unknown, Power-
          Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltSta:&nbsp;&nbsp;&nbsp; Status: AttnBtn- PowerFlt- MRL- CmdCplt-
          PresDet+ Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Changed: MRL- PresDet- LinkState-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
          PMEIntEna- CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCap: CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootSta: PME ReqID 0000, PMEStatus- PMEPending-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Not Supported,
          TimeoutDis-, LTR+, OBFF Via WAKE# ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR+, OBFF Via WAKE# ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn- EgressBlck-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -6dB,
          EqualizationComplete+, EqualizationPhase1+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2+, EqualizationPhase3+,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [100 v1] Virtual Channel<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Caps:&nbsp;&nbsp;&nbsp; LPEVC=0 RefClk=100ns PATEntryBits=1<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Arb:&nbsp;&nbsp;&nbsp; Fixed- WRR32- WRR64- WRR128-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ctrl:&nbsp;&nbsp;&nbsp; ArbSelect=Fixed<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status:&nbsp;&nbsp;&nbsp; InProgress-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; VC0:&nbsp;&nbsp;&nbsp; Caps:&nbsp;&nbsp;&nbsp; PATOffset=00 MaxTimeSlots=1
          RejSnoopTrans-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Arb:&nbsp;&nbsp;&nbsp; Fixed+ WRR32- WRR64- WRR128- TWRR128-
          WRR256-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ctrl:&nbsp;&nbsp;&nbsp; Enable+ ID=0 ArbSelect=Fixed TC/VC=ff<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status:&nbsp;&nbsp;&nbsp; NegoPending- InProgress-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [140 v1] Root Complex Link<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Desc:&nbsp;&nbsp;&nbsp; PortNumber=02 ComponentID=01 EltType=Config<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Link0:&nbsp;&nbsp;&nbsp; Desc:&nbsp;&nbsp;&nbsp; TargetPort=00 TargetComponent=01
          AssocRCRB- LinkType=MemMapped LinkValid+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Addr:&nbsp;&nbsp;&nbsp; 00000000fed19000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [d94 v1] #19<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: pcieport<br>
          <br>
          00:14.0 USB controller: Intel Corporation 9 Series Chipset
          Family USB xHCI Controller (prog-if 30 [XHCI])<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family USB xHCI Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 33<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f20000 (64-bit, non-prefetchable)
          [size=64K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [70] Power Management version 2<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
          PME(D0-,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 00000000fee00398&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: xhci_hcd<br>
          <br>
          00:16.0 Communication controller: Intel Corporation 9 Series
          Chipset Family ME Interface #1<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family ME Interface<br>
          &nbsp;&nbsp;&nbsp; Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 11<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f39000 (64-bit, non-prefetchable)
          [size=16]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [8c] MSI: Enable- Count=1/1 Maskable- 64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 0000000000000000&nbsp; Data: 0000<br>
          <br>
          00:19.0 Ethernet controller: Intel Corporation Ethernet
          Connection I217-V<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd Ethernet
          Connection I217-V<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 32<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f00000 (32-bit, non-prefetchable)
          [size=128K]<br>
          &nbsp;&nbsp;&nbsp; Region 1: Memory at f7f38000 (32-bit, non-prefetchable)
          [size=4K]<br>
          &nbsp;&nbsp;&nbsp; Region 2: I/O ports at f040 [size=32]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [c8] Power Management version 2<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 00000000fee00358&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [e0] PCI Advanced Features<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFCap: TP+ FLR+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFCtrl: FLR-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFStatus: TP-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: e1000e<br>
          <br>
          00:1a.0 USB controller: Intel Corporation 9 Series Chipset
          Family USB EHCI Controller #2 (prog-if 20 [EHCI])<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family USB EHCI Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 16<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f37000 (32-bit, non-prefetchable)
          [size=1K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] Power Management version 2<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [58] Debug port: BAR=1 offset=00a0<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [98] PCI Advanced Features<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFCap: TP+ FLR+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFCtrl: FLR-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFStatus: TP-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: ehci-pci<br>
          <br>
          00:1b.0 Audio device: Intel Corporation 9 Series Chipset
          Family HD Audio Controller<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family HD Audio Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 34<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f30000 (64-bit, non-prefetchable)
          [size=16K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] Power Management version 2<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 00000000fee003f8&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [70] Express (v1) Root Complex Integrated
          Endpoint, MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, PhantFunc 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- RBE-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 128 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr+ TransPend-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [100 v1] Virtual Channel<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Caps:&nbsp;&nbsp;&nbsp; LPEVC=0 RefClk=100ns PATEntryBits=1<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Arb:&nbsp;&nbsp;&nbsp; Fixed- WRR32- WRR64- WRR128-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ctrl:&nbsp;&nbsp;&nbsp; ArbSelect=Fixed<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status:&nbsp;&nbsp;&nbsp; InProgress-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; VC0:&nbsp;&nbsp;&nbsp; Caps:&nbsp;&nbsp;&nbsp; PATOffset=00 MaxTimeSlots=1
          RejSnoopTrans-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Arb:&nbsp;&nbsp;&nbsp; Fixed- WRR32- WRR64- WRR128- TWRR128-
          WRR256-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ctrl:&nbsp;&nbsp;&nbsp; Enable+ ID=0 ArbSelect=Fixed TC/VC=01<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status:&nbsp;&nbsp;&nbsp; NegoPending- InProgress-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; VC1:&nbsp;&nbsp;&nbsp; Caps:&nbsp;&nbsp;&nbsp; PATOffset=00 MaxTimeSlots=1
          RejSnoopTrans-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Arb:&nbsp;&nbsp;&nbsp; Fixed- WRR32- WRR64- WRR128- TWRR128-
          WRR256-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ctrl:&nbsp;&nbsp;&nbsp; Enable+ ID=2 ArbSelect=Fixed TC/VC=04<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status:&nbsp;&nbsp;&nbsp; NegoPending- InProgress-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: snd_hda_intel<br>
          &nbsp;&nbsp;&nbsp; Kernel modules: snd_hda_intel<br>
          <br>
          00:1c.0 PCI bridge: Intel Corporation 9 Series Chipset Family
          PCI Express Root Port 1 (rev d0) (prog-if 00 [Normal decode])<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 26<br>
          &nbsp;&nbsp;&nbsp; Bus: primary=00, secondary=02, subordinate=02,
          sec-latency=0<br>
          &nbsp;&nbsp;&nbsp; I/O behind bridge: 0000f000-00000fff [empty]<br>
          &nbsp;&nbsp;&nbsp; Memory behind bridge: fff00000-000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Prefetchable memory behind bridge:
          00000000fff00000-00000000000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort+ &lt;SERR- &lt;PERR-<br>
          &nbsp;&nbsp;&nbsp; BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- &gt;Reset-
          FastB2B-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [40] Express (v2) Root Port (Slot-), MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, PhantFunc 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- RBE+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 128 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr+ TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #1, Speed 5GT/s, Width x2, ASPM L0s
          L1, Exit Latency L0s &lt;1us, L1 &lt;4us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 2.5GT/s, Width x0, TrErr- Train+
          SlotClk+ DLActive- BWMgmt- ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
          PMEIntEna- CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCap: CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootSta: PME ReqID 0000, PMEStatus- PMEPending-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Range ABC, TimeoutDis+,
          LTR+, OBFF Via WAKE# ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR+, OBFF Disabled ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn- EgressBlck-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -3.5dB,
          EqualizationComplete-, EqualizationPhase1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee00238&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd
          9 Series Chipset Family PCI Express Root Port 1<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: pcieport<br>
          <br>
          00:1c.2 PCI bridge: Intel Corporation 9 Series Chipset Family
          PCI Express Root Port 3 (rev d0) (prog-if 00 [Normal decode])<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin C routed to IRQ 27<br>
          &nbsp;&nbsp;&nbsp; Bus: primary=00, secondary=03, subordinate=03,
          sec-latency=0<br>
          &nbsp;&nbsp;&nbsp; I/O behind bridge: 0000d000-0000dfff [size=4K]<br>
          &nbsp;&nbsp;&nbsp; Memory behind bridge: f7d00000-f7dfffff [size=1M]<br>
          &nbsp;&nbsp;&nbsp; Prefetchable memory behind bridge:
          00000000fff00000-00000000000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &lt;SERR- &lt;PERR-<br>
          &nbsp;&nbsp;&nbsp; BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- &gt;Reset-
          FastB2B-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, PhantFunc 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- RBE+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 128 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr+ TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #3, Speed 5GT/s, Width x1, ASPM L0s
          L1, Exit Latency L0s &lt;512ns, L1 &lt;16us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 2.5GT/s, Width x1, TrErr- Train-
          SlotClk+ DLActive+ BWMgmt+ ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCap:&nbsp;&nbsp;&nbsp; AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
          HotPlug- Surprise-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Slot #2, PowerLimit 10.000W; Interlock- NoCompl+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCtl:&nbsp;&nbsp;&nbsp; Enable: AttnBtn- PwrFlt- MRL- PresDet-
          CmdCplt- HPIrq- LinkChg-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Control: AttnInd Unknown, PwrInd Unknown, Power-
          Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltSta:&nbsp;&nbsp;&nbsp; Status: AttnBtn- PowerFlt- MRL- CmdCplt-
          PresDet+ Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Changed: MRL- PresDet- LinkState-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
          PMEIntEna- CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCap: CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootSta: PME ReqID 0000, PMEStatus- PMEPending-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Range ABC, TimeoutDis+,
          LTR+, OBFF Not Supported ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR+, OBFF Disabled ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn- EgressBlck-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -3.5dB,
          EqualizationComplete-, EqualizationPhase1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee00278&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd
          9 Series Chipset Family PCI Express Root Port 3<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: pcieport<br>
          <br>
          00:1c.3 PCI bridge: Intel Corporation 9 Series Chipset Family
          PCI Express Root Port 4 (rev d0) (prog-if 00 [Normal decode])<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin D routed to IRQ 28<br>
          &nbsp;&nbsp;&nbsp; Bus: primary=00, secondary=04, subordinate=05,
          sec-latency=0<br>
          &nbsp;&nbsp;&nbsp; I/O behind bridge: 0000f000-00000fff [empty]<br>
          &nbsp;&nbsp;&nbsp; Memory behind bridge: fff00000-000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Prefetchable memory behind bridge:
          00000000fff00000-00000000000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort+ &lt;SERR- &lt;PERR-<br>
          &nbsp;&nbsp;&nbsp; BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- &gt;Reset-
          FastB2B-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, PhantFunc 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- RBE+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 128 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr+ TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #4, Speed 5GT/s, Width x1, ASPM L0s
          L1, Exit Latency L0s &lt;1us, L1 &lt;16us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 2.5GT/s, Width x1, TrErr- Train-
          SlotClk+ DLActive+ BWMgmt+ ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCap:&nbsp;&nbsp;&nbsp; AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
          HotPlug- Surprise-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Slot #3, PowerLimit 10.000W; Interlock- NoCompl+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCtl:&nbsp;&nbsp;&nbsp; Enable: AttnBtn- PwrFlt- MRL- PresDet-
          CmdCplt- HPIrq- LinkChg-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Control: AttnInd Unknown, PwrInd Unknown, Power-
          Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltSta:&nbsp;&nbsp;&nbsp; Status: AttnBtn- PowerFlt- MRL- CmdCplt-
          PresDet+ Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Changed: MRL- PresDet- LinkState-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
          PMEIntEna- CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCap: CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootSta: PME ReqID 0000, PMEStatus- PMEPending-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Range ABC, TimeoutDis+,
          LTR+, OBFF Not Supported ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR+, OBFF Disabled ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn- EgressBlck-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -3.5dB,
          EqualizationComplete-, EqualizationPhase1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee002b8&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd
          9 Series Chipset Family PCI Express Root Port 4<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: pcieport<br>
          <br>
          00:1c.6 PCI bridge: Intel Corporation 9 Series Chipset Family
          PCI Express Root Port 7 (rev d0) (prog-if 00 [Normal decode])<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin C routed to IRQ 29<br>
          &nbsp;&nbsp;&nbsp; Bus: primary=00, secondary=06, subordinate=06,
          sec-latency=0<br>
          &nbsp;&nbsp;&nbsp; I/O behind bridge: 0000c000-0000cfff [size=4K]<br>
          &nbsp;&nbsp;&nbsp; Memory behind bridge: f7c00000-f7cfffff [size=1M]<br>
          &nbsp;&nbsp;&nbsp; Prefetchable memory behind bridge:
          00000000fff00000-00000000000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &lt;SERR- &lt;PERR-<br>
          &nbsp;&nbsp;&nbsp; BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- &gt;Reset-
          FastB2B-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, PhantFunc 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- RBE+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 128 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr+ TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #7, Speed 5GT/s, Width x1, ASPM L0s
          L1, Exit Latency L0s &lt;512ns, L1 &lt;16us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 5GT/s, Width x1, TrErr- Train-
          SlotClk+ DLActive+ BWMgmt+ ABWMgmt+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCap:&nbsp;&nbsp;&nbsp; AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
          HotPlug- Surprise-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Slot #6, PowerLimit 10.000W; Interlock- NoCompl+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltCtl:&nbsp;&nbsp;&nbsp; Enable: AttnBtn- PwrFlt- MRL- PresDet-
          CmdCplt- HPIrq- LinkChg-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Control: AttnInd Unknown, PwrInd Unknown, Power-
          Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; SltSta:&nbsp;&nbsp;&nbsp; Status: AttnBtn- PowerFlt- MRL- CmdCplt-
          PresDet+ Interlock-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Changed: MRL- PresDet- LinkState-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
          PMEIntEna- CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootCap: CRSVisible-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RootSta: PME ReqID 0000, PMEStatus- PMEPending-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Range ABC, TimeoutDis+,
          LTR+, OBFF Not Supported ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR+, OBFF Disabled ARIFwd-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn- EgressBlck-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -6dB,
          EqualizationComplete-, EqualizationPhase1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee002d8&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd
          9 Series Chipset Family PCI Express Root Port 7<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: pcieport<br>
          <br>
          00:1d.0 USB controller: Intel Corporation 9 Series Chipset
          Family USB EHCI Controller #1 (prog-if 20 [EHCI])<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family USB EHCI Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 23<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f36000 (32-bit, non-prefetchable)
          [size=1K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] Power Management version 2<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
          PME(D0+,D1-,D2-,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [58] Debug port: BAR=1 offset=00a0<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [98] PCI Advanced Features<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFCap: TP+ FLR+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFCtrl: FLR-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AFStatus: TP-<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: ehci-pci<br>
          <br>
          00:1f.0 ISA bridge: Intel Corporation 9 Series Chipset Family
          Z97 LPC Controller<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family Z97 LPC Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [e0] Vendor Specific Information: Len=0c
          &lt;?&gt;<br>
          <br>
          00:1f.2 SATA controller: Intel Corporation 9 Series Chipset
          Family SATA Controller [AHCI Mode] (prog-if 01 [AHCI 1.0])<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family SATA Controller [AHCI Mode]<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin B routed to IRQ 30<br>
          &nbsp;&nbsp;&nbsp; Region 0: I/O ports at f090 [size=8]<br>
          &nbsp;&nbsp;&nbsp; Region 1: I/O ports at f080 [size=4]<br>
          &nbsp;&nbsp;&nbsp; Region 2: I/O ports at f070 [size=8]<br>
          &nbsp;&nbsp;&nbsp; Region 3: I/O ports at f060 [size=4]<br>
          &nbsp;&nbsp;&nbsp; Region 4: I/O ports at f020 [size=32]<br>
          &nbsp;&nbsp;&nbsp; Region 5: Memory at f7f35000 (32-bit, non-prefetchable)
          [size=2K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee002f8&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [70] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0-,D1-,D2-,D3hot+,D3cold-)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: ahci<br>
          <br>
          00:1f.3 SMBus: Intel Corporation 9 Series Chipset Family SMBus
          Controller<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 9 Series Chipset
          Family SMBus Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin C routed to IRQ 11<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7f34000 (64-bit, non-prefetchable)
          [disabled] [size=256]<br>
          &nbsp;&nbsp;&nbsp; Region 4: I/O ports at f000 [size=32]<br>
          <br>
          01:00.0 VGA compatible controller: Advanced Micro Devices,
          Inc. [AMD/ATI] Ellesmere [Radeon RX 470/480/570/580] (rev e1)
          (prog-if 00 [VGA controller])<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd Device 2311<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 36<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at e0000000 (64-bit, prefetchable)
          [size=256M]<br>
          &nbsp;&nbsp;&nbsp; Region 2: Memory at f0000000 (64-bit, prefetchable)
          [size=2M]<br>
          &nbsp;&nbsp;&nbsp; Region 4: I/O ports at e000 [size=256]<br>
          &nbsp;&nbsp;&nbsp; Region 5: Memory at f7e00000 (32-bit, non-prefetchable)
          [size=256K]<br>
          &nbsp;&nbsp;&nbsp; Expansion ROM at 000c0000 [disabled] [size=128K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [48] Vendor Specific Information: Len=08
          &lt;?&gt;<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
          PME(D0-,D1+,D2+,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 256 bytes, PhantFunc 0, Latency
          L0s &lt;4us, L1 unlimited<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 256 bytes, MaxReadReq 512 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr+ UncorrErr- FatalErr- UnsuppReq+
          AuxPwr- TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #0, Speed 8GT/s, Width x16, ASPM L1,
          Exit Latency L1 &lt;1us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 8GT/s, Width x16, TrErr- Train-
          SlotClk+ DLActive- BWMgmt- ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Not Supported,
          TimeoutDis-, LTR+, OBFF Not Supported<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR+, OBFF Disabled<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -3.5dB,
          EqualizationComplete+, EqualizationPhase1+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 00000000fee00438&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [100 v1] Vendor Specific Information:
          ID=0001 Rev=1 Len=010 &lt;?&gt;<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [150 v2] Advanced Error Reporting<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESta:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UEMsk:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESvrt:&nbsp;&nbsp;&nbsp; DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CESta:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CEMsk:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AERCap:&nbsp;&nbsp;&nbsp; First Error Pointer: 00, ECRCGenCap+
          ECRCGenEn- ECRCChkCap+ ECRCChkEn-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MultHdrRecCap- MultHdrRecEn- TLPPfxPres-
          HdrLogCap-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; HeaderLog: 00000000 00000000 00000000 00000000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [200 v1] #15<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [270 v1] #19<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [2b0 v1] Address Translation Service (ATS)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ATSCap:&nbsp;&nbsp;&nbsp; Invalidate Queue Depth: 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ATSCtl:&nbsp;&nbsp;&nbsp; Enable-, Smallest Translation Unit: 00<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [2c0 v1] Page Request Interface (PRI)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PRICtl: Enable- Reset-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PRISta: RF- UPRGI- Stopped+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Page Request Capacity: 00000020, Page Request
          Allocation: 00000000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [2d0 v1] Process Address Space ID (PASID)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PASIDCap: Exec+ Priv+, Max PASID Width: 10<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PASIDCtl: Enable- Exec- Priv-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [320 v1] Latency Tolerance Reporting<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Max snoop latency: 71680ns<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Max no snoop latency: 71680ns<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [328 v1] Alternative Routing-ID
          Interpretation (ARI)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ARICap:&nbsp;&nbsp;&nbsp; MFVC- ACS-, Next Function: 1<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ARICtl:&nbsp;&nbsp;&nbsp; MFVC- ACS-, Function Group: 0<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [370 v1] L1 PM Substates<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
          ASPM_L1.1+ L1_PM_Substates+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; PortCommonModeRestoreTime=0us
          PortTPowerOnTime=170us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2-
          ASPM_L1.1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; T_CommonMode=0us LTR1.2_Threshold=0ns<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; L1SubCtl2: T_PwrOn=10us<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: amdgpu<br>
          &nbsp;&nbsp;&nbsp; Kernel modules: amdgpu<br>
          <br>
          01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
          Ellesmere [Radeon RX 580]<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd Device aaf0<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin B routed to IRQ 35<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7e60000 (64-bit, non-prefetchable)
          [size=16K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [48] Vendor Specific Information: Len=08
          &lt;?&gt;<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
          PME(D0-,D1-,D2-,D3hot-,D3cold-)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 256 bytes, PhantFunc 0, Latency
          L0s &lt;4us, L1 unlimited<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 256 bytes, MaxReadReq 512 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr+ UncorrErr- FatalErr- UnsuppReq+
          AuxPwr- TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #0, Speed 8GT/s, Width x16, ASPM L1,
          Exit Latency L1 &lt;1us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 8GT/s, Width x16, TrErr- Train-
          SlotClk+ DLActive- BWMgmt- ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Not Supported,
          TimeoutDis-, LTR+, OBFF Not Supported<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR-, OBFF Disabled<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -3.5dB,
          EqualizationComplete-, EqualizationPhase1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 00000000fee00418&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [100 v1] Vendor Specific Information:
          ID=0001 Rev=1 Len=010 &lt;?&gt;<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [150 v2] Advanced Error Reporting<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESta:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UEMsk:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESvrt:&nbsp;&nbsp;&nbsp; DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CESta:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CEMsk:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AERCap:&nbsp;&nbsp;&nbsp; First Error Pointer: 00, ECRCGenCap+
          ECRCGenEn- ECRCChkCap+ ECRCChkEn-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MultHdrRecCap- MultHdrRecEn- TLPPfxPres-
          HdrLogCap-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; HeaderLog: 00000000 00000000 00000000 00000000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [328 v1] Alternative Routing-ID
          Interpretation (ARI)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ARICap:&nbsp;&nbsp;&nbsp; MFVC- ACS-, Next Function: 0<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ARICtl:&nbsp;&nbsp;&nbsp; MFVC- ACS-, Function Group: 0<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: snd_hda_intel<br>
          &nbsp;&nbsp;&nbsp; Kernel modules: snd_hda_intel<br>
          <br>
          03:00.0 Ethernet controller: Qualcomm Atheros Killer E220x
          Gigabit Ethernet Controller (rev 10)<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd Killer E220x
          Gigabit Ethernet Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 18<br>
          &nbsp;&nbsp;&nbsp; Region 0: Memory at f7d00000 (64-bit, non-prefetchable)
          [size=256K]<br>
          &nbsp;&nbsp;&nbsp; Region 2: I/O ports at d000 [size=128]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [40] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
          PME(D0+,D1+,D2+,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [58] Express (v1) Endpoint, MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 4096 bytes, PhantFunc 0, Latency
          L0s unlimited, L1 unlimited<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- AttnBtn+ AttnInd+ PwrInd+ RBE+ FLReset-
          SlotPowerLimit 10.000W<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable+ Non-Fatal+
          Fatal+ Unsupported+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 512 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr+ TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #0, Speed 2.5GT/s, Width x1, ASPM L0s
          L1, Exit Latency L0s unlimited, L1 unlimited<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 2.5GT/s, Width x1, TrErr- Train-
          SlotClk+ DLActive- BWMgmt- ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [c0] MSI: Enable- Count=1/16 Maskable+
          64bit+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: 0000000000000000&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Masking: 00000000&nbsp; Pending: 00000000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [d8] MSI-X: Enable+ Count=16 Masked-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Vector table: BAR=0 offset=00002000<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PBA: BAR=0 offset=00003000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [100 v1] Advanced Error Reporting<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESta:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UEMsk:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESvrt:&nbsp;&nbsp;&nbsp; DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CESta:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CEMsk:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AERCap:&nbsp;&nbsp;&nbsp; First Error Pointer: 00, ECRCGenCap+
          ECRCGenEn- ECRCChkCap+ ECRCChkEn-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MultHdrRecCap- MultHdrRecEn- TLPPfxPres-
          HdrLogCap-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; HeaderLog: 00000000 00000000 00000000 00000000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [180 v1] Device Serial Number
          ff-ec-0a-e8-74-d4-35-ff<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: alx<br>
          <br>
          04:00.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev
          41) (prog-if 01 [Subtractive decode])<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 10<br>
          &nbsp;&nbsp;&nbsp; Bus: primary=04, secondary=05, subordinate=05,
          sec-latency=32<br>
          &nbsp;&nbsp;&nbsp; I/O behind bridge: 0000f000-00000fff [empty]<br>
          &nbsp;&nbsp;&nbsp; Memory behind bridge: fff00000-000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Prefetchable memory behind bridge:
          00000000fff00000-00000000000fffff [empty]<br>
          &nbsp;&nbsp;&nbsp; Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=medium
          &gt;TAbort- &lt;TAbort- &lt;MAbort+ &lt;SERR- &lt;PERR-<br>
          &nbsp;&nbsp;&nbsp; BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- &gt;Reset-
          FastB2B-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; PriDiscTmr- SecDiscTmr+ DiscTmrStat- DiscTmrSERREn-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [90] Power Management version 2<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=55mA
          PME(D0+,D1+,D2+,D3hot+,D3cold+)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [a0] Subsystem: Gigabyte Technology Co., Ltd
          82801 PCI Bridge<br>
          <br>
          06:00.0 SATA controller: Marvell Technology Group Ltd.
          88SE9172 SATA 6Gb/s Controller (rev 12) (prog-if 01 [AHCI
          1.0])<br>
          &nbsp;&nbsp;&nbsp; Subsystem: Gigabyte Technology Co., Ltd 88SE9172 SATA
          6Gb/s Controller<br>
          &nbsp;&nbsp;&nbsp; Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV-
          VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+<br>
          &nbsp;&nbsp;&nbsp; Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
          &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-<br>
          &nbsp;&nbsp;&nbsp; Latency: 0, Cache Line Size: 64 bytes<br>
          &nbsp;&nbsp;&nbsp; Interrupt: pin A routed to IRQ 31<br>
          &nbsp;&nbsp;&nbsp; Region 0: I/O ports at c040 [size=8]<br>
          &nbsp;&nbsp;&nbsp; Region 1: I/O ports at c030 [size=4]<br>
          &nbsp;&nbsp;&nbsp; Region 2: I/O ports at c020 [size=8]<br>
          &nbsp;&nbsp;&nbsp; Region 3: I/O ports at c010 [size=4]<br>
          &nbsp;&nbsp;&nbsp; Region 4: I/O ports at c000 [size=16]<br>
          &nbsp;&nbsp;&nbsp; Region 5: Memory at f7c10000 (32-bit, non-prefetchable)
          [size=512]<br>
          &nbsp;&nbsp;&nbsp; Expansion ROM at f7c00000 [disabled] [size=64K]<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [40] Power Management version 3<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
          PME(D0-,D1-,D2-,D3hot+,D3cold-)<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Address: fee00318&nbsp; Data: 0000<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [70] Express (v2) Legacy Endpoint, MSI 00<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap:&nbsp;&nbsp;&nbsp; MaxPayload 512 bytes, PhantFunc 0, Latency
          L0s &lt;1us, L1 &lt;8us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl:&nbsp;&nbsp;&nbsp; Report errors: Correctable- Non-Fatal-
          Fatal- Unsupported-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MaxPayload 128 bytes, MaxReadReq 512 bytes<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevSta:&nbsp;&nbsp;&nbsp; CorrErr- UncorrErr- FatalErr- UnsuppReq-
          AuxPwr- TransPend-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCap:&nbsp;&nbsp;&nbsp; Port #0, Speed 5GT/s, Width x1, ASPM L0s
          L1, Exit Latency L0s &lt;512ns, L1 &lt;64us<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl:&nbsp;&nbsp;&nbsp; ASPM Disabled; RCB 64 bytes Disabled-
          CommClk+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta:&nbsp;&nbsp;&nbsp; Speed 5GT/s, Width x1, TrErr- Train-
          SlotClk+ DLActive- BWMgmt- ABWMgmt-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCap2: Completion Timeout: Not Supported,
          TimeoutDis+, LTR-, OBFF Not Supported<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCap: 32bit- 64bit- 128bitCAS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; DevCtl2: Completion Timeout: 50us to 50ms,
          TimeoutDis-, LTR-, OBFF Disabled<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;AtomicOpsCtl: ReqEn-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
          SpeedDis-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Transmit Margin: Normal Operating Range,
          EnterModifiedCompliance- ComplianceSOS-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Compliance De-emphasis: -6dB<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; LnkSta2: Current De-emphasis Level: -6dB,
          EqualizationComplete-, EqualizationPhase1-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EqualizationPhase2-, EqualizationPhase3-,
          LinkEqualizationRequest-<br>
          &nbsp;&nbsp;&nbsp; Capabilities: [100 v1] Advanced Error Reporting<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESta:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UEMsk:&nbsp;&nbsp;&nbsp; DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; UESvrt:&nbsp;&nbsp;&nbsp; DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
          UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CESta:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; CEMsk:&nbsp;&nbsp;&nbsp; RxErr- BadTLP- BadDLLP- Rollover- Timeout-
          NonFatalErr+<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; AERCap:&nbsp;&nbsp;&nbsp; First Error Pointer: 00, ECRCGenCap-
          ECRCGenEn- ECRCChkCap- ECRCChkEn-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; MultHdrRecCap- MultHdrRecEn- TLPPfxPres-
          HdrLogCap-<br>
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; HeaderLog: 00000000 00000000 00000000 00000000<br>
          &nbsp;&nbsp;&nbsp; Kernel driver in use: ahci<br>
          <br>
        </tt>[8.6.] SCSI information (from /proc/scsi/scsi)</p>
      <p>Not applicable<br>
      </p>
      <p>[8.7.] Other information that might be relevant to the problem<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (please look in /proc and include all information that
        you<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; think to be relevant):</p>
      <p>N/A<br>
      </p>
      <p>[X.] Other notes, patches, fixes, workarounds:</p>
      <p>N/A</p>
      <p><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------BFAC371A5B27B4925B5C2198--

--===============1162300626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1162300626==--
