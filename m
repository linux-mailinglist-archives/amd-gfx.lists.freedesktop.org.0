Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDCF1A9B8E
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2020 12:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3B6E95F;
	Wed, 15 Apr 2020 10:58:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220496E95F
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Apr 2020 10:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQnMVb8Na0iw7m7h5wuimA0U+ozcBbR1Eq2tD9myT3G3y030shi4ZK/qyrU5B40C2Ud/I7N9XFWpejdtGVYikaG5MvXHmQKj0DPEl3dgvHQfKR6yt2OzWNQUWB8oebDsN6jqmHdUyR48rfGfrCJvgXktW83CH1Sa2OYIBhEYL6B6P3JJL+gFLAMCgr52ONoooWEATZGk7WayVlbxUYYY6OTD92dRUC7ceLOqCoZdcgbDQ0huXP79VMn0GXZtXLvK8jd+M+nUjFPWWERaWSsMMuC+TrKOf3M1S9MTp8ZWaceTmBGM6P+4rVvpHdTSsN6y43SorE23GG1nOBFDyG5Wuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4Zr67scR8NDlDXL7nvbsTHtK66Vn0R1vnKOcuysQz8=;
 b=ULBOA4B4r6BtEBW/nPR4TvTHwj6x+8fAUmei6aCQJzqGMGemg55jaivAPV2oO99IxhttTjdCS6uPInmbzaKO0yc06AJFomwI5yBaQ8cFwoWDq8kgXjnTbVk+FPFLolgD+mof1ol+/OKP74mRDp6gwGV8hTz9HnYlBDpEf0iDjlgu7MiGbuMc9BwkJqnE5Akjsr+Qs7yeoP0vrzZNLZ1+hi/HOUuZZVF1w9RDi2rxWP7gvHKbxIrZ7vNyzeK/QNgNhys9nxuGoMbKLmvetVUtNBPC4VtXFXZkDq6hUmR3tiYIPQGHvcdFWGjlJ2Ca05OQCoUpXH975yK0saqiDwClEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4Zr67scR8NDlDXL7nvbsTHtK66Vn0R1vnKOcuysQz8=;
 b=X0XO9T/6z2FGAzsFgJbNtqL0wFNFLORbF2VfkTlIVfYFNBXvjM+X8Qv4o1KHq4V6/JRKXUfKTMsn4PmdqUtHygzaslgFkvKEyfw3UKunXUNaFwPLVwgdIUsfJ6HLkjRa7He1EqklUO8m9n/EKY5G7KB8e+0TEzye0DTAHUfLGqM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3018.namprd12.prod.outlook.com (2603:10b6:5:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Wed, 15 Apr
 2020 10:58:34 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 10:58:34 +0000
Subject: Re: [PATCH] Revert "drm/amdgpu: use the BAR if possible in
 amdgpu_device_vram_access v2"
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20200413182026.2561-1-kent.russell@amd.com>
 <85fcb568-b0d8-b6c9-4e62-3866aa2da0c9@gmail.com>
 <DM6PR12MB3721FDB775B65C22B91D564585DA0@DM6PR12MB3721.namprd12.prod.outlook.com>
 <MN2PR12MB4488C1D9BF9C0A693860B1C1F7DA0@MN2PR12MB4488.namprd12.prod.outlook.com>
 <146d9570-724e-423d-931e-24c96821aaae@email.android.com>
 <MN2PR12MB451836BC6F9C0F002EE1C3D685DA0@MN2PR12MB4518.namprd12.prod.outlook.com>
 <e69b430e-f4e3-c4a0-82f0-dae527cccf3d@amd.com>
 <MN2PR12MB4518A3D9746674DA688AD34885DA0@MN2PR12MB4518.namprd12.prod.outlook.com>
 <f99378af-9352-9d85-57d6-d4980484ce12@amd.com>
 <MN2PR12MB4518963F186CF8528A620A7D85DB0@MN2PR12MB4518.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ff3cbf9d-0c8b-b7c5-2077-01c3d48ff09c@amd.com>
Date: Wed, 15 Apr 2020 12:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <MN2PR12MB4518963F186CF8528A620A7D85DB0@MN2PR12MB4518.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 10:58:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b873377-b7c3-4f20-2f79-08d7e12bf0ae
X-MS-TrafficTypeDiagnostic: DM6PR12MB3018:|DM6PR12MB3018:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3018B3A154CFFBFC366148C483DB0@DM6PR12MB3018.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0374433C81
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(31686004)(4326008)(6666004)(33964004)(66476007)(8936002)(186003)(5660300002)(6486002)(2906002)(86362001)(66556008)(31696002)(52116002)(110136005)(66574012)(54906003)(81156014)(66946007)(53546011)(2616005)(478600001)(45080400002)(30864003)(6636002)(16526019)(966005)(36756003)(316002)(8676002)(559001)(579004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LF6fsqkg0juleYimBPlqbZdMhLxPUT5E15Zce5SHh/ReS1xsA47EVWdVeQGVU6qRSlRR3x/GfgVwgu1XktzBkTQcSMRMv6E5QJv3yaQ02Hgc85tDq3uH1qk7URIRPBxq9xEHVoG0kAdBaHGvqUkfyFmGeiiv+bTc8F9TLqYotYDl2xw8WkmYbWBCduXymrQX38Gm28R8Kln78Vv0wQDUO7MZKGfIZ05jLSl7GjvsedDIBNK/lh4ptE1dRisS/pBjw4ZZ+WXi5vRFqqzp/g53qdhkxSmS2q0PnUEGiULO9fFwSaAuHpZVDUDUgVnZn9Lo5Qvz1e7iJMCDOx4WnBDMexfcIyUUGDgQqgC3oaL1ZMxfwxkIB40bI8scLVLhK9YDywOtMLKGCObVBhEi1zMApyo2H/kIRsI6sJ8qMNf61DSLN1XHRSHu+lfji0a858k58p1v0aK+FeXwubjdkoAezgGJ2+e3dx60+Pm9ZuYQbU=
X-MS-Exchange-AntiSpam-MessageData: 8Vql7hCRmY3iNcFUdWYGSoWkiBnF5vo9wpyTQslv5Px6P99SmCcPkzPM6rH9FvRV38a4QyT9fmXu46YPrqSCpPyF4bua3PYoDJOiCySCaACjb7SmO1D4pcjz5r2rfu8ZVGGglEoXhxazHAjRgHFnPd+S+nWZO2XJZog0ut95MncK4nMqpO1xEOVkmlRYboHmrDsHIvx864ZaHnfTGFzxfg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b873377-b7c3-4f20-2f79-08d7e12bf0ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 10:58:33.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9a564JhBy2lhthmOXaNUZHtXdjDOjW3tY8sAIW/gXq6VNFZUboDrd8v7VitH0R+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3018
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1189748873=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1189748873==
Content-Type: multipart/alternative;
 boundary="------------62ECEE4A38209F1762D8447F"
Content-Language: en-US

--------------62ECEE4A38209F1762D8447F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

> To elaborate on the PTRACE test, we PEEK 2 DWORDs inside thunk 
> allocated mapped memory and 2 DWORDS outside that boundary (it’s only 
> about 4MB to the boundary).  Then we POKE to swap the DWORD positions 
> across the boundary.  The RAS event on the single failing machine 
> happens on the out of boundary PEEK.
>

Well when you access outside of an allocated buffer I would expect that 
we never get as far as even touching the hardware because the kernel 
should block the access with an -EPERM or -EFAULT. So sounds like I'm 
not understanding something correctly here.

Apart from that I completely agree that we need to sort out any other 
RAS event first to make sure that the system is simply not failing randomly.

Regards,
Christian.

Am 15.04.20 um 11:49 schrieb Kim, Jonathan:
>
> [AMD Public Use]
>
> Hi Christian,
>
> That could potentially be it.  With additional testing, 2 of 3 Vega20 
> machines never hit error over BAR access with the PTRACE test.  3 of 3 
> machines (from the same pool) always hit error with CWSR.
>
> To elaborate on the PTRACE test, we PEEK 2 DWORDs inside thunk 
> allocated mapped memory and 2 DWORDS outside that boundary (it’s only 
> about 4MB to the boundary).  Then we POKE to swap the DWORD positions 
> across the boundary.  The RAS event on the single failing machine 
> happens on the out of boundary PEEK.
>
> Felix mentioned we don’t hit errors over general HDP access but that 
> may not true.  An Arcturus failure sys logs posted (which wasn’t 
> tested by me) shows someone launched rocm bandwidth test, hit a VM 
> fault and a RAS event ensued during evictions (I can point the 
> internal ticket or log snippet offline if interested).  Whether the 
> RAS event is BAR access triggered or the result of HW instability is 
> beyond me since I don’t have access to the machine.
>
> Thanks,
>
> Jon
>
> *From:*Koenig, Christian <Christian.Koenig@amd.com>
> *Sent:* Wednesday, April 15, 2020 4:11 AM
> *To:* Kim, Jonathan <Jonathan.Kim@amd.com>; Kuehling, Felix 
> <Felix.Kuehling@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
> *Cc:* Russell, Kent <Kent.Russell@amd.com>; amd-gfx@lists.freedesktop.org
> *Subject:* Re: [PATCH] Revert "drm/amdgpu: use the BAR if possible in 
> amdgpu_device_vram_access v2"
>
> Hi Jon,
>
>     Also cwsr tests fail on Vega20 with or without the revert with the
>     same RAS error.
>
>
> That sounds like the system/setup has a more general problem.
>
> Could it be that we are seeing RAS errors because there really is some 
> hardware failure, but with the MM path we don't trigger a RAS interrupt?
>
> Thanks,
> Christian.
>
> Am 14.04.20 um 22:30 schrieb Kim, Jonathan:
>
>     [AMD Official Use Only - Internal Distribution Only]
>
>     If we’re passing the test on the revert, then the only thing
>     that’s different is we’re not invalidating HDP and doing a copy to
>     host anymore in amdgpu_device_vram_access since the function is
>     still called in ttm access_memory with BAR.
>
>     Also cwsr tests fail on Vega20 with or without the revert with the
>     same RAS error.
>
>     Thanks,
>
>     Jon
>
>     *From:* Kuehling, Felix <Felix.Kuehling@amd.com>
>     <mailto:Felix.Kuehling@amd.com>
>     *Sent:* Tuesday, April 14, 2020 2:32 PM
>     *To:* Kim, Jonathan <Jonathan.Kim@amd.com>
>     <mailto:Jonathan.Kim@amd.com>; Koenig, Christian
>     <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>;
>     Deucher, Alexander <Alexander.Deucher@amd.com>
>     <mailto:Alexander.Deucher@amd.com>
>     *Cc:* Russell, Kent <Kent.Russell@amd.com>
>     <mailto:Kent.Russell@amd.com>; amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>
>     *Subject:* Re: [PATCH] Revert "drm/amdgpu: use the BAR if possible
>     in amdgpu_device_vram_access v2"
>
>     I wouldn't call it premature. Revert is a usual practice when
>     there is a serious regression that isn't fully understood or
>     root-caused. As far as I can tell, the problem has been reproduced
>     on multiple systems, different GPUs, and clearly regressed to
>     Christian's commit. I think that justifies reverting it for now.
>
>     I agree with Christian that a general HDP memory access problem
>     causing RAS errors would potentially cause problems in other tests
>     as well. For example common operations like GART table updates,
>     and GPUVM page table updates and PCIe peer2peer accesses in ROCm
>     applications use HDP. But we're not seeing obvious problems from
>     those. So we need to understand what's special about this test. I
>     asked questions to that effect on our other email thread.
>
>     Regards,
>       Felix
>
>     Am 2020-04-14 um 10:51 a.m. schrieb Kim, Jonathan:
>
>         [AMD Official Use Only - Internal Distribution Only]
>
>         I think it’s premature to push this revert.
>
>         With more testing, I’m getting failures from different tests
>         or sometimes none at all on my machine.
>
>         Kent, let’s continue the discussion on the original thread.
>
>         Thanks,
>
>         Jon
>
>         *From:* Koenig, Christian <Christian.Koenig@amd.com>
>         <mailto:Christian.Koenig@amd.com>
>         *Sent:* Tuesday, April 14, 2020 10:47 AM
>         *To:* Deucher, Alexander <Alexander.Deucher@amd.com>
>         <mailto:Alexander.Deucher@amd.com>
>         *Cc:* Russell, Kent <Kent.Russell@amd.com>
>         <mailto:Kent.Russell@amd.com>; amd-gfx@lists.freedesktop.org
>         <mailto:amd-gfx@lists.freedesktop.org>; Kuehling, Felix
>         <Felix.Kuehling@amd.com> <mailto:Felix.Kuehling@amd.com>; Kim,
>         Jonathan <Jonathan.Kim@amd.com> <mailto:Jonathan.Kim@amd.com>
>         *Subject:* Re: [PATCH] Revert "drm/amdgpu: use the BAR if
>         possible in amdgpu_device_vram_access v2"
>
>         That's exactly my concern as well.
>
>         This looks a bit like the test creates erroneous data somehow,
>         but there doesn't seems to be a RAS check in the MM data path.
>
>         And now that we use the BAR path it goes up in flames.
>
>         I just don't see how we can create erroneous data in a test case?
>
>         Christian.
>
>         Am 14.04.2020 16:35 schrieb "Deucher, Alexander"
>         <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>:
>
>             [AMD Public Use]
>
>             If this causes an issue, any access to vram via the BAR
>             could cause an issue.
>
>             Alex
>
>             ------------------------------------------------------------------------
>
>             *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org
>             <mailto:amd-gfx-bounces@lists.freedesktop.org>> on behalf
>             of Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>
>             *Sent:* Tuesday, April 14, 2020 10:19 AM
>             *To:* Koenig, Christian <Christian.Koenig@amd.com
>             <mailto:Christian.Koenig@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             <amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>>
>             *Cc:* Kuehling, Felix <Felix.Kuehling@amd.com
>             <mailto:Felix.Kuehling@amd.com>>; Kim, Jonathan
>             <Jonathan.Kim@amd.com <mailto:Jonathan.Kim@amd.com>>
>             *Subject:* RE: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in amdgpu_device_vram_access v2"
>
>             [AMD Official Use Only - Internal Distribution Only]
>
>             On VG20 or MI100, as soon as we run the subtest, we get
>             the dmesg output below, and then the kernel ends up
>             hanging. I don't know enough about the test itself to know
>             why this is occurring, but Jon Kim and Felix were
>             discussing it on a separate thread when the issue was
>             first reported, so they can hopefully provide some
>             additional information.
>
>              Kent
>
>             > -----Original Message-----
>             > From: Christian König <ckoenig.leichtzumerken@gmail.com
>             <mailto:ckoenig.leichtzumerken@gmail.com>>
>             > Sent: Tuesday, April 14, 2020 9:52 AM
>             > To: Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             > Subject: Re: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in
>             > amdgpu_device_vram_access v2"
>             >
>             > Am 13.04.20 um 20:20 schrieb Kent Russell:
>             > > This reverts commit
>             c12b84d6e0d70f1185e6daddfd12afb671791b6e.
>             > > The original patch causes a RAS event and subsequent
>             kernel hard-hang
>             > > when running the
>             KFDMemoryTest.PtraceAccessInvisibleVram on VG20 and
>             > > Arcturus
>             > >
>             > > dmesg output at hang time:
>             > > [drm] RAS event of type ERREVENT_ATHUB_INTERRUPT detected!
>             > > amdgpu 0000:67:00.0: GPU reset begin!
>             > > Evicting PASID 0x8000 queues
>             > > Started evicting pasid 0x8000
>             > > qcm fence wait loop timeout expired
>             > > The cp might be in an unrecoverable state due to an
>             unsuccessful
>             > > queues preemption Failed to evict process queues
>             Failed to suspend
>             > > process 0x8000 Finished evicting pasid 0x8000 Started
>             restoring pasid
>             > > 0x8000 Finished restoring pasid 0x8000 [drm] UVD VCPU
>             state may lost
>             > > due to RAS ERREVENT_ATHUB_INTERRUPT
>             > > amdgpu: [powerplay] Failed to send message 0x26,
>             response 0x0
>             > > amdgpu: [powerplay] Failed to set soft min gfxclk !
>             > > amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
>             > > amdgpu: [powerplay] Failed to send message 0x7,
>             response 0x0
>             > > amdgpu: [powerplay] [DisableAllSMUFeatures] Failed to
>             disable all smu
>             > features!
>             > > amdgpu: [powerplay] [DisableDpmTasks] Failed to
>             disable all smu features!
>             > > amdgpu: [powerplay] [PowerOffAsic] Failed to disable DPM!
>             > > [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR*
>             suspend of IP
>             > > block <powerplay> failed -5
>             >
>             > Do you have more information on what's going wrong here
>             since this is a really
>             > important patch for KFD debugging.
>             >
>             > >
>             > > Signed-off-by: Kent Russell <kent.russell@amd.com
>             <mailto:kent.russell@amd.com>>
>             >
>             > Reviewed-by: Christian König <christian.koenig@amd.com
>             <mailto:christian.koenig@amd.com>>
>             >
>             > > ---
>             > > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26
>             ----------------------
>             > >   1 file changed, 26 deletions(-)
>             > >
>             > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > index cf5d6e585634..a3f997f84020 100644
>             > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > @@ -254,32 +254,6 @@ void amdgpu_device_vram_access(struct
>             > amdgpu_device *adev, loff_t pos,
>             > >      uint32_t hi = ~0;
>             > >      uint64_t last;
>             > >
>             > > -
>             > > -#ifdef CONFIG_64BIT
>             > > -   last = min(pos + size, adev->gmc.visible_vram_size);
>             > > -   if (last > pos) {
>             > > -           void __iomem *addr =
>             adev->mman.aper_base_kaddr + pos;
>             > > -           size_t count = last - pos;
>             > > -
>             > > -           if (write) {
>             > > - memcpy_toio(addr, buf, count);
>             > > -                   mb();
>             > > - amdgpu_asic_flush_hdp(adev, NULL);
>             > > -           } else {
>             > > - amdgpu_asic_invalidate_hdp(adev, NULL);
>             > > -                   mb();
>             > > - memcpy_fromio(buf, addr, count);
>             > > -           }
>             > > -
>             > > -           if (count == size)
>             > > - return;
>             > > -
>             > > -           pos += count;
>             > > -           buf += count / 4;
>             > > -           size -= count;
>             > > -   }
>             > > -#endif
>             > > -
>             > > spin_lock_irqsave(&adev->mmio_idx_lock, flags);
>             > >      for (last = pos + size; pos < last; pos += 4) {
>             > >              uint32_t tmp = pos >> 31;
>             _______________________________________________
>             amd-gfx mailing list
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;reserved=0
>
>         Am 14.04.2020 16:35 schrieb "Deucher, Alexander"
>         <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>:
>
>             [AMD Public Use]
>
>             If this causes an issue, any access to vram via the BAR
>             could cause an issue.
>
>             Alex
>
>             ------------------------------------------------------------------------
>
>             *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org
>             <mailto:amd-gfx-bounces@lists.freedesktop.org>> on behalf
>             of Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>
>             *Sent:* Tuesday, April 14, 2020 10:19 AM
>             *To:* Koenig, Christian <Christian.Koenig@amd.com
>             <mailto:Christian.Koenig@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             <amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>>
>             *Cc:* Kuehling, Felix <Felix.Kuehling@amd.com
>             <mailto:Felix.Kuehling@amd.com>>; Kim, Jonathan
>             <Jonathan.Kim@amd.com <mailto:Jonathan.Kim@amd.com>>
>             *Subject:* RE: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in amdgpu_device_vram_access v2"
>
>             [AMD Official Use Only - Internal Distribution Only]
>
>             On VG20 or MI100, as soon as we run the subtest, we get
>             the dmesg output below, and then the kernel ends up
>             hanging. I don't know enough about the test itself to know
>             why this is occurring, but Jon Kim and Felix were
>             discussing it on a separate thread when the issue was
>             first reported, so they can hopefully provide some
>             additional information.
>
>              Kent
>
>             > -----Original Message-----
>             > From: Christian König <ckoenig.leichtzumerken@gmail.com
>             <mailto:ckoenig.leichtzumerken@gmail.com>>
>             > Sent: Tuesday, April 14, 2020 9:52 AM
>             > To: Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             > Subject: Re: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in
>             > amdgpu_device_vram_access v2"
>             >
>             > Am 13.04.20 um 20:20 schrieb Kent Russell:
>             > > This reverts commit
>             c12b84d6e0d70f1185e6daddfd12afb671791b6e.
>             > > The original patch causes a RAS event and subsequent
>             kernel hard-hang
>             > > when running the
>             KFDMemoryTest.PtraceAccessInvisibleVram on VG20 and
>             > > Arcturus
>             > >
>             > > dmesg output at hang time:
>             > > [drm] RAS event of type ERREVENT_ATHUB_INTERRUPT detected!
>             > > amdgpu 0000:67:00.0: GPU reset begin!
>             > > Evicting PASID 0x8000 queues
>             > > Started evicting pasid 0x8000
>             > > qcm fence wait loop timeout expired
>             > > The cp might be in an unrecoverable state due to an
>             unsuccessful
>             > > queues preemption Failed to evict process queues
>             Failed to suspend
>             > > process 0x8000 Finished evicting pasid 0x8000 Started
>             restoring pasid
>             > > 0x8000 Finished restoring pasid 0x8000 [drm] UVD VCPU
>             state may lost
>             > > due to RAS ERREVENT_ATHUB_INTERRUPT
>             > > amdgpu: [powerplay] Failed to send message 0x26,
>             response 0x0
>             > > amdgpu: [powerplay] Failed to set soft min gfxclk !
>             > > amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
>             > > amdgpu: [powerplay] Failed to send message 0x7,
>             response 0x0
>             > > amdgpu: [powerplay] [DisableAllSMUFeatures] Failed to
>             disable all smu
>             > features!
>             > > amdgpu: [powerplay] [DisableDpmTasks] Failed to
>             disable all smu features!
>             > > amdgpu: [powerplay] [PowerOffAsic] Failed to disable DPM!
>             > > [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR*
>             suspend of IP
>             > > block <powerplay> failed -5
>             >
>             > Do you have more information on what's going wrong here
>             since this is a really
>             > important patch for KFD debugging.
>             >
>             > >
>             > > Signed-off-by: Kent Russell <kent.russell@amd.com
>             <mailto:kent.russell@amd.com>>
>             >
>             > Reviewed-by: Christian König <christian.koenig@amd.com
>             <mailto:christian.koenig@amd.com>>
>             >
>             > > ---
>             > > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26
>             ----------------------
>             > >   1 file changed, 26 deletions(-)
>             > >
>             > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > index cf5d6e585634..a3f997f84020 100644
>             > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > @@ -254,32 +254,6 @@ void amdgpu_device_vram_access(struct
>             > amdgpu_device *adev, loff_t pos,
>             > >      uint32_t hi = ~0;
>             > >      uint64_t last;
>             > >
>             > > -
>             > > -#ifdef CONFIG_64BIT
>             > > -   last = min(pos + size, adev->gmc.visible_vram_size);
>             > > -   if (last > pos) {
>             > > -           void __iomem *addr =
>             adev->mman.aper_base_kaddr + pos;
>             > > -           size_t count = last - pos;
>             > > -
>             > > -           if (write) {
>             > > - memcpy_toio(addr, buf, count);
>             > > -                   mb();
>             > > - amdgpu_asic_flush_hdp(adev, NULL);
>             > > -           } else {
>             > > - amdgpu_asic_invalidate_hdp(adev, NULL);
>             > > -                   mb();
>             > > - memcpy_fromio(buf, addr, count);
>             > > -           }
>             > > -
>             > > -           if (count == size)
>             > > -                   return;
>             > > -
>             > > -           pos += count;
>             > > -           buf += count / 4;
>             > > -           size -= count;
>             > > -   }
>             > > -#endif
>             > > -
>             > > spin_lock_irqsave(&adev->mmio_idx_lock, flags);
>             > >      for (last = pos + size; pos < last; pos += 4) {
>             > >              uint32_t tmp = pos >> 31;
>             _______________________________________________
>             amd-gfx mailing list
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;reserved=0
>
>         Am 14.04.2020 16:35 schrieb "Deucher, Alexander"
>         <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>:
>
>             [AMD Public Use]
>
>             If this causes an issue, any access to vram via the BAR
>             could cause an issue.
>
>             Alex
>
>             ------------------------------------------------------------------------
>
>             *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org
>             <mailto:amd-gfx-bounces@lists.freedesktop.org>> on behalf
>             of Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>
>             *Sent:* Tuesday, April 14, 2020 10:19 AM
>             *To:* Koenig, Christian <Christian.Koenig@amd.com
>             <mailto:Christian.Koenig@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             <amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>>
>             *Cc:* Kuehling, Felix <Felix.Kuehling@amd.com
>             <mailto:Felix.Kuehling@amd.com>>; Kim, Jonathan
>             <Jonathan.Kim@amd.com <mailto:Jonathan.Kim@amd.com>>
>             *Subject:* RE: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in amdgpu_device_vram_access v2"
>
>             [AMD Official Use Only - Internal Distribution Only]
>
>             On VG20 or MI100, as soon as we run the subtest, we get
>             the dmesg output below, and then the kernel ends up
>             hanging. I don't know enough about the test itself to know
>             why this is occurring, but Jon Kim and Felix were
>             discussing it on a separate thread when the issue was
>             first reported, so they can hopefully provide some
>             additional information.
>
>              Kent
>
>             > -----Original Message-----
>             > From: Christian König <ckoenig.leichtzumerken@gmail.com
>             <mailto:ckoenig.leichtzumerken@gmail.com>>
>             > Sent: Tuesday, April 14, 2020 9:52 AM
>             > To: Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             > Subject: Re: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in
>             > amdgpu_device_vram_access v2"
>             >
>             > Am 13.04.20 um 20:20 schrieb Kent Russell:
>             > > This reverts commit
>             c12b84d6e0d70f1185e6daddfd12afb671791b6e.
>             > > The original patch causes a RAS event and subsequent
>             kernel hard-hang
>             > > when running the
>             KFDMemoryTest.PtraceAccessInvisibleVram on VG20 and
>             > > Arcturus
>             > >
>             > > dmesg output at hang time:
>             > > [drm] RAS event of type ERREVENT_ATHUB_INTERRUPT detected!
>             > > amdgpu 0000:67:00.0: GPU reset begin!
>             > > Evicting PASID 0x8000 queues
>             > > Started evicting pasid 0x8000
>             > > qcm fence wait loop timeout expired
>             > > The cp might be in an unrecoverable state due to an
>             unsuccessful
>             > > queues preemption Failed to evict process queues
>             Failed to suspend
>             > > process 0x8000 Finished evicting pasid 0x8000 Started
>             restoring pasid
>             > > 0x8000 Finished restoring pasid 0x8000 [drm] UVD VCPU
>             state may lost
>             > > due to RAS ERREVENT_ATHUB_INTERRUPT
>             > > amdgpu: [powerplay] Failed to send message 0x26,
>             response 0x0
>             > > amdgpu: [powerplay] Failed to set soft min gfxclk !
>             > > amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
>             > > amdgpu: [powerplay] Failed to send message 0x7,
>             response 0x0
>             > > amdgpu: [powerplay] [DisableAllSMUFeatures] Failed to
>             disable all smu
>             > features!
>             > > amdgpu: [powerplay] [DisableDpmTasks] Failed to
>             disable all smu features!
>             > > amdgpu: [powerplay] [PowerOffAsic] Failed to disable DPM!
>             > > [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR*
>             suspend of IP
>             > > block <powerplay> failed -5
>             >
>             > Do you have more information on what's going wrong here
>             since this is a really
>             > important patch for KFD debugging.
>             >
>             > >
>             > > Signed-off-by: Kent Russell <kent.russell@amd.com
>             <mailto:kent.russell@amd.com>>
>             >
>             > Reviewed-by: Christian König <christian.koenig@amd.com
>             <mailto:christian.koenig@amd.com>>
>             >
>             > > ---
>             > > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26
>             ----------------------
>             > >   1 file changed, 26 deletions(-)
>             > >
>             > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > index cf5d6e585634..a3f997f84020 100644
>             > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > @@ -254,32 +254,6 @@ void amdgpu_device_vram_access(struct
>             > amdgpu_device *adev, loff_t pos,
>             > >      uint32_t hi = ~0;
>             > >      uint64_t last;
>             > >
>             > > -
>             > > -#ifdef CONFIG_64BIT
>             > > -   last = min(pos + size, adev->gmc.visible_vram_size);
>             > > -   if (last > pos) {
>             > > -           void __iomem *addr =
>             adev->mman.aper_base_kaddr + pos;
>             > > -           size_t count = last - pos;
>             > > -
>             > > -           if (write) {
>             > > - memcpy_toio(addr, buf, count);
>             > > -                   mb();
>             > > - amdgpu_asic_flush_hdp(adev, NULL);
>             > > -           } else {
>             > > - amdgpu_asic_invalidate_hdp(adev, NULL);
>             > > -                   mb();
>             > > - memcpy_fromio(buf, addr, count);
>             > > -           }
>             > > -
>             > > -           if (count == size)
>             > > -                   return;
>             > > -
>             > > -           pos += count;
>             > > -           buf += count / 4;
>             > > -           size -= count;
>             > > -   }
>             > > -#endif
>             > > -
>             > > spin_lock_irqsave(&adev->mmio_idx_lock, flags);
>             > >      for (last = pos + size; pos < last; pos += 4) {
>             > >              uint32_t tmp = pos >> 31;
>             _______________________________________________
>             amd-gfx mailing list
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;reserved=0
>
>         Am 14.04.2020 16:35 schrieb "Deucher, Alexander"
>         <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>:
>
>             [AMD Public Use]
>
>             If this causes an issue, any access to vram via the BAR
>             could cause an issue.
>
>             Alex
>
>             ------------------------------------------------------------------------
>
>             *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org
>             <mailto:amd-gfx-bounces@lists.freedesktop.org>> on behalf
>             of Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>
>             *Sent:* Tuesday, April 14, 2020 10:19 AM
>             *To:* Koenig, Christian <Christian.Koenig@amd.com
>             <mailto:Christian.Koenig@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             <amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>>
>             *Cc:* Kuehling, Felix <Felix.Kuehling@amd.com
>             <mailto:Felix.Kuehling@amd.com>>; Kim, Jonathan
>             <Jonathan.Kim@amd.com <mailto:Jonathan.Kim@amd.com>>
>             *Subject:* RE: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in amdgpu_device_vram_access v2"
>
>             [AMD Official Use Only - Internal Distribution Only]
>
>             On VG20 or MI100, as soon as we run the subtest, we get
>             the dmesg output below, and then the kernel ends up
>             hanging. I don't know enough about the test itself to know
>             why this is occurring, but Jon Kim and Felix were
>             discussing it on a separate thread when the issue was
>             first reported, so they can hopefully provide some
>             additional information.
>
>              Kent
>
>             > -----Original Message-----
>             > From: Christian König <ckoenig.leichtzumerken@gmail.com
>             <mailto:ckoenig.leichtzumerken@gmail.com>>
>             > Sent: Tuesday, April 14, 2020 9:52 AM
>             > To: Russell, Kent <Kent.Russell@amd.com
>             <mailto:Kent.Russell@amd.com>>;
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             > Subject: Re: [PATCH] Revert "drm/amdgpu: use the BAR if
>             possible in
>             > amdgpu_device_vram_access v2"
>             >
>             > Am 13.04.20 um 20:20 schrieb Kent Russell:
>             > > This reverts commit
>             c12b84d6e0d70f1185e6daddfd12afb671791b6e.
>             > > The original patch causes a RAS event and subsequent
>             kernel hard-hang
>             > > when running the
>             KFDMemoryTest.PtraceAccessInvisibleVram on VG20 and
>             > > Arcturus
>             > >
>             > > dmesg output at hang time:
>             > > [drm] RAS event of type ERREVENT_ATHUB_INTERRUPT detected!
>             > > amdgpu 0000:67:00.0: GPU reset begin!
>             > > Evicting PASID 0x8000 queues
>             > > Started evicting pasid 0x8000
>             > > qcm fence wait loop timeout expired
>             > > The cp might be in an unrecoverable state due to an
>             unsuccessful
>             > > queues preemption Failed to evict process queues
>             Failed to suspend
>             > > process 0x8000 Finished evicting pasid 0x8000 Started
>             restoring pasid
>             > > 0x8000 Finished restoring pasid 0x8000 [drm] UVD VCPU
>             state may lost
>             > > due to RAS ERREVENT_ATHUB_INTERRUPT
>             > > amdgpu: [powerplay] Failed to send message 0x26,
>             response 0x0
>             > > amdgpu: [powerplay] Failed to set soft min gfxclk !
>             > > amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
>             > > amdgpu: [powerplay] Failed to send message 0x7,
>             response 0x0
>             > > amdgpu: [powerplay] [DisableAllSMUFeatures] Failed to
>             disable all smu
>             > features!
>             > > amdgpu: [powerplay] [DisableDpmTasks] Failed to
>             disable all smu features!
>             > > amdgpu: [powerplay] [PowerOffAsic] Failed to disable DPM!
>             > > [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR*
>             suspend of IP
>             > > block <powerplay> failed -5
>             >
>             > Do you have more information on what's going wrong here
>             since this is a really
>             > important patch for KFD debugging.
>             >
>             > >
>             > > Signed-off-by: Kent Russell <kent.russell@amd.com
>             <mailto:kent.russell@amd.com>>
>             >
>             > Reviewed-by: Christian König <christian.koenig@amd.com
>             <mailto:christian.koenig@amd.com>>
>             >
>             > > ---
>             > > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26
>             ----------------------
>             > >   1 file changed, 26 deletions(-)
>             > >
>             > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > index cf5d6e585634..a3f997f84020 100644
>             > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>             > > @@ -254,32 +254,6 @@ void amdgpu_device_vram_access(struct
>             > amdgpu_device *adev, loff_t pos,
>             > >      uint32_t hi = ~0;
>             > >      uint64_t last;
>             > >
>             > > -
>             > > -#ifdef CONFIG_64BIT
>             > > -   last = min(pos + size, adev->gmc.visible_vram_size);
>             > > -   if (last > pos) {
>             > > -           void __iomem *addr =
>             adev->mman.aper_base_kaddr + pos;
>             > > -           size_t count = last - pos;
>             > > -
>             > > -           if (write) {
>             > > - memcpy_toio(addr, buf, count);
>             > > -                   mb();
>             > > - amdgpu_asic_flush_hdp(adev, NULL);
>             > > -           } else {
>             > > - amdgpu_asic_invalidate_hdp(adev, NULL);
>             > > -                   mb();
>             > > - memcpy_fromio(buf, addr, count);
>             > > -           }
>             > > -
>             > > -           if (count == size)
>             > > -                   return;
>             > > -
>             > > -           pos += count;
>             > > -           buf += count / 4;
>             > > -           size -= count;
>             > > -   }
>             > > -#endif
>             > > -
>             > > spin_lock_irqsave(&adev->mmio_idx_lock, flags);
>             > >      for (last = pos + size; pos < last; pos += 4) {
>             > >              uint32_t tmp = pos >> 31;
>             _______________________________________________
>             amd-gfx mailing list
>             amd-gfx@lists.freedesktop.org
>             <mailto:amd-gfx@lists.freedesktop.org>
>             https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;reserved=0
>
>         Am 14.04.2020 16:35 schrieb "Deucher, Alexander"
>         <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>:
>
>         [AMD Public Use]
>
>         If this causes an issue, any access to vram via the BAR could
>         cause an issue.
>
>         Alex
>
>         ------------------------------------------------------------------------
>
>         *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org
>         <mailto:amd-gfx-bounces@lists.freedesktop.org>> on behalf of
>         Russell, Kent <Kent.Russell@amd.com <mailto:Kent.Russell@amd.com>>
>         *Sent:* Tuesday, April 14, 2020 10:19 AM
>         *To:* Koenig, Christian <Christian.Koenig@amd.com
>         <mailto:Christian.Koenig@amd.com>>;
>         amd-gfx@lists.freedesktop.org
>         <mailto:amd-gfx@lists.freedesktop.org>
>         <amd-gfx@lists.freedesktop.org
>         <mailto:amd-gfx@lists.freedesktop.org>>
>         *Cc:* Kuehling, Felix <Felix.Kuehling@amd.com
>         <mailto:Felix.Kuehling@amd.com>>; Kim, Jonathan
>         <Jonathan.Kim@amd.com <mailto:Jonathan.Kim@amd.com>>
>         *Subject:* RE: [PATCH] Revert "drm/amdgpu: use the BAR if
>         possible in amdgpu_device_vram_access v2"
>
>         [AMD Official Use Only - Internal Distribution Only]
>
>         On VG20 or MI100, as soon as we run the subtest, we get the
>         dmesg output below, and then the kernel ends up hanging. I
>         don't know enough about the test itself to know why this is
>         occurring, but Jon Kim and Felix were discussing it on a
>         separate thread when the issue was first reported, so they can
>         hopefully provide some additional information.
>
>          Kent
>
>         > -----Original Message-----
>         > From: Christian König <ckoenig.leichtzumerken@gmail.com
>         <mailto:ckoenig.leichtzumerken@gmail.com>>
>         > Sent: Tuesday, April 14, 2020 9:52 AM
>         > To: Russell, Kent <Kent.Russell@amd.com
>         <mailto:Kent.Russell@amd.com>>; amd-gfx@lists.freedesktop.org
>         <mailto:amd-gfx@lists.freedesktop.org>
>         > Subject: Re: [PATCH] Revert "drm/amdgpu: use the BAR if
>         possible in
>         > amdgpu_device_vram_access v2"
>         >
>         > Am 13.04.20 um 20:20 schrieb Kent Russell:
>         > > This reverts commit c12b84d6e0d70f1185e6daddfd12afb671791b6e.
>         > > The original patch causes a RAS event and subsequent
>         kernel hard-hang
>         > > when running the KFDMemoryTest.PtraceAccessInvisibleVram
>         on VG20 and
>         > > Arcturus
>         > >
>         > > dmesg output at hang time:
>         > > [drm] RAS event of type ERREVENT_ATHUB_INTERRUPT detected!
>         > > amdgpu 0000:67:00.0: GPU reset begin!
>         > > Evicting PASID 0x8000 queues
>         > > Started evicting pasid 0x8000
>         > > qcm fence wait loop timeout expired
>         > > The cp might be in an unrecoverable state due to an
>         unsuccessful
>         > > queues preemption Failed to evict process queues Failed to
>         suspend
>         > > process 0x8000 Finished evicting pasid 0x8000 Started
>         restoring pasid
>         > > 0x8000 Finished restoring pasid 0x8000 [drm] UVD VCPU
>         state may lost
>         > > due to RAS ERREVENT_ATHUB_INTERRUPT
>         > > amdgpu: [powerplay] Failed to send message 0x26, response 0x0
>         > > amdgpu: [powerplay] Failed to set soft min gfxclk !
>         > > amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
>         > > amdgpu: [powerplay] Failed to send message 0x7, response 0x0
>         > > amdgpu: [powerplay] [DisableAllSMUFeatures] Failed to
>         disable all smu
>         > features!
>         > > amdgpu: [powerplay] [DisableDpmTasks] Failed to disable
>         all smu features!
>         > > amdgpu: [powerplay] [PowerOffAsic] Failed to disable DPM!
>         > > [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR*
>         suspend of IP
>         > > block <powerplay> failed -5
>         >
>         > Do you have more information on what's going wrong here
>         since this is a really
>         > important patch for KFD debugging.
>         >
>         > >
>         > > Signed-off-by: Kent Russell <kent.russell@amd.com
>         <mailto:kent.russell@amd.com>>
>         >
>         > Reviewed-by: Christian König <christian.koenig@amd.com
>         <mailto:christian.koenig@amd.com>>
>         >
>         > > ---
>         > > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26
>         ----------------------
>         > >   1 file changed, 26 deletions(-)
>         > >
>         > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>         > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>         > > index cf5d6e585634..a3f997f84020 100644
>         > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>         > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>         > > @@ -254,32 +254,6 @@ void amdgpu_device_vram_access(struct
>         > amdgpu_device *adev, loff_t pos,
>         > >      uint32_t hi = ~0;
>         > >      uint64_t last;
>         > >
>         > > -
>         > > -#ifdef CONFIG_64BIT
>         > > -   last = min(pos + size, adev->gmc.visible_vram_size);
>         > > -   if (last > pos) {
>         > > -           void __iomem *addr =
>         adev->mman.aper_base_kaddr + pos;
>         > > -           size_t count = last - pos;
>         > > -
>         > > -           if (write) {
>         > > -                   memcpy_toio(addr, buf, count);
>         > > -                   mb();
>         > > - amdgpu_asic_flush_hdp(adev, NULL);
>         > > -           } else {
>         > > - amdgpu_asic_invalidate_hdp(adev, NULL);
>         > > -                   mb();
>         > > -                   memcpy_fromio(buf, addr, count);
>         > > -           }
>         > > -
>         > > -           if (count == size)
>         > > -                   return;
>         > > -
>         > > -           pos += count;
>         > > -           buf += count / 4;
>         > > -           size -= count;
>         > > -   }
>         > > -#endif
>         > > -
>         > > spin_lock_irqsave(&adev->mmio_idx_lock, flags);
>         > >      for (last = pos + size; pos < last; pos += 4) {
>         > >              uint32_t tmp = pos >> 31;
>         _______________________________________________
>         amd-gfx mailing list
>         amd-gfx@lists.freedesktop.org
>         <mailto:amd-gfx@lists.freedesktop.org>
>         https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;reserved=0
>


--------------62ECEE4A38209F1762D8447F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">
      <blockquote type="cite">
        <p class="MsoNormal"><span style="color:windowtext">To elaborate
            on the PTRACE test, we PEEK 2 DWORDs inside thunk allocated
            mapped memory and 2 DWORDS outside that boundary (it’s only
            about 4MB to the boundary).&nbsp; Then we POKE to swap the DWORD
            positions across the boundary.&nbsp; The RAS event on the single
            failing machine happens on the out of boundary PEEK.</span></p>
        <span style="color:windowtext"></span></blockquote>
      <br>
      Well when you access outside of an allocated buffer I would expect
      that we never get as far as even touching the hardware because the
      kernel should block the access with an -EPERM or -EFAULT. So
      sounds like I'm not understanding something correctly here.<br>
      <br>
      Apart from that I completely agree that we need to sort out any
      other RAS event first to make sure that the system is simply not
      failing randomly.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 15.04.20 um 11:49 schrieb Kim, Jonathan:<br>
    </div>
    <blockquote type="cite" cite="mid:MN2PR12MB4518963F186CF8528A620A7D85DB0@MN2PR12MB4518.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.msipheader4d0fcdd7, li.msipheader4d0fcdd7, div.msipheader4d0fcdd7
	{mso-style-name:msipheader4d0fcdd7;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.msipheader87abd423, li.msipheader87abd423, div.msipheader87abd423
	{mso-style-name:msipheader87abd423;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:#317100;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="msipheader87abd423" style="margin:0in;margin-bottom:.0001pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD
            Public Use]</span><o:p></o:p></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Hi
            Christian,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">That could
            potentially be it. &nbsp;With additional testing, 2 of 3 Vega20
            machines never hit error over BAR access with the PTRACE
            test.&nbsp; 3 of 3 machines (from the same pool) always hit error
            with CWSR.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">To elaborate
            on the PTRACE test, we PEEK 2 DWORDs inside thunk allocated
            mapped memory and 2 DWORDS outside that boundary (it’s only
            about 4MB to the boundary).&nbsp; Then we POKE to swap the DWORD
            positions across the boundary.&nbsp; The RAS event on the single
            failing machine happens on the out of boundary PEEK.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Felix
            mentioned we don’t hit errors over general HDP access but
            that may not true.&nbsp; An Arcturus failure sys logs posted
            (which wasn’t tested by me) shows someone launched rocm
            bandwidth test, hit a VM fault and a RAS event ensued during
            evictions (I can point the internal ticket or log snippet
            offline if interested).&nbsp; Whether the RAS event is BAR access
            triggered or the result of HW instability is beyond me since
            I don’t have access to the machine.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Thanks,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Jon<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p>&nbsp;</o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b><span style="color:windowtext">From:</span></b><span style="color:windowtext"> Koenig, Christian
                <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>
                <br>
                <b>Sent:</b> Wednesday, April 15, 2020 4:11 AM<br>
                <b>To:</b> Kim, Jonathan <a class="moz-txt-link-rfc2396E" href="mailto:Jonathan.Kim@amd.com">&lt;Jonathan.Kim@amd.com&gt;</a>;
                Kuehling, Felix <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>; Deucher,
                Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a><br>
                <b>Cc:</b> Russell, Kent <a class="moz-txt-link-rfc2396E" href="mailto:Kent.Russell@amd.com">&lt;Kent.Russell@amd.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
                <b>Subject:</b> Re: [PATCH] Revert &quot;drm/amdgpu: use the
                BAR if possible in amdgpu_device_vram_access v2&quot;<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div>
          <p class="MsoNormal" style="margin-bottom:12.0pt">Hi Jon,<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal">Also cwsr tests fail on Vega20 with or
              without the revert with the same RAS error.<o:p></o:p></p>
          </blockquote>
          <p class="MsoNormal"><br>
            That sounds like the system/setup has a more general
            problem.<br>
            <br>
            Could it be that we are seeing RAS errors because there
            really is some hardware failure, but with the MM path we
            don't trigger a RAS interrupt?<br>
            <br>
            Thanks,<br>
            Christian.<br>
            <br>
            Am 14.04.20 um 22:30 schrieb Kim, Jonathan:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <p class="msipheader4d0fcdd7" style="margin:0in;margin-bottom:.0001pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
              Official Use Only - Internal Distribution Only]</span><o:p></o:p></p>
          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          <p class="MsoNormal">If we’re passing the test on the revert,
            then the only thing that’s different is we’re not
            invalidating HDP and doing a copy to host anymore in
            amdgpu_device_vram_access since the function is still called
            in ttm access_memory with BAR.<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          <p class="MsoNormal">Also cwsr tests fail on Vega20 with or
            without the revert with the same RAS error.<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          <p class="MsoNormal">Thanks,<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          <p class="MsoNormal">Jon<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          <div>
            <div style="border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b>From:</b> Kuehling, Felix <a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">
                  &lt;Felix.Kuehling@amd.com&gt;</a> <br>
                <b>Sent:</b> Tuesday, April 14, 2020 2:32 PM<br>
                <b>To:</b> Kim, Jonathan <a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">&lt;Jonathan.Kim@amd.com&gt;</a>;
                Koenig, Christian
                <a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                Deucher, Alexander
                <a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">&lt;Alexander.Deucher@amd.com&gt;</a><br>
                <b>Cc:</b> Russell, Kent <a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">&lt;Kent.Russell@amd.com&gt;</a>;
                <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                <b>Subject:</b> Re: [PATCH] Revert &quot;drm/amdgpu: use the
                BAR if possible in amdgpu_device_vram_access v2&quot;<o:p></o:p></p>
            </div>
          </div>
          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          <p>I wouldn't call it premature. Revert is a usual practice
            when there is a serious regression that isn't fully
            understood or root-caused. As far as I can tell, the problem
            has been reproduced on multiple systems, different GPUs, and
            clearly regressed to Christian's commit. I think that
            justifies reverting it for now.<o:p></o:p></p>
          <p>I agree with Christian that a general HDP memory access
            problem causing RAS errors would potentially cause problems
            in other tests as well. For example common operations like
            GART table updates, and GPUVM page table updates and PCIe
            peer2peer accesses in ROCm applications use HDP. But we're
            not seeing obvious problems from those. So we need to
            understand what's special about this test. I asked questions
            to that effect on our other email thread.<o:p></o:p></p>
          <p>Regards,<br>
            &nbsp; Felix<o:p></o:p></p>
          <div>
            <p class="MsoNormal">Am 2020-04-14 um 10:51 a.m. schrieb
              Kim, Jonathan:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="msipheader4d0fcdd7" style="margin:0in;margin-bottom:.0001pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
                Official Use Only - Internal Distribution Only]</span><o:p></o:p></p>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal">I think it’s premature to push this
              revert.<o:p></o:p></p>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal">With more testing, I’m getting failures
              from different tests or sometimes none at all on my
              machine.<o:p></o:p></p>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal">Kent, let’s continue the discussion on
              the original thread.<o:p></o:p></p>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal">Thanks,<o:p></o:p></p>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal">Jon<o:p></o:p></p>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <div>
              <div style="border:none;border-top:solid #E1E1E1
                1.0pt;padding:3.0pt 0in 0in 0in">
                <p class="MsoNormal"><b>From:</b> Koenig, Christian <a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">
                    &lt;Christian.Koenig@amd.com&gt;</a> <br>
                  <b>Sent:</b> Tuesday, April 14, 2020 10:47 AM<br>
                  <b>To:</b> Deucher, Alexander <a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">&lt;Alexander.Deucher@amd.com&gt;</a><br>
                  <b>Cc:</b> Russell, Kent <a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">&lt;Kent.Russell@amd.com&gt;</a>;
                  <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                  Kuehling, Felix
                  <a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">&lt;Felix.Kuehling@amd.com&gt;</a>;
                  Kim, Jonathan
                  <a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">&lt;Jonathan.Kim@amd.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH] Revert &quot;drm/amdgpu: use
                  the BAR if possible in amdgpu_device_vram_access v2&quot;<o:p></o:p></p>
              </div>
            </div>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
            <div>
              <div>
                <div>
                  <div>
                    <div>
                      <p class="MsoNormal">That's exactly my concern as
                        well. <o:p></o:p></p>
                      <div>
                        <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">This looks a bit like the
                          test creates erroneous data somehow, but there
                          doesn't seems to be a RAS check in the MM data
                          path.<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">And now that we use the BAR
                          path it goes up in flames.<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">I just don't see how we can
                          create erroneous data in a test case?<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                      </div>
                      <div>
                        <p class="MsoNormal">Christian.<o:p></o:p></p>
                      </div>
                    </div>
                    <div>
                      <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                      <div>
                        <p class="MsoNormal">Am 14.04.2020 16:35 schrieb
                          &quot;Deucher, Alexander&quot; &lt;<a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;:<o:p></o:p></p>
                        <blockquote style="border:none;border-left:solid
                          #CCCCCC 1.0pt;padding:0in 0in 0in
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                          <div>
                            <p style="margin:15.0pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD
                                Public Use]</span><o:p></o:p></p>
                            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                            <div>
                              <div>
                                <p class="MsoNormal"><span style="font-size:12.0pt">If this
                                    causes an issue, any access to vram
                                    via the BAR could cause an issue.</span><o:p></o:p></p>
                              </div>
                              <div>
                                <p class="MsoNormal"><span style="font-size:12.0pt">&nbsp;</span><o:p></o:p></p>
                              </div>
                              <div>
                                <p class="MsoNormal"><span style="font-size:12.0pt">Alex</span><o:p></o:p></p>
                              </div>
                              <div class="MsoNormal" style="text-align:center" align="center">
                                <hr width="98%" size="2" align="center">
                              </div>
                              <div>
                                <p class="MsoNormal"><b>From:</b>
                                  amd-gfx &lt;<a href="mailto:amd-gfx-bounces@lists.freedesktop.org" moz-do-not-send="true">amd-gfx-bounces@lists.freedesktop.org</a>&gt;
                                  on behalf of Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;<br>
                                  <b>Sent:</b> Tuesday, April 14, 2020
                                  10:19 AM<br>
                                  <b>To:</b> Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                                  <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                                  &lt;<a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;<br>
                                  <b>Cc:</b> Kuehling, Felix &lt;<a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">Felix.Kuehling@amd.com</a>&gt;;
                                  Kim, Jonathan &lt;<a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">Jonathan.Kim@amd.com</a>&gt;<br>
                                  <b>Subject:</b> RE: [PATCH] Revert
                                  &quot;drm/amdgpu: use the BAR if possible
                                  in amdgpu_device_vram_access v2&quot;
                                  <o:p></o:p></p>
                                <div>
                                  <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                                </div>
                              </div>
                              <div>
                                <div>
                                  <p class="MsoNormal">[AMD Official Use
                                    Only - Internal Distribution Only]<br>
                                    <br>
                                    On VG20 or MI100, as soon as we run
                                    the subtest, we get the dmesg output
                                    below, and then the kernel ends up
                                    hanging. I don't know enough about
                                    the test itself to know why this is
                                    occurring, but Jon Kim and Felix
                                    were discussing it on a separate
                                    thread when the issue was first
                                    reported, so they can hopefully
                                    provide some additional information.<br>
                                    <br>
                                    &nbsp;Kent<br>
                                    <br>
                                    &gt; -----Original Message-----<br>
                                    &gt; From: Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
                                    &gt; Sent: Tuesday, April 14, 2020
                                    9:52 AM<br>
                                    &gt; To: Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;;
                                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                                    &gt; Subject: Re: [PATCH] Revert
                                    &quot;drm/amdgpu: use the BAR if possible
                                    in<br>
                                    &gt; amdgpu_device_vram_access v2&quot;<br>
                                    &gt; <br>
                                    &gt; Am 13.04.20 um 20:20 schrieb
                                    Kent Russell:<br>
                                    &gt; &gt; This reverts commit
                                    c12b84d6e0d70f1185e6daddfd12afb671791b6e.<br>
                                    &gt; &gt; The original patch causes
                                    a RAS event and subsequent kernel
                                    hard-hang<br>
                                    &gt; &gt; when running the
                                    KFDMemoryTest.PtraceAccessInvisibleVram
                                    on VG20 and<br>
                                    &gt; &gt; Arcturus<br>
                                    &gt; &gt;<br>
                                    &gt; &gt; dmesg output at hang time:<br>
                                    &gt; &gt; [drm] RAS event of type
                                    ERREVENT_ATHUB_INTERRUPT detected!<br>
                                    &gt; &gt; amdgpu 0000:67:00.0: GPU
                                    reset begin!<br>
                                    &gt; &gt; Evicting PASID 0x8000
                                    queues<br>
                                    &gt; &gt; Started evicting pasid
                                    0x8000<br>
                                    &gt; &gt; qcm fence wait loop
                                    timeout expired<br>
                                    &gt; &gt; The cp might be in an
                                    unrecoverable state due to an
                                    unsuccessful<br>
                                    &gt; &gt; queues preemption Failed
                                    to evict process queues Failed to
                                    suspend<br>
                                    &gt; &gt; process 0x8000 Finished
                                    evicting pasid 0x8000 Started
                                    restoring pasid<br>
                                    &gt; &gt; 0x8000 Finished restoring
                                    pasid 0x8000 [drm] UVD VCPU state
                                    may lost<br>
                                    &gt; &gt; due to RAS
                                    ERREVENT_ATHUB_INTERRUPT<br>
                                    &gt; &gt; amdgpu: [powerplay] Failed
                                    to send message 0x26, response 0x0<br>
                                    &gt; &gt; amdgpu: [powerplay] Failed
                                    to set soft min gfxclk !<br>
                                    &gt; &gt; amdgpu: [powerplay] Failed
                                    to upload DPM Bootup Levels!<br>
                                    &gt; &gt; amdgpu: [powerplay] Failed
                                    to send message 0x7, response 0x0<br>
                                    &gt; &gt; amdgpu: [powerplay]
                                    [DisableAllSMUFeatures] Failed to
                                    disable all smu<br>
                                    &gt; features!<br>
                                    &gt; &gt; amdgpu: [powerplay]
                                    [DisableDpmTasks] Failed to disable
                                    all smu features!<br>
                                    &gt; &gt; amdgpu: [powerplay]
                                    [PowerOffAsic] Failed to disable
                                    DPM!<br>
                                    &gt; &gt;
                                    [drm:amdgpu_device_ip_suspend_phase2
                                    [amdgpu]] *ERROR* suspend of IP<br>
                                    &gt; &gt; block &lt;powerplay&gt;
                                    failed -5<br>
                                    &gt; <br>
                                    &gt; Do you have more information on
                                    what's going wrong here since this
                                    is a really<br>
                                    &gt; important patch for KFD
                                    debugging.<br>
                                    &gt; <br>
                                    &gt; &gt;<br>
                                    &gt; &gt; Signed-off-by: Kent
                                    Russell &lt;<a href="mailto:kent.russell@amd.com" moz-do-not-send="true">kent.russell@amd.com</a>&gt;<br>
                                    &gt; <br>
                                    &gt; Reviewed-by: Christian König
                                    &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                                    &gt; <br>
                                    &gt; &gt; ---<br>
                                    &gt; &gt;&nbsp;&nbsp;
                                    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
                                    | 26 ----------------------<br>
                                    &gt; &gt;&nbsp;&nbsp; 1 file changed, 26
                                    deletions(-)<br>
                                    &gt; &gt;<br>
                                    &gt; &gt; diff --git
                                    a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                    &gt; &gt;
                                    b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                    &gt; &gt; index
                                    cf5d6e585634..a3f997f84020 100644<br>
                                    &gt; &gt; ---
                                    a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                    &gt; &gt; &#43;&#43;&#43;
                                    b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                    &gt; &gt; @@ -254,32 &#43;254,6 @@ void
                                    amdgpu_device_vram_access(struct<br>
                                    &gt; amdgpu_device *adev, loff_t
                                    pos,<br>
                                    &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hi = ~0;<br>
                                    &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t last;<br>
                                    &gt; &gt;<br>
                                    &gt; &gt; -<br>
                                    &gt; &gt; -#ifdef CONFIG_64BIT<br>
                                    &gt; &gt; -&nbsp;&nbsp; last = min(pos &#43; size,
                                    adev-&gt;gmc.visible_vram_size);<br>
                                    &gt; &gt; -&nbsp;&nbsp; if (last &gt; pos) {<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem
                                    *addr =
                                    adev-&gt;mman.aper_base_kaddr &#43; pos;<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t count =
                                    last - pos;<br>
                                    &gt; &gt; -<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    memcpy_toio(addr, buf, count);<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    amdgpu_asic_flush_hdp(adev, NULL);<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    amdgpu_asic_invalidate_hdp(adev,
                                    NULL);<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    memcpy_fromio(buf, addr, count);<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                                    &gt; &gt; -<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count ==
                                    size)<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    return;<br>
                                    &gt; &gt; -<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos &#43;= count;<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf &#43;= count /
                                    4;<br>
                                    &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size -= count;<br>
                                    &gt; &gt; -&nbsp;&nbsp; }<br>
                                    &gt; &gt; -#endif<br>
                                    &gt; &gt; -<br>
                                    &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock,
                                    flags);<br>
                                    &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (last = pos &#43;
                                    size; pos &lt; last; pos &#43;= 4) {<br>
                                    &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tmp
                                    = pos &gt;&gt; 31;<br>
_______________________________________________<br>
                                    amd-gfx mailing list<br>
                                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                                    <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0" moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0</a><o:p></o:p></p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </blockquote>
                      </div>
                      <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                    </div>
                  </div>
                  <div>
                    <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                    <div>
                      <p class="MsoNormal">Am 14.04.2020 16:35 schrieb
                        &quot;Deucher, Alexander&quot; &lt;<a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;:<o:p></o:p></p>
                      <blockquote style="border:none;border-left:solid
                        #CCCCCC 1.0pt;padding:0in 0in 0in
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                        <div>
                          <p style="margin:15.0pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD
                              Public Use]</span><o:p></o:p></p>
                          <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                          <div>
                            <div>
                              <p class="MsoNormal"><span style="font-size:12.0pt">If this
                                  causes an issue, any access to vram
                                  via the BAR could cause an issue.</span><o:p></o:p></p>
                            </div>
                            <div>
                              <p class="MsoNormal"><span style="font-size:12.0pt">&nbsp;</span><o:p></o:p></p>
                            </div>
                            <div>
                              <p class="MsoNormal"><span style="font-size:12.0pt">Alex</span><o:p></o:p></p>
                            </div>
                            <div class="MsoNormal" style="text-align:center" align="center">
                              <hr width="98%" size="2" align="center">
                            </div>
                            <div>
                              <p class="MsoNormal"><b>From:</b> amd-gfx
                                &lt;<a href="mailto:amd-gfx-bounces@lists.freedesktop.org" moz-do-not-send="true">amd-gfx-bounces@lists.freedesktop.org</a>&gt;
                                on behalf of Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;<br>
                                <b>Sent:</b> Tuesday, April 14, 2020
                                10:19 AM<br>
                                <b>To:</b> Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                                <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                                &lt;<a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;<br>
                                <b>Cc:</b> Kuehling, Felix &lt;<a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">Felix.Kuehling@amd.com</a>&gt;;
                                Kim, Jonathan &lt;<a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">Jonathan.Kim@amd.com</a>&gt;<br>
                                <b>Subject:</b> RE: [PATCH] Revert
                                &quot;drm/amdgpu: use the BAR if possible in
                                amdgpu_device_vram_access v2&quot;
                                <o:p></o:p></p>
                              <div>
                                <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                              </div>
                            </div>
                            <div>
                              <div>
                                <p class="MsoNormal">[AMD Official Use
                                  Only - Internal Distribution Only]<br>
                                  <br>
                                  On VG20 or MI100, as soon as we run
                                  the subtest, we get the dmesg output
                                  below, and then the kernel ends up
                                  hanging. I don't know enough about the
                                  test itself to know why this is
                                  occurring, but Jon Kim and Felix were
                                  discussing it on a separate thread
                                  when the issue was first reported, so
                                  they can hopefully provide some
                                  additional information.<br>
                                  <br>
                                  &nbsp;Kent<br>
                                  <br>
                                  &gt; -----Original Message-----<br>
                                  &gt; From: Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
                                  &gt; Sent: Tuesday, April 14, 2020
                                  9:52 AM<br>
                                  &gt; To: Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;;
                                  <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                                  &gt; Subject: Re: [PATCH] Revert
                                  &quot;drm/amdgpu: use the BAR if possible
                                  in<br>
                                  &gt; amdgpu_device_vram_access v2&quot;<br>
                                  &gt; <br>
                                  &gt; Am 13.04.20 um 20:20 schrieb Kent
                                  Russell:<br>
                                  &gt; &gt; This reverts commit
                                  c12b84d6e0d70f1185e6daddfd12afb671791b6e.<br>
                                  &gt; &gt; The original patch causes a
                                  RAS event and subsequent kernel
                                  hard-hang<br>
                                  &gt; &gt; when running the
                                  KFDMemoryTest.PtraceAccessInvisibleVram
                                  on VG20 and<br>
                                  &gt; &gt; Arcturus<br>
                                  &gt; &gt;<br>
                                  &gt; &gt; dmesg output at hang time:<br>
                                  &gt; &gt; [drm] RAS event of type
                                  ERREVENT_ATHUB_INTERRUPT detected!<br>
                                  &gt; &gt; amdgpu 0000:67:00.0: GPU
                                  reset begin!<br>
                                  &gt; &gt; Evicting PASID 0x8000 queues<br>
                                  &gt; &gt; Started evicting pasid
                                  0x8000<br>
                                  &gt; &gt; qcm fence wait loop timeout
                                  expired<br>
                                  &gt; &gt; The cp might be in an
                                  unrecoverable state due to an
                                  unsuccessful<br>
                                  &gt; &gt; queues preemption Failed to
                                  evict process queues Failed to suspend<br>
                                  &gt; &gt; process 0x8000 Finished
                                  evicting pasid 0x8000 Started
                                  restoring pasid<br>
                                  &gt; &gt; 0x8000 Finished restoring
                                  pasid 0x8000 [drm] UVD VCPU state may
                                  lost<br>
                                  &gt; &gt; due to RAS
                                  ERREVENT_ATHUB_INTERRUPT<br>
                                  &gt; &gt; amdgpu: [powerplay] Failed
                                  to send message 0x26, response 0x0<br>
                                  &gt; &gt; amdgpu: [powerplay] Failed
                                  to set soft min gfxclk !<br>
                                  &gt; &gt; amdgpu: [powerplay] Failed
                                  to upload DPM Bootup Levels!<br>
                                  &gt; &gt; amdgpu: [powerplay] Failed
                                  to send message 0x7, response 0x0<br>
                                  &gt; &gt; amdgpu: [powerplay]
                                  [DisableAllSMUFeatures] Failed to
                                  disable all smu<br>
                                  &gt; features!<br>
                                  &gt; &gt; amdgpu: [powerplay]
                                  [DisableDpmTasks] Failed to disable
                                  all smu features!<br>
                                  &gt; &gt; amdgpu: [powerplay]
                                  [PowerOffAsic] Failed to disable DPM!<br>
                                  &gt; &gt;
                                  [drm:amdgpu_device_ip_suspend_phase2
                                  [amdgpu]] *ERROR* suspend of IP<br>
                                  &gt; &gt; block &lt;powerplay&gt;
                                  failed -5<br>
                                  &gt; <br>
                                  &gt; Do you have more information on
                                  what's going wrong here since this is
                                  a really<br>
                                  &gt; important patch for KFD
                                  debugging.<br>
                                  &gt; <br>
                                  &gt; &gt;<br>
                                  &gt; &gt; Signed-off-by: Kent Russell
                                  &lt;<a href="mailto:kent.russell@amd.com" moz-do-not-send="true">kent.russell@amd.com</a>&gt;<br>
                                  &gt; <br>
                                  &gt; Reviewed-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                                  &gt; <br>
                                  &gt; &gt; ---<br>
                                  &gt; &gt;&nbsp;&nbsp;
                                  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
                                  | 26 ----------------------<br>
                                  &gt; &gt;&nbsp;&nbsp; 1 file changed, 26
                                  deletions(-)<br>
                                  &gt; &gt;<br>
                                  &gt; &gt; diff --git
                                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                  &gt; &gt;
                                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                  &gt; &gt; index
                                  cf5d6e585634..a3f997f84020 100644<br>
                                  &gt; &gt; ---
                                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                  &gt; &gt; &#43;&#43;&#43;
                                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                  &gt; &gt; @@ -254,32 &#43;254,6 @@ void
                                  amdgpu_device_vram_access(struct<br>
                                  &gt; amdgpu_device *adev, loff_t pos,<br>
                                  &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hi = ~0;<br>
                                  &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t last;<br>
                                  &gt; &gt;<br>
                                  &gt; &gt; -<br>
                                  &gt; &gt; -#ifdef CONFIG_64BIT<br>
                                  &gt; &gt; -&nbsp;&nbsp; last = min(pos &#43; size,
                                  adev-&gt;gmc.visible_vram_size);<br>
                                  &gt; &gt; -&nbsp;&nbsp; if (last &gt; pos) {<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem
                                  *addr = adev-&gt;mman.aper_base_kaddr
                                  &#43; pos;<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t count =
                                  last - pos;<br>
                                  &gt; &gt; -<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  memcpy_toio(addr, buf, count);<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  amdgpu_asic_flush_hdp(adev, NULL);<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  amdgpu_asic_invalidate_hdp(adev,
                                  NULL);<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  memcpy_fromio(buf, addr, count);<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                                  &gt; &gt; -<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count ==
                                  size)<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
                                  &gt; &gt; -<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos &#43;= count;<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf &#43;= count /
                                  4;<br>
                                  &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size -= count;<br>
                                  &gt; &gt; -&nbsp;&nbsp; }<br>
                                  &gt; &gt; -#endif<br>
                                  &gt; &gt; -<br>
                                  &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock,
                                  flags);<br>
                                  &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (last = pos &#43; size;
                                  pos &lt; last; pos &#43;= 4) {<br>
                                  &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tmp =
                                  pos &gt;&gt; 31;<br>
_______________________________________________<br>
                                  amd-gfx mailing list<br>
                                  <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                                  <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0" moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0</a><o:p></o:p></p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </blockquote>
                    </div>
                    <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                  </div>
                </div>
                <div>
                  <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                  <div>
                    <p class="MsoNormal">Am 14.04.2020 16:35 schrieb
                      &quot;Deucher, Alexander&quot; &lt;<a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;:<o:p></o:p></p>
                    <blockquote style="border:none;border-left:solid
                      #CCCCCC 1.0pt;padding:0in 0in 0in
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                      <div>
                        <p style="margin:15.0pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD
                            Public Use]</span><o:p></o:p></p>
                        <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                        <div>
                          <div>
                            <p class="MsoNormal"><span style="font-size:12.0pt">If this causes
                                an issue, any access to vram via the BAR
                                could cause an issue.</span><o:p></o:p></p>
                          </div>
                          <div>
                            <p class="MsoNormal"><span style="font-size:12.0pt">&nbsp;</span><o:p></o:p></p>
                          </div>
                          <div>
                            <p class="MsoNormal"><span style="font-size:12.0pt">Alex</span><o:p></o:p></p>
                          </div>
                          <div class="MsoNormal" style="text-align:center" align="center">
                            <hr width="98%" size="2" align="center">
                          </div>
                          <div>
                            <p class="MsoNormal"><b>From:</b> amd-gfx
                              &lt;<a href="mailto:amd-gfx-bounces@lists.freedesktop.org" moz-do-not-send="true">amd-gfx-bounces@lists.freedesktop.org</a>&gt;
                              on behalf of Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;<br>
                              <b>Sent:</b> Tuesday, April 14, 2020 10:19
                              AM<br>
                              <b>To:</b> Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                              <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                              &lt;<a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;<br>
                              <b>Cc:</b> Kuehling, Felix &lt;<a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">Felix.Kuehling@amd.com</a>&gt;;
                              Kim, Jonathan &lt;<a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">Jonathan.Kim@amd.com</a>&gt;<br>
                              <b>Subject:</b> RE: [PATCH] Revert
                              &quot;drm/amdgpu: use the BAR if possible in
                              amdgpu_device_vram_access v2&quot;
                              <o:p></o:p></p>
                            <div>
                              <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                            </div>
                          </div>
                          <div>
                            <div>
                              <p class="MsoNormal">[AMD Official Use
                                Only - Internal Distribution Only]<br>
                                <br>
                                On VG20 or MI100, as soon as we run the
                                subtest, we get the dmesg output below,
                                and then the kernel ends up hanging. I
                                don't know enough about the test itself
                                to know why this is occurring, but Jon
                                Kim and Felix were discussing it on a
                                separate thread when the issue was first
                                reported, so they can hopefully provide
                                some additional information.<br>
                                <br>
                                &nbsp;Kent<br>
                                <br>
                                &gt; -----Original Message-----<br>
                                &gt; From: Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
                                &gt; Sent: Tuesday, April 14, 2020 9:52
                                AM<br>
                                &gt; To: Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;;
                                <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                                &gt; Subject: Re: [PATCH] Revert
                                &quot;drm/amdgpu: use the BAR if possible in<br>
                                &gt; amdgpu_device_vram_access v2&quot;<br>
                                &gt; <br>
                                &gt; Am 13.04.20 um 20:20 schrieb Kent
                                Russell:<br>
                                &gt; &gt; This reverts commit
                                c12b84d6e0d70f1185e6daddfd12afb671791b6e.<br>
                                &gt; &gt; The original patch causes a
                                RAS event and subsequent kernel
                                hard-hang<br>
                                &gt; &gt; when running the
                                KFDMemoryTest.PtraceAccessInvisibleVram
                                on VG20 and<br>
                                &gt; &gt; Arcturus<br>
                                &gt; &gt;<br>
                                &gt; &gt; dmesg output at hang time:<br>
                                &gt; &gt; [drm] RAS event of type
                                ERREVENT_ATHUB_INTERRUPT detected!<br>
                                &gt; &gt; amdgpu 0000:67:00.0: GPU reset
                                begin!<br>
                                &gt; &gt; Evicting PASID 0x8000 queues<br>
                                &gt; &gt; Started evicting pasid 0x8000<br>
                                &gt; &gt; qcm fence wait loop timeout
                                expired<br>
                                &gt; &gt; The cp might be in an
                                unrecoverable state due to an
                                unsuccessful<br>
                                &gt; &gt; queues preemption Failed to
                                evict process queues Failed to suspend<br>
                                &gt; &gt; process 0x8000 Finished
                                evicting pasid 0x8000 Started restoring
                                pasid<br>
                                &gt; &gt; 0x8000 Finished restoring
                                pasid 0x8000 [drm] UVD VCPU state may
                                lost<br>
                                &gt; &gt; due to RAS
                                ERREVENT_ATHUB_INTERRUPT<br>
                                &gt; &gt; amdgpu: [powerplay] Failed to
                                send message 0x26, response 0x0<br>
                                &gt; &gt; amdgpu: [powerplay] Failed to
                                set soft min gfxclk !<br>
                                &gt; &gt; amdgpu: [powerplay] Failed to
                                upload DPM Bootup Levels!<br>
                                &gt; &gt; amdgpu: [powerplay] Failed to
                                send message 0x7, response 0x0<br>
                                &gt; &gt; amdgpu: [powerplay]
                                [DisableAllSMUFeatures] Failed to
                                disable all smu<br>
                                &gt; features!<br>
                                &gt; &gt; amdgpu: [powerplay]
                                [DisableDpmTasks] Failed to disable all
                                smu features!<br>
                                &gt; &gt; amdgpu: [powerplay]
                                [PowerOffAsic] Failed to disable DPM!<br>
                                &gt; &gt;
                                [drm:amdgpu_device_ip_suspend_phase2
                                [amdgpu]] *ERROR* suspend of IP<br>
                                &gt; &gt; block &lt;powerplay&gt; failed
                                -5<br>
                                &gt; <br>
                                &gt; Do you have more information on
                                what's going wrong here since this is a
                                really<br>
                                &gt; important patch for KFD debugging.<br>
                                &gt; <br>
                                &gt; &gt;<br>
                                &gt; &gt; Signed-off-by: Kent Russell
                                &lt;<a href="mailto:kent.russell@amd.com" moz-do-not-send="true">kent.russell@amd.com</a>&gt;<br>
                                &gt; <br>
                                &gt; Reviewed-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                                &gt; <br>
                                &gt; &gt; ---<br>
                                &gt; &gt;&nbsp;&nbsp;
                                drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
                                | 26 ----------------------<br>
                                &gt; &gt;&nbsp;&nbsp; 1 file changed, 26
                                deletions(-)<br>
                                &gt; &gt;<br>
                                &gt; &gt; diff --git
                                a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                &gt; &gt;
                                b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                &gt; &gt; index
                                cf5d6e585634..a3f997f84020 100644<br>
                                &gt; &gt; ---
                                a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                &gt; &gt; &#43;&#43;&#43;
                                b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                                &gt; &gt; @@ -254,32 &#43;254,6 @@ void
                                amdgpu_device_vram_access(struct<br>
                                &gt; amdgpu_device *adev, loff_t pos,<br>
                                &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hi = ~0;<br>
                                &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t last;<br>
                                &gt; &gt;<br>
                                &gt; &gt; -<br>
                                &gt; &gt; -#ifdef CONFIG_64BIT<br>
                                &gt; &gt; -&nbsp;&nbsp; last = min(pos &#43; size,
                                adev-&gt;gmc.visible_vram_size);<br>
                                &gt; &gt; -&nbsp;&nbsp; if (last &gt; pos) {<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *addr
                                = adev-&gt;mman.aper_base_kaddr &#43; pos;<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t count =
                                last - pos;<br>
                                &gt; &gt; -<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                memcpy_toio(addr, buf, count);<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                amdgpu_asic_flush_hdp(adev, NULL);<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                amdgpu_asic_invalidate_hdp(adev, NULL);<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                memcpy_fromio(buf, addr, count);<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                                &gt; &gt; -<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count == size)<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
                                &gt; &gt; -<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos &#43;= count;<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf &#43;= count / 4;<br>
                                &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size -= count;<br>
                                &gt; &gt; -&nbsp;&nbsp; }<br>
                                &gt; &gt; -#endif<br>
                                &gt; &gt; -<br>
                                &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock,
                                flags);<br>
                                &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (last = pos &#43; size;
                                pos &lt; last; pos &#43;= 4) {<br>
                                &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tmp =
                                pos &gt;&gt; 31;<br>
_______________________________________________<br>
                                amd-gfx mailing list<br>
                                <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                                <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0" moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0</a><o:p></o:p></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                  <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                </div>
              </div>
              <div>
                <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                <div>
                  <p class="MsoNormal">Am 14.04.2020 16:35 schrieb
                    &quot;Deucher, Alexander&quot; &lt;<a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;:<o:p></o:p></p>
                  <blockquote style="border:none;border-left:solid
                    #CCCCCC 1.0pt;padding:0in 0in 0in
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                    <div>
                      <p style="margin:15.0pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD
                          Public Use]</span><o:p></o:p></p>
                      <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                      <div>
                        <div>
                          <p class="MsoNormal"><span style="font-size:12.0pt">If this causes an
                              issue, any access to vram via the BAR
                              could cause an issue.</span><o:p></o:p></p>
                        </div>
                        <div>
                          <p class="MsoNormal"><span style="font-size:12.0pt">&nbsp;</span><o:p></o:p></p>
                        </div>
                        <div>
                          <p class="MsoNormal"><span style="font-size:12.0pt">Alex</span><o:p></o:p></p>
                        </div>
                        <div class="MsoNormal" style="text-align:center" align="center">
                          <hr width="98%" size="2" align="center">
                        </div>
                        <div>
                          <p class="MsoNormal"><b>From:</b> amd-gfx &lt;<a href="mailto:amd-gfx-bounces@lists.freedesktop.org" moz-do-not-send="true">amd-gfx-bounces@lists.freedesktop.org</a>&gt;
                            on behalf of Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;<br>
                            <b>Sent:</b> Tuesday, April 14, 2020 10:19
                            AM<br>
                            <b>To:</b> Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                            <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                            &lt;<a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;<br>
                            <b>Cc:</b> Kuehling, Felix &lt;<a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">Felix.Kuehling@amd.com</a>&gt;;
                            Kim, Jonathan &lt;<a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">Jonathan.Kim@amd.com</a>&gt;<br>
                            <b>Subject:</b> RE: [PATCH] Revert
                            &quot;drm/amdgpu: use the BAR if possible in
                            amdgpu_device_vram_access v2&quot;
                            <o:p></o:p></p>
                          <div>
                            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                          </div>
                        </div>
                        <div>
                          <div>
                            <p class="MsoNormal">[AMD Official Use Only
                              - Internal Distribution Only]<br>
                              <br>
                              On VG20 or MI100, as soon as we run the
                              subtest, we get the dmesg output below,
                              and then the kernel ends up hanging. I
                              don't know enough about the test itself to
                              know why this is occurring, but Jon Kim
                              and Felix were discussing it on a separate
                              thread when the issue was first reported,
                              so they can hopefully provide some
                              additional information.<br>
                              <br>
                              &nbsp;Kent<br>
                              <br>
                              &gt; -----Original Message-----<br>
                              &gt; From: Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
                              &gt; Sent: Tuesday, April 14, 2020 9:52 AM<br>
                              &gt; To: Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;;
                              <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                              &gt; Subject: Re: [PATCH] Revert
                              &quot;drm/amdgpu: use the BAR if possible in<br>
                              &gt; amdgpu_device_vram_access v2&quot;<br>
                              &gt; <br>
                              &gt; Am 13.04.20 um 20:20 schrieb Kent
                              Russell:<br>
                              &gt; &gt; This reverts commit
                              c12b84d6e0d70f1185e6daddfd12afb671791b6e.<br>
                              &gt; &gt; The original patch causes a RAS
                              event and subsequent kernel hard-hang<br>
                              &gt; &gt; when running the
                              KFDMemoryTest.PtraceAccessInvisibleVram on
                              VG20 and<br>
                              &gt; &gt; Arcturus<br>
                              &gt; &gt;<br>
                              &gt; &gt; dmesg output at hang time:<br>
                              &gt; &gt; [drm] RAS event of type
                              ERREVENT_ATHUB_INTERRUPT detected!<br>
                              &gt; &gt; amdgpu 0000:67:00.0: GPU reset
                              begin!<br>
                              &gt; &gt; Evicting PASID 0x8000 queues<br>
                              &gt; &gt; Started evicting pasid 0x8000<br>
                              &gt; &gt; qcm fence wait loop timeout
                              expired<br>
                              &gt; &gt; The cp might be in an
                              unrecoverable state due to an unsuccessful<br>
                              &gt; &gt; queues preemption Failed to
                              evict process queues Failed to suspend<br>
                              &gt; &gt; process 0x8000 Finished evicting
                              pasid 0x8000 Started restoring pasid<br>
                              &gt; &gt; 0x8000 Finished restoring pasid
                              0x8000 [drm] UVD VCPU state may lost<br>
                              &gt; &gt; due to RAS
                              ERREVENT_ATHUB_INTERRUPT<br>
                              &gt; &gt; amdgpu: [powerplay] Failed to
                              send message 0x26, response 0x0<br>
                              &gt; &gt; amdgpu: [powerplay] Failed to
                              set soft min gfxclk !<br>
                              &gt; &gt; amdgpu: [powerplay] Failed to
                              upload DPM Bootup Levels!<br>
                              &gt; &gt; amdgpu: [powerplay] Failed to
                              send message 0x7, response 0x0<br>
                              &gt; &gt; amdgpu: [powerplay]
                              [DisableAllSMUFeatures] Failed to disable
                              all smu<br>
                              &gt; features!<br>
                              &gt; &gt; amdgpu: [powerplay]
                              [DisableDpmTasks] Failed to disable all
                              smu features!<br>
                              &gt; &gt; amdgpu: [powerplay]
                              [PowerOffAsic] Failed to disable DPM!<br>
                              &gt; &gt;
                              [drm:amdgpu_device_ip_suspend_phase2
                              [amdgpu]] *ERROR* suspend of IP<br>
                              &gt; &gt; block &lt;powerplay&gt; failed
                              -5<br>
                              &gt; <br>
                              &gt; Do you have more information on
                              what's going wrong here since this is a
                              really<br>
                              &gt; important patch for KFD debugging.<br>
                              &gt; <br>
                              &gt; &gt;<br>
                              &gt; &gt; Signed-off-by: Kent Russell &lt;<a href="mailto:kent.russell@amd.com" moz-do-not-send="true">kent.russell@amd.com</a>&gt;<br>
                              &gt; <br>
                              &gt; Reviewed-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                              &gt; <br>
                              &gt; &gt; ---<br>
                              &gt; &gt;&nbsp;&nbsp;
                              drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
                              | 26 ----------------------<br>
                              &gt; &gt;&nbsp;&nbsp; 1 file changed, 26
                              deletions(-)<br>
                              &gt; &gt;<br>
                              &gt; &gt; diff --git
                              a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                              &gt; &gt;
                              b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                              &gt; &gt; index cf5d6e585634..a3f997f84020
                              100644<br>
                              &gt; &gt; ---
                              a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                              &gt; &gt; &#43;&#43;&#43;
                              b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                              &gt; &gt; @@ -254,32 &#43;254,6 @@ void
                              amdgpu_device_vram_access(struct<br>
                              &gt; amdgpu_device *adev, loff_t pos,<br>
                              &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hi = ~0;<br>
                              &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t last;<br>
                              &gt; &gt;<br>
                              &gt; &gt; -<br>
                              &gt; &gt; -#ifdef CONFIG_64BIT<br>
                              &gt; &gt; -&nbsp;&nbsp; last = min(pos &#43; size,
                              adev-&gt;gmc.visible_vram_size);<br>
                              &gt; &gt; -&nbsp;&nbsp; if (last &gt; pos) {<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *addr =
                              adev-&gt;mman.aper_base_kaddr &#43; pos;<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t count = last
                              - pos;<br>
                              &gt; &gt; -<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              memcpy_toio(addr, buf, count);<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              amdgpu_asic_flush_hdp(adev, NULL);<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              amdgpu_asic_invalidate_hdp(adev, NULL);<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              memcpy_fromio(buf, addr, count);<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                              &gt; &gt; -<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count == size)<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
                              &gt; &gt; -<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos &#43;= count;<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf &#43;= count / 4;<br>
                              &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size -= count;<br>
                              &gt; &gt; -&nbsp;&nbsp; }<br>
                              &gt; &gt; -#endif<br>
                              &gt; &gt; -<br>
                              &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock,
                              flags);<br>
                              &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (last = pos &#43; size; pos
                              &lt; last; pos &#43;= 4) {<br>
                              &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tmp = pos
                              &gt;&gt; 31;<br>
_______________________________________________<br>
                              amd-gfx mailing list<br>
                              <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                              <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0" moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0</a><o:p></o:p></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                </div>
                <p class="MsoNormal">&nbsp;<o:p></o:p></p>
              </div>
            </div>
            <div>
              <p class="MsoNormal">&nbsp;<o:p></o:p></p>
              <div>
                <p class="MsoNormal">Am 14.04.2020 16:35 schrieb
                  &quot;Deucher, Alexander&quot; &lt;<a href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;:<o:p></o:p></p>
              </div>
            </div>
            <div>
              <p style="margin:15.0pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD
                  Public Use]</span><o:p></o:p></p>
              <p class="MsoNormal">&nbsp;<o:p></o:p></p>
              <div>
                <div>
                  <p class="MsoNormal"><span style="font-size:12.0pt">If
                      this causes an issue, any access to vram via the
                      BAR could cause an issue.</span><o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><span style="font-size:12.0pt">&nbsp;</span><o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><span style="font-size:12.0pt">Alex</span><o:p></o:p></p>
                </div>
                <div class="MsoNormal" style="text-align:center" align="center">
                  <hr width="98%" size="2" align="center">
                </div>
                <div id="divRplyFwdMsg">
                  <p class="MsoNormal"><b>From:</b> amd-gfx &lt;<a href="mailto:amd-gfx-bounces@lists.freedesktop.org" moz-do-not-send="true">amd-gfx-bounces@lists.freedesktop.org</a>&gt;
                    on behalf of Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;<br>
                    <b>Sent:</b> Tuesday, April 14, 2020 10:19 AM<br>
                    <b>To:</b> Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                    &lt;<a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;<br>
                    <b>Cc:</b> Kuehling, Felix &lt;<a href="mailto:Felix.Kuehling@amd.com" moz-do-not-send="true">Felix.Kuehling@amd.com</a>&gt;;
                    Kim, Jonathan &lt;<a href="mailto:Jonathan.Kim@amd.com" moz-do-not-send="true">Jonathan.Kim@amd.com</a>&gt;<br>
                    <b>Subject:</b> RE: [PATCH] Revert &quot;drm/amdgpu: use
                    the BAR if possible in amdgpu_device_vram_access v2&quot;
                    <o:p></o:p></p>
                  <div>
                    <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                  </div>
                </div>
                <div>
                  <div>
                    <p class="MsoNormal">[AMD Official Use Only -
                      Internal Distribution Only]<br>
                      <br>
                      On VG20 or MI100, as soon as we run the subtest,
                      we get the dmesg output below, and then the kernel
                      ends up hanging. I don't know enough about the
                      test itself to know why this is occurring, but Jon
                      Kim and Felix were discussing it on a separate
                      thread when the issue was first reported, so they
                      can hopefully provide some additional information.<br>
                      <br>
                      &nbsp;Kent<br>
                      <br>
                      &gt; -----Original Message-----<br>
                      &gt; From: Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
                      &gt; Sent: Tuesday, April 14, 2020 9:52 AM<br>
                      &gt; To: Russell, Kent &lt;<a href="mailto:Kent.Russell@amd.com" moz-do-not-send="true">Kent.Russell@amd.com</a>&gt;;
                      <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                      &gt; Subject: Re: [PATCH] Revert &quot;drm/amdgpu: use
                      the BAR if possible in<br>
                      &gt; amdgpu_device_vram_access v2&quot;<br>
                      &gt; <br>
                      &gt; Am 13.04.20 um 20:20 schrieb Kent Russell:<br>
                      &gt; &gt; This reverts commit
                      c12b84d6e0d70f1185e6daddfd12afb671791b6e.<br>
                      &gt; &gt; The original patch causes a RAS event
                      and subsequent kernel hard-hang<br>
                      &gt; &gt; when running the
                      KFDMemoryTest.PtraceAccessInvisibleVram on VG20
                      and<br>
                      &gt; &gt; Arcturus<br>
                      &gt; &gt;<br>
                      &gt; &gt; dmesg output at hang time:<br>
                      &gt; &gt; [drm] RAS event of type
                      ERREVENT_ATHUB_INTERRUPT detected!<br>
                      &gt; &gt; amdgpu 0000:67:00.0: GPU reset begin!<br>
                      &gt; &gt; Evicting PASID 0x8000 queues<br>
                      &gt; &gt; Started evicting pasid 0x8000<br>
                      &gt; &gt; qcm fence wait loop timeout expired<br>
                      &gt; &gt; The cp might be in an unrecoverable
                      state due to an unsuccessful<br>
                      &gt; &gt; queues preemption Failed to evict
                      process queues Failed to suspend<br>
                      &gt; &gt; process 0x8000 Finished evicting pasid
                      0x8000 Started restoring pasid<br>
                      &gt; &gt; 0x8000 Finished restoring pasid 0x8000
                      [drm] UVD VCPU state may lost<br>
                      &gt; &gt; due to RAS ERREVENT_ATHUB_INTERRUPT<br>
                      &gt; &gt; amdgpu: [powerplay] Failed to send
                      message 0x26, response 0x0<br>
                      &gt; &gt; amdgpu: [powerplay] Failed to set soft
                      min gfxclk !<br>
                      &gt; &gt; amdgpu: [powerplay] Failed to upload DPM
                      Bootup Levels!<br>
                      &gt; &gt; amdgpu: [powerplay] Failed to send
                      message 0x7, response 0x0<br>
                      &gt; &gt; amdgpu: [powerplay]
                      [DisableAllSMUFeatures] Failed to disable all smu<br>
                      &gt; features!<br>
                      &gt; &gt; amdgpu: [powerplay] [DisableDpmTasks]
                      Failed to disable all smu features!<br>
                      &gt; &gt; amdgpu: [powerplay] [PowerOffAsic]
                      Failed to disable DPM!<br>
                      &gt; &gt; [drm:amdgpu_device_ip_suspend_phase2
                      [amdgpu]] *ERROR* suspend of IP<br>
                      &gt; &gt; block &lt;powerplay&gt; failed -5<br>
                      &gt; <br>
                      &gt; Do you have more information on what's going
                      wrong here since this is a really<br>
                      &gt; important patch for KFD debugging.<br>
                      &gt; <br>
                      &gt; &gt;<br>
                      &gt; &gt; Signed-off-by: Kent Russell &lt;<a href="mailto:kent.russell@amd.com" moz-do-not-send="true">kent.russell@amd.com</a>&gt;<br>
                      &gt; <br>
                      &gt; Reviewed-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                      &gt; <br>
                      &gt; &gt; ---<br>
                      &gt; &gt;&nbsp;&nbsp;
                      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26
                      ----------------------<br>
                      &gt; &gt;&nbsp;&nbsp; 1 file changed, 26 deletions(-)<br>
                      &gt; &gt;<br>
                      &gt; &gt; diff --git
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt; &gt;
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt; &gt; index cf5d6e585634..a3f997f84020 100644<br>
                      &gt; &gt; ---
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt; &gt; &#43;&#43;&#43;
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt; &gt; @@ -254,32 &#43;254,6 @@ void
                      amdgpu_device_vram_access(struct<br>
                      &gt; amdgpu_device *adev, loff_t pos,<br>
                      &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hi = ~0;<br>
                      &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t last;<br>
                      &gt; &gt;<br>
                      &gt; &gt; -<br>
                      &gt; &gt; -#ifdef CONFIG_64BIT<br>
                      &gt; &gt; -&nbsp;&nbsp; last = min(pos &#43; size,
                      adev-&gt;gmc.visible_vram_size);<br>
                      &gt; &gt; -&nbsp;&nbsp; if (last &gt; pos) {<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *addr =
                      adev-&gt;mman.aper_base_kaddr &#43; pos;<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t count = last - pos;<br>
                      &gt; &gt; -<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy_toio(addr,
                      buf, count);<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      amdgpu_asic_flush_hdp(adev, NULL);<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      amdgpu_asic_invalidate_hdp(adev, NULL);<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy_fromio(buf,
                      addr, count);<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                      &gt; &gt; -<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count == size)<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
                      &gt; &gt; -<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos &#43;= count;<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf &#43;= count / 4;<br>
                      &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size -= count;<br>
                      &gt; &gt; -&nbsp;&nbsp; }<br>
                      &gt; &gt; -#endif<br>
                      &gt; &gt; -<br>
                      &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock,
                      flags);<br>
                      &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (last = pos &#43; size; pos &lt;
                      last; pos &#43;= 4) {<br>
                      &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tmp = pos &gt;&gt;
                      31;<br>
                      _______________________________________________<br>
                      amd-gfx mailing list<br>
                      <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                      <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0" moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Calexander.deucher%40amd.com%7C68e0bfea2a5f4a909ab108d7e07ed164%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637224707637289768&amp;amp;sdata=ttNOHJt0IwywpOIWahKjjuC6OkT1jxduc6iMzYzndpg%3D&amp;amp;reserved=0</a><o:p></o:p></p>
                  </div>
                </div>
              </div>
            </div>
          </blockquote>
        </blockquote>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------62ECEE4A38209F1762D8447F--

--===============1189748873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1189748873==--
