Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCD512752
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Apr 2022 01:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56710EB85;
	Wed, 27 Apr 2022 23:06:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422EB10EC4A
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Apr 2022 23:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6dfkVNCbKrE9k313d4bNoT4egKrbI2/4qryuc0NcwiHiL/5c3K0JVJOGnAzq3yLK+U5Q1DGFLWXkGMTvpp27lTEg9hd5GW7cjqXzF3W0qeb06/O1ne39LwjvfR8TGwMPheFqaOCqAg6HbHUmYfsSRXTLSPlp96Uu5jVMJc4bjSz+an7aKq//exJ2l6I7SFoPbnyda+/o7+5QSdugtW/Qx6f16FC9ihb/lKo1jYCXI8SM0DQ3vcmKw71ajDr5ahc2P/96NAeuRh7dKBdvK4KSnWy2f1ZJbTDQVDYaNvbEApTGz95pqsMjT66hUQVc39GBkVZshm1H8xcUDJQK0+Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmljSCdgvTsp925q8g8lfy6L2Ld2mGiUkGM5rNGgKUI=;
 b=HzZ8FhAZ7L6+BvFqw7SVPA6zf9h1ePTnDUu9Q7JB5E0aRnlHQXIhbK7G4uwlPkSiWm45xesH3MdIYzYTgWMFsS26u6AZxEiuLancY4aEd6fOh8tdFvdLA0QA5Ui1uma4tx5dLBbYWH2J4FxkfoEG8lzI/nRzBcj3gJnVFvfE2F85iei82ikLXXaBQ1lPGhCiGudtImK17zKUVKeXT8SamZ10l8NOmMNRag8K11FVr5SVR+efgOYdjd+F8nNjAoexgZpKE6dpLldqs5Vzp55/St4tAX3qalfakKJaRJcCYTR/0uX24bVCRVxbmFSOgBsgykLCJm9v0mk76FVOvw+Ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmljSCdgvTsp925q8g8lfy6L2Ld2mGiUkGM5rNGgKUI=;
 b=0an1tEjsOo6saamFWhzfJHkYPZJO2B15VlcuvXmzBE+zys5OfpXbxlov/bikP01uAf0Tf+8rxdZ5TS2K5RGSZ2fNcYEb2tgxyXjkgur1V/SM1T34XjI9TH5dGE3zW20BqbWhuUmyTs2rqFxSDfXQbk1SSHHfIzBAK/shUT/DQEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 23:06:13 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::b176:c415:e589:a801]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::b176:c415:e589:a801%3]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 23:06:13 +0000
Message-ID: <971b223d-5779-1b33-fbb0-c5f2f6e0213e@amd.com>
Date: Wed, 27 Apr 2022 19:06:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Kernel ooops/warnings with a steam game (Forza Horizon 5)
Content-Language: en-US
To: =?UTF-8?Q?Robert_=c5=9awi=c4=99cki?= <robert@swiecki.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <CAP145piim21dDoS7fsv9WQ-Toc3xr-xG7ayP7_T+F4SeS8AUmQ@mail.gmail.com>
From: philip yang <yangp@amd.com>
In-Reply-To: <CAP145piim21dDoS7fsv9WQ-Toc3xr-xG7ayP7_T+F4SeS8AUmQ@mail.gmail.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:610:11a::24) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b7bce13-143a-4843-7a26-08da28a2867e
X-MS-TrafficTypeDiagnostic: MW3PR12MB4476:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4476E735D54E8A9B6CFDD96FE6FA9@MW3PR12MB4476.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Df45QpaWNFbY8kJd+lsLZLRU4eVbPy3ssCNxonYDU9Lb8ULIaMG+0xDoUzU/LcOJE3jp2TtjohXn8jpdmb4Ah1qHrCAM6LwIXufL7zihSZhZ7bPCEtxHdHl/oESxCDV6Lft9t0wOf6bR9Dhc0TGZCwDKIO6M9unqIW2zOtZcwXz58ywTzMvGp9CSRaMbBLVhL8Yz9b2WzLmHDO2mIEfDEUkVZ0fUVuWPRDWHXKvcubkdRLYQemwQaIYsaOSq/rwhsqW/8lDBGwKvZDdte+MdpoNRz/1CPvAl9tGSJw/IklkAHYRLg2oXEj/VG3YfvZXi2ZDcUuG7PrEof3BwRxJ1M/kvw4PSJYJ41aKkyaE0eztP+JQ+03ggF2N06Pv3SP6ip/d704Ynueb2EOuPTNGpAdIdPIjv4xffTUyeBpG4vZpQq1vLie8yAkk9UgpbeVT9aBSepqik15LrXVmN6dNj2nt1/OM7IsYjZ0LO8mxdRoiOoQbtr/hGdG+ceA4xp6IzTsrvqM/QwqG3pGrfWLw1yQa4jmL/iUOQrKBm3Hh2Z8ZOmpQxa0vupHWeo7VW7H87kd+ukQO666rjUZIT5bHPqBuElbKnZyATtxwVxUfXxRUF7SOu3rNI4U0T37zsAzol2rf9rSr+1FCWcIK5OCcTucxc8SU/vsyxviyK5PeB7HBKa8uR6ozWDKyj/eeGcMMj0Epxxpvw39lnlNBzw/o1JXzkJ7PthKKGIfjomKgPbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(31696002)(6486002)(508600001)(38100700002)(30864003)(66946007)(8676002)(66556008)(66476007)(110136005)(8936002)(316002)(5660300002)(6512007)(26005)(83380400001)(31686004)(36756003)(6506007)(2616005)(53546011)(186003)(45080400002)(66574015)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEdWbDREZkJHZU9GMWliV2JDa01lZXNsZVg0bjFHSkZDZXkzZ0s0SU5oWnFJ?=
 =?utf-8?B?aWltWUZQYUZFdHBNbTY0VEsyTk4vOGxQMmlmZElvZnM2YlNvY1VVZ0dCQlY2?=
 =?utf-8?B?YWpJVEVPTnkvYksydVBTMytZVVpESXNNVldqdkl4L3B6WVFBb1BTeThrL1d6?=
 =?utf-8?B?RjQwWjk3SUpSTDUzaTluUUI3bXFCakFTMW02VFlYZUhpVkVtYi8xZ3EvMEFJ?=
 =?utf-8?B?clpFcnQwS2xJaXFXTXAzRktFOE5jcVlKbldXZERPZThmOXVIcW9LbWhoejBD?=
 =?utf-8?B?Qmo2aWhvbVhHRW9CZnA5WDZRckxWeTlUV1JveDFFUDNLcTJPYVdJRmpGN0o4?=
 =?utf-8?B?UUl5bmpRNzN3YkxseG12enAwKy9VT2VETG1tTHR2TmZ1TUk4OFZOU0xPQnRz?=
 =?utf-8?B?bXNEcU0rR2NidlNXZVk3blNNVGFGRlRDYlZGTUViSG0zU3p3OHVIMDFocEN6?=
 =?utf-8?B?NWw3OW5HZkZZdkltcXRQSDY3Y2o4MWRPb0ZuRnZJRWR6OG9CVGlZbVJ6NUJ6?=
 =?utf-8?B?ZWFQQlpaQ0J2cmVMU1FDcnZBSXdyV0w5ZURGalc5VTVMdTZ5aldaT0hZOHZq?=
 =?utf-8?B?dEtMS0FETGY2SG9OS3l6MDBONmtXK1lTNXh2QUJTbHhUbkhkMVVXMXBCQXpO?=
 =?utf-8?B?d00yR0RHZER5STc2SDdLRjI1UjIxUlc5eHpwL3BWZlZoYWpRbnR5aGZaelpK?=
 =?utf-8?B?aTEvQnRRUjQ4WjNqazdJck5ZbXkwNmZhMnVXcE1YVjRtVkhRS2dXQlJweEYw?=
 =?utf-8?B?QlJzcDF6Tmk3RlJQMjdtdkQzSTl2dHdaWmlUMThqTE9WUFBDaDhwZVNQYmR6?=
 =?utf-8?B?S3VqdGE4dlpTNXVqV0JmbzU3bnVIUkZlUE5iQ204TzFIb2hYV3FGb0F3UlhM?=
 =?utf-8?B?ZEZQRzFjZWI4TEdOQTI0TGNZSHNteUFsbE0vZFpXUjV6M29CK1RraGJid3Zr?=
 =?utf-8?B?QUtHM09oeWluTEVneE1ZTTAycThhcm9CQ1hOOUV1VldnN0ZrRnZ0VW9CVUMy?=
 =?utf-8?B?ZisvZVNkaFFlaXZnelRMZ0R1STJka2Nwc1FSUnBNTWZVZWJIZXArNHZRUEFH?=
 =?utf-8?B?emFxQVEzYUVyUEtEeGJWV2pqZDg2NjRLVjVtbHk2ZytMaG9LZ3UrQU5IRjBX?=
 =?utf-8?B?RldobFl0VlpFWjFEZlJYLzRtb1lDN1BIR3hCc3gvVllNWFB1dGRMZC9NTXJY?=
 =?utf-8?B?TDNvRitUZlZwMFNCSFJpcnovMGRCZXhLZzJGa0pNZTBId1lQQ0s5d3dzclY5?=
 =?utf-8?B?TGhoVkNIRkFuN1M0Q0kybGFOMVJVVFM1ZVVSSUhRMngwSXlXcmxLVWE2TkFk?=
 =?utf-8?B?ZW9rUXJOV01WVFZ4VlNCMkQ4UXM4Z0ZUaEQ1VW1zQWRPUWYyREg5NzVHMVNS?=
 =?utf-8?B?cWt1Tm5uR253VERpYUpoZ0NkdlZVb3VEeGdieHJESlJjaklpeUhaWnhmNkFF?=
 =?utf-8?B?RGxtenh6eWhsbGlwMWJRR3FYNGtxSkNRWENRU2NwQldxTVFhMmVYT3FHSlVP?=
 =?utf-8?B?ZmVrQlduTG4zZ0NBbld5aHBjS1NzSlRScXZZYWV3eGRIV2RsSnp6cDhGUlhB?=
 =?utf-8?B?WUJKT09QWWtNSUxMZ2JSRUM1b0dzSW93UHZmWmdSRFBEQWMxWGZnMXovZk5H?=
 =?utf-8?B?dWtXcmluaFRDMGJnNFhKdWJyVjVDMkh1Qk15SzhCZUdra1JNWVZSMzlhRWVl?=
 =?utf-8?B?WW5VajgxRFdFY2ZyMEpHejBJMllIOGdCZXFSSGpXamlSVllaVHBOblhicVhB?=
 =?utf-8?B?UG9nU3U2MzlGdnpQQk4rYWhFczhhcmxpN1NWQ3dxcnZCSlRDNldrOFlHZHYx?=
 =?utf-8?B?enBNV1pNTHJIaU1VRlY0ZEJsWGdnTU0wN1FpOTV3Z2REbEVtempKb1ZUTjBI?=
 =?utf-8?B?ZDlxSGxodFhNUVA5bEpCMXdQQy9BcThEdmF6WWdnUFRsR2NOU3lycUtqcDNi?=
 =?utf-8?B?SlVRSG9NbmNQRjEwR1hRNFNid2lVU0s2UGtWSEM3UklYL1pwUHRkL2NYYWhM?=
 =?utf-8?B?WVhiNm8zQXBRUzRaV1pJOUoyZURrTk1XaVdQTHJMQXorNTNuQmZNQ1FoOUJo?=
 =?utf-8?B?aDc0TTFKdnFwNUFCb1ZHZWY3Y3hLa2V0cmVvNWpMdXdQWUhZRzRwT0RKZUI5?=
 =?utf-8?B?WXNXTHQwakpmVmF5RXUzWEFsWDRlSmlvQ3VPNHMzQXVjSFFRSEwyNGQ3SUFn?=
 =?utf-8?B?SDk5ZjRvUWVtRkJiWGFWM01Kb2FKczRwMlBQZ1hzN3lQeVgyTmw0Q3g5SnZS?=
 =?utf-8?B?VWZSbjZtMHVtNVIzSWY5Mkl3VkhXL3NPMmhpMHFWVTEwU3NBckZta1ZxK1Nh?=
 =?utf-8?B?ay9IV3JpNGZhU092aUkzVHBxc1BEejIwNFQ4QjVPUWkyVmQzdkNRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7bce13-143a-4843-7a26-08da28a2867e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 23:06:13.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umE+3xTK3XUkOhRQPG30zrRCNwkNBC92mHUcSwR2AyHFuEVuVRUBPSFkmwfYlmqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Thanks for the report, please try this patch, I only compile test
      it on the latest amd-staging-drm-next branch, I don't have the
      setup to verify the fix.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <div class="moz-cite-prefix">On 2022-04-26 13:22, Robert Święcki
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAP145piim21dDoS7fsv9WQ-Toc3xr-xG7ayP7_T+F4SeS8AUmQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi,

While playing Forza Horizon 5 via Proton Experimental I got dmesg
ooopses/warnings. My data below, I also attach config for the kernel
(5.18.0-rc3). Please let me know if you need more information.

Card: RX 6800 XT
Mesa 22.0.2-1

$ uname -a
Linux jd 5.18.0-rc3+ #188 SMP PREEMPT_DYNAMIC Wed Apr 20 15:21:49 CEST
2022 x86_64 GNU/Linux

$ dmesg | grep amdgpu
[    1.397146] [drm] amdgpu kernel modesetting enabled.
[    1.397329] amdgpu: vga_switcheroo: detected switching method
\_SB_.PCI0.GPP8.SWUS.SWDS.VGA_.ATPX handle
[    1.401948] amdgpu: Ignoring ACPI CRAT on non-APU system
[    1.402119] amdgpu: Virtual CRAT table created for CPU
[    1.402286] amdgpu: Topology: Add CPU node
[    1.402489] fb0: switching to amdgpu from EFI VGA
[    1.402707] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[    1.402729] amdgpu 0000:0c:00.0: enabling device (0006 -&gt; 0007)
[    1.402754] amdgpu 0000:0c:00.0: amdgpu: Trusted Memory Zone (TMZ)
feature not supported
[    1.404358] amdgpu 0000:0c:00.0: amdgpu: Fetched VBIOS from VFCT
[    1.404360] amdgpu: ATOM BIOS: 113-D4120500-101
[    1.404389] amdgpu 0000:0c:00.0: amdgpu: MEM ECC is not presented.
[    1.404390] amdgpu 0000:0c:00.0: amdgpu: SRAM ECC is not presented.
[    1.404396] amdgpu 0000:0c:00.0: amdgpu: VRAM: 16368M
0x0000008000000000 - 0x00000083FEFFFFFF (16368M used)
[    1.404398] amdgpu 0000:0c:00.0: amdgpu: GART: 512M
0x0000000000000000 - 0x000000001FFFFFFF
[    1.404400] amdgpu 0000:0c:00.0: amdgpu: AGP: 267894784M
0x0000008400000000 - 0x0000FFFFFFFFFFFF
[    1.404431] [drm] amdgpu: 16368M of VRAM memory ready
[    1.404432] [drm] amdgpu: 16368M of GTT memory ready.
[    1.404647] amdgpu 0000:0c:00.0: amdgpu: PSP runtime database doesn't exist
[    3.574788] amdgpu 0000:0c:00.0: amdgpu: STB initialized to 2048 entries
[    3.575351] amdgpu 0000:0c:00.0: amdgpu: Will use PSP to load VCN firmware
[    3.771913] amdgpu 0000:0c:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
[    3.771937] amdgpu 0000:0c:00.0: amdgpu: use vbios provided pptable
[    3.845019] amdgpu 0000:0c:00.0: amdgpu: SMU is initialized successfully!
[    4.307684] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    4.307984] amdgpu: Virtual CRAT table created for GPU
[    4.308107] amdgpu: Topology: Add dGPU node [0x73bf:0x1002]
[    4.308110] kfd kfd: amdgpu: added device 1002:73bf
[    4.308135] amdgpu 0000:0c:00.0: amdgpu: SE 4, SH per SE 2, CU per
SH 10, active_cu_number 72
[    4.308169] amdgpu 0000:0c:00.0: amdgpu: ring gfx_0.0.0 uses VM inv
eng 0 on hub 0
[    4.308171] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.0.0 uses VM
inv eng 1 on hub 0
[    4.308172] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.1.0 uses VM
inv eng 4 on hub 0
[    4.308173] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.2.0 uses VM
inv eng 5 on hub 0
[    4.308175] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.3.0 uses VM
inv eng 6 on hub 0
[    4.308176] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.0.1 uses VM
inv eng 7 on hub 0
[    4.308177] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.1.1 uses VM
inv eng 8 on hub 0
[    4.308179] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.2.1 uses VM
inv eng 9 on hub 0
[    4.308180] amdgpu 0000:0c:00.0: amdgpu: ring comp_1.3.1 uses VM
inv eng 10 on hub 0
[    4.308181] amdgpu 0000:0c:00.0: amdgpu: ring kiq_2.1.0 uses VM inv
eng 11 on hub 0
[    4.308183] amdgpu 0000:0c:00.0: amdgpu: ring sdma0 uses VM inv eng
12 on hub 0
[    4.308184] amdgpu 0000:0c:00.0: amdgpu: ring sdma1 uses VM inv eng
13 on hub 0
[    4.308185] amdgpu 0000:0c:00.0: amdgpu: ring sdma2 uses VM inv eng
14 on hub 0
[    4.308187] amdgpu 0000:0c:00.0: amdgpu: ring sdma3 uses VM inv eng
15 on hub 0
[    4.308188] amdgpu 0000:0c:00.0: amdgpu: ring vcn_dec_0 uses VM inv
eng 0 on hub 1
[    4.308189] amdgpu 0000:0c:00.0: amdgpu: ring vcn_enc_0.0 uses VM
inv eng 1 on hub 1
[    4.308190] amdgpu 0000:0c:00.0: amdgpu: ring vcn_enc_0.1 uses VM
inv eng 4 on hub 1
[    4.308192] amdgpu 0000:0c:00.0: amdgpu: ring vcn_dec_1 uses VM inv
eng 5 on hub 1
[    4.308193] amdgpu 0000:0c:00.0: amdgpu: ring vcn_enc_1.0 uses VM
inv eng 6 on hub 1
[    4.308194] amdgpu 0000:0c:00.0: amdgpu: ring vcn_enc_1.1 uses VM
inv eng 7 on hub 1
[    4.308196] amdgpu 0000:0c:00.0: amdgpu: ring jpeg_dec uses VM inv
eng 8 on hub 1
[    4.310171] [drm] Initialized amdgpu 3.46.0 20150101 for
0000:0c:00.0 on minor 0
[    4.319774] fbcon: amdgpudrmfb (fb0) is primary device
[    4.746407] amdgpu 0000:0c:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[   20.155153] snd_hda_intel 0000:0c:00.1: bound 0000:0c:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])

$ glxinfo
name of display: :0
display: :0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
server glx extensions:
    GLX_ARB_context_flush_control, GLX_ARB_create_context,
    GLX_ARB_create_context_no_error, GLX_ARB_create_context_profile,
    GLX_ARB_create_context_robustness, GLX_ARB_fbconfig_float,
    GLX_ARB_framebuffer_sRGB, GLX_ARB_multisample,
    GLX_EXT_create_context_es2_profile, GLX_EXT_create_context_es_profile,
    GLX_EXT_fbconfig_packed_float, GLX_EXT_framebuffer_sRGB,
    GLX_EXT_get_drawable_type, GLX_EXT_libglvnd, GLX_EXT_no_config_context,
    GLX_EXT_texture_from_pixmap, GLX_EXT_visual_info, GLX_EXT_visual_rating,
    GLX_MESA_copy_sub_buffer, GLX_OML_swap_method, GLX_SGIS_multisample,
    GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group,
    GLX_SGI_make_current_read
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
client glx extensions:
    GLX_ARB_context_flush_control, GLX_ARB_create_context,
    GLX_ARB_create_context_no_error, GLX_ARB_create_context_profile,
    GLX_ARB_create_context_robustness, GLX_ARB_fbconfig_float,
    GLX_ARB_framebuffer_sRGB, GLX_ARB_get_proc_address, GLX_ARB_multisample,
    GLX_ATI_pixel_format_float, GLX_EXT_buffer_age,
    GLX_EXT_create_context_es2_profile, GLX_EXT_create_context_es_profile,
    GLX_EXT_fbconfig_packed_float, GLX_EXT_framebuffer_sRGB,
    GLX_EXT_import_context, GLX_EXT_no_config_context, GLX_EXT_swap_control,
    GLX_EXT_swap_control_tear, GLX_EXT_texture_from_pixmap,
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_INTEL_swap_event,
    GLX_MESA_copy_sub_buffer, GLX_MESA_multithread_makecurrent,
    GLX_MESA_query_renderer, GLX_MESA_swap_control, GLX_NV_float_buffer,
    GLX_OML_swap_method, GLX_OML_sync_control, GLX_SGIS_multisample,
    GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group,
    GLX_SGI_make_current_read, GLX_SGI_swap_control, GLX_SGI_video_sync
GLX version: 1.4
GLX extensions:
    GLX_ARB_create_context, GLX_ARB_create_context_no_error,
    GLX_ARB_create_context_profile, GLX_ARB_create_context_robustness,
    GLX_ARB_fbconfig_float, GLX_ARB_framebuffer_sRGB,
    GLX_ARB_get_proc_address, GLX_ARB_multisample, GLX_EXT_buffer_age,
    GLX_EXT_create_context_es2_profile, GLX_EXT_create_context_es_profile,
    GLX_EXT_fbconfig_packed_float, GLX_EXT_framebuffer_sRGB,
    GLX_EXT_no_config_context, GLX_EXT_swap_control,
    GLX_EXT_swap_control_tear, GLX_EXT_texture_from_pixmap,
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_MESA_copy_sub_buffer,
    GLX_MESA_query_renderer, GLX_MESA_swap_control, GLX_OML_swap_method,
    GLX_OML_sync_control, GLX_SGIS_multisample, GLX_SGIX_fbconfig,
    GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group, GLX_SGI_make_current_read,
    GLX_SGI_video_sync
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: AMD (0x1002)
    Device: AMD Radeon RX 6800 XT (sienna_cichlid, LLVM 14.0.1, DRM
3.46, 5.18.0-rc3+) (0x73bf)
    Version: 22.0.2
    Accelerated: yes
    Video memory: 16384MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.6
    Max compat profile version: 4.6
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 15888 MB, largest block: 15888 MB
    VBO free aux. memory - total: 4294901742 MB, largest block: 4294901742 MB
    Texture free memory - total: 15888 MB, largest block: 15888 MB
    Texture free aux. memory - total: 4294901742 MB, largest block:
4294901742 MB
    Renderbuffer free memory - total: 15888 MB, largest block: 15888 MB
    Renderbuffer free aux. memory - total: 4294901742 MB, largest
block: 4294901742 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 16384 MB
    Total available memory: 4294918144 MB
    Currently available dedicated video memory: 15888 MB
OpenGL vendor string: AMD
OpenGL renderer string: AMD Radeon RX 6800 XT (sienna_cichlid, LLVM
14.0.1, DRM 3.46, 5.18.0-rc3+)
OpenGL core profile version string: 4.6 (Core Profile) Mesa 22.0.2
OpenGL core profile shading language version string: 4.60
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate,
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced,
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect,
    GL_AMD_performance_monitor, GL_AMD_pinned_memory,
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture,
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax,
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer,
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3,
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility,
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility,
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance,
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended,
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture,
    GL_ARB_clip_control, GL_ARB_color_buffer_float,
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader,
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted,
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image,
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float,
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access,
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend,
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect,
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts,
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location,
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport,
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments,
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB,
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv,
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64,
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex,
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays,
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2,
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment,
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect,
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile,
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object,
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp,
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query,
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object,
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness,
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map,
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects,
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters,
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock,
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote,
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size,
    GL_ARB_shader_objects, GL_ARB_shader_precision,
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object,
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples,
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array,
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include,
    GL_ARB_shading_language_packing, GL_ARB_sparse_buffer,
    GL_ARB_sparse_texture, GL_ARB_sparse_texture2,
    GL_ARB_sparse_texture_clamp, GL_ARB_spirv_extensions,
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader,
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object,
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range,
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc,
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic,
    GL_ARB_texture_float, GL_ARB_texture_gather,
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample,
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels,
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg,
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8,
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample,
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query,
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3,
    GL_ARB_transform_feedback_instanced,
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object,
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object,
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding,
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader,
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev,
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, GL_ATI_meminfo,
    GL_ATI_texture_float, GL_ATI_texture_mirror_once,
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr,
    GL_EXT_blend_equation_separate, GL_EXT_demote_to_helper_invocation,
    GL_EXT_depth_bounds_test, GL_EXT_draw_buffers2, GL_EXT_draw_instanced,
    GL_EXT_framebuffer_blit, GL_EXT_framebuffer_multisample,
    GL_EXT_framebuffer_multisample_blit_scaled, GL_EXT_framebuffer_object,
    GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, GL_EXT_memory_object_fd,
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float,
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp,
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd,
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store,
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical,
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1,
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc,
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer,
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8,
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod,
    GL_EXT_texture_shared_exponent, GL_EXT_texture_snorm,
    GL_EXT_texture_swizzle, GL_EXT_timer_query, GL_EXT_transform_feedback,
    GL_EXT_vertex_array_bgra, GL_EXT_vertex_attrib_64bit,
    GL_EXT_window_rectangles, GL_IBM_multimode_draw_arrays,
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced,
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error,
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior,
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr,
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y,
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions,
    GL_MESA_texture_signed_rgba, GL_NVX_gpu_memory_info,
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives,
    GL_NV_conditional_render, GL_NV_copy_image, GL_NV_depth_clamp,
    GL_NV_packed_depth_stencil, GL_NV_shader_atomic_int64,
    GL_NV_texture_barrier, GL_NV_vdpau_interop, GL_OES_EGL_image, GL_S3_s3tc

OpenGL version string: 4.6 (Compatibility Profile) Mesa 22.0.2
OpenGL shading language version string: 4.60
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate,
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced,
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor,
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object,
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export,
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4,
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index,
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5,
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility,
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility,
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance,
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended,
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture,
    GL_ARB_clip_control, GL_ARB_color_buffer_float, GL_ARB_compatibility,
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader,
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted,
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image,
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float,
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control,
    GL_ARB_direct_state_access, GL_ARB_draw_buffers,
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex,
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts,
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location,
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport,
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow,
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments,
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB,
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv,
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64,
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex,
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays,
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2,
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment,
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect,
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query,
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile,
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object,
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp,
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query,
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object,
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness,
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map,
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects,
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters,
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock,
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote,
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size,
    GL_ARB_shader_objects, GL_ARB_shader_precision,
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object,
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples,
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array,
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack,
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing,
    GL_ARB_shadow, GL_ARB_sparse_buffer, GL_ARB_sparse_texture,
    GL_ARB_sparse_texture2, GL_ARB_sparse_texture_clamp,
    GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, GL_ARB_sync,
    GL_ARB_tessellation_shader, GL_ARB_texture_barrier,
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object,
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range,
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc,
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map,
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add,
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar,
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic,
    GL_ARB_texture_float, GL_ARB_texture_gather,
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat,
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two,
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod,
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui,
    GL_ARB_texture_stencil8, GL_ARB_texture_storage,
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle,
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2,
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced,
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix,
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra,
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit,
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object,
    GL_ARB_vertex_program, GL_ARB_vertex_shader,
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev,
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate,
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_meminfo,
    GL_ATI_separate_stencil, GL_ATI_texture_compression_3dc,
    GL_ATI_texture_env_combine3, GL_ATI_texture_float,
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync,
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color,
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate,
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array,
    GL_EXT_copy_texture, GL_EXT_demote_to_helper_invocation,
    GL_EXT_depth_bounds_test, GL_EXT_direct_state_access,
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_draw_range_elements,
    GL_EXT_fog_coord, GL_EXT_framebuffer_blit, GL_EXT_framebuffer_multisample,
    GL_EXT_framebuffer_multisample_blit_scaled, GL_EXT_framebuffer_object,
    GL_EXT_framebuffer_sRGB, GL_EXT_gpu_program_parameters,
    GL_EXT_gpu_shader4, GL_EXT_memory_object, GL_EXT_memory_object_fd,
    GL_EXT_multi_draw_arrays, GL_EXT_packed_depth_stencil,
    GL_EXT_packed_float, GL_EXT_packed_pixels, GL_EXT_pixel_buffer_object,
    GL_EXT_point_parameters, GL_EXT_polygon_offset_clamp,
    GL_EXT_provoking_vertex, GL_EXT_rescale_normal, GL_EXT_secondary_color,
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_specular_color,
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store,
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical,
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap,
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D,
    GL_EXT_texture_array, GL_EXT_texture_buffer_object,
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc,
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc,
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp,
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine,
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic,
    GL_EXT_texture_integer, GL_EXT_texture_lod_bias,
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_object,
    GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8,
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod,
    GL_EXT_texture_shared_exponent, GL_EXT_texture_snorm,
    GL_EXT_texture_swizzle, GL_EXT_timer_query, GL_EXT_transform_feedback,
    GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, GL_EXT_vertex_attrib_64bit,
    GL_EXT_window_rectangles, GL_IBM_multimode_draw_arrays,
    GL_IBM_rasterpos_clip, GL_IBM_texture_mirrored_repeat,
    GL_INGR_blend_func_separate, GL_INTEL_blackhole_render,
    GL_KHR_blend_equation_advanced, GL_KHR_context_flush_control,
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile,
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness,
    GL_KHR_texture_compression_astc_ldr,
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y,
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions,
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_NVX_gpu_memory_info,
    GL_NV_alpha_to_coverage_dither_control, GL_NV_blend_square,
    GL_NV_compute_shader_derivatives, GL_NV_conditional_render,
    GL_NV_copy_depth_to_color, GL_NV_copy_image, GL_NV_depth_clamp,
    GL_NV_fog_distance, GL_NV_half_float, GL_NV_light_max_exponent,
    GL_NV_packed_depth_stencil, GL_NV_primitive_restart,
    GL_NV_shader_atomic_int64, GL_NV_texgen_reflection, GL_NV_texture_barrier,
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_NV_vdpau_interop,
    GL_OES_EGL_image, GL_OES_read_format, GL_S3_s3tc,
    GL_SGIS_generate_mipmap, GL_SGIS_texture_border_clamp,
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays

OpenGL ES profile version string: OpenGL ES 3.2 Mesa 22.0.2
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_framebuffer_multisample_advanced, GL_AMD_performance_monitor,
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order,
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5,
    GL_APPLE_texture_max_level, GL_EXT_EGL_image_storage,
    GL_EXT_base_instance, GL_EXT_blend_func_extended, GL_EXT_blend_minmax,
    GL_EXT_buffer_storage, GL_EXT_clear_texture, GL_EXT_clip_control,
    GL_EXT_clip_cull_distance, GL_EXT_color_buffer_float,
    GL_EXT_color_buffer_half_float, GL_EXT_compressed_ETC1_RGB8_sub_texture,
    GL_EXT_copy_image, GL_EXT_demote_to_helper_invocation, GL_EXT_depth_clamp,
    GL_EXT_discard_framebuffer, GL_EXT_disjoint_timer_query,
    GL_EXT_draw_buffers, GL_EXT_draw_buffers_indexed,
    GL_EXT_draw_elements_base_vertex, GL_EXT_draw_instanced,
    GL_EXT_float_blend, GL_EXT_frag_depth, GL_EXT_geometry_point_size,
    GL_EXT_geometry_shader, GL_EXT_gpu_shader5, GL_EXT_map_buffer_range,
    GL_EXT_memory_object, GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays,
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp,
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra,
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control,
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects,
    GL_EXT_shader_group_vote, GL_EXT_shader_implicit_conversions,
    GL_EXT_shader_integer_mix, GL_EXT_shader_io_blocks,
    GL_EXT_shader_samples_identical, GL_EXT_tessellation_point_size,
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp,
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc,
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc,
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb,
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic,
    GL_EXT_texture_format_BGRA8888, GL_EXT_texture_mirror_clamp_to_edge,
    GL_EXT_texture_norm16, GL_EXT_texture_query_lod, GL_EXT_texture_rg,
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8,
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod,
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view,
    GL_EXT_unpack_subimage, GL_EXT_window_rectangles,
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced,
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error,
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior,
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr,
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra,
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions,
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives,
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments,
    GL_NV_image_formats, GL_NV_pixel_buffer_object, GL_NV_read_buffer,
    GL_NV_read_depth, GL_NV_read_depth_stencil, GL_NV_read_stencil,
    GL_OES_EGL_image, GL_OES_EGL_image_external,
    GL_OES_EGL_image_external_essl3, GL_OES_EGL_sync,
    GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, GL_OES_depth24,
    GL_OES_depth_texture, GL_OES_depth_texture_cube_map,
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex,
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap,
    GL_OES_geometry_point_size, GL_OES_geometry_shader,
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer,
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box,
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading,
    GL_OES_sample_variables, GL_OES_shader_image_atomic,
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation,
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context,
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader,
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer,
    GL_OES_texture_cube_map_array, GL_OES_texture_float,
    GL_OES_texture_float_linear, GL_OES_texture_half_float,
    GL_OES_texture_half_float_linear, GL_OES_texture_npot,
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array,
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float,
    GL_OES_viewport_array



[213178.377749] ------------[ cut here ]------------
[213178.377764] WARNING: CPU: 31 PID: 234755 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:665
amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213178.377922] Modules linked in: hfsplus hfs ntfs msdos nfnetlink
snd_seq_dummy snd_hrtimer amd_pstate snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep nls_iso8859_2
nls_cp852 snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
input_leds joydev intel_rapl_common mxm_wmi snd_seq wmi_bmof
snd_seq_device corsair_psu snd_timer ucsi_ccg sp5100_tco ccp
typec_ucsi snd typec soundcore sch_fq asus_wmi_ec_sensors amd_sfh
nct6775 hwmon_vid k10temp sctp ip6_udp_tunnel udp_tunnel ip_tables
x_tables dm_crypt uas usb_storage hid_generic usbhid hid amdgpu
drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit drm_dp_helper cec
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i2c_designware_pci
drm aesni_intel i2c_piix4 xhci_pci i2c_designware_core backlight ice
xhci_pci_renesas nvme wmi
[213178.377953] CPU: 31 PID: 234755 Comm: ForzaHorizon5.e Tainted: G
     W         5.18.0-rc3+ #188
[213178.377955] Hardware name: ASUS System Product Name/ROG CROSSHAIR
VIII FORMULA, BIOS 4006 03/07/2022
[213178.377956] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213178.378039] Code: f8 8a 92 c0 48 c7 c7 20 7d ac c0 e8 05 fd 0f fd
eb c0 48 c7 c6 60 0c 98 c0 bf 02 00 00 00 e8 b2 b4 c1 00 bd f2 ff ff
ff eb b0 &lt;0f&gt; 0b eb f5 bd fd ff ff ff eb a5 48 83 b8 a0 00 00 00 00 0f
84 4e
[213178.378040] RSP: 0018:ffffaf0b07ab7bc8 EFLAGS: 00010286
[213178.378042] RAX: ffff9c7e01266000 RBX: ffff9c7e11cbc000 RCX:
0000000000000000
[213178.378043] RDX: 0000000000001000 RSI: ffff9c7e01266000 RDI:
ffff9c7e59e37800
[213178.378043] RBP: ffffaf0b07ab7c58 R08: ffff9c7e33ef0838 R09:
ffff9c7e01266000
[213178.378044] R10: 00000000000002f0 R11: 0000000000000000 R12:
ffff9c80efd13360
[213178.378045] R13: 0000000038100000 R14: ffff9c7e33ef0958 R15:
ffff9c7e59e37858
[213178.378046] FS:  0000000024e0f640(0000) GS:ffff9c850f1c0000(0000)
knlGS:000000001bd10000
[213178.378048] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[213178.378048] CR2: 0000381c00887020 CR3: 00000001436f0000 CR4:
0000000000750ee0
[213178.378049] PKRU: 55555554
[213178.378050] Call Trace:
[213178.378052]  &lt;TASK&gt;
[213178.378054]  amdgpu_cs_parser_bos+0x12b/0x540 [amdgpu]
[213178.378134]  amdgpu_cs_ioctl+0xa8/0x180 [amdgpu]
[213178.378214]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213178.378294]  drm_ioctl_kernel+0x91/0x140 [drm]
[213178.378317]  drm_ioctl+0x1ce/0x400 [drm]
[213178.378326]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213178.378409]  ? seccomp_run_filters+0x96/0x140
[213178.378414]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu]
[213178.378489]  __x64_sys_ioctl+0x82/0xc0
[213178.378493]  do_syscall_64+0x34/0x80
[213178.378498]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[213178.378500] RIP: 0033:0x7f91d22ff737
[213178.378501] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff
ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 46 0f 00 f7 d8 64 89
01 48
[213178.378502] RSP: 002b:0000000024e0d4a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[213178.378504] RAX: ffffffffffffffda RBX: 0000000024e0d530 RCX:
00007f91d22ff737
[213178.378504] RDX: 0000000024e0d530 RSI: 00000000c0186444 RDI:
0000000000000021
[213178.378505] RBP: 00000000c0186444 R08: 00007f912c02fa40 R09:
0000000024e0d738
[213178.378505] R10: 00007f915433d800 R11: 0000000000000246 R12:
00007f912c02f9e0
[213178.378506] R13: 0000000000000021 R14: 00007f912c02fae0 R15:
00007f912c02fb10
[213178.378507]  &lt;/TASK&gt;
[213178.378507] ---[ end trace 0000000000000000 ]---
[213178.378509] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!
[213291.130392] ------------[ cut here ]------------
[213291.130395] WARNING: CPU: 11 PID: 236033 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:665
amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213291.130482] Modules linked in: hfsplus hfs ntfs msdos nfnetlink
snd_seq_dummy snd_hrtimer amd_pstate snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep nls_iso8859_2
nls_cp852 snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
input_leds joydev intel_rapl_common mxm_wmi snd_seq wmi_bmof
snd_seq_device corsair_psu snd_timer ucsi_ccg sp5100_tco ccp
typec_ucsi snd typec soundcore sch_fq asus_wmi_ec_sensors amd_sfh
nct6775 hwmon_vid k10temp sctp ip6_udp_tunnel udp_tunnel ip_tables
x_tables dm_crypt uas usb_storage hid_generic usbhid hid amdgpu
drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit drm_dp_helper cec
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i2c_designware_pci
drm aesni_intel i2c_piix4 xhci_pci i2c_designware_core backlight ice
xhci_pci_renesas nvme wmi
[213291.130509] CPU: 11 PID: 236033 Comm: ForzaHorizon5.e Tainted: G
     W         5.18.0-rc3+ #188
[213291.130511] Hardware name: ASUS System Product Name/ROG CROSSHAIR
VIII FORMULA, BIOS 4006 03/07/2022
[213291.130512] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213291.130575] Code: f8 8a 92 c0 48 c7 c7 20 7d ac c0 e8 05 fd 0f fd
eb c0 48 c7 c6 60 0c 98 c0 bf 02 00 00 00 e8 b2 b4 c1 00 bd f2 ff ff
ff eb b0 &lt;0f&gt; 0b eb f5 bd fd ff ff ff eb a5 48 83 b8 a0 00 00 00 00 0f
84 4e
[213291.130576] RSP: 0018:ffffaf0b074d7bc8 EFLAGS: 00010282
[213291.130578] RAX: ffff9c7e1751e000 RBX: ffff9c7e0f99f000 RCX:
0000000000000000
[213291.130578] RDX: 0000000000001000 RSI: ffff9c7e1751e000 RDI:
ffff9c7e337eb800
[213291.130579] RBP: ffffaf0b074d7c58 R08: ffff9c7e6400d838 R09:
ffff9c7e1751e000
[213291.130580] R10: 00000000000002f0 R11: 0000000000000000 R12:
ffff9c7e3278a180
[213291.130580] R13: 00000000381d0000 R14: ffff9c7e6400d9e8 R15:
ffff9c7e337eb858
[213291.130581] FS:  000000002376f640(0000) GS:ffff9c850ecc0000(0000)
knlGS:000000001bd60000
[213291.130582] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[213291.130582] CR2: 0000794c00654020 CR3: 000000011baa8000 CR4:
0000000000750ee0
[213291.130583] DR0: 0000028ffd932280 DR1: 0000028ffd932190 DR2:
0000028ffd9321c0
[213291.130583] DR3: 0000028ffd932bf0 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[213291.130584] PKRU: 55555554
[213291.130584] Call Trace:
[213291.130587]  &lt;TASK&gt;
[213291.130589]  amdgpu_cs_parser_bos+0x12b/0x540 [amdgpu]
[213291.130652]  amdgpu_cs_ioctl+0xa8/0x180 [amdgpu]
[213291.130718]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213291.130783]  drm_ioctl_kernel+0x91/0x140 [drm]
[213291.130795]  drm_ioctl+0x1ce/0x400 [drm]
[213291.130804]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213291.130868]  ? seccomp_run_filters+0x96/0x140
[213291.130872]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu]
[213291.130935]  __x64_sys_ioctl+0x82/0xc0
[213291.130939]  do_syscall_64+0x34/0x80
[213291.130941]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[213291.130943] RIP: 0033:0x7f323baff737
[213291.130944] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff
ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 46 0f 00 f7 d8 64 89
01 48
[213291.130945] RSP: 002b:000000002376d8f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[213291.130946] RAX: ffffffffffffffda RBX: 000000002376d970 RCX:
00007f323baff737
[213291.130947] RDX: 000000002376d970 RSI: 00000000c0186444 RDI:
000000000000001c
[213291.130947] RBP: 00000000c0186444 R08: 00007f31c4ca9ec0 R09:
000000002376db78
[213291.130948] R10: 00007f31c45bf8d0 R11: 0000000000000246 R12:
00007f31c4ca9e70
[213291.130948] R13: 000000000000001c R14: 00007f31c4dd1130 R15:
0000000000000000
[213291.130949]  &lt;/TASK&gt;
[213291.130949] ---[ end trace 0000000000000000 ]---
[213291.130950] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!
[213384.142672] ------------[ cut here ]------------
[213384.142675] WARNING: CPU: 24 PID: 237242 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:665
amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213384.142780] Modules linked in: hfsplus hfs ntfs msdos nfnetlink
snd_seq_dummy snd_hrtimer amd_pstate snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep nls_iso8859_2
nls_cp852 snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
input_leds joydev intel_rapl_common mxm_wmi snd_seq wmi_bmof
snd_seq_device corsair_psu snd_timer ucsi_ccg sp5100_tco ccp
typec_ucsi snd typec soundcore sch_fq asus_wmi_ec_sensors amd_sfh
nct6775 hwmon_vid k10temp sctp ip6_udp_tunnel udp_tunnel ip_tables
x_tables dm_crypt uas usb_storage hid_generic usbhid hid amdgpu
drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit drm_dp_helper cec
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i2c_designware_pci
drm aesni_intel i2c_piix4 xhci_pci i2c_designware_core backlight ice
xhci_pci_renesas nvme wmi
[213384.142814] CPU: 24 PID: 237242 Comm: ForzaHorizon5.e Tainted: G
     W         5.18.0-rc3+ #188
[213384.142815] Hardware name: ASUS System Product Name/ROG CROSSHAIR
VIII FORMULA, BIOS 4006 03/07/2022
[213384.142817] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213384.142905] Code: f8 8a 92 c0 48 c7 c7 20 7d ac c0 e8 05 fd 0f fd
eb c0 48 c7 c6 60 0c 98 c0 bf 02 00 00 00 e8 b2 b4 c1 00 bd f2 ff ff
ff eb b0 &lt;0f&gt; 0b eb f5 bd fd ff ff ff eb a5 48 83 b8 a0 00 00 00 00 0f
84 4e
[213384.142906] RSP: 0018:ffffaf0b1107fbc8 EFLAGS: 00010286
[213384.142907] RAX: ffff9c7e16380000 RBX: ffff9c7e1de08400 RCX:
0000000000000000
[213384.142908] RDX: 0000000000001000 RSI: ffff9c7e16380000 RDI:
ffff9c7e368f1400
[213384.142909] RBP: ffffaf0b1107fc58 R08: ffff9c7e34bef838 R09:
ffff9c7e16380000
[213384.142910] R10: 00000000000002f0 R11: 0000000000000000 R12:
ffff9c7e0d9828a0
[213384.142910] R13: 00000000383e0000 R14: ffff9c7e34bef958 R15:
ffff9c7e368f1458
[213384.142911] FS:  0000000025cef640(0000) GS:ffff9c850f000000(0000)
knlGS:000000001bd10000
[213384.142913] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[213384.142913] CR2: 00007f73f0e19000 CR3: 000000011b41c000 CR4:
0000000000750ee0
[213384.142914] PKRU: 55555554
[213384.142915] Call Trace:
[213384.142917]  &lt;TASK&gt;
[213384.142919]  amdgpu_cs_parser_bos+0x12b/0x540 [amdgpu]
[213384.143007]  amdgpu_cs_ioctl+0xa8/0x180 [amdgpu]
[213384.143094]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213384.143181]  drm_ioctl_kernel+0x91/0x140 [drm]
[213384.143194]  ? do_fault+0x1c8/0x480
[213384.143198]  drm_ioctl+0x1ce/0x400 [drm]
[213384.143209]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213384.143300]  ? seccomp_run_filters+0x96/0x140
[213384.143303]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu]
[213384.143386]  __x64_sys_ioctl+0x82/0xc0
[213384.143390]  do_syscall_64+0x34/0x80
[213384.143392]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[213384.143394] RIP: 0033:0x7f7406aff737
[213384.143396] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff
ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 46 0f 00 f7 d8 64 89
01 48
[213384.143397] RSP: 002b:0000000025ced8e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[213384.143399] RAX: ffffffffffffffda RBX: 0000000025ced970 RCX:
00007f7406aff737
[213384.143400] RDX: 0000000025ced970 RSI: 00000000c0186444 RDI:
000000000000001c
[213384.143400] RBP: 00000000c0186444 R08: 00007f736402f540 R09:
0000000025cedb78
[213384.143401] R10: 00007f7384519d20 R11: 0000000000000246 R12:
00007f736402f4e0
[213384.143402] R13: 000000000000001c R14: 00007f736402f5e0 R15:
00007f736402f610
[213384.143403]  &lt;/TASK&gt;
[213384.143403] ---[ end trace 0000000000000000 ]---
[213384.143404] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!
[213553.789398] ------------[ cut here ]------------
[213553.789399] WARNING: CPU: 11 PID: 239394 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:665
amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213553.789485] Modules linked in: hfsplus hfs ntfs msdos nfnetlink
snd_seq_dummy snd_hrtimer amd_pstate snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep nls_iso8859_2
nls_cp852 snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
input_leds joydev intel_rapl_common mxm_wmi snd_seq wmi_bmof
snd_seq_device corsair_psu snd_timer ucsi_ccg sp5100_tco ccp
typec_ucsi snd typec soundcore sch_fq asus_wmi_ec_sensors amd_sfh
nct6775 hwmon_vid k10temp sctp ip6_udp_tunnel udp_tunnel ip_tables
x_tables dm_crypt uas usb_storage hid_generic usbhid hid amdgpu
drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit drm_dp_helper cec
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i2c_designware_pci
drm aesni_intel i2c_piix4 xhci_pci i2c_designware_core backlight ice
xhci_pci_renesas nvme wmi
[213553.789515] CPU: 11 PID: 239394 Comm: ForzaHorizon5.e Tainted: G
     W         5.18.0-rc3+ #188
[213553.789516] Hardware name: ASUS System Product Name/ROG CROSSHAIR
VIII FORMULA, BIOS 4006 03/07/2022
[213553.789518] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[213553.789594] Code: f8 8a 92 c0 48 c7 c7 20 7d ac c0 e8 05 fd 0f fd
eb c0 48 c7 c6 60 0c 98 c0 bf 02 00 00 00 e8 b2 b4 c1 00 bd f2 ff ff
ff eb b0 &lt;0f&gt; 0b eb f5 bd fd ff ff ff eb a5 48 83 b8 a0 00 00 00 00 0f
84 4e
[213553.789596] RSP: 0018:ffffaf0b14227bc8 EFLAGS: 00010282
[213553.789597] RAX: ffff9c7e1b5ce000 RBX: ffff9c7e1de0c800 RCX:
0000000000000000
[213553.789598] RDX: 0000000000001000 RSI: ffff9c7e1b5ce000 RDI:
ffff9c7e3960ec00
[213553.789598] RBP: ffffaf0b14227c58 R08: ffff9c7e01255c38 R09:
ffff9c7e1b5ce000
[213553.789599] R10: 00000000000002f0 R11: 0000000000000000 R12:
ffff9c7e57ca7720
[213553.789600] R13: 0000000038080000 R14: ffff9c7e01255de8 R15:
ffff9c7e3960ec58
[213553.789601] FS:  0000000022b6f640(0000) GS:ffff9c850ecc0000(0000)
knlGS:000000001bd60000
[213553.789602] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[213553.789602] CR2: 0000000002512128 CR3: 0000000164322000 CR4:
0000000000750ee0
[213553.789603] DR0: 0000028ffd932280 DR1: 0000028ffd932190 DR2:
0000028ffd9321c0
[213553.789604] DR3: 0000028ffd932bf0 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[213553.789604] PKRU: 55555554
[213553.789605] Call Trace:
[213553.789607]  &lt;TASK&gt;
[213553.789608]  amdgpu_cs_parser_bos+0x12b/0x540 [amdgpu]
[213553.789691]  amdgpu_cs_ioctl+0xa8/0x180 [amdgpu]
[213553.789767]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213553.789859]  drm_ioctl_kernel+0x91/0x140 [drm]
[213553.789877]  ? default_send_IPI_single_phys+0x21/0x40
[213553.789881]  drm_ioctl+0x1ce/0x400 [drm]
[213553.789895]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[213553.789971]  ? seccomp_run_filters+0x96/0x140
[213553.789974]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu]
[213553.790047]  __x64_sys_ioctl+0x82/0xc0
[213553.790049]  do_syscall_64+0x34/0x80
[213553.790051]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[213553.790053] RIP: 0033:0x7fe73f4ff737
[213553.790055] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff
ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 46 0f 00 f7 d8 64 89
01 48
[213553.790055] RSP: 002b:0000000022b6d8f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[213553.790056] RAX: ffffffffffffffda RBX: 0000000022b6d970 RCX:
00007fe73f4ff737
[213553.790057] RDX: 0000000022b6d970 RSI: 00000000c0186444 RDI:
000000000000001a
[213553.790058] RBP: 00000000c0186444 R08: 00007fe6bcd81990 R09:
0000000022b6db78
[213553.790058] R10: 00007fe6bc519cc0 R11: 0000000000000246 R12:
00007fe6bcd81940
[213553.790059] R13: 000000000000001a R14: 00007fe6bccbd790 R15:
0000000000000000
[213553.790060]  &lt;/TASK&gt;
[213553.790060] ---[ end trace 0000000000000000 ]---
[213553.790061] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!
[214232.601871] ------------[ cut here ]------------
[214232.601872] WARNING: CPU: 11 PID: 241033 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:665
amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[214232.601965] Modules linked in: hfsplus hfs ntfs msdos nfnetlink
snd_seq_dummy snd_hrtimer amd_pstate snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep nls_iso8859_2
nls_cp852 snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
input_leds joydev intel_rapl_common mxm_wmi snd_seq wmi_bmof
snd_seq_device corsair_psu snd_timer ucsi_ccg sp5100_tco ccp
typec_ucsi snd typec soundcore sch_fq asus_wmi_ec_sensors amd_sfh
nct6775 hwmon_vid k10temp sctp ip6_udp_tunnel udp_tunnel ip_tables
x_tables dm_crypt uas usb_storage hid_generic usbhid hid amdgpu
drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit drm_dp_helper cec
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i2c_designware_pci
drm aesni_intel i2c_piix4 xhci_pci i2c_designware_core backlight ice
xhci_pci_renesas nvme wmi
[214232.601992] CPU: 11 PID: 241033 Comm: ForzaHorizon5.e Tainted: G
     W         5.18.0-rc3+ #188
[214232.601993] Hardware name: ASUS System Product Name/ROG CROSSHAIR
VIII FORMULA, BIOS 4006 03/07/2022
[214232.601994] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[214232.602074] Code: f8 8a 92 c0 48 c7 c7 20 7d ac c0 e8 05 fd 0f fd
eb c0 48 c7 c6 60 0c 98 c0 bf 02 00 00 00 e8 b2 b4 c1 00 bd f2 ff ff
ff eb b0 &lt;0f&gt; 0b eb f5 bd fd ff ff ff eb a5 48 83 b8 a0 00 00 00 00 0f
84 4e
[214232.602075] RSP: 0018:ffffaf0b10fb7bc8 EFLAGS: 00010286
[214232.602076] RAX: ffff9c7e4c71f000 RBX: ffff9c7e0135f400 RCX:
0000000000000000
[214232.602077] RDX: 0000000000001000 RSI: ffff9c7e4c71f000 RDI:
ffff9c7e16d4a800
[214232.602077] RBP: ffffaf0b10fb7c58 R08: ffff9c7e2cbb5438 R09:
ffff9c7e4c71f000
[214232.602078] R10: 00000000000002f0 R11: 0000000000000000 R12:
ffff9c7e5fe57000
[214232.602079] R13: 0000000037d00000 R14: ffff9c7e2cbb5558 R15:
ffff9c7e16d4a858
[214232.602079] FS:  000000002520f640(0000) GS:ffff9c850ecc0000(0000)
knlGS:000000001bd10000
[214232.602080] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[214232.602081] CR2: 00007fd664084000 CR3: 000000013f9dc000 CR4:
0000000000750ee0
[214232.602081] DR0: 0000028ffd932280 DR1: 0000028ffd932190 DR2:
0000028ffd9321c0
[214232.602082] DR3: 0000028ffd932bf0 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[214232.602082] PKRU: 55555554
[214232.602082] Call Trace:
[214232.602090]  &lt;TASK&gt;
[214232.602092]  amdgpu_cs_parser_bos+0x12b/0x540 [amdgpu]
[214232.602173]  amdgpu_cs_ioctl+0xa8/0x180 [amdgpu]
[214232.602284]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[214232.602385]  drm_ioctl_kernel+0x91/0x140 [drm]
[214232.602401]  drm_ioctl+0x1ce/0x400 [drm]
[214232.602413]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[214232.602524]  ? seccomp_run_filters+0x96/0x140
[214232.602527]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu]
[214232.602631]  __x64_sys_ioctl+0x82/0xc0
[214232.602635]  do_syscall_64+0x34/0x80
[214232.602637]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[214232.602640] RIP: 0033:0x7fd67baff737
[214232.602641] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff
ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 46 0f 00 f7 d8 64 89
01 48
[214232.602643] RSP: 002b:000000002520d8e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[214232.602645] RAX: ffffffffffffffda RBX: 000000002520d970 RCX:
00007fd67baff737
[214232.602646] RDX: 000000002520d970 RSI: 00000000c0186444 RDI:
000000000000001a
[214232.602647] RBP: 00000000c0186444 R08: 00007fd5e002f540 R09:
000000002520db78
[214232.602648] R10: 00007fd5f8519cf0 R11: 0000000000000246 R12:
00007fd5e002f4e0
[214232.602649] R13: 000000000000001a R14: 00007fd5e002f610 R15:
00007fd5e002f5e0
[214232.602650]  &lt;/TASK&gt;
[214232.602651] ---[ end trace 0000000000000000 ]---
[214232.602652] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!
[214347.336060] ------------[ cut here ]------------
[214347.336062] WARNING: CPU: 19 PID: 242156 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:665
amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[214347.336179] Modules linked in: hfsplus hfs ntfs msdos nfnetlink
snd_seq_dummy snd_hrtimer amd_pstate snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep nls_iso8859_2
nls_cp852 snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
input_leds joydev intel_rapl_common mxm_wmi snd_seq wmi_bmof
snd_seq_device corsair_psu snd_timer ucsi_ccg sp5100_tco ccp
typec_ucsi snd typec soundcore sch_fq asus_wmi_ec_sensors amd_sfh
nct6775 hwmon_vid k10temp sctp ip6_udp_tunnel udp_tunnel ip_tables
x_tables dm_crypt uas usb_storage hid_generic usbhid hid amdgpu
drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit drm_dp_helper cec
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i2c_designware_pci
drm aesni_intel i2c_piix4 xhci_pci i2c_designware_core backlight ice
xhci_pci_renesas nvme wmi
[214347.336206] CPU: 19 PID: 242156 Comm: ForzaHorizon5.e Tainted: G
     W         5.18.0-rc3+ #188
[214347.336207] Hardware name: ASUS System Product Name/ROG CROSSHAIR
VIII FORMULA, BIOS 4006 03/07/2022
[214347.336208] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x115/0x140 [amdgpu]
[214347.336306] Code: f8 8a 92 c0 48 c7 c7 20 7d ac c0 e8 05 fd 0f fd
eb c0 48 c7 c6 60 0c 98 c0 bf 02 00 00 00 e8 b2 b4 c1 00 bd f2 ff ff
ff eb b0 &lt;0f&gt; 0b eb f5 bd fd ff ff ff eb a5 48 83 b8 a0 00 00 00 00 0f
84 4e
[214347.336307] RSP: 0018:ffffaf0b148e7bc8 EFLAGS: 00010286
[214347.336308] RAX: ffff9c7e572b6000 RBX: ffff9c7e01239400 RCX:
0000000000000000
[214347.336309] RDX: 0000000000001000 RSI: ffff9c7e572b6000 RDI:
ffff9c7e30db8800
[214347.336310] RBP: ffffaf0b148e7c58 R08: ffff9c7e629c2038 R09:
ffff9c7e572b6000
[214347.336310] R10: 00000000000002f0 R11: 0000000000000000 R12:
ffff9c7e11cc6b40
[214347.336311] R13: 0000000037dd0000 R14: ffff9c7e629c2158 R15:
ffff9c7e30db8858
[214347.336312] FS:  0000000025a0f640(0000) GS:ffff9c850eec0000(0000)
knlGS:000000001bd10000
[214347.336313] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[214347.336313] CR2: 0000000002cb8000 CR3: 000000013f9da000 CR4:
0000000000750ee0
[214347.336314] PKRU: 55555554
[214347.336315] Call Trace:
[214347.336316]  &lt;TASK&gt;
[214347.336318]  amdgpu_cs_parser_bos+0x12b/0x540 [amdgpu]
[214347.336419]  amdgpu_cs_ioctl+0xa8/0x180 [amdgpu]
[214347.336505]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[214347.336590]  drm_ioctl_kernel+0x91/0x140 [drm]
[214347.336603]  drm_ioctl+0x1ce/0x400 [drm]
[214347.336613]  ? amdgpu_cs_vm_handling+0x440/0x440 [amdgpu]
[214347.336698]  ? seccomp_run_filters+0x96/0x140
[214347.336701]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu]
[214347.336783]  __x64_sys_ioctl+0x82/0xc0
[214347.336785]  do_syscall_64+0x34/0x80
[214347.336788]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[214347.336790] RIP: 0033:0x7fc5342ff737
[214347.336791] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff
ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 46 0f 00 f7 d8 64 89
01 48
[214347.336791] RSP: 002b:0000000025a0d8e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[214347.336792] RAX: ffffffffffffffda RBX: 0000000025a0d970 RCX:
00007fc5342ff737
[214347.336793] RDX: 0000000025a0d970 RSI: 00000000c0186444 RDI:
000000000000001a
[214347.336793] RBP: 00000000c0186444 R08: 00007fc49802f540 R09:
0000000025a0db78
[214347.336794] R10: 00007fc4b0519d90 R11: 0000000000000246 R12:
00007fc49802f4e0
[214347.336794] R13: 000000000000001a R14: 00007fc49802f610 R15:
00007fc49802f5e0
[214347.336795]  &lt;/TASK&gt;
[214347.336796] ---[ end trace 0000000000000000 ]---
[214347.336796] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!




</pre>
    </blockquote>
  </body>
</html>
