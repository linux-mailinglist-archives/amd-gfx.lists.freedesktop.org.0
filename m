Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E689EB86
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Apr 2024 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21211320B;
	Wed, 10 Apr 2024 07:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KtkJA6bh";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEED710E17F
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Apr 2024 15:39:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439CppUs017838; Tue, 9 Apr 2024 15:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=BVya2MLIf3T+ay0p5m5Dy3OvncV3HoHy2h8QweebvPk=; b=Kt
 kJA6bhYIkRC4MZLI1LGmOfLeWO1DAgDad2jo7KMtyNYLPZZoBT16faQIgcrECgso
 uho+kGsHmTj+j03mF4sk+Tj67rvzDvEv5P65XlEpKhzoYQ723lz+eFXq/ieHk29c
 dIPNHSbCr/YssNqPMd/fxt/sv23fosG2q+AQ4axlxDChD3/z9C2D6Xpp+H9hnm/y
 58TZKFu9K4Oj62ub7r3YRdyjw/YexEmOqzGOgM7sk3hJbpFyQ5Idupg0jpYqlaOr
 rVHIYVaWEKXnHO4ooXxxAsLGXtvdSHuOJMGGhbV3b6aGsXyt0iMvfc6CTQcsKeeQ
 9VxAKmFibhcVPVY8phCA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcv3khhnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 15:39:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439FdIfx026011
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Apr 2024 15:39:18 GMT
Received: from [10.110.80.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Apr 2024
 08:39:17 -0700
Message-ID: <4a29d0b8-d9b6-4229-b5de-b4f378328cf4@quicinc.com>
Date: Tue, 9 Apr 2024 08:39:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.5.5: UBSAN: radeon_atombios.c: index 1 is out of range for type
 'UCHAR [1]'
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Kees Cook <kees@kernel.org>
CC: Justin Piszcz <jpiszcz@lucidpixels.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux AMDGPU
 <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Kees Cook <keescook@chromium.org>
References: <CAO9zADy4b1XkD_ZaEF+XkDCXePJLD4Lev3g7HAEGYsCHgeM+KQ@mail.gmail.com>
 <ZRoIGhMesKtmNkAM@debian.me>
 <CAO9zADyfaLRWB-0rdojnbFD6SUsqX+zb9JZSZUkgTC7VJN=c1A@mail.gmail.com>
 <a619df03-e0cb-48f7-840a-970b7a6f6037@quicinc.com>
 <CA212FEF-E0BB-483C-86CC-6986D4FBE168@kernel.org>
 <CADnq5_PKoX9G8jD=m1WnX3nxd_+GL_xi03_Dgq8HK6Diw3=JsQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CADnq5_PKoX9G8jD=m1WnX3nxd_+GL_xi03_Dgq8HK6Diw3=JsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: c1qwXR0YvDTneK_1PZhMy5ER1dO-JAhs
X-Proofpoint-GUID: c1qwXR0YvDTneK_1PZhMy5ER1dO-JAhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_11,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090102
X-Mailman-Approved-At: Wed, 10 Apr 2024 07:12:48 +0000
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

On 4/8/2024 9:23 PM, Alex Deucher wrote:
> On Mon, Apr 8, 2024 at 9:45 PM Kees Cook <kees@kernel.org> wrote:
>>
>>
>>
>> On April 8, 2024 5:45:29 PM PDT, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>>> On 10/1/23 17:12, Justin Piszcz wrote:
>>>>>> ================================================================================
>>>>>> [Sun Oct  1 15:59:04 2023] UBSAN: array-index-out-of-bounds in
>>>>>> drivers/gpu/drm/radeon/radeon_atombios.c:2620:43
>>>>>> [Sun Oct  1 15:59:04 2023] index 1 is out of range for type 'UCHAR [1]'
>>>>>> [Sun Oct  1 15:59:04 2023] CPU: 5 PID: 1 Comm: swapper/0 Tainted: G
>>>>>>              T  6.5.5 #13 55df8de52754ef95effc50a55e9206abdea304ac
>>>>>> [Sun Oct  1 15:59:04 2023] Hardware name: Supermicro X9SRL-F/X9SRL-F,
>>>>>> BIOS 3.3 11/13/2018
>>>>>> [Sun Oct  1 15:59:04 2023] Call Trace:
>>>>>> [Sun Oct  1 15:59:04 2023]  <TASK>
>>>>>> [Sun Oct  1 15:59:04 2023]  dump_stack_lvl+0x36/0x50
>>>>>> [Sun Oct  1 15:59:04 2023]  __ubsan_handle_out_of_bounds+0xc7/0x110
>>>>>> [Sun Oct  1 15:59:04 2023]  radeon_atombios_get_power_modes+0x87a/0x8f0
>>>>>> [Sun Oct  1 15:59:04 2023]  radeon_pm_init+0x13a/0x7e0
>>>>>> [Sun Oct  1 15:59:04 2023]  evergreen_init+0x13d/0x3d0
>>>>>> [Sun Oct  1 15:59:04 2023]  radeon_device_init+0x60a/0xbf0
>>>>>> [Sun Oct  1 15:59:04 2023]  radeon_driver_load_kms+0xb1/0x250
>>>>>> [Sun Oct  1 15:59:04 2023]  drm_dev_register+0xfc/0x250
>>>>>> [Sun Oct  1 15:59:04 2023]  radeon_pci_probe+0xd0/0x150
>>>>>> [Sun Oct  1 15:59:04 2023]  pci_device_probe+0x97/0x130
>>>>>> [Sun Oct  1 15:59:04 2023]  really_probe+0xbe/0x2f0
>>>>>> [Sun Oct  1 15:59:04 2023]  ? __pfx___driver_attach+0x10/0x10
>>>>>> [Sun Oct  1 15:59:04 2023]  __driver_probe_device+0x6e/0x120
>>>>>> [Sun Oct  1 15:59:04 2023]  driver_probe_device+0x1a/0x90
>>>>>> [Sun Oct  1 15:59:04 2023]  __driver_attach+0xd4/0x170
>>>>>> [Sun Oct  1 15:59:04 2023]  bus_for_each_dev+0x87/0xe0
>>>>>> [Sun Oct  1 15:59:04 2023]  bus_add_driver+0xf3/0x1f0
>>>>>> [Sun Oct  1 15:59:04 2023]  driver_register+0x58/0x120
>>>>>> [Sun Oct  1 15:59:04 2023]  ? __pfx_radeon_module_init+0x10/0x10
>>>>>> [Sun Oct  1 15:59:04 2023]  do_one_initcall+0x93/0x4a0
>>>>>> [Sun Oct  1 15:59:04 2023]  kernel_init_freeable+0x301/0x580
>>>>>> [Sun Oct  1 15:59:04 2023]  ? __pfx_kernel_init+0x10/0x10
>>>>>> [Sun Oct  1 15:59:04 2023]  kernel_init+0x15/0x1b0
>>>>>> [Sun Oct  1 15:59:04 2023]  ret_from_fork+0x2f/0x50
>>>>>> [Sun Oct  1 15:59:04 2023]  ? __pfx_kernel_init+0x10/0x10
>>>>>> [Sun Oct  1 15:59:04 2023]  ret_from_fork_asm+0x1b/0x30
>>>>>> [Sun Oct  1 15:59:04 2023]  </TASK>
>>>>>> [Sun Oct  1 15:59:04 2023]
>>>>>> ================================================================================
>>>>>> [Sun Oct  1 15:59:04 2023] [drm] radeon: dpm initialized
>>>>>> [Sun Oct  1 15:59:04 2023] [drm] GART: num cpu pages 262144, num gpu
>>>>>> pages 262144
>>>>>> [Sun Oct  1 15:59:04 2023] [drm] enabling PCIE gen 2 link speeds,
>>>>>> disable with radeon.pcie_gen2=0
>>>>>> [Sun Oct  1 15:59:04 2023] [drm] PCIE GART of 1024M enabled (table at
>>>>>> 0x000000000014C000).
>>>>>> [Sun Oct  1 15:59:04 2023] radeon 0000:03:00.0: WB enabled
>>>>>> [Sun Oct  1 15:59:04 2023] radeon 0000:03:00.0: fence driver on ring 0
>>>>>> use gpu addr 0x0000000040000c00
>>>>>> [Sun Oct  1 15:59:04 2023] radeon 0000:03:00.0: fence driver on ring 3
>>>>>> use gpu addr 0x0000000040000c0c
>>>>>> [Sun Oct  1 15:59:04 2023] radeon 0000:03:00.0: fence driver on ring 5
>>>>>> use gpu addr 0x000000000005c418
>>>>>> [Sun Oct  1 15:59:04 2023] radeon 0000:03:00.0: radeon: MSI limited to 32-bit
>>>>>> [Sun Oct  1 15:59:04 2023] radeon 0000:03:00.0: radeon: using MSI.
>>>>>> [Sun Oct  1 15:59:04 2023] [drm] radeon: irq initialized.
>>>>>>
>>>>>
>>>>> Please also open an issue on freedesktop tracker [1].
>>>>>
>>>>> Thanks.
>>>>>
>>>>> [1]: https://gitlab.freedesktop.org/drm/amd/-/issues
>>>>
>>>> Issue opened: https://gitlab.freedesktop.org/drm/amd/-/issues/2894
>>>>
>>>> Regards,
>>>> Justin
>>>
>>> +Kees since I've worked with him on several of these flexible array issues.
>>>
>>> I just happened to look at kernel logs today for my ath1*k driver maintenance and see the subject issue is present on my device, running 6.9.0-rc1. The freedesktop issue tracker says the issue is closed, but any fix has not landed in the upstream kernel. Is there a -next patch somewhere?
>>>
>>> [   12.105270] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/radeon/radeon_atombios.c:2718:34
>>> [   12.105272] index 48 is out of range for type 'UCHAR [1]'
>>> [
>>>
>>> If there isn't really an upstream fix, I can probably supply one.
>>
>> I would expect this to have fixed it:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/radeon/pptable.h?id=c63079c61177ba1b17fa05c6875699a36924fe39
>>
>> If not, there must be something else happening?
> 
> This patch should silence it I think:
> https://patchwork.freedesktop.org/patch/588305/

I can confirm that my issues are resolved with that patch
Tested-by: Jeff Johnson <quic_jjohnson@quicinc.com>


