Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJjRAC9U3mlIqQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Apr 2026 16:50:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB473FB7CA
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Apr 2026 16:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A50B10E31E;
	Tue, 14 Apr 2026 14:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="W75qsxSE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7705D10E31E
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Apr 2026 14:50:19 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fw6dM6Dd5z9tLf;
 Tue, 14 Apr 2026 16:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1776178215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzso2jAfCRSfDhtXxNbyOXg9dD6yAxKr7TDUE5t33bY=;
 b=W75qsxSEhTUH06wmkI/mPbWLJhHUVBXRHeFZZocpefPgynOSwy1JW77UtGjsjDm8LOOabJ
 sx26EB/o4QrAlvT6sH/8ksQLJIfYcH9pdn7JgbCJkrtvS3Qq0LLxi+nMMCUAuGc1NaY8fz
 WiKj6EhdoSxc5JvWqSkpd/vCvUrZ67bYIEP+bvyD7li/ccQgn1SFKpdyfGT2vG4OsghLjQ
 r97MH8JhoBhGG3GJq0m8HypdEJqbBlUsq71xn5V8ZEdfS8ppDNwrDk0Bqp3RridhJ0dGgT
 Sc+K5HeATfsUWAbxX/yHaa9CG/2hPUs/fLeRhBHEU0DRMgqGzghjBeXF+J4XqQ==
Message-ID: <1cd26979-9b60-48cb-a0fa-308769245e38@mailbox.org>
Date: Tue, 14 Apr 2026 16:50:07 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu/userq: gnome shell uses max priority
To: "Khatri, Sunil" <sukhatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>,
 "Mohan Marimuthu, Yogesh" <yogesh.mohanmarimuthu@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20260413084943.819126-1-sunil.khatri@amd.com>
 <5976d500-d768-4a63-8fbe-4e68e20fc0e6@amd.com>
 <4e862955-3437-40f4-bf04-2bdab7d84909@amd.com>
 <3e220f91-a89e-42fa-9186-c9658d41839b@mailbox.org>
 <9ad4a8a9-7888-4634-aa50-15d22e98dc1d@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <9ad4a8a9-7888-4634-aa50-15d22e98dc1d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: p7q1a7xmc4b4xdx4pso9s5wpfdt3955h
X-MBO-RS-ID: 9f14a11de7428112fd2
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sukhatri@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,m:alexander.deucher@amd.com,m:yogesh.mohanmarimuthu@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 4FB473FB7CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 15:51, Khatri, Sunil wrote:
> On 14-04-2026 07:12 pm, Michel Dänzer wrote:
>> On 4/13/26 11:24, Khatri, Sunil wrote:
>>> On 13-04-2026 02:32 pm, Christian König wrote:
>>>> On 4/13/26 10:49, Sunil Khatri wrote:
>>>>> In function amdgpu_userq_priority_permit allow till
>>>>> maximum priority i.e 3 which is seen for gnome shell.
>>>>>
>>>>> This is needed to fix the issue of unable to create queue
>>>>> for gnome shell.
>>>>>
>>>>> logs:
>>>>> [drm] *ERROR* comm: gnome-shell pid: 2802 client-id:10 client: Unset ... SK: Priority 3
>>>> Clear NAK, as far as I can see the existing code is correct.
>>>>
>>>> AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH is only allowed when you have CAP_SYS_NICE, e.g. you are root.
>>>>
>>>> That is also documented in the UAPI. Question is why is gnome shell trying to use that?
>>> I see, let me add Yogesh for his inputs, @yogesh, why gnome shell is asking for priority AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH. Based on the code seems mesa is getting a flag set flags & PIPE_CONTEXT_HIGH_PRIORITY -> this sets AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH for graphics queue.
>> For some background, mutter uses EGL_CONTEXT_PRIORITY_HIGH_IMG when EGL_IMG_context_priority is supported, to try and prevent its GPU work from getting starved by clients.
>>
>> This works (or at least doesn't fail similarly) with kernel queues, presumably via DRM master status. I'd argue that should suffice with user queues as well.
>>
> Below is the check that we have for userqueues during queue creation, and for gnome it did not hit any of the condition and eventually return with -EACCES that is wrong. It has to be maste or CAP_SYS_NICE capable.
> if(priority<AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH)
>                 return0;
>         if(capable(CAP_SYS_NICE))
>                 return0;
>         if(drm_is_current_master(filp))
>                 return0;
>         return-EACCES;

Indeed, looks like at least in some cases mutter creates the EGL context before it has DRM master status. I'll look into fixing this in mutter.

With kernel queues, radeonsi silently falls back to a normal-priority context in this case, but then still claims it's high priority. I filed https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15282 about this.

Meanwhile, user queues should probably also fail without logging an error in this case.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
