Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FF19AC69
	for <lists+amd-gfx@lfdr.de>; Wed,  1 Apr 2020 15:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C616E37F;
	Wed,  1 Apr 2020 13:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800B86E93C
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Apr 2020 13:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYMm2e1xY/qMchfe0Z+xlsRSr1fcgtOEYLdsuw5oi6+4fflx5rVhSFAA9LBSgcKMFJJ7Xf27AdDVpB3olICc10wgXlqPZeocpXGgWkkxKZF3iOs/U4wzsCc7GEYTRToFrxF3KVNRa0zREUkLM1yFCevlN3kQA3EuvTtVLoZCBl8DO/Df09PLwrqefpIRfDoLERiD1fMv93s9gPc6VD9le+3bkJ6hg/6jXEDy28dYCSHeRBcdTi/6nUogzbPkL4qU3X/IYdnAoPENBQYAhebLSAKT1fdu08TMzIF0JWflqSIvfhh0N+rZQy7qQOvpqxdYrvlGTXl3zpAvyEyMf021cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1hTVItSvXXPPqnaVG0HNoe53XuZyKRY21eAez9/g5o=;
 b=Wqjrsp3k7fRMLC/qnmU6p7QvR+nKadbe9PPT1oIY/f7Fd2mUgsr7MPSoP26jXUvWpswGRqAyyMcxydPm+wGDdfqp74tTrS+NFzyjw0OiPv8p6xH2nGRY5CFgZIATpb+Y+vOI9139x54w2kPi+Yjh9EPxCemPknjJc2y820sEbu2+sUZd1k6Q0SWBkum9hTbM7jUqBbzdB/4Y6TljMctNWCtAe3f7mKrPCZXZNOQIJ7urtVRAkXBTM+FIO4FKtnA3vRE4Jq9GD0V2NTz+8AVbgGZ5vI50ttuvkFGnafz8JlOLxjrAHWvhioX3QvKKGdN9H79toDhxT8UcGwWtBCIv8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1hTVItSvXXPPqnaVG0HNoe53XuZyKRY21eAez9/g5o=;
 b=PN4zdOQooBnJCZnXJuZR4TdBPYle7WIP2KUv2xiSOyxQ/JArz4ZdT236nIZucGG3iF/uO05je5juG7wQUWYwS42aBc5sMFiiCQIKlXHJZ3YulOGx2Cr1wx7uoj+0ew4Zgk3XZ5LgSUYJpGdL/qqxTy2tBLhlsEZxgXplzP3SKzw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
Received: from BN8PR12MB3041.namprd12.prod.outlook.com (2603:10b6:408:46::11)
 by BN8PR12MB3297.namprd12.prod.outlook.com (2603:10b6:408:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 1 Apr
 2020 13:10:03 +0000
Received: from BN8PR12MB3041.namprd12.prod.outlook.com
 ([fe80::a421:2af7:645a:a051]) by BN8PR12MB3041.namprd12.prod.outlook.com
 ([fe80::a421:2af7:645a:a051%6]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 13:10:03 +0000
Subject: Re: [PATCH] drm/amdkfd: Provide SMI events watch
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <1584467823-31170-1-git-send-email-Amber.Lin@amd.com>
 <ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com>
From: Amber Lin <Amber.Lin@amd.com>
Message-ID: <4786adb1-41b6-9df7-ea08-2ed7d9b975e0@amd.com>
Date: Wed, 1 Apr 2020 09:10:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To BN8PR12MB3041.namprd12.prod.outlook.com
 (2603:10b6:408:46::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.18] (72.141.223.142) by
 YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Wed, 1 Apr 2020 13:10:03 +0000
X-Originating-IP: [72.141.223.142]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d08827d5-a4fc-4d68-5ff6-08d7d63dfdcb
X-MS-TrafficTypeDiagnostic: BN8PR12MB3297:|BN8PR12MB3297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB329784786EF47465CD68B13AE1C90@BN8PR12MB3297.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(2906002)(31696002)(316002)(16576012)(478600001)(81166006)(5660300002)(956004)(2616005)(66556008)(66946007)(86362001)(81156014)(8676002)(66476007)(8936002)(36756003)(16526019)(26005)(186003)(53546011)(31686004)(52116002)(30864003)(33964004)(6486002)(579004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYCb08iL7R2V1oIe4658LnnF42iw6cMnpxdpySgTrjLAEEEHkj5MP4WE9uhIw7fYhLTLKvyLAOu91Cgz9mRLxosjm5w4TA/VhRPdq+Q81mrmqWbazJpKHi0miUDiKMDHHvDD8hXWmMiAjyVyqsrJzJInLfUo1JFcNgcmdWQCqwQlloi7uhVy/OuffYIZjvpXN47u4s5Zd2NuOjOSUjGN/pu5IQhGPSP41+eA2Kbiat7qrsoGJo4/mBceuqA9E9qyt4QFaDbWXd0ZNEwE4QgxqDE7vIfRkcm00ybZ/srJiEo8PkPeTM6zDHYzsYzEaEQLUPqOqDSVX8KoW8/8NiHM3uzy37QAJCGZA7LhgRjINNYCo6tEy3OIQvadV0K6MpmEqZw8jdHlNIZYxxWB1sVKWHEc4vEdLL336E+6CSPHIMcDAOJljUtgLBOdGvTVXjGp
X-MS-Exchange-AntiSpam-MessageData: yOPQq/aDaNTL/cXc7n7PWxpwk4WNhAaAtbObiJ1wMjzQEERQqq5cNC9awvGFOE0Qpjx6dnmbaoCDFGIpdLpdg0XCY8O62nUVAAwI7CNn9h9uuF2I/4jq5F95dPLr0jDGZY6nwgr047feYuSbKTsnPw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08827d5-a4fc-4d68-5ff6-08d7d63dfdcb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 13:10:03.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laLmNnasjM12ZkcdJGKcYITV3lp+aidLIlDs+x54+CgAo8Dyca/YH0TskIsI8tAX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3297
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
Content-Type: multipart/mixed; boundary="===============1025346635=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1025346635==
Content-Type: multipart/alternative;
 boundary="------------93C8209409CEDF064967EEF2"
Content-Language: en-US

--------------93C8209409CEDF064967EEF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Felix for the review. I have a better understanding of how kfifo 
works now and have changed my code quite a bit. Couple of questions 
below inline regarding the gpu_id and data arguments.

Thanks.

Amber

On 2020-03-26 4:53 p.m., Felix Kuehling wrote:
>
> Hi Amber,
>
> I see that this is based on the debugger event code. Jon and I are 
> just working through some issues with that code. The lessons from that 
> will need to be applied to this as well. But I think we can define 
> your API to simplify this a bit.
>
> The basic problem is, that we have one Fifo in the kfd_device, but 
> potentially multiple file descriptors referring to it. For the event 
> interface I think we can enforce only a single file descriptor per 
> device. If there is already one, your register call can fail. See more 
> comments inline.
>
> On 2020-03-17 13:57, Amber Lin wrote:
>> When the compute is malfunctioning or performance drops, the system admin
>> will use SMI (System Management Interface) tool to monitor/diagnostic what
>> went wrong. This patch provides an event watch interface for the user
>> space to register events they are interested. After the event is
>> registered, the user can use annoymous file descriptor's pull function
>
> pull -> poll
>
Thank you for spotting the typo. I’ll change that.

>> with wait-time specified to wait for the event to happen. Once the event
>> happens, the user can use read() to retrieve information related to the
>> event.
>>
>> VM fault event is done in this patch.
>>
>> Signed-off-by: Amber Lin<Amber.Lin@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/Makefile              |   3 +-
>>   drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c |   2 +
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c         |  38 ++++++
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c          |   1 +
>>   drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c  |   2 +
>>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h            |  10 ++
>>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c      | 143 +++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h      |  41 +++++++
>>   include/uapi/linux/kfd_ioctl.h                   |  27 ++++-
>>   9 files changed, 265 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>>   create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
>> index 6147462..cc98b4a 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/Makefile
>> +++ b/drivers/gpu/drm/amd/amdkfd/Makefile
>> @@ -53,7 +53,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
>>   		$(AMDKFD_PATH)/kfd_int_process_v9.o \
>>   		$(AMDKFD_PATH)/kfd_dbgdev.o \
>>   		$(AMDKFD_PATH)/kfd_dbgmgr.o \
>> -		$(AMDKFD_PATH)/kfd_crat.o
>> +		$(AMDKFD_PATH)/kfd_crat.o \
>> +		$(AMDKFD_PATH)/kfd_smi_events.o
>>   
>>   ifneq ($(CONFIG_AMD_IOMMU_V2),)
>>   AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
>> diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
>> index 9f59ba9..24b4717 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
>> @@ -24,6 +24,7 @@
>>   #include "kfd_events.h"
>>   #include "cik_int.h"
>>   #include "amdgpu_amdkfd.h"
>> +#include "kfd_smi_events.h"
>>   
>>   static bool cik_event_interrupt_isr(struct kfd_dev *dev,
>>   					const uint32_t *ih_ring_entry,
>> @@ -107,6 +108,7 @@ static void cik_event_interrupt_wq(struct kfd_dev *dev,
>>   		ihre->source_id == CIK_INTSRC_GFX_MEM_PROT_FAULT) {
>>   		struct kfd_vm_fault_info info;
>>   
>> +		kfd_smi_event_update_vmfault(dev, pasid);
>>   		kfd_process_vm_fault(dev->dqm, pasid);
>>   
>>   		memset(&info, 0, sizeof(info));
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index f8fa03a..8e92956 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -39,6 +39,7 @@
>>   #include "kfd_device_queue_manager.h"
>>   #include "kfd_dbgmgr.h"
>>   #include "amdgpu_amdkfd.h"
>> +#include "kfd_smi_events.h"
>>   
>>   static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>>   static int kfd_open(struct inode *, struct file *);
>> @@ -1243,6 +1244,40 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
>>   	return ret;
>>   }
>>   
>> +/* Handle requests for watching SMI events */
>> +static int kfd_ioctl_smi_events(struct file *filep,
>> +				struct kfd_process *p, void *data)
>> +{
>> +	struct kfd_ioctl_smi_events_args *args = data;
>> +	struct kfd_dev *dev;
>> +	int ret = 0;
>> +
>> +	dev = kfd_device_by_id(args->gpu_id);
>> +	if (!dev)
>> +		return -EINVAL;
>> +
>> +	switch (args->op) {
>> +	case KFD_SMI_EVENTS_REGISTER:
>> +		ret = kfd_smi_event_register(dev, args->events);
>> +		if (ret >= 0) {
>> +			/* When the registration is successful, it returns the
>> +			 * annoymous inode. Pass it to the user in data1
>> +			 */
>> +			args->data1 = ret;
>> +			ret = 0;
>
> You could return the file descriptor as the return value. On success 
> it returns a positive fd. On failure it returns a negative error code.
>
I'm thinking to have a consistent return value regardless of the 
argument content. When args->op is not REGISTER, the return value as 0 
is success.
>
>> +		}
>> +		break;
>> +	case KFD_SMI_EVENTS_UNREGISTER:
>> +		kfd_smi_event_unregister(dev, args->events);
>
> Register seems to do two things: create a file descriptor, and 
> subscribe to specific events. This unregister function only affects 
> the subscription but not the file descriptor. I'd suggest a cleaner API:
>
>   * Register: creates the file descriptor
>   * Subscribe: enables/disables subscription to specific events
>
> The unregistration is done implicitly by closing the file descriptor, 
> so there is no explicit ioctl API call for this.
>
Make sense. I've changed this.
>
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   bool kfd_dev_is_large_bar(struct kfd_dev *dev)
>>   {
>>   	struct kfd_local_mem_info mem_info;
>> @@ -1827,6 +1862,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>>   
>>   	AMDKFD_IOCTL_DEF(AMDKFD_IOC_ALLOC_QUEUE_GWS,
>>   			kfd_ioctl_alloc_queue_gws, 0),
>> +
>> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SMI_EVENTS,
>> +			kfd_ioctl_smi_events, 0),
>>   };
>>   
>>   #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index 7866cd06..450368c 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -532,6 +532,7 @@ struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
>>   	kfd->device_info = device_info;
>>   	kfd->pdev = pdev;
>>   	kfd->init_complete = false;
>> +	kfd->smi_events.events = 0;
>>   	kfd->kfd2kgd = f2g;
>>   	atomic_set(&kfd->compute_profile, 0);
>>   
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
>> index e05d75e..151e83e 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
>> @@ -24,6 +24,7 @@
>>   #include "kfd_events.h"
>>   #include "soc15_int.h"
>>   #include "kfd_device_queue_manager.h"
>> +#include "kfd_smi_events.h"
>>   
>>   static bool event_interrupt_isr_v9(struct kfd_dev *dev,
>>   					const uint32_t *ih_ring_entry,
>> @@ -117,6 +118,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
>>   		info.prot_read  = ring_id & 0x10;
>>   		info.prot_write = ring_id & 0x20;
>>   
>> +		kfd_smi_event_update_vmfault(dev, pasid);
>>   		kfd_process_vm_fault(dev->dqm, pasid);
>>   		kfd_signal_vm_fault_event(dev, pasid, &info);
>>   	}
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> index 43b888b..fdb51de 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> @@ -223,6 +223,13 @@ struct kfd_vmid_info {
>>   	uint32_t vmid_num_kfd;
>>   };
>>   
>> +struct kfd_smi_events {
>> +	uint64_t events;
>> +	struct kfifo fifo;
>> +	wait_queue_head_t wait_queue;
>> +	uint32_t max_events;
>> +};
>> +
>>   struct kfd_dev {
>>   	struct kgd_dev *kgd;
>>   
>> @@ -309,6 +316,9 @@ struct kfd_dev {
>>   
>>   	/* Global GWS resource shared b/t processes*/
>>   	void *gws;
>> +
>> +	/* if this device is in SMI events watch */
>> +	struct kfd_smi_events smi_events;
>>   };
>>   
>>   enum kfd_mempool {
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>> new file mode 100644
>> index 0000000..ba9d036
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>> @@ -0,0 +1,143 @@
>> +/*
>> + * Copyright 2020 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include <linux/poll.h>
>> +#include <linux/wait.h>
>> +#include <linux/anon_inodes.h>
>> +#include <uapi/linux/kfd_ioctl.h>
>> +#include "amdgpu_vm.h"
>> +#include "kfd_priv.h"
>> +#include "kfd_smi_events.h"
>> +
>> +static DEFINE_MUTEX(kfd_smi_mutex);
>> +
>> +struct mutex *kfd_get_smi_mutex(void)
>> +{
>> +	return &kfd_smi_mutex;
>> +}
>> +
>> +static __poll_t kfd_smi_ev_poll(struct file *, struct poll_table_struct *);
>> +static ssize_t kfd_smi_ev_read(struct file *, char __user *, size_t, loff_t *);
>> +static int kfd_smi_ev_release(struct inode *, struct file *);
>> +
>> +static const char kfd_smi_name[] = "kfd_smi_ev";
>> +
>> +static const struct file_operations kfd_smi_ev_fops = {
>> +	.owner = THIS_MODULE,
>> +	.poll = kfd_smi_ev_poll,
>> +	.read = kfd_smi_ev_read,
>> +	.release = kfd_smi_ev_release
>> +};
>> +
>> +static __poll_t kfd_smi_ev_poll(struct file *filep,
>> +				struct poll_table_struct *wait)
>> +{
>> +	struct kfd_dev *dev = filep->private_data;
>> +	struct kfd_smi_events *ev = &dev->smi_events;
>> +
>> +	__poll_t mask = 0;
>> +
>> +	poll_wait(filep, &ev->wait_queue, wait);
>> +	mask |= !kfifo_is_empty(&ev->fifo) ? POLLIN | POLLRDNORM : mask;
>> +
>> +	return mask;
>> +}
>> +
>> +static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
>> +			       size_t size, loff_t *offset)
>> +{
>> +	int ret, copied = 0;
>> +	struct kfd_dev *dev = filep->private_data;
>> +
>> +	ret = kfifo_to_user(&dev->smi_events.fifo, user, size, &copied);
>> +	if (ret || !copied) {
>> +		pr_debug("kfd smi-events: Fail to read fd (%i) (%i)\n",
>> +				ret, copied);
>> +		return ret ? ret : -EAGAIN;
>> +	}
>> +
>> +	return copied;
>> +}
>> +
>> +static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
>> +{
>> +	struct kfd_dev *dev = filep->private_data;
>> +
>> +	kfifo_free(&dev->smi_events.fifo);
>> +	return 0;
>> +}
>> +
>> +void kfd_smi_event_update_vmfault(struct kfd_dev *kdev, uint16_t pasid)
>> +{
>> +	struct kfd_smi_vmfault_fifo fifo_out;
>> +	struct amdgpu_device *adev = (struct amdgpu_device *)kdev->kgd;
>> +	struct amdgpu_task_info task_info;
>> +
>> +	if (!kdev->smi_events.events)
>> +		return;
>
> This condition is redundant.
>
Removed it. It was from my original plan to handle multiple events in 
one function but after realizing not do-able and changing the function 
name, I forgot to remove this check.
>
>> +
>> +	if (!(kdev->smi_events.events & KFD_SMI_EV_VMFAULT))
>> +		return;
>> +
>> +	memset(&task_info, 0, sizeof(struct amdgpu_task_info));
>> +	amdgpu_vm_get_task_info(adev, pasid, &task_info);
>> +
>> +	fifo_out.group = 0;
>> +	fifo_out.event = KFD_SMI_EV_VMFAULT;
>> +	fifo_out.gpu_id = kdev->id;
>> +	fifo_out.pid = task_info.pid;
>> +	strcpy(fifo_out.task_name, task_info.task_name);
>> +	kfifo_in(&kdev->smi_events.fifo, &fifo_out, sizeof(fifo_out));
>> +	wake_up_all(&kdev->smi_events.wait_queue);
>> +}
>> +
>> +void kfd_smi_event_unregister(struct kfd_dev *dev, uint64_t events)
>> +{
>> +	mutex_lock(kfd_get_smi_mutex());
>> +	dev->smi_events.events &= ~events;
>> +	mutex_unlock(kfd_get_smi_mutex());
>> +}
>> +
>> +int kfd_smi_event_register(struct kfd_dev *dev, uint64_t events)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(kfd_get_smi_mutex());
>> +	dev->smi_events.events |= events;
>> +	mutex_unlock(kfd_get_smi_mutex());
>> +
>> +	/* We use the lower 32 bits for now. Each bit represents one event. If
>> +	 * featured events are increased to more than 32, we'll use the upper
>> +	 * bits as groups so the total number of events can be up to 32*32.
>> +	 */
>> +	dev->smi_events.max_events = 32;
>
> I don't understand the explanation above. It seems to refer to the 
> event subscription mechanism. But you use this as the size of the 
> fifo. That's the size in bytes. Your struct kfd_smi_vmfault_fifo is 
> bigger than that, so even a single entry will overflow your FIFO queue.
>
I’m afraid we’ll eventually need to support more than 64 events, so I 
want to reserve the upper 32 bits to serve as “group”. Once we reach 32 
events, 0x00000000_80000000 will be the last event in group 0, and 
0x00000001_00000001 is the first event in group 1. This way we can 
expand the 64 bits to support more than 64 events.

This seems too complicated to explain in code. I'll just use the events 
parameter as event IDs. Once the featured events grows to more than 64, 
we can use "data" in the argument to express group when the op is 
ENABLE/DISABLE events.

>> +	ret = kfifo_alloc(&dev->smi_events.fifo, dev->smi_events.max_events,
>> +			 GFP_KERNEL);
>> +	if (ret) {
>> +		pr_err("fail to allocate kfifo\n");
>> +		return ret;
>> +	}
>> +	init_waitqueue_head(&dev->smi_events.wait_queue);
>> +
>> +	return anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops,
>> +				(void *)dev, 0);
>> +}
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
>> new file mode 100644
>> index 0000000..2e320d3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
>> @@ -0,0 +1,41 @@
>> +/*
>> + * Copyright 2020 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#ifndef KFD_SMI_EVENTS_H_INCLUDED
>> +#define KFD_SMI_EVENTS_H_INCLUDED
>> +
>> +int kfd_smi_event_register(struct kfd_dev *dev, uint64_t events);
>> +void kfd_smi_event_unregister(struct kfd_dev *dev, uint64_t events);
>> +void kfd_smi_event_update_vmfault(struct kfd_dev *dev, uint16_t pasid);
>> +
>> +/* All FIFO must start with "uint32_t group" and "uint32_t event" so the user
>> + * can read the first 8 bytes to determine the next read length.
>
> Note about terminology: FIFO refers to a fifo queue. I think you're 
> using it to describe an entry or record in the FIFO.
>
> I don't know why you need to split group and event? The event mask is 
> only 64-bit, so there can be no more than 64 events.
>
I've removed group
>
>> + */
>> +struct kfd_smi_vmfault_fifo {
>> +	uint32_t group;
>> +	uint32_t event;
>> +	unsigned int gpu_id;
>
> The gpu_id is redundant because the file descriptor used to read the 
> events is associated with a kfd_dev (GPU). If you want to have a 
> single fifo, you should change the register API to not require a 
> gpu_id and the fifo should be global, not a member of the kfd_dev.
>
True
>
>> +	pid_t pid;
>> +	char task_name[TASK_COMM_LEN];
>> +};
>
> This needs to be part of the user API because usermode needs to parse 
> this structure. So it should be defined in kfd_ioctl.h. In your 
> proposed API I think the size of the FIFO entry is implied by the 
> event type. It would be cleaner to separate the FIFO entries into a 
> header and payload. The header would be the same for all events and 
> doesn't need to be duplicated in each event structure. It would 
> contain the event type and size (to allow variable size events). The 
> payload would depend on the event type.
>
I'll change this
>
>> +
>> +#endif
>> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
>> index 4f66764..6ce7c69 100644
>> --- a/include/uapi/linux/kfd_ioctl.h
>> +++ b/include/uapi/linux/kfd_ioctl.h
>> @@ -442,6 +442,28 @@ struct kfd_ioctl_import_dmabuf_args {
>>   	__u32 dmabuf_fd;	/* to KFD */
>>   };
>>   
>> +/*
>> + * KFD SMI(System Management Interface) events
>> + */
>> +enum kfd_smi_events_op {
>> +	KFD_SMI_EVENTS_REGISTER = 1,
>> +	KFD_SMI_EVENTS_UNREGISTER
>> +};
>> +
>> +/* Event ID (mask) */
>> +#define KFD_SMI_EV_VMFAULT     0x00000001
>> +
>> +struct kfd_ioctl_smi_events_args {
>> +	__u32 op;       /* to KFD */
>> +	/* upper 32 bits: group. lower 32 bits: event IDs */
>> +	__u64 events;   /* to KFD */
>> +	__u32 gpu_id;   /* to KFD */
>> +	pid_t pid;      /* to KFD */
>> +	__u32 data1;    /* from KFD */
>> +	__u32 data2;
>> +	__u32 data3;
>
> This looks like you copied it from the debug API.  pid, data1-3 are 
> not used by your API. I think gpu_id should not be used either if you 
> want the event FIFO to be global.
>
> Regards,
>   Felix
>
gpu_id is for the user space to tell KFD which device it wants to watch 
events. I'll use separate fd/fifo for each device. I want to reserve 
some extra parameters in case I need to feedback extra information for 
possible future events. Further thinking of it, that will be handled in 
the anonymous fd's output, not here. I'll remove data 2 and 3 and rename 
data1 as data. I want to use it for anon_fd in REGISTRATION and for 
group in DISABLE/ENABLE when we need to support more than 64 events.
>
>> +};
>> +
>>   /* Register offset inside the remapped mmio page
>>    */
>>   enum kfd_mmio_remap {
>> @@ -546,7 +568,10 @@ enum kfd_mmio_remap {
>>   #define AMDKFD_IOC_ALLOC_QUEUE_GWS		\
>>   		AMDKFD_IOWR(0x1E, struct kfd_ioctl_alloc_queue_gws_args)
>>   
>> +#define AMDKFD_IOC_SMI_EVENTS			\
>> +		AMDKFD_IOWR(0x1F, struct kfd_ioctl_smi_events_args)
>> +
>>   #define AMDKFD_COMMAND_START		0x01
>> -#define AMDKFD_COMMAND_END		0x1F
>> +#define AMDKFD_COMMAND_END		0x20
>>   
>>   #endif

--------------93C8209409CEDF064967EEF2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Thanks Felix for the review. I have a better understanding of how
      kfifo works now and have changed my code quite a bit. Couple of
      questions below inline regarding the gpu_id and data arguments.</p>
    <p>Thanks.</p>
    <p>Amber<br>
    </p>
    <div class="moz-cite-prefix">On 2020-03-26 4:53 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      
      <p>Hi Amber,</p>
      <p>I see that this is based on the debugger event code. Jon and I
        are just working through some issues with that code. The lessons
        from that will need to be applied to this as well. But I think
        we can define your API to simplify this a bit.</p>
      <p>The basic problem is, that we have one Fifo in the kfd_device,
        but potentially multiple file descriptors referring to it. For
        the event interface I think we can enforce only a single file
        descriptor per device. If there is already one, your register
        call can fail. See more comments inline.<br>
      </p>
      <div class="moz-cite-prefix">On 2020-03-17 13:57, Amber Lin wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">When the compute is malfunctioning or performance drops, the system admin
will use SMI (System Management Interface) tool to monitor/diagnostic what
went wrong. This patch provides an event watch interface for the user
space to register events they are interested. After the event is
registered, the user can use annoymous file descriptor's pull function</pre>
      </blockquote>
      <p>pull -&gt; poll<br>
      </p>
    </blockquote>
    <p style="tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt
      320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt
      687.0pt 732.8pt"><span style="mso-bookmark:_MailOriginal"></span></p>
    <p style="tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt
      320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt
      687.0pt 732.8pt">
      <span style="mso-bookmark:_MailOriginal">Thank you for spotting
        the typo. I’ll change that.</span></p>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">with wait-time specified to wait for the event to happen. Once the event
happens, the user can use read() to retrieve information related to the
event.

VM fault event is done in this patch.

Signed-off-by: Amber Lin <a class="moz-txt-link-rfc2396E" href="mailto:Amber.Lin@amd.com" moz-do-not-send="true">&lt;Amber.Lin@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/Makefile              |   3 &#43;-
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c |   2 &#43;
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c         |  38 &#43;&#43;&#43;&#43;&#43;&#43;
 drivers/gpu/drm/amd/amdkfd/kfd_device.c          |   1 &#43;
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c  |   2 &#43;
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h            |  10 &#43;&#43;
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c      | 143 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h      |  41 &#43;&#43;&#43;&#43;&#43;&#43;&#43;
 include/uapi/linux/kfd_ioctl.h                   |  27 &#43;&#43;&#43;&#43;-
 9 files changed, 265 insertions(&#43;), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h

diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index 6147462..cc98b4a 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -53,7 &#43;53,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_int_process_v9.o \
 		$(AMDKFD_PATH)/kfd_dbgdev.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
-		$(AMDKFD_PATH)/kfd_crat.o
&#43;		$(AMDKFD_PATH)/kfd_crat.o \
&#43;		$(AMDKFD_PATH)/kfd_smi_events.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES &#43;= $(AMDKFD_PATH)/kfd_iommu.o
diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
index 9f59ba9..24b4717 100644
--- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
@@ -24,6 &#43;24,7 @@
 #include &quot;kfd_events.h&quot;
 #include &quot;cik_int.h&quot;
 #include &quot;amdgpu_amdkfd.h&quot;
&#43;#include &quot;kfd_smi_events.h&quot;
 
 static bool cik_event_interrupt_isr(struct kfd_dev *dev,
 					const uint32_t *ih_ring_entry,
@@ -107,6 &#43;108,7 @@ static void cik_event_interrupt_wq(struct kfd_dev *dev,
 		ihre-&gt;source_id == CIK_INTSRC_GFX_MEM_PROT_FAULT) {
 		struct kfd_vm_fault_info info;
 
&#43;		kfd_smi_event_update_vmfault(dev, pasid);
 		kfd_process_vm_fault(dev-&gt;dqm, pasid);
 
 		memset(&amp;info, 0, sizeof(info));
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f8fa03a..8e92956 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -39,6 &#43;39,7 @@
 #include &quot;kfd_device_queue_manager.h&quot;
 #include &quot;kfd_dbgmgr.h&quot;
 #include &quot;amdgpu_amdkfd.h&quot;
&#43;#include &quot;kfd_smi_events.h&quot;
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -1243,6 &#43;1244,40 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
 	return ret;
 }
 
&#43;/* Handle requests for watching SMI events */
&#43;static int kfd_ioctl_smi_events(struct file *filep,
&#43;				struct kfd_process *p, void *data)
&#43;{
&#43;	struct kfd_ioctl_smi_events_args *args = data;
&#43;	struct kfd_dev *dev;
&#43;	int ret = 0;
&#43;
&#43;	dev = kfd_device_by_id(args-&gt;gpu_id);
&#43;	if (!dev)
&#43;		return -EINVAL;
&#43;
&#43;	switch (args-&gt;op) {
&#43;	case KFD_SMI_EVENTS_REGISTER:
&#43;		ret = kfd_smi_event_register(dev, args-&gt;events);
&#43;		if (ret &gt;= 0) {
&#43;			/* When the registration is successful, it returns the
&#43;			 * annoymous inode. Pass it to the user in data1
&#43;			 */
&#43;			args-&gt;data1 = ret;
&#43;			ret = 0;</pre>
      </blockquote>
      <p>You could return the file descriptor as the return value. On
        success it returns a positive fd. On failure it returns a
        negative error code.<br>
      </p>
    </blockquote>
    I'm thinking to have a consistent return value regardless of the
    argument content. When args-&gt;op is not REGISTER, the return value
    as 0 is success.<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;		}
&#43;		break;
&#43;	case KFD_SMI_EVENTS_UNREGISTER:
&#43;		kfd_smi_event_unregister(dev, args-&gt;events);</pre>
      </blockquote>
      <p>Register seems to do two things: create a file descriptor, and
        subscribe to specific events. This unregister function only
        affects the subscription but not the file descriptor. I'd
        suggest a cleaner API:</p>
      <ul>
        <li>Register: creates the file descriptor</li>
        <li>Subscribe: enables/disables subscription to specific events<br>
        </li>
      </ul>
      <p>The unregistration is done implicitly by closing the file
        descriptor, so there is no explicit ioctl API call for this.<br>
      </p>
    </blockquote>
    Make sense. I've changed this.<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;		break;
&#43;	default:
&#43;		ret = -EINVAL;
&#43;		break;
&#43;	}
&#43;
&#43;	return ret;
&#43;}
&#43;
 bool kfd_dev_is_large_bar(struct kfd_dev *dev)
 {
 	struct kfd_local_mem_info mem_info;
@@ -1827,6 &#43;1862,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_ALLOC_QUEUE_GWS,
 			kfd_ioctl_alloc_queue_gws, 0),
&#43;
&#43;	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SMI_EVENTS,
&#43;			kfd_ioctl_smi_events, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 7866cd06..450368c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -532,6 &#43;532,7 @@ struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
 	kfd-&gt;device_info = device_info;
 	kfd-&gt;pdev = pdev;
 	kfd-&gt;init_complete = false;
&#43;	kfd-&gt;smi_events.events = 0;
 	kfd-&gt;kfd2kgd = f2g;
 	atomic_set(&amp;kfd-&gt;compute_profile, 0);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index e05d75e..151e83e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -24,6 &#43;24,7 @@
 #include &quot;kfd_events.h&quot;
 #include &quot;soc15_int.h&quot;
 #include &quot;kfd_device_queue_manager.h&quot;
&#43;#include &quot;kfd_smi_events.h&quot;
 
 static bool event_interrupt_isr_v9(struct kfd_dev *dev,
 					const uint32_t *ih_ring_entry,
@@ -117,6 &#43;118,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
 		info.prot_read  = ring_id &amp; 0x10;
 		info.prot_write = ring_id &amp; 0x20;
 
&#43;		kfd_smi_event_update_vmfault(dev, pasid);
 		kfd_process_vm_fault(dev-&gt;dqm, pasid);
 		kfd_signal_vm_fault_event(dev, pasid, &amp;info);
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 43b888b..fdb51de 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -223,6 &#43;223,13 @@ struct kfd_vmid_info {
 	uint32_t vmid_num_kfd;
 };
 
&#43;struct kfd_smi_events {
&#43;	uint64_t events;
&#43;	struct kfifo fifo;
&#43;	wait_queue_head_t wait_queue;
&#43;	uint32_t max_events;
&#43;};
&#43;
 struct kfd_dev {
 	struct kgd_dev *kgd;
 
@@ -309,6 &#43;316,9 @@ struct kfd_dev {
 
 	/* Global GWS resource shared b/t processes*/
 	void *gws;
&#43;
&#43;	/* if this device is in SMI events watch */
&#43;	struct kfd_smi_events smi_events;
 };
 
 enum kfd_mempool {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
new file mode 100644
index 0000000..ba9d036
--- /dev/null
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -0,0 &#43;1,143 @@
&#43;/*
&#43; * Copyright 2020 Advanced Micro Devices, Inc.
&#43; *
&#43; * Permission is hereby granted, free of charge, to any person obtaining a
&#43; * copy of this software and associated documentation files (the &quot;Software&quot;),
&#43; * to deal in the Software without restriction, including without limitation
&#43; * the rights to use, copy, modify, merge, publish, distribute, sublicense,
&#43; * and/or sell copies of the Software, and to permit persons to whom the
&#43; * Software is furnished to do so, subject to the following conditions:
&#43; *
&#43; * The above copyright notice and this permission notice shall be included in
&#43; * all copies or substantial portions of the Software.
&#43; *
&#43; * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
&#43; * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
&#43; * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
&#43; * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
&#43; * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
&#43; * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
&#43; * OTHER DEALINGS IN THE SOFTWARE.
&#43; */
&#43;
&#43;#include &lt;linux/poll.h&gt;
&#43;#include &lt;linux/wait.h&gt;
&#43;#include &lt;linux/anon_inodes.h&gt;
&#43;#include &lt;uapi/linux/kfd_ioctl.h&gt;
&#43;#include &quot;amdgpu_vm.h&quot;
&#43;#include &quot;kfd_priv.h&quot;
&#43;#include &quot;kfd_smi_events.h&quot;
&#43;
&#43;static DEFINE_MUTEX(kfd_smi_mutex);
&#43;
&#43;struct mutex *kfd_get_smi_mutex(void)
&#43;{
&#43;	return &amp;kfd_smi_mutex;
&#43;}
&#43;
&#43;static __poll_t kfd_smi_ev_poll(struct file *, struct poll_table_struct *);
&#43;static ssize_t kfd_smi_ev_read(struct file *, char __user *, size_t, loff_t *);
&#43;static int kfd_smi_ev_release(struct inode *, struct file *);
&#43;
&#43;static const char kfd_smi_name[] = &quot;kfd_smi_ev&quot;;
&#43;
&#43;static const struct file_operations kfd_smi_ev_fops = {
&#43;	.owner = THIS_MODULE,
&#43;	.poll = kfd_smi_ev_poll,
&#43;	.read = kfd_smi_ev_read,
&#43;	.release = kfd_smi_ev_release
&#43;};
&#43;
&#43;static __poll_t kfd_smi_ev_poll(struct file *filep,
&#43;				struct poll_table_struct *wait)
&#43;{
&#43;	struct kfd_dev *dev = filep-&gt;private_data;
&#43;	struct kfd_smi_events *ev = &amp;dev-&gt;smi_events;
&#43;
&#43;	__poll_t mask = 0;
&#43;
&#43;	poll_wait(filep, &amp;ev-&gt;wait_queue, wait);
&#43;	mask |= !kfifo_is_empty(&amp;ev-&gt;fifo) ? POLLIN | POLLRDNORM : mask;
&#43;
&#43;	return mask;
&#43;}
&#43;
&#43;static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
&#43;			       size_t size, loff_t *offset)
&#43;{
&#43;	int ret, copied = 0;
&#43;	struct kfd_dev *dev = filep-&gt;private_data;
&#43;
&#43;	ret = kfifo_to_user(&amp;dev-&gt;smi_events.fifo, user, size, &amp;copied);
&#43;	if (ret || !copied) {
&#43;		pr_debug(&quot;kfd smi-events: Fail to read fd (%i) (%i)\n&quot;,
&#43;				ret, copied);
&#43;		return ret ? ret : -EAGAIN;
&#43;	}
&#43;
&#43;	return copied;
&#43;}
&#43;
&#43;static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
&#43;{
&#43;	struct kfd_dev *dev = filep-&gt;private_data;
&#43;
&#43;	kfifo_free(&amp;dev-&gt;smi_events.fifo);
&#43;	return 0;
&#43;}
&#43;
&#43;void kfd_smi_event_update_vmfault(struct kfd_dev *kdev, uint16_t pasid)
&#43;{
&#43;	struct kfd_smi_vmfault_fifo fifo_out;
&#43;	struct amdgpu_device *adev = (struct amdgpu_device *)kdev-&gt;kgd;
&#43;	struct amdgpu_task_info task_info;
&#43;
&#43;	if (!kdev-&gt;smi_events.events)
&#43;		return;</pre>
      </blockquote>
      <p>This condition is redundant.<br>
      </p>
    </blockquote>
    Removed it. It was from my original plan to handle multiple events
    in one function but after realizing not do-able and changing the
    function name, I forgot to remove this check.<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;
&#43;	if (!(kdev-&gt;smi_events.events &amp; KFD_SMI_EV_VMFAULT))
&#43;		return;
&#43;
&#43;	memset(&amp;task_info, 0, sizeof(struct amdgpu_task_info));
&#43;	amdgpu_vm_get_task_info(adev, pasid, &amp;task_info);
&#43;
&#43;	fifo_out.group = 0;
&#43;	fifo_out.event = KFD_SMI_EV_VMFAULT;
&#43;	fifo_out.gpu_id = kdev-&gt;id;
&#43;	fifo_out.pid = task_info.pid;
&#43;	strcpy(fifo_out.task_name, task_info.task_name);
&#43;	kfifo_in(&amp;kdev-&gt;smi_events.fifo, &amp;fifo_out, sizeof(fifo_out));
&#43;	wake_up_all(&amp;kdev-&gt;smi_events.wait_queue);
&#43;}
&#43;
&#43;void kfd_smi_event_unregister(struct kfd_dev *dev, uint64_t events)
&#43;{
&#43;	mutex_lock(kfd_get_smi_mutex());
&#43;	dev-&gt;smi_events.events &amp;= ~events;
&#43;	mutex_unlock(kfd_get_smi_mutex());
&#43;}
&#43;
&#43;int kfd_smi_event_register(struct kfd_dev *dev, uint64_t events)
&#43;{
&#43;	int ret;
&#43;
&#43;	mutex_lock(kfd_get_smi_mutex());
&#43;	dev-&gt;smi_events.events |= events;
&#43;	mutex_unlock(kfd_get_smi_mutex());
&#43;
&#43;	/* We use the lower 32 bits for now. Each bit represents one event. If
&#43;	 * featured events are increased to more than 32, we'll use the upper
&#43;	 * bits as groups so the total number of events can be up to 32*32.
&#43;	 */
&#43;	dev-&gt;smi_events.max_events = 32;</pre>
      </blockquote>
      <p>I don't understand the explanation above. It seems to refer to
        the event subscription mechanism. But you use this as the size
        of the fifo. That's the size in bytes. Your struct
        kfd_smi_vmfault_fifo is bigger than that, so even a single entry
        will overflow your FIFO queue.<br>
      </p>
    </blockquote>
    <p><span style="mso-bookmark:_MailOriginal"><span style="color:#548235;mso-themecolor:accent6;mso-themeshade:191;mso-style-textfill-fill-color:#548235;mso-style-textfill-fill-themecolor:accent6;mso-style-textfill-fill-alpha:100.0%;mso-style-textfill-fill-colortransforms:lumm=75000">
          <font color="#000000">I’m afraid we’ll eventually need to
            support more than 64 events, so I want to reserve the upper
            32 bits to serve as “group”. Once we reach 32 events,
            0x00000000_80000000 will be the last event in group 0, and
            0x00000001_00000001 is the first event in group 1. This way
            we can expand the 64 bits to support more than 64 events.</font></span></span></p>
    <p><span style="mso-bookmark:_MailOriginal"><span style="color:#548235;mso-themecolor:accent6;mso-themeshade:191;mso-style-textfill-fill-color:#548235;mso-style-textfill-fill-themecolor:accent6;mso-style-textfill-fill-alpha:100.0%;mso-style-textfill-fill-colortransforms:lumm=75000"><font color="#000000">This seems too complicated to explain in
            code. I'll just use the events parameter as event IDs. Once
            the featured events grows to more than 64, we can use &quot;data&quot;
            in the argument to express group when the op is
            ENABLE/DISABLE events.<br>
          </font></span></span></p>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;	ret = kfifo_alloc(&amp;dev-&gt;smi_events.fifo, dev-&gt;smi_events.max_events,
&#43;			 GFP_KERNEL);
&#43;	if (ret) {
&#43;		pr_err(&quot;fail to allocate kfifo\n&quot;);
&#43;		return ret;
&#43;	}
&#43;	init_waitqueue_head(&amp;dev-&gt;smi_events.wait_queue);
&#43;
&#43;	return anon_inode_getfd(kfd_smi_name, &amp;kfd_smi_ev_fops,
&#43;				(void *)dev, 0);
&#43;}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
new file mode 100644
index 0000000..2e320d3
--- /dev/null
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
@@ -0,0 &#43;1,41 @@
&#43;/*
&#43; * Copyright 2020 Advanced Micro Devices, Inc.
&#43; *
&#43; * Permission is hereby granted, free of charge, to any person obtaining a
&#43; * copy of this software and associated documentation files (the &quot;Software&quot;),
&#43; * to deal in the Software without restriction, including without limitation
&#43; * the rights to use, copy, modify, merge, publish, distribute, sublicense,
&#43; * and/or sell copies of the Software, and to permit persons to whom the
&#43; * Software is furnished to do so, subject to the following conditions:
&#43; *
&#43; * The above copyright notice and this permission notice shall be included in
&#43; * all copies or substantial portions of the Software.
&#43; *
&#43; * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
&#43; * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
&#43; * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
&#43; * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
&#43; * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
&#43; * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
&#43; * OTHER DEALINGS IN THE SOFTWARE.
&#43; */
&#43;
&#43;#ifndef KFD_SMI_EVENTS_H_INCLUDED
&#43;#define KFD_SMI_EVENTS_H_INCLUDED
&#43;
&#43;int kfd_smi_event_register(struct kfd_dev *dev, uint64_t events);
&#43;void kfd_smi_event_unregister(struct kfd_dev *dev, uint64_t events);
&#43;void kfd_smi_event_update_vmfault(struct kfd_dev *dev, uint16_t pasid);
&#43;
&#43;/* All FIFO must start with &quot;uint32_t group&quot; and &quot;uint32_t event&quot; so the user
&#43; * can read the first 8 bytes to determine the next read length.</pre>
      </blockquote>
      <p>Note about terminology: FIFO refers to a fifo queue. I think
        you're using it to describe an entry or record in the FIFO.<br>
      </p>
      <p>I don't know why you need to split group and event? The event
        mask is only 64-bit, so there can be no more than 64 events.<br>
      </p>
    </blockquote>
    I've removed group<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43; */
&#43;struct kfd_smi_vmfault_fifo {
&#43;	uint32_t group;
&#43;	uint32_t event;
&#43;	unsigned int gpu_id;</pre>
      </blockquote>
      <p>The gpu_id is redundant because the file descriptor used to
        read the events is associated with a kfd_dev (GPU). If you want
        to have a single fifo, you should change the register API to not
        require a gpu_id and the fifo should be global, not a member of
        the kfd_dev.</p>
    </blockquote>
    True<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;	pid_t pid;
&#43;	char task_name[TASK_COMM_LEN];
&#43;};</pre>
      </blockquote>
      <p>This needs to be part of the user API because usermode needs to
        parse this structure. So it should be defined in kfd_ioctl.h. In
        your proposed API I think the size of the FIFO entry is implied
        by the event type. It would be cleaner to separate the FIFO
        entries into a header and payload. The header would be the same
        for all events and doesn't need to be duplicated in each event
        structure. It would contain the event type and size (to allow
        variable size events). The payload would depend on the event
        type.</p>
    </blockquote>
    I'll change this<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;
&#43;#endif
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 4f66764..6ce7c69 100644
--- a/include/uapi/linux/kfd_ioctl.h
&#43;&#43;&#43; b/include/uapi/linux/kfd_ioctl.h
@@ -442,6 &#43;442,28 @@ struct kfd_ioctl_import_dmabuf_args {
 	__u32 dmabuf_fd;	/* to KFD */
 };
 
&#43;/*
&#43; * KFD SMI(System Management Interface) events
&#43; */
&#43;enum kfd_smi_events_op {
&#43;	KFD_SMI_EVENTS_REGISTER = 1,
&#43;	KFD_SMI_EVENTS_UNREGISTER
&#43;};
&#43;
&#43;/* Event ID (mask) */
&#43;#define KFD_SMI_EV_VMFAULT     0x00000001
&#43;
&#43;struct kfd_ioctl_smi_events_args {
&#43;	__u32 op;       /* to KFD */
&#43;	/* upper 32 bits: group. lower 32 bits: event IDs */
&#43;	__u64 events;   /* to KFD */
&#43;	__u32 gpu_id;   /* to KFD */
&#43;	pid_t pid;      /* to KFD */
&#43;	__u32 data1;    /* from KFD */
&#43;	__u32 data2;
&#43;	__u32 data3;</pre>
      </blockquote>
      <p>This looks like you copied it from the debug API.&nbsp; pid, data1-3
        are not used by your API. I think gpu_id should not be used
        either if you want the event FIFO to be global.</p>
      <p>Regards,<br>
        &nbsp; Felix<br>
      </p>
    </blockquote>
    gpu_id is for the user space to tell KFD which device it wants to
    watch events. I'll use separate fd/fifo for each device. I want to
    reserve some extra parameters in case I need to feedback extra
    information for possible future events. Further thinking of it, that
    will be handled in the anonymous fd's output, not here. I'll remove
    data 2 and 3 and rename data1 as data. I want to use it for anon_fd
    in REGISTRATION and for group in DISABLE/ENABLE when we need to
    support more than 64 events.<br>
    <blockquote type="cite" cite="mid:ee4dc24e-4d47-7c8b-af23-788e90d234da@amd.com">
      <p> </p>
      <blockquote type="cite" cite="mid:1584467823-31170-1-git-send-email-Amber.Lin@amd.com">
        <pre class="moz-quote-pre" wrap="">&#43;};
&#43;
 /* Register offset inside the remapped mmio page
  */
 enum kfd_mmio_remap {
@@ -546,7 &#43;568,10 @@ enum kfd_mmio_remap {
 #define AMDKFD_IOC_ALLOC_QUEUE_GWS		\
 		AMDKFD_IOWR(0x1E, struct kfd_ioctl_alloc_queue_gws_args)
 
&#43;#define AMDKFD_IOC_SMI_EVENTS			\
&#43;		AMDKFD_IOWR(0x1F, struct kfd_ioctl_smi_events_args)
&#43;
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x1F
&#43;#define AMDKFD_COMMAND_END		0x20
 
 #endif
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------93C8209409CEDF064967EEF2--

--===============1025346635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1025346635==--
