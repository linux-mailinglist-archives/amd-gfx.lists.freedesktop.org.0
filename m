Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AHqbMd7tPGoyuggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 10:59:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2347B6C4043
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 10:59:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=v6PB8gUB;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEA310F1C4;
	Thu, 25 Jun 2026 08:59:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA8410F1C4;
 Thu, 25 Jun 2026 08:59:05 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gmCQs2h9Hz9tfx;
 Thu, 25 Jun 2026 10:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1782377941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqIEwzv1RmZSABsvckz2P9dhAjK2UikqkQENvnsyIuw=;
 b=v6PB8gUBhjvoaxMgTEkCKc9WkDBq3OA9MQ9QoL8q/TIRe290WWlx8j4r1hlt7MCvrFXhjN
 buEcaVDL0dTZAVkqwIbtViY8AJFcqq2cw719wHbvfdIAlmMJMHIiEA83kwpp31dLvaKXH+
 eTcUBeYoFugvRbicDxQun6aDYJ5u/ePYHovhwkkJ4wwFuCFMCwxTVyy6AhUcTzrwBpFBsR
 3aC6eLPZMfqQeSO4OMB/jpgg7KcYR6Qc+9YHoFpf2vQajGiIO5+KQKbFVqQXu48YE5cNrj
 75v3bdF4ty906899UUdloRZYhHn9al/6RzBvlxcIAEn8oxZsH7fsjHePcxV4fw==
Message-ID: <ac206a38-65cf-466a-ad12-36d3f2e3372a@mailbox.org>
Date: Thu, 25 Jun 2026 10:58:57 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/amd/display: Pin native scanout to VRAM on
 large-carveout APUs
To: Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>, Melissa Wen
 <mwen@igalia.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, natalie.vock@gmx.de
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
References: <20260616071037.26718-1-matthew.schwartz@linux.dev>
 <334d4642-a7ce-4d04-ab14-6b95653e6f86@amd.com>
 <09a37c38-3f99-40bf-9a87-f88298ce349a@amd.com>
 <9b96d6a5-7c3c-4bd5-8785-76c9642bc933@amd.com>
 <faa1c424-2282-4e70-9934-e29f437f8bbb@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <faa1c424-2282-4e70-9934-e29f437f8bbb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 61jgk4mtwaxym58hnqu4yeiu8ueddh3d
X-MBO-RS-ID: b0abf692e43af43f1a5
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,linux.dev,igalia.com,gmx.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2347B6C4043

On 6/24/26 19:55, Harry Wentland wrote:
> On 2026-06-24 11:52, Christian König wrote:
>> On 6/24/26 17:30, Harry Wentland wrote:
>>> On 2026-06-16 03:31, Christian König wrote:
>>>> On 6/16/26 09:10, Matthew Schwartz wrote:
>>>>> Native scanout buffers on APUs are pinned with the VRAM|GTT domain, so
>>>>> under VRAM carveout pressure a swapchain can end up split across VRAM and
>>>>> GTT. The scanout buffer's memory type then changes from one flip to the
>>>>> next, and amdgpu_dm_crtc_mem_type_changed() rejects an async page flip
>>>>> across the change. The result is repeated async page flip failures,
>>>>> observed as choppy updates under carveout pressure, until the buffers
>>>>> reconverge to a single domain.
>>>>
>>>> That's intentional behavior.
>>>>
>>>>> Pin native scanout buffers in VRAM only so the swapchain stays in one
>>>>> memory domain. Restrict this to APUs whose carveout is larger than
>>>
>>> Above you mention that under VRAM pressure a swapchain can end up split
>>> across VRAM and GTT. Wouldn't restricting the swapchain to VRAM now mean
>>> that in those cases you fail to allocate the swapchain entirely?
>>
>> Yes, exactly that.
>>
>> My educated guess is that the display server then falls back to using a copy instead of a flip and that helps saving memory somehow (e.g. less scanout buffers alocated concurrently).
>>
>> Would it somehow be possible to get DC to dynamically switch between VRAM and GTT?
> 
> DCN can't switch between mapped and unmapped memory. I'm not a memory
> management expert but wouldn't GTT be in GART (mapped) and VRAM in
> the (unmapped) FB aperture?
> 
> From DCHUB HW doc:
> "No change from mapped to unmapped or unmapped to mapped is 
> allowed for immediate f lip"
> 
> If so, we can't async flip between them.

A possible alternative solution then might be explicitly pinning the BO to either VRAM or GTT for an async commit, wherever the current scanout BO is located.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
