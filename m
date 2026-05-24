Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBhECB6YEmo+1QYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 24 May 2026 08:18:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D175C1828
	for <lists+amd-gfx@lfdr.de>; Sun, 24 May 2026 08:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226210E062;
	Sun, 24 May 2026 06:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="Pcss/Abf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CA410E062
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 May 2026 06:18:00 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64NJmQV7227724; Sun, 24 May 2026 06:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=XuegOV
 y4pNZlaxyzTvZgCV5NLqnyGyYRazvgp1KhDHg=; b=Pcss/AbfxIxCm3uOpJk8ZK
 0kGBFWzWPgx3HexZHNL0DeG5O83CKXBL5saNpVRdkA0qw5mGVrN0XVDE61QYwKUo
 3ZtQ7wD6bcNRfC5+9g6KxGQvI0H5kncLfSoQvwa0pPwgFMcG/ImqNIyJ7pbJIOI1
 iDsYQntKKBX62PZ2Dl56I3836kgLGvWxUNbGTGZhc75jpwgAzTQVqTOcWm/OUROf
 I9xXAMB1457oVEsQSjWGw6R0vGg1NFbxGYmPaFE19zCZYzO1LZrzzEinU20MedNf
 gzS2S5UGEUh1Rf20rRGv4uZ6G5N57UpedNOVi6vmjn20MSKfzgmWb4D3L8Fw3XPA
 ==
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eb4nbtvqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 May 2026 06:17:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64O6950H005262;
 Sun, 24 May 2026 06:17:56 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ebrsg0fcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 May 2026 06:17:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 64O6HtSp36569762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 24 May 2026 06:17:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D7CD58058;
 Sun, 24 May 2026 06:17:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA9AF58057;
 Sun, 24 May 2026 06:17:50 +0000 (GMT)
Received: from [9.39.18.98] (unknown [9.39.18.98])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 24 May 2026 06:17:50 +0000 (GMT)
Message-ID: <2685af20-398f-4c02-a1c4-50456cbebd07@linux.ibm.com>
Date: Sun, 24 May 2026 11:47:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix num_pages calculation in
 amdgpu_ttm_map_buffer() for non-4K page sizes
To: "Kuehling, Felix" <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, christian.koenig@amd.com,
 Philip Yang <yangp@amd.com>
Cc: David.YatSin@amd.com, Kent.Russell@amd.com,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Vaidyanathan Srinivasan <svaidy@linux.ibm.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260522112838.1311531-1-donettom@linux.ibm.com>
 <324818a5-5169-4822-9364-033f7bed208a@amd.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <324818a5-5169-4822-9364-033f7bed208a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=VvYTxe2n c=1 sm=1 tr=0 ts=6a129815 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=Wsw0RTbig2Dux1eSHHYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ot3-e3DrSb9ZkKzuHz_mujor28iYd2Hm
X-Proofpoint-GUID: hw2D-UYkM4By4uEMcZw44ERnmlPQcAZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDA2MCBTYWx0ZWRfX9nBO2skluqcW
 IjjC4ks4To30oxbWAtlmrxzMuQRd10zXH0v/se8dAwhHjTTfMrYcbUy76NaoHbxFchoqLWORncL
 LaIA/L8XW9sGheIl5G2i7Mj1kl+mWhYFG1XIsYl7HC9dg52tTvXi7YKPRdF1vkLLW2XPCfSLpkX
 QJ3V8Eu6mk26uW5XUf2WPHzNsLmgdxCWX9j615VyZy4CWhgbtAFc/rRaBIAurXNKRJsAw9IovXd
 T2sYD6fpN/PHx0TmZQNBX5g8yr8VrTEFIgqIu49GfXEraXrVOV7uSkbMBMrZTYy6Q3VnVOWvDQr
 Rt/fEDT7fCwxMAyd7NHiMh3TSHEziE46T4lIopJ2O9AwzInPV7E7kXZu6nd5vSma4r1dJ9TidxX
 oFZZuxQOuqeQmgqc1li7EILIhFL1OCjBpQ7Var3kApafTcZhxx1l74aI0/4frwaVJFctbxAxKDV
 /ptWso3Ba0QeLrrt1bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240060
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:felix.kuehling@amd.com,m:alexander.deucher@amd.com,m:alexdeucher@gmail.com,m:christian.koenig@amd.com,m:yangp@amd.com,m:David.YatSin@amd.com,m:Kent.Russell@amd.com,m:ritesh.list@gmail.com,m:svaidy@linux.ibm.com,m:pierre-eric.pelloux-prayer@amd.com,m:simona@ffwll.ch,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,lists.freedesktop.org,gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[donettom@linux.ibm.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,linux.ibm.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[donettom@linux.ibm.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 34D175C1828
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/22/26 9:32 PM, Kuehling, Felix wrote:
>
> On 2026-05-22 07:28, Donet Tom wrote:
>> amdgpu_gart_map_vram_range() expects the number of pages (num_pages) in
>> 4K page units. However, in amdgpu_ttm_map_buffer(), the number of pages
>> is calculated based on the system page size. On systems with non-4K page
>> sizes, this results in an incorrect number of pages being passed to
>> amdgpu_gart_map_vram_range().
>>
>> Fix this by calculating the number of pages correctly before passing it
>> to amdgpu_gart_map_vram_range().
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 3d2e00efc741..2904a9400605 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -269,6 +269,7 @@ static int amdgpu_ttm_map_buffer(struct 
>> amdgpu_ttm_buffer_entity *entity,
>>           amdgpu_gart_map(adev, 0, num_pages, dma_addr, flags, 
>> cpu_addr);
>>       } else {
>>           u64 pa = mm_cur->start + adev->vm_manager.vram_base_offset;
>> +        num_pages *= AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>>             amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, 
>> cpu_addr);
>
> IMO it would be cleaner to change the definition of 
> amdgpu_gart_map_vram_range to use the same page size as amdgpu_gart_map.

Thank you, Felix, for the review.

I will make the suggested changes in amdgpu_gart_map_vram_range() and 
post a v2 patch.


-Donet

>
> Regards,
>   Felix
>
>
>>       }
