Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EImtGNR0oWkPtQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 11:41:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBA1B61A5
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 11:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6000510EAF5;
	Fri, 27 Feb 2026 10:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bmFMYRHI";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986010EAF5
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TaOoP3kKW9GOTnnPkcrNTTLpiwm0eTVavuqfZrEUgUY=; b=bmFMYRHIgghAF40st9c2ANGf8T
 Ez4ZcbpIrXu6AU8se8rcLAfjvQbLtPnWB3oREmfnsqptvRwcnlR163LW4hq+K/xbQqUg+j5yO1m6H
 //bIG68P7y3Hf1pFjs9LnfSIYi5uHQO9aAR+3oXFD0qPALK2TTRqzyckz8ibh6f5QersE4FUAiWW9
 Gmpw+ZNMnEjRIz8VdrZCl3iWLpLrHd0ws2ae48m3N7ORPCVbdVWg3EZDRr+A0YczwyGWCRqxt5F7n
 XXTUWymg9/8+t0EiXWv4qLTd1z6Z7FxP34nXX++nQG1BRN4fUPWMSCXLpnz07H9dqJXqEiWGm27ZW
 KZ2H9j4w==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vvvHV-006TVl-CL; Fri, 27 Feb 2026 11:41:13 +0100
Message-ID: <ae213ed7-ba5e-4e9b-81ac-95e20abd8b1d@igalia.com>
Date: Fri, 27 Feb 2026 10:41:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: update type for num_syncobj_handles in
 drm_amdgpu_userq_signal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Khatri, Sunil" <sukhatri@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20260226155146.3727191-1-sunil.khatri@amd.com>
 <e93f64b2-8157-4cc8-b4b9-16572a8cd022@igalia.com>
 <490f80ef-6614-4ba3-8183-fbca7698f8da@mailbox.org>
 <6e1ec357-6858-48ae-9447-e915fc946417@amd.com>
 <41773dd1-0929-4c5e-9c67-07262ee299b2@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <41773dd1-0929-4c5e-9c67-07262ee299b2@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:sukhatri@amd.com,m:michel.daenzer@mailbox.org,m:sunil.khatri@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DDCBA1B61A5
X-Rspamd-Action: no action


On 27/02/2026 10:32, Christian König wrote:
> On 2/27/26 10:22, Khatri, Sunil wrote:
>>
>> On 27-02-2026 02:43 pm, Michel Dänzer wrote:
>>> On 2/26/26 17:05, Tvrtko Ursulin wrote:
>>>> On 26/02/2026 15:51, Sunil Khatri wrote:
>>>>> update the type for num_syncobj_handles from __u64 to _u16 with
>>>>> required padding.
>>>>>
>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>> ---
>>>>>     include/uapi/drm/amdgpu_drm.h | 4 +++-
>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>>>>> index 33e8738ce91f..42b4c0f6746b 100644
>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>> @@ -479,7 +479,9 @@ struct drm_amdgpu_userq_signal {
>>>>>          * @num_syncobj_handles: A count that represents the number of syncobj handles in
>>>>>          * @syncobj_handles.
>>>>>          */
>>>>> -    __u64    num_syncobj_handles;
>>>>> +    __u16    num_syncobj_handles;
>>>> Could probably cause build warnings/errors for something which builds fine today. Hm on big endian it actually breaks completely.
>>> Yeah this is a clear UAPI break, no go.
>>
>> Yeah i am holding on this change for a cleaner solution. I acknowledge the UAPI breaking here.
> 
> This uAPI break was intentional. The functionality is used only as experimental feature behind module parameter and new FW anyway.
> 
> But we didn't wanted to break existing Mesa binaries for easier testing and so kept the ABI for x86 intact with the padding.

Ack, I wasn't aware, sorry for the noise!

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>
>> Regards
>>
>> Sunil khatri
>>
>>>
>>>
>>>>> +    __u16    pad0;
>>>>> +    __u32    pad1;
>>>>>         /**
>>>>>          * @bo_read_handles: The list of BO handles that the submitted user queue job
>>>>>          * is using for read only. This will update BO fences in the kernel.
>>>
> 

