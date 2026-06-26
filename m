Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uqQ5GNHNPmr5LwkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 21:06:57 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0606CFDC4
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 21:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=cBoHEM+Y;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB91810E274;
	Fri, 26 Jun 2026 19:06:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D8910E274
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rOmIE0CF+Mz+pl53T+O7iOs66YOotTKS+U+8CKwg3lY=; b=cBoHEM+YJ7h4FdVCcCbvCmHa0C
 fAmVZHZ+u9dC1YLDdW4CdlVy0aCZR0bNkcrDZLYaRPIUO8Ozp2YFSHhGjiD3kSh8e15eB7qghj1Nh
 tiL82dVxl1mvcSd2oOZfpLB0Q1qZtx3h84IIvW1SKb5PCH/n5zLCKANVCr+MDW5+GmqVdIDxrzH1p
 YSwxbeApujKOKZM31//nyV8CIm0ptGfoNSLwBSHzeKTRl8m6gfHXmnvP5HF91li8ZBYz2CAmmoCFl
 GtpkkWvHrWSqcvjcBnSREY1ygk0BV1bdVjYmBss/zmIC761am6AgfSNKgy+5b142G1c0zjHI1zlm2
 FfeFiWOA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wdBsj-005dKB-1d; Fri, 26 Jun 2026 21:06:29 +0200
Message-ID: <f2817235-3f0f-4a95-ba21-e5c0913f7c07@igalia.com>
Date: Fri, 26 Jun 2026 20:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Remove unused amdgpu_device_ip_is_hw
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260626085558.97923-1-tvrtko.ursulin@igalia.com>
 <20260626085558.97923-2-tvrtko.ursulin@igalia.com>
 <4887714.vXUDI8C0e8@timur-max>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <4887714.vXUDI8C0e8@timur-max>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:kernel-dev@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,igalia.com:email,igalia.com:mid,igalia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD0606CFDC4


On 26/06/2026 17:59, Timur Kristóf wrote:
> On 2026. június 26., péntek 10:55:56 közép-európai nyári idő Tvrtko Ursulin
> wrote:
>> This function is unused so lets remove it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Timur Kristóf <timur.kristof@gmail.com>
> 
> Nice cleanup!
> 
> Reviewed-by: Timur Kristóf <timur.kristof@gmail.com>
> 
> Are there any more uses left of the amdgpu_ip_block_status.hw field?
> As far as I can see the field is set but never used, maybe we could remove it
> too. What did this field mean anyway?

It appears used during init/fini and suspend/resume, a little bit in 
reset. I am not quite sure what it means - could it be "hw initialized" 
or "hw ready"?

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c | 21 ---------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h |  2 --
>>   2 files changed, 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c index 6aa54156bbc9..62285e973c5c
>> 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
>> @@ -368,27 +368,6 @@ int amdgpu_device_ip_wait_for_idle(struct amdgpu_device
>> *adev, return 0;
>>   }
>>
>> -/**
>> - * amdgpu_device_ip_is_hw - is the hardware IP enabled
>> - *
>> - * @adev: amdgpu_device pointer
>> - * @block_type: Type of hardware IP (SMU, GFX, UVD, etc.)
>> - *
>> - * Check if the hardware IP is enable or not.
>> - * Returns true if it the IP is enable, false if not.
>> - */
>> -bool amdgpu_device_ip_is_hw(struct amdgpu_device *adev,
>> -			    enum amd_ip_block_type block_type)
>> -{
>> -	struct amdgpu_ip_block *ip_block;
>> -
>> -	ip_block = amdgpu_device_ip_get_ip_block(adev, block_type);
>> -	if (ip_block)
>> -		return ip_block->status.hw;
>> -
>> -	return false;
>> -}
>> -
>>   /**
>>    * amdgpu_device_ip_is_valid - is the hardware IP valid
>>    *
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h index 1d0df6d93957..11739fbdeaa6
>> 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
>> @@ -146,8 +146,6 @@ void amdgpu_device_ip_get_clockgating_state(struct
>> amdgpu_device *adev, u64 *flags);
>>   int amdgpu_device_ip_wait_for_idle(struct amdgpu_device *adev,
>>   				   enum amd_ip_block_type
> block_type);
>> -bool amdgpu_device_ip_is_hw(struct amdgpu_device *adev,
>> -			    enum amd_ip_block_type block_type);
>>   bool amdgpu_device_ip_is_valid(struct amdgpu_device *adev,
>>   			       enum amd_ip_block_type block_type);
> 
> 
> 
> 

