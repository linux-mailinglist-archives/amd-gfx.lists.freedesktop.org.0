Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0491CF8E7A
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Nov 2019 12:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2036E40B;
	Tue, 12 Nov 2019 11:23:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045506E3D0
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 11:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoAbdZtl5echb0ldTh+Td2f8dRoYzsJTdbj2yW0ajebrpYTaFEcxP8a2WxtsOE+goMvUNW0QxPdK7m0x8n5d7Q0RHmlYJsBOU+H2Am6uLCyB0zqC06tcikXI9wcIJM1mNRdKUgpwB5TMsyIJ/BH94AXODQRw1cUj2jxyMeXLMtxO+jxwfXtrSVhPeIjJI3ikBMnaM2dlZefIyO/lADFTnZq/WWCf9+gvp9h2gQz5lK9qyY+qYd0ZpK1A6SKRwdXZuqVipPBqPzWs78qo3fQoQyw7k1wjmKPy6gAobHyl1azpoXq+f60MFTWQaWLa7M1kNVZNeJLdDd+gAh45Sni3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mXWjGz0f1Njrto8vMGT7ANHNm/jlMMO4iWRHig+Gwc=;
 b=PXx8rHStK3h+KrRobLFpEgXCKM23KWJ2puxSlneA8TtTFmK2b7xZ8Rym+EKUfqHU8MByHs3XgiEdIYCTZVhyjGLr7RxR33pj+k8OQQ8KmlDech8Siqs+bdvoP+tZp7X/HfKZyxHlApN8FStXKLfWRpKg1az4lXQ7ojd+fZ2rkTXS4mv5mdGpxRJtCZIhKdyVvqLjfahCuZiliqITlvCoH9HlzViDEOBJKmQrLfGeQtl23vPzHbFtgl6k2YelyNJO/N1kVFKD5Qj1l9Wn32WDUbdnVzwMqLBpT3yf41is22oWJHAtS//GCwkc42YyEFBzO7WuNk8H85oKsyCj9UkdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1756.namprd12.prod.outlook.com (10.175.86.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 11:23:13 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 11:23:12 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
To: "Deng, Emily" <Emily.Deng@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1573122349-22080-1-git-send-email-Emily.Deng@amd.com>
 <9de32e5b-69a2-f43f-629f-fef3c30bf5a1@gmail.com>
 <MN2PR12MB2975D4E26CED960B82305F308F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975E26D8A8352863BA01FCA8F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <c01acb29-72ce-a109-3ca5-166706327d61@amd.com>
 <MN2PR12MB29755CFCE09CEC0D9EB999D18F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <70c2c1cc-40b8-30da-7aee-f59fbc4d0d42@amd.com>
 <DM6PR12MB2971859C1BF16EE7E65B35B18F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <d6f9c508-3c23-c797-1cbc-7502dc4c0b13@amd.com>
 <DM6PR12MB29714AB9AD16FA3ABD7D62C28F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <dcc1124b-5e19-b018-7449-659a8b7d74ea@amd.com>
 <DM6PR12MB29710DFE90F22F5903499AFE8F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <91f4a0c4-23e3-a399-5cb1-fb01da922784@amd.com>
 <MWHPR12MB1453817C6F05A57FD431E159EA770@MWHPR12MB1453.namprd12.prod.outlook.com>
 <MN2PR12MB29750EDB35E27DF9CD63152C8F770@MN2PR12MB2975.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2f035f22-4057-dd9e-27ef-0f5612113e29@amd.com>
Date: Mon, 11 Nov 2019 22:11:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <MN2PR12MB29750EDB35E27DF9CD63152C8F770@MN2PR12MB2975.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::47) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 119f985d-4f2d-438c-d819-08d76762b43c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1756:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17569974AD825EC86FE17FFF83770@DM5PR12MB1756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 021975AE46
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(189003)(199004)(13464003)(51234002)(58126008)(31696002)(6666004)(66574012)(16586007)(110136005)(478600001)(6506007)(14454004)(386003)(606006)(66476007)(66556008)(36756003)(6116002)(37036004)(6436002)(66946007)(65956001)(65806001)(229853002)(7736002)(5660300002)(25786009)(966005)(33964004)(76176011)(6486002)(30864003)(86362001)(52116002)(99286004)(316002)(71190400001)(53546011)(46003)(8676002)(6512007)(446003)(11346002)(2906002)(81166006)(81156014)(6246003)(186003)(6306002)(54896002)(8936002)(236005)(476003)(2616005)(486006)(14444005)(31686004)(2501003)(559001)(579004)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1756;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvvShaCUJ2e0RCnDo4fpPGTu0QPSFPXeJ7IAb6qmJNkhvi3kF53zUZrI/DJ1C0tRqk3I0LER+8+DQVZuk2SdgVBgOw6uuBK6OqSna66sGDUz8FEbA6hWYhkV/567jWknpww5tlsjp8z1GyDZdmcKUZAq5mG9BUg58QoCQpbJj7E5BF+tnWuuYxGqkY2OKGhm1rmBTd1DUf2CYMvgC/Xymv2EJVS3StUy/ftCHSMAyUjeU3ZmtmdpBb38tMjAZ05xNGdhcV1LNvAVBU/14NFnj+fgDvUqmyZ9Cb87n17FwpTW7jLrtwDgZttGvD4dpPJyeLZ39Wt/uBaaZl8hf866ZF1miTuWtgrva3filYGKdOnr1HGOV23H99Qpc5fyPXl8I9qrOHyJwyFc+hsEtySsYGUty3RmlxGKQa80Knp3I38wmA/wqUn0wuSRBsJpPE8QIj/dpjHXkbeX2sYu/aML8MZ3mz0VnKe/z9/dJM9zO7s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119f985d-4f2d-438c-d819-08d76762b43c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 11:23:12.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BCP+J4Rqj4XhlYvlMzrQ5+A/AgAtgT6ZD1bvU8S+BqrexBhbqYSLLak3HZtPeyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1756
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mXWjGz0f1Njrto8vMGT7ANHNm/jlMMO4iWRHig+Gwc=;
 b=qQnDYoiYRKMffphZKH6xpk+BbxB2UP0d5NcP72Obm4ULEcrJbHZNv+PQdaLloh2be0H5jSKhu7GgSNHmTbDZlVWiERe1IXkleiqaLAApIAOChTFlTGMxTaRKNkNZ+sj6YWsk8a2lRaIKg1fIMx/5emLNIDH7jKuouy/qZMb2yT4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0444669653=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0444669653==
Content-Type: multipart/alternative;
 boundary="------------D24A49F7CA0F12D67D5E19E9"
Content-Language: en-US

--------------D24A49F7CA0F12D67D5E19E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Emily,

you need to print which scheduler instance is freeing the jobs and which 
one is triggering the reset. The TID and PID is completely meaningless 
here since we are called from different worker threads and the TID/PID 
can change on each call.

Apart from that I will look into this a bit deeper when I have time.

Regards,
Christian.

Am 12.11.19 um 07:02 schrieb Deng, Emily:
> Hi Christian,
>     I add the follow print in function drm_sched_cleanup_jobs. From 
> the log it shows that only use cancel_delayed_work could not avoid to 
> free job when the sched is in reset. But don’t know exactly where it 
> is wrong about the driver. Do you have any suggestion about this?
> + printk("Emily:drm_sched_cleanup_jobs:begin,tid:%lu, pid:%lu\n", 
> current->tgid, current->pid);
>         /*
>          * Don't destroy jobs while the timeout worker is running  OR 
> thread
>          * is being parked and hence assumed to not touch ring_mirror_list
>          */
>          if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> !cancel_delayed_work(&sched->work_tdr)))
>                 return;
> +       printk("Emily:drm_sched_cleanup_jobs,tid:%lu, pid:%lu\n", 
> current->tgid, current->pid);
> Best wishes
> Emily Deng
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11380.695091] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11380.695104] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11380.695105] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11380.695107] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11380.695107] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.222954] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 
> timeout, signaled seq=78585, emitted seq=78587
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.224275] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process 
> information: process  pid 0 thread  pid 0, 
> s_job:00000000fe75ab36,tid=15603, pid=15603
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225413] amdgpu 0000:00:08.0: GPU reset begin!
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225417] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225425] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225425] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225428] Emily:amdgpu_job_free_cb,Process information: process  
> pid 0 thread  pid 0, s_job:00000000fe75ab36, tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225429] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225430] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225473] Emily:drm_sched_cleanup_jobs:begin,tid:2253, pid:2253
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225486] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225489] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
> [11381.225494] Emily:amdgpu_job_free_cb,Process information: process  
> pid 0 thread  pid 0, s_job:00000000f086ec84, tid:2262, pid:2262
> >-----Original Message-----
> >From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> >Sent: Tuesday, November 12, 2019 11:28 AM
> >To: Koenig, Christian <Christian.Koenig@amd.com>; Deng, Emily
> ><Emily.Deng@amd.com>; amd-gfx@lists.freedesktop.org
> >Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
> >
> >Thinking more about this claim - we assume here that if cancel_delayed_work
> >returned true it guarantees that timeout work is not running but, it merely
> >means there was a pending timeout work which was removed from the
> >workqueue before it's timer elapsed and so it didn't have a chance to be
> >dequeued and executed, it doesn't cover already executing work. So there is a
> >possibility where while timeout work started executing another timeout work
> >already got enqueued (maybe through earlier cleanup jobs or through
> >drm_sched_fault) and if at this point another drm_sched_cleanup_jobs runs
> >cancel_delayed_work(&sched->work_tdr) will return true even while there is a
> >timeout job in progress.
> >Unfortunately we cannot change cancel_delayed_work to
> >cancel_delayed_work_sync to flush the timeout work as timeout work itself
> >waits for schedule thread  to be parked again when calling park_thread.
> >
> >Andrey
> >
> >________________________________________
> >From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of
> >Koenig, Christian <Christian.Koenig@amd.com>
> >Sent: 08 November 2019 05:35:18
> >To: Deng, Emily; amd-gfx@lists.freedesktop.org
> >Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
> >
> >Hi Emily,
> >
> >exactly that can't happen. See here:
> >
> >>         /* Don't destroy jobs while the timeout worker is running */
> >>         if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> >>            !cancel_delayed_work(&sched->work_tdr))
> >>                 return NULL;
> >
> >We never free jobs while the timeout working is running to prevent exactly
> >that issue.
> >
> >Regards,
> >Christian.
> >
> >Am 08.11.19 um 11:32 schrieb Deng, Emily:
> >> Hi Christian,
> >>       The drm_sched_job_timedout-> amdgpu_job_timedout call
> >amdgpu_device_gpu_recover. I mean the main scheduler free the jobs while
> >in amdgpu_device_gpu_recover, and before calling drm_sched_stop.
> >>
> >> Best wishes
> >> Emily Deng
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Koenig, Christian <Christian.Koenig@amd.com>
> >>> Sent: Friday, November 8, 2019 6:26 PM
> >>> To: Deng, Emily <Emily.Deng@amd.com>; amd-gfx@lists.freedesktop.org
> >>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
> >>>
> >>> Hi Emily,
> >>>
> >>> well who is calling amdgpu_device_gpu_recover() in this case?
> >>>
> >>> When it's not the scheduler we shouldn't have a guilty job in the first place.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>> Am 08.11.19 um 11:22 schrieb Deng, Emily:
> >>>> Hi Chrisitan,
> >>>>        No, I am with the new branch and also has the patch. Even it
> >>>> are freed by
> >>> main scheduler, how we could avoid main scheduler to free jobs while
> >>> enter to function amdgpu_device_gpu_recover?
> >>>> Best wishes
> >>>> Emily Deng
> >>>>
> >>>>
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
> >>>>> Sent: Friday, November 8, 2019 6:15 PM
> >>>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-
> >gfx@lists.freedesktop.org
> >>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
> >>>>>
> >>>>> Hi Emily,
> >>>>>
> >>>>> in this case you are on an old code branch.
> >>>>>
> >>>>> Jobs are freed now by the main scheduler thread and only if no
> >>>>> timeout handler is running.
> >>>>>
> >>>>> See this patch here:
> >>>>>> commit 5918045c4ed492fb5813f980dcf89a90fefd0a4e
> >>>>>> Author: Christian König <christian.koenig@amd.com>
> >>>>>> Date:   Thu Apr 18 11:00:21 2019 -0400
> >>>>>>
> >>>>>>       drm/scheduler: rework job destruction
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>> Am 08.11.19 um 11:11 schrieb Deng, Emily:
> >>>>>> Hi Christian,
> >>>>>>         Please refer to follow log, when it enter to
> >>>>>> amdgpu_device_gpu_recover
> >>>>> function, the bad job 000000005086879e is freeing in function
> >>>>> amdgpu_job_free_cb  at the same time, because of the hardware fence
> >>> signal.
> >>>>> But amdgpu_device_gpu_recover goes faster, at this case, the
> >>>>> s_fence is already freed, but job is not freed in time. Then this issue
> >occurs.
> >>>>>> [  449.792189] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
> >>> sdma0
> >>>>>> timeout, signaled seq=2481, emitted seq=2483 [  449.793202]
> >>>>>> [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
> >>>>> process  pid 0 thread  pid 0, s_job:000000005086879e [  449.794163]
> >>>>> amdgpu
> >>>>> 0000:00:08.0: GPU reset begin!
> >>>>>> [  449.794175] Emily:amdgpu_job_free_cb,Process information:
> >>>>>> process pid 0 thread  pid 0, s_job:000000005086879e [  449.794221]
> >>>>>> Emily:amdgpu_job_free_cb,Process information: process  pid 0
> >>>>>> thread pid 0, s_job:0000000066eb74ab [  449.794222]
> >>>>>> Emily:amdgpu_job_free_cb,Process information: process  pid 0
> >>>>>> thread pid 0, s_job:00000000d4438ad9 [  449.794255]
> >>>>>> Emily:amdgpu_job_free_cb,Process information: process  pid 0
> >>>>>> thread pid 0, s_job:00000000b6d69c65 [  449.794257]
> >>>>>> Emily:amdgpu_job_free_cb,Process information: process  pid 0
> >>>>>> thread pid 0,
> >>>>> s_job:00000000ea85e922 [ 449.794287]
> >>>>> Emily:amdgpu_job_free_cb,Process
> >>>>> information: process  pid 0 thread pid 0, s_job:00000000ed3a5ac6 [
> >>>>> 449.794366] BUG: unable to handle kernel NULL pointer dereference
> >>>>> at
> >>>>> 00000000000000c0 [  449.800818] PGD 0 P4D 0 [  449.801040] Oops:
> >>>>> 0000 [#1] SMP PTI
> >>>>>> [  449.801338] CPU: 3 PID: 55 Comm: kworker/3:1 Tainted: G           OE
> >>>>> 4.18.0-15-generic #16~18.04.1-Ubuntu
> >>>>>> [  449.802157] Hardware name: QEMU Standard PC (i440FX + PIIX,
> >>>>>> 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014 [  449.802944]
> >>>>>> Workqueue: events drm_sched_job_timedout [amd_sched] [
> >>>>>> 449.803488]
> >>> RIP:
> >>>>> 0010:amdgpu_device_gpu_recover+0x1da/0xb60 [amdgpu]
> >>>>>> [  449.804020] Code: dd ff ff 49 39 c5 48 89 55 a8 0f 85 56 ff ff
> >>>>>> ff
> >>>>>> 45 85 e4 0f
> >>>>> 85 a1 00 00 00 48 8b 45 b0 48 85 c0 0f 84 60 01 00 00 48 8b 40 10
> >>>>> <48> 8b
> >>> 98
> >>>>> c0 00         00 00 48 85 db 0f 84 4c 01 00 00 48 8b 43 48 a8 01
> >>>>>> [  449.805593] RSP: 0018:ffffb4c7c08f7d68 EFLAGS: 00010286 [
> >>>>>> 449.806032] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> >>>>>> 0000000000000000 [  449.806625] RDX: ffffb4c7c08f5ac0 RSI:
> >>>>>> 0000000fffffffe0 RDI: 0000000000000246 [  449.807224] RBP:
> >>>>>> ffffb4c7c08f7de0 R08: 00000068b9d54000 R09: 0000000000000000 [
> >>>>>> 449.807818] R10: 0000000000000000 R11: 0000000000000148 R12:
> >>>>>> 0000000000000000 [  449.808411] R13: ffffb4c7c08f7da0 R14:
> >>>>>> ffff8d82b8525d40 R15: ffff8d82b8525d40 [  449.809004] FS:
> >>>>>> 0000000000000000(0000) GS:ffff8d82bfd80000(0000)
> >>>>>> knlGS:0000000000000000 [ 449.809674] CS:  0010 DS: 0000 ES: 0000
> >CR0:
> >>>>>> 0000000080050033 [  449.810153] CR2: 00000000000000c0 CR3:
> >>>>>> 000000003cc0a001 CR4: 00000000003606e0 [  449.810747] DR0:
> >>>>> 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000 [
> >>>>> 449.811344] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> >>>>> 0000000000000400 [  449.811937] Call Trace:
> >>>>>> [  449.812206] amdgpu_job_timedout+0x114/0x140 [amdgpu] [
> >>>>>> 449.812635] drm_sched_job_timedout+0x44/0x90 [amd_sched] [
> >>>>>> 449.813139]  ? amdgpu_cgs_destroy_device+0x10/0x10 [amdgpu] [
> >>>>>> 449.813609]  ? drm_sched_job_timedout+0x44/0x90 [amd_sched] [
> >>>>>> 449.814077] process_one_work+0x1fd/0x3f0 [  449.814417]
> >>>>>> worker_thread+0x34/0x410 [ 449.814728]  kthread+0x121/0x140 [
> >>>>>> 449.815004]  ? process_one_work+0x3f0/0x3f0 [  449.815374]  ?
> >>>>>> kthread_create_worker_on_cpu+0x70/0x70
> >>>>>> [  449.815799] ret_from_fork+0x35/0x40
> >>>>>>
> >>>>>>> -----Original Message-----
> >>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
> >>>>>>> Sent: Friday, November 8, 2019 5:43 PM
> >>>>>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-
> >>> gfx@lists.freedesktop.org
> >>>>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for
> >>>>>>> tdr
> >>>>>>>
> >>>>>>> Am 08.11.19 um 10:39 schrieb Deng, Emily:
> >>>>>>>> Sorry, please take your time.
> >>>>>>> Have you seen my other response a bit below?
> >>>>>>>
> >>>>>>> I can't follow how it would be possible for job->s_fence to be
> >>>>>>> NULL without the job also being freed.
> >>>>>>>
> >>>>>>> So it looks like this patch is just papering over some bigger issues.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Christian.
> >>>>>>>
> >>>>>>>> Best wishes
> >>>>>>>> Emily Deng
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> -----Original Message-----
> >>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
> >>>>>>>>> Sent: Friday, November 8, 2019 5:08 PM
> >>>>>>>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-
> >>>>> gfx@lists.freedesktop.org
> >>>>>>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for
> >>>>>>>>> tdr
> >>>>>>>>>
> >>>>>>>>> Am 08.11.19 um 09:52 schrieb Deng, Emily:
> >>>>>>>>>> Ping.....
> >>>>>>>>> You need to give me at least enough time to wake up :)
> >>>>>>>>>
> >>>>>>>>>> Best wishes
> >>>>>>>>>> Emily Deng
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On
> >>> Behalf
> >>>>>>>>>>> Of Deng, Emily
> >>>>>>>>>>> Sent: Friday, November 8, 2019 10:56 AM
> >>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; amd-
> >>>>>>>>>>> gfx@lists.freedesktop.org
> >>>>>>>>>>> Subject: RE: [PATCH] drm/amdgpu: Fix the null pointer issue
> >>>>>>>>>>> for tdr
> >>>>>>>>>>>
> >>>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> >>>>>>>>>>>> Sent: Thursday, November 7, 2019 7:28 PM
> >>>>>>>>>>>> To: Deng, Emily <Emily.Deng@amd.com>;
> >>>>>>>>>>>> amd-gfx@lists.freedesktop.org
> >>>>>>>>>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue
> >>>>>>>>>>>> for tdr
> >>>>>>>>>>>>
> >>>>>>>>>>>> Am 07.11.19 um 11:25 schrieb Emily Deng:
> >>>>>>>>>>>>> When the job is already signaled, the s_fence is freed.
> >>>>>>>>>>>>> Then it will has null pointer in amdgpu_device_gpu_recover.
> >>>>>>>>>>>> NAK, the s_fence is only set to NULL when the job is destroyed.
> >>>>>>>>>>>> See drm_sched_job_cleanup().
> >>>>>>>>>>> I know it is set to NULL in drm_sched_job_cleanup. But in one
> >>>>>>>>>>> case, when it enter into the amdgpu_device_gpu_recover, it
> >>>>>>>>>>> already in drm_sched_job_cleanup, and at this time, it will
> >>>>>>>>>>> go to free
> >>>>> job.
> >>>>>>>>>>> But the amdgpu_device_gpu_recover sometimes is faster. At
> >>>>>>>>>>> that time, job is not freed, but s_fence is already NULL.
> >>>>>>>>> No, that case can't happen. See here:
> >>>>>>>>>
> >>>>>>>>>>            drm_sched_job_cleanup(s_job);
> >>>>>>>>>>
> >>>>>>>>>>            amdgpu_ring_priority_put(ring, s_job->s_priority);
> >>>>>>>>>>            dma_fence_put(job->fence);
> >>>>>>>>>>            amdgpu_sync_free(&job->sync);
> >>>>>>>>>>            amdgpu_sync_free(&job->sched_sync);
> >>>>>>>>>>            kfree(job);
> >>>>>>>>> The job itself is freed up directly after freeing the reference
> >>>>>>>>> to the
> >>>>> s_fence.
> >>>>>>>>> So you are just papering over a much bigger problem here. This
> >>>>>>>>> patch is a clear NAK.
> >>>>>>>>>
> >>>>>>>>> Regards,
> >>>>>>>>> Christian.
> >>>>>>>>>
> >>>>>>>>>>>> When you see a job without an s_fence then that means the
> >>>>>>>>>>>> problem is somewhere else.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Regards,
> >>>>>>>>>>>> Christian.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Emily Deng <Emily.Deng@amd.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
> >>>>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c     | 11 ++++++---
> >--
> >>>>>>>>>>>>>       2 files changed, 7 insertions(+), 6 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>>>>>>>>> index e6ce949..5a8f08e 100644
> >>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>>>>>>>>> @@ -4075,7 +4075,7 @@ int
> >>> amdgpu_device_gpu_recover(struct
> >>>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>>>            *
> >>>>>>>>>>>>>            * job->base holds a reference to parent fence
> >>>>>>>>>>>>>            */
> >>>>>>>>>>>>> - if (job && job->base.s_fence->parent &&
> >>>>>>>>>>>>> + if (job && job->base.s_fence &&
> >>>>>>>>>>>>> + job->base.s_fence->parent
> >>>>>>> &&
> >>>>>>>>>>>>>               dma_fence_is_signaled(job->base.s_fence->parent))
> >>>>>>>>>>>>>                   job_signaled = true;
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>>> index 31809ca..56cc10e 100644
> >>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>>> @@ -334,8 +334,8 @@ void
> >drm_sched_increase_karma(struct
> >>>>>>>>>>>> drm_sched_job
> >>>>>>>>>>>>> *bad)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>                           spin_lock(&rq->lock);
> >>>>>>>>>>>>>                           list_for_each_entry_safe(entity,
> >>>>>>>>>>>>> tmp,
> >>> &rq-
> >>>>>>>> entities,
> >>>>>>>>>>>> list) {
> >>>>>>>>>>>>> -                          if (bad->s_fence->scheduled.context
> >>>>>>> ==
> >>>>>>>>>>>>> -                              entity->fence_context) {
> >>>>>>>>>>>>> +                          if (bad->s_fence &&
> >>>>>>>>>>>>> + (bad->s_fence-
> >>>>>>>>>>>>> scheduled.context ==
> >>>>>>>>>>>>> +                              entity->fence_context)) {
> >>>>>>>>>>>>>                                           if
> >>>>>>>>>>>>> (atomic_read(&bad-
> >>>>>>>> karma) >
> >>>>>>>>>>>>>                                               bad->sched-
> >>>> hang_limit)
> >>>>>>>>>>>>>                                                   if
> >>>>>>>>>>>>> (entity-
> >>>> guilty) @@ -376,7 +376,7 @@ void
> >>>>>>>>>>>>> drm_sched_stop(struct
> >>>>>>> drm_gpu_scheduler
> >>>>>>>>>>>> *sched, struct drm_sched_job *bad)
> >>>>>>>>>>>>>            * This iteration is thread safe as sched thread
> >>>>>>>>>>>>> is
> >>> stopped.
> >>>>>>>>>>>>>            */
> >>>>>>>>>>>>>           list_for_each_entry_safe_reverse(s_job, tmp,
> >>>>>>>>>>>>> &sched- ring_mirror_list, node) {
> >>>>>>>>>>>>> -          if (s_job->s_fence->parent &&
> >>>>>>>>>>>>> +          if (s_job->s_fence && s_job->s_fence->parent &&
> >>>>>>>>>>>>>                       dma_fence_remove_callback(s_job-
> >>>> s_fence-
> >>>>>>>> parent,
> >>>>>>>>>>>>>                                                 &s_job->cb)) {
> >>>>>>>>>>>>>                           atomic_dec(&sched->hw_rq_count);
> >>> @@ -
> >>>>>>> 395,7
> >>>>>>>>>>> +395,8 @@ void
> >>>>>>>>>>>>> drm_sched_stop(struct drm_gpu_scheduler
> >>>>>>>>>>>> *sched, struct drm_sched_job *bad)
> >>>>>>>>>>>>>                            *
> >>>>>>>>>>>>>                            * Job is still alive so fence
> >>>>>>>>>>>>> refcount at
> >>> least 1
> >>>>>>>>>>>>>                            */
> >>>>>>>>>>>>> - dma_fence_wait(&s_job->s_fence->finished,
> >>>>>>> false);
> >>>>>>>>>>>>> +                  if (s_job->s_fence)
> >>>>>>>>>>>>> + dma_fence_wait(&s_job->s_fence-
> >>>>>>>> finished,
> >>>>>>>>>>>> false);
> >>>>>>>>>>>>>                           /*
> >>>>>>>>>>>>>                            * We must keep bad job alive
> >>>>>>>>>>>>> for later
> >>> use
> >>>>>>> during @@
> >>>>>>>>>>>> -438,7
> >>>>>>>>>>>>> +439,7 @@ void drm_sched_start(struct drm_gpu_scheduler
> >>>>> *sched,
> >>>>>>>>>>>>> +bool
> >>>>>>>>>>>> full_recovery)
> >>>>>>>>>>>>>            * GPU recovers can't run in parallel.
> >>>>>>>>>>>>>            */
> >>>>>>>>>>>>>           list_for_each_entry_safe(s_job, tmp,
> >>>>>>>>>>>>> &sched->ring_mirror_list,
> >>>>>>>>>>>>> node)
> >>>>>>>>>>>> {
> >>>>>>>>>>>>> -          struct dma_fence *fence = s_job->s_fence->parent;
> >>>>>>>>>>>>> +          struct dma_fence *fence = s_job->s_fence ?
> >>>>>>>>>>>>> + s_job-
> >>>>>>>> s_fence-
> >>>>>>>>>>>>> parent :
> >>>>>>>>>>>>> +NULL;
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>                   atomic_inc(&sched->hw_rq_count);
> >>>>>>>>>>>>>
> >>>>>>>>>>> _______________________________________________
> >>>>>>>>>>> amd-gfx mailing list
> >>>>>>>>>>> amd-gfx@lists.freedesktop.org
> >>>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx 
> <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>
> >
> >_______________________________________________
> >amd-gfx mailing list
> >amd-gfx@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------D24A49F7CA0F12D67D5E19E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hi Emily,<br>
      <br>
      you need to print which scheduler instance is freeing the jobs and
      which one is triggering the reset. The TID and PID is completely
      meaningless here since we are called from different worker threads
      and the TID/PID can change on each call.<br>
      <br>
      Apart from that I will look into this a bit deeper when I have
      time.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 12.11.19 um 07:02 schrieb Deng, Emily:<br>
    </div>
    <blockquote type="cite" cite="mid:MN2PR12MB29750EDB35E27DF9CD63152C8F770@MN2PR12MB2975.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from rtf -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <font size="2" face="Calibri"><span style="font-size:11pt;">
          <div>Hi Christian,</div>
          <div>&nbsp;&nbsp;&nbsp; I add the follow print in function
            drm_sched_cleanup_jobs. From the log it shows that only use
            cancel_delayed_work could not avoid to free job when the
            sched is in reset. But don’t know exactly where it is wrong
            about the driver. Do you have any suggestion
            about this?</div>
          <div><font face="Times New Roman">&nbsp;</font></div>
          <div>&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            printk(&quot;Emily:drm_sched_cleanup_jobs:begin,tid:%lu,
            pid:%lu\n&quot;, current-&gt;tgid, current-&gt;pid);</div>
          <div>&nbsp;</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Don't destroy jobs while the timeout worker is
            running&nbsp; OR thread</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is being parked and hence assumed to not touch
            ring_mirror_list</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((sched-&gt;timeout != MAX_SCHEDULE_TIMEOUT
            &amp;&amp;</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            !cancel_delayed_work(&amp;sched-&gt;work_tdr)))</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;</div>
          <div>&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printk(&quot;Emily:drm_sched_cleanup_jobs,tid:%lu,
            pid:%lu\n&quot;, current-&gt;tgid, current-&gt;pid);</div>
          <div><font face="Times New Roman">&nbsp;</font></div>
          <div><font face="Times New Roman">&nbsp;</font></div>
          <div><font face="Calibri">Best wishes</font></div>
          <div><font face="Calibri">Emily Deng</font></div>
          <div><font face="Times New Roman">&nbsp;</font></div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11380.695091]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11380.695104]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11380.695105]
            Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11380.695107]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11380.695107]
            Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.222954] [drm:amdgpu_job_timedout [amdgpu]]
            *ERROR* ring sdma0 timeout, signaled seq=78585, emitted
            seq=78587</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.224275] [drm:amdgpu_job_timedout [amdgpu]]
            *ERROR* Process information: process&nbsp; pid 0 thread&nbsp; pid 0,
            s_job:00000000fe75ab36,tid=15603, pid=15603</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225413] amdgpu 0000:00:08.0: <font color="#00B050">GPU reset begin</font>!</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225417]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225425]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225425]
            Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225428] Emily:<font color="#00B050">amdgpu_job_free_cb</font>,Process
            information: process&nbsp; pid 0 thread&nbsp; pid 0,
            s_job:00000000fe75ab36, tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225429]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225430]
            Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225473]
            Emily:drm_sched_cleanup_jobs:begin,tid:2253, pid:2253</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225486]
            Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225489]
            Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
          <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
            kernel: [11381.225494] Emily:amdgpu_job_free_cb,Process
            information: process&nbsp; pid 0 thread&nbsp; pid 0,
            s_job:00000000f086ec84, tid:2262, pid:2262</div>
          <div>&gt;-----Original Message-----</div>
          <div>&gt;From: Grodzovsky, Andrey
            <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a></div>
          <div>&gt;Sent: Tuesday, November 12, 2019 11:28 AM</div>
          <div>&gt;To: Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Deng, Emily</div>
          <div>&gt;<a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a></div>
          <div>&gt;Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer
            issue for tdr</div>
          <div>&gt;</div>
          <div>&gt;Thinking more about this claim - we assume here that
            if cancel_delayed_work</div>
          <div>&gt;returned true it guarantees that timeout work is not
            running but, it merely</div>
          <div>&gt;means there was a pending timeout work which was
            removed from the</div>
          <div>&gt;workqueue before it's timer elapsed and so it didn't
            have a chance to be</div>
          <div>&gt;dequeued and executed, it doesn't cover already
            executing work. So there is a</div>
          <div>&gt;possibility where while timeout work started
            executing another timeout work</div>
          <div>&gt;already got enqueued (maybe through earlier cleanup
            jobs or through</div>
          <div>&gt;drm_sched_fault) and if at this point another
            drm_sched_cleanup_jobs runs</div>
          <div>&gt;cancel_delayed_work(&amp;sched-&gt;work_tdr) will
            return true even while there is a</div>
          <div>&gt;timeout job in progress.</div>
          <div>&gt;Unfortunately we cannot change cancel_delayed_work to</div>
          <div>&gt;cancel_delayed_work_sync to flush the timeout work as
            timeout work itself</div>
          <div>&gt;waits for schedule thread&nbsp; to be parked again when
            calling park_thread.</div>
          <div>&gt;</div>
          <div>&gt;Andrey</div>
          <div>&gt;</div>
          <div>&gt;________________________________________</div>
          <div>&gt;From: amd-gfx
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of</div>
          <div>&gt;Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a></div>
          <div>&gt;Sent: 08 November 2019 05:35:18</div>
          <div>&gt;To: Deng, Emily; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a></div>
          <div>&gt;Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer
            issue for tdr</div>
          <div>&gt;</div>
          <div>&gt;Hi Emily,</div>
          <div>&gt;</div>
          <div>&gt;exactly that can't happen. See here:</div>
          <div>&gt;</div>
          <div>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't destroy jobs while the timeout
            worker is running */</div>
          <div>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sched-&gt;timeout !=
            MAX_SCHEDULE_TIMEOUT &amp;&amp;</div>
          <div>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            !cancel_delayed_work(&amp;sched-&gt;work_tdr))</div>
          <div>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;</div>
          <div>&gt;</div>
          <div>&gt;We never free jobs while the timeout working is
            running to prevent exactly</div>
          <div>&gt;that issue.</div>
          <div>&gt;</div>
          <div>&gt;Regards,</div>
          <div>&gt;Christian.</div>
          <div>&gt;</div>
          <div>&gt;Am 08.11.19 um 11:32 schrieb Deng, Emily:</div>
          <div>&gt;&gt; Hi Christian,</div>
          <div>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The drm_sched_job_timedout-&gt;
            amdgpu_job_timedout call</div>
          <div>&gt;amdgpu_device_gpu_recover. I mean the main scheduler
            free the jobs while</div>
          <div>&gt;in amdgpu_device_gpu_recover, and before calling
            drm_sched_stop.</div>
          <div>&gt;&gt;</div>
          <div>&gt;&gt; Best wishes</div>
          <div>&gt;&gt; Emily Deng</div>
          <div>&gt;&gt;</div>
          <div>&gt;&gt;</div>
          <div>&gt;&gt;</div>
          <div>&gt;&gt;&gt; -----Original Message-----</div>
          <div>&gt;&gt;&gt; From: Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a></div>
          <div>&gt;&gt;&gt; Sent: Friday, November 8, 2019 6:26 PM</div>
          <div>&gt;&gt;&gt; To: Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt; Subject: Re: [PATCH] drm/amdgpu: Fix the
            null pointer issue for tdr</div>
          <div>&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt; Hi Emily,</div>
          <div>&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt; well who is calling
            amdgpu_device_gpu_recover() in this case?</div>
          <div>&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt; When it's not the scheduler we shouldn't
            have a guilty job in the first place.</div>
          <div>&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt; Regards,</div>
          <div>&gt;&gt;&gt; Christian.</div>
          <div>&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt; Am 08.11.19 um 11:22 schrieb Deng, Emily:</div>
          <div>&gt;&gt;&gt;&gt; Hi Chrisitan,</div>
          <div>&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No, I am with the new branch and
            also has the patch. Even it</div>
          <div>&gt;&gt;&gt;&gt; are freed by</div>
          <div>&gt;&gt;&gt; main scheduler, how we could avoid main
            scheduler to free jobs while</div>
          <div>&gt;&gt;&gt; enter to function amdgpu_device_gpu_recover?</div>
          <div>&gt;&gt;&gt;&gt; Best wishes</div>
          <div>&gt;&gt;&gt;&gt; Emily Deng</div>
          <div>&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt; -----Original Message-----</div>
          <div>&gt;&gt;&gt;&gt;&gt; From: Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a></div>
          <div>&gt;&gt;&gt;&gt;&gt; Sent: Friday, November 8, 2019 6:15
            PM</div>
          <div>&gt;&gt;&gt;&gt;&gt; To: Deng, Emily
            <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>; amd-</div>
          <div>&gt;<a class="moz-txt-link-abbreviated" href="mailto:gfx@lists.freedesktop.org">gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt;&gt;&gt; Subject: Re: [PATCH] drm/amdgpu: Fix
            the null pointer issue for tdr</div>
          <div>&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt; Hi Emily,</div>
          <div>&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt; in this case you are on an old code
            branch.</div>
          <div>&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt; Jobs are freed now by the main
            scheduler thread and only if no</div>
          <div>&gt;&gt;&gt;&gt;&gt; timeout handler is running.</div>
          <div>&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt; See this patch here:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; commit
            5918045c4ed492fb5813f980dcf89a90fefd0a4e</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Author: Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Date:&nbsp;&nbsp; Thu Apr 18 11:00:21 2019
            -0400</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/scheduler: rework job
            destruction</div>
          <div>&gt;&gt;&gt;&gt;&gt; Regards,</div>
          <div>&gt;&gt;&gt;&gt;&gt; Christian.</div>
          <div>&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt; Am 08.11.19 um 11:11 schrieb Deng,
            Emily:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Hi Christian,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please refer to follow
            log, when it enter to</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; amdgpu_device_gpu_recover</div>
          <div>&gt;&gt;&gt;&gt;&gt; function, the bad job
            000000005086879e is freeing in function</div>
          <div>&gt;&gt;&gt;&gt;&gt; amdgpu_job_free_cb&nbsp; at the same
            time, because of the hardware fence</div>
          <div>&gt;&gt;&gt; signal.</div>
          <div>&gt;&gt;&gt;&gt;&gt; But amdgpu_device_gpu_recover goes
            faster, at this case, the</div>
          <div>&gt;&gt;&gt;&gt;&gt; s_fence is already freed, but job is
            not freed in time. Then this issue</div>
          <div>&gt;occurs.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.792189]
            [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring</div>
          <div>&gt;&gt;&gt; sdma0</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; timeout, signaled seq=2481,
            emitted seq=2483 [&nbsp; 449.793202]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [drm:amdgpu_job_timedout
            [amdgpu]] *ERROR* Process information:</div>
          <div>&gt;&gt;&gt;&gt;&gt; process&nbsp; pid 0 thread&nbsp; pid 0,
            s_job:000000005086879e [&nbsp; 449.794163]</div>
          <div>&gt;&gt;&gt;&gt;&gt; amdgpu</div>
          <div>&gt;&gt;&gt;&gt;&gt; 0000:00:08.0: GPU reset begin!</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.794175]
            Emily:amdgpu_job_free_cb,Process information:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; process pid 0 thread&nbsp; pid 0,
            s_job:000000005086879e [&nbsp; 449.794221]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Emily:amdgpu_job_free_cb,Process
            information: process&nbsp; pid 0</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,
            s_job:0000000066eb74ab [&nbsp; 449.794222]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Emily:amdgpu_job_free_cb,Process
            information: process&nbsp; pid 0</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,
            s_job:00000000d4438ad9 [&nbsp; 449.794255]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Emily:amdgpu_job_free_cb,Process
            information: process&nbsp; pid 0</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,
            s_job:00000000b6d69c65 [&nbsp; 449.794257]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Emily:amdgpu_job_free_cb,Process
            information: process&nbsp; pid 0</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,</div>
          <div>&gt;&gt;&gt;&gt;&gt; s_job:00000000ea85e922 [&nbsp;
            449.794287]</div>
          <div>&gt;&gt;&gt;&gt;&gt; Emily:amdgpu_job_free_cb,Process</div>
          <div>&gt;&gt;&gt;&gt;&gt; information: process&nbsp; pid 0 thread&nbsp;
            pid 0, s_job:00000000ed3a5ac6 [</div>
          <div>&gt;&gt;&gt;&gt;&gt; 449.794366] BUG: unable to handle
            kernel NULL pointer dereference</div>
          <div>&gt;&gt;&gt;&gt;&gt; at</div>
          <div>&gt;&gt;&gt;&gt;&gt; 00000000000000c0 [&nbsp; 449.800818] PGD
            0 P4D 0 [&nbsp; 449.801040] Oops:</div>
          <div>&gt;&gt;&gt;&gt;&gt; 0000 [#1] SMP PTI</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.801338] CPU: 3 PID: 55
            Comm: kworker/3:1 Tainted: G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OE</div>
          <div>&gt;&gt;&gt;&gt;&gt; 4.18.0-15-generic #16~18.04.1-Ubuntu</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.802157] Hardware name:
            QEMU Standard PC (i440FX &#43; PIIX,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 1996), BIOS
            Ubuntu-1.8.2-1ubuntu1 04/01/2014 [&nbsp; 449.802944]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; Workqueue: events
            drm_sched_job_timedout [amd_sched] [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.803488]</div>
          <div>&gt;&gt;&gt; RIP:</div>
          <div>&gt;&gt;&gt;&gt;&gt;
            0010:amdgpu_device_gpu_recover&#43;0x1da/0xb60 [amdgpu]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.804020] Code: dd ff ff 49
            39 c5 48 89 55 a8 0f 85 56 ff ff</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; ff</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 45 85 e4 0f</div>
          <div>&gt;&gt;&gt;&gt;&gt; 85 a1 00 00 00 48 8b 45 b0 48 85 c0
            0f 84 60 01 00 00 48 8b 40 10</div>
          <div>&gt;&gt;&gt;&gt;&gt; &lt;48&gt; 8b</div>
          <div>&gt;&gt;&gt; 98</div>
          <div>&gt;&gt;&gt;&gt;&gt; c0 00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00 00 48 85 db 0f 84
            4c 01 00 00 48 8b 43 48 a8 01</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.805593] RSP:
            0018:ffffb4c7c08f7d68 EFLAGS: 00010286 [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.806032] RAX:
            0000000000000000 RBX: 0000000000000000 RCX:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000000000000 [&nbsp; 449.806625]
            RDX: ffffb4c7c08f5ac0 RSI:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000fffffffe0 RDI:
            0000000000000246 [&nbsp; 449.807224] RBP:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; ffffb4c7c08f7de0 R08:
            00000068b9d54000 R09: 0000000000000000 [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.807818] R10:
            0000000000000000 R11: 0000000000000148 R12:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000000000000 [&nbsp; 449.808411]
            R13: ffffb4c7c08f7da0 R14:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; ffff8d82b8525d40 R15:
            ffff8d82b8525d40 [&nbsp; 449.809004] FS:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000000000000(0000)
            GS:ffff8d82bfd80000(0000)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; knlGS:0000000000000000 [&nbsp;
            449.809674] CS:&nbsp; 0010 DS: 0000 ES: 0000</div>
          <div>&gt;CR0:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000080050033 [&nbsp; 449.810153]
            CR2: 00000000000000c0 CR3:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 000000003cc0a001 CR4:
            00000000003606e0 [&nbsp; 449.810747] DR0:</div>
          <div>&gt;&gt;&gt;&gt;&gt; 0000000000000000 DR1:
            0000000000000000 DR2: 0000000000000000 [</div>
          <div>&gt;&gt;&gt;&gt;&gt; 449.811344] DR3: 0000000000000000
            DR6: 00000000fffe0ff0 DR7:</div>
          <div>&gt;&gt;&gt;&gt;&gt; 0000000000000400 [&nbsp; 449.811937] Call
            Trace:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.812206]&nbsp;
            amdgpu_job_timedout&#43;0x114/0x140 [amdgpu] [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.812635]&nbsp;
            drm_sched_job_timedout&#43;0x44/0x90 [amd_sched] [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.813139]&nbsp; ?
            amdgpu_cgs_destroy_device&#43;0x10/0x10 [amdgpu] [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.813609]&nbsp; ?
            drm_sched_job_timedout&#43;0x44/0x90 [amd_sched] [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.814077]&nbsp;
            process_one_work&#43;0x1fd/0x3f0 [&nbsp; 449.814417]</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; worker_thread&#43;0x34/0x410 [&nbsp;
            449.814728]&nbsp; kthread&#43;0x121/0x140 [</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.815004]&nbsp; ?
            process_one_work&#43;0x3f0/0x3f0 [&nbsp; 449.815374]&nbsp; ?</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;
            kthread_create_worker_on_cpu&#43;0x70/0x70</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt; [&nbsp; 449.815799]&nbsp;
            ret_from_fork&#43;0x35/0x40</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original Message-----</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday, November 8,
            2019 5:43 PM</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Deng, Emily
            <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>; amd-</div>
          <div>&gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:gfx@lists.freedesktop.org">gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [PATCH]
            drm/amdgpu: Fix the null pointer issue for</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; tdr</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 08.11.19 um 10:39 schrieb
            Deng, Emily:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sorry, please take your
            time.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Have you seen my other
            response a bit below?</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; I can't follow how it would
            be possible for job-&gt;s_fence to be</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; NULL without the job also
            being freed.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; So it looks like this patch
            is just papering over some bigger issues.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Regards,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Christian.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Best wishes</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Emily Deng</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original
            Message-----</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Koenig,
            Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday,
            November 8, 2019 5:08 PM</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Deng, Emily
            <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>; amd-</div>
          <div>&gt;&gt;&gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:gfx@lists.freedesktop.org">gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [PATCH]
            drm/amdgpu: Fix the null pointer issue for</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; tdr</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 08.11.19 um 09:52
            schrieb Deng, Emily:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Ping.....</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; You need to give me
            at least enough time to wake up :)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Best wishes</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Emily Deng</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -----Original Message-----</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From:
            amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> On</div>
          <div>&gt;&gt;&gt; Behalf</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Of Deng,
            Emily</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent:
            Friday, November 8, 2019 10:56 AM</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Koenig,
            Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; amd-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            <a class="moz-txt-link-abbreviated" href="mailto:gfx@lists.freedesktop.org">gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: RE:
            [PATCH] drm/amdgpu: Fix the null pointer issue</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for tdr</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -----Original Message-----</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From:
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent:
            Thursday, November 7, 2019 7:28 PM</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To:
            Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject:
            Re: [PATCH] drm/amdgpu: Fix the null pointer issue</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for tdr</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am
            07.11.19 um 11:25 schrieb Emily Deng:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; When
            the job is already signaled, the s_fence is freed.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Then
            it will has null pointer in amdgpu_device_gpu_recover.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; NAK, the
            s_fence is only set to NULL when the job is destroyed.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; See
            drm_sched_job_cleanup().</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I know it is
            set to NULL in drm_sched_job_cleanup. But in one</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; case, when
            it enter into the amdgpu_device_gpu_recover, it</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; already in
            drm_sched_job_cleanup, and at this time, it will</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; go to free</div>
          <div>&gt;&gt;&gt;&gt;&gt; job.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; But the
            amdgpu_device_gpu_recover sometimes is faster. At</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; that time,
            job is not freed, but s_fence is already NULL.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; No, that case can't
            happen. See here:</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            drm_sched_job_cleanup(s_job);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            amdgpu_ring_priority_put(ring, s_job-&gt;s_priority);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            dma_fence_put(job-&gt;fence);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            amdgpu_sync_free(&amp;job-&gt;sync);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            amdgpu_sync_free(&amp;job-&gt;sched_sync);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            kfree(job);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The job itself is
            freed up directly after freeing the reference</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; to the</div>
          <div>&gt;&gt;&gt;&gt;&gt; s_fence.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; So you are just
            papering over a much bigger problem here. This</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; patch is a clear
            NAK.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Regards,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Christian.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; When you
            see a job without an s_fence then that means the</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; problem
            is somewhere else.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Regards,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            Christian.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            Signed-off-by: Emily Deng <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |&nbsp; 2 &#43;-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            drivers/gpu/drm/scheduler/sched_main.c&nbsp;&nbsp;&nbsp;&nbsp; | 11 &#43;&#43;&#43;&#43;&#43;&#43;---</div>
          <div>&gt;--</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            2 files changed, 7 insertions(&#43;), 6 deletions(-)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff
            --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            index e6ce949..5a8f08e 100644</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
            a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;&#43;&#43;
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@
            -4075,7 &#43;4075,7 @@ int</div>
          <div>&gt;&gt;&gt; amdgpu_device_gpu_recover(struct</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            amdgpu_device *adev,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            *</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            * job-&gt;base holds a reference to parent fence</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            */</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -&nbsp;
            if (job &amp;&amp; job-&gt;base.s_fence-&gt;parent
            &amp;&amp;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;&nbsp;
            if (job &amp;&amp; job-&gt;base.s_fence &amp;&amp;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;
            job-&gt;base.s_fence-&gt;parent</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; &amp;&amp;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            dma_fence_is_signaled(job-&gt;base.s_fence-&gt;parent))</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            job_signaled = true;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff
            --git a/drivers/gpu/drm/scheduler/sched_main.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            b/drivers/gpu/drm/scheduler/sched_main.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            index 31809ca..56cc10e 100644</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
            a/drivers/gpu/drm/scheduler/sched_main.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;&#43;&#43;
            b/drivers/gpu/drm/scheduler/sched_main.c</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@
            -334,8 &#43;334,8 @@ void</div>
          <div>&gt;drm_sched_increase_karma(struct</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            drm_sched_job</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            *bad)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            spin_lock(&amp;rq-&gt;lock);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            list_for_each_entry_safe(entity,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; tmp,</div>
          <div>&gt;&gt;&gt; &amp;rq-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; entities,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; list) {</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
            (bad-&gt;s_fence-&gt;scheduled.context</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; ==</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;fence_context) {</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bad-&gt;s_fence &amp;&amp;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;
            (bad-&gt;s_fence-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            scheduled.context ==</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;fence_context)) {</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            if</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            (atomic_read(&amp;bad-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; karma) &gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            bad-&gt;sched-</div>
          <div>&gt;&gt;&gt;&gt; hang_limit)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            if</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            (entity-</div>
          <div>&gt;&gt;&gt;&gt; guilty) @@ -376,7 &#43;376,7 @@ void</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            drm_sched_stop(struct</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_gpu_scheduler</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *sched,
            struct drm_sched_job *bad)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            * This iteration is thread safe as sched thread</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; is</div>
          <div>&gt;&gt;&gt; stopped.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            */</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            list_for_each_entry_safe_reverse(s_job, tmp,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &amp;sched- ring_mirror_list, node) {</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (s_job-&gt;s_fence-&gt;parent &amp;&amp;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (s_job-&gt;s_fence &amp;&amp;
            s_job-&gt;s_fence-&gt;parent &amp;&amp;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            dma_fence_remove_callback(s_job-</div>
          <div>&gt;&gt;&gt;&gt; s_fence-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; parent,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &amp;s_job-&gt;cb)) {</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            atomic_dec(&amp;sched-&gt;hw_rq_count);</div>
          <div>&gt;&gt;&gt; @@ -</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; 395,7</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;395,8 @@
            void</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            drm_sched_stop(struct drm_gpu_scheduler</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *sched,
            struct drm_sched_job *bad)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            *</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            * Job is still alive so fence</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            refcount at</div>
          <div>&gt;&gt;&gt; least 1</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            */</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            dma_fence_wait(&amp;s_job-&gt;s_fence-&gt;finished,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; false);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (s_job-&gt;s_fence)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            dma_fence_wait(&amp;s_job-&gt;s_fence-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; finished,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; false);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            /*</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            * We must keep bad job alive</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for
            later</div>
          <div>&gt;&gt;&gt; use</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; during @@</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -438,7</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;439,7 @@ void drm_sched_start(struct drm_gpu_scheduler</div>
          <div>&gt;&gt;&gt;&gt;&gt; *sched,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;bool</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            full_recovery)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            * GPU recovers can't run in parallel.</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            */</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            list_for_each_entry_safe(s_job, tmp,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &amp;sched-&gt;ring_mirror_list,</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            node)</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; {</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence =
            s_job-&gt;s_fence-&gt;parent;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence = s_job-&gt;s_fence ?</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#43;
            s_job-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; s_fence-</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            parent :</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            &#43;NULL;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            atomic_inc(&amp;sched-&gt;hw_rq_count);</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            _______________________________________________</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; amd-gfx
            mailing list</div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a></div>
          <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx" moz-do-not-send="true">
              https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
          <div>&gt;</div>
          <div>&gt;_______________________________________________</div>
          <div>&gt;amd-gfx mailing list</div>
          <div>&gt;<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a></div>
          <div>&gt;<a href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
          <div><font face="Times New Roman">&nbsp;</font></div>
        </span></font>
    </blockquote>
    <br>
  </body>
</html>

--------------D24A49F7CA0F12D67D5E19E9--

--===============0444669653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0444669653==--
