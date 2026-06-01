Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN3yFSmFHmo9kgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 09:24:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1026F629A08
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 09:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7A410ECBA;
	Tue,  2 Jun 2026 07:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=freenet.de header.i=@freenet.de header.b="SfjTOkRV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Mon, 01 Jun 2026 20:11:20 UTC
Received: from mout.freenet.de (mout.freenet.de [194.97.204.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E49B10E923
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 20:11:20 +0000 (UTC)
Received: from [2001:748:400:2319::4] (helo=sub5.mail.fnrz.de)
 by mout5.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port
 25) (Exim 4.98.2 #2) id 1wU8td-00000009Oua-1fMC;
 Mon, 01 Jun 2026 22:06:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=tWlEUGoiBzfNymD0+Qu7d4Gs56CtanwKdg2uJyGIqyU=; b=SfjTOkRV7SKUdTX2RlUTzeIW/A
 +5A5vC0KZwgBOOdv0duYhxDUS7kI40gaT1/ac0O8/zo2yuV7p4fT6FiaORsodH2dKbjXLKS0nFLTR
 GHuyjQM+0w6us3evIbQx9Q95+jmonuExjFAsiEEeJgLmD8mCOia6al7tHX91Q098yFyUewLLKrDa1
 QElqMdj0i2Zpe88Y5xRFYvbhL5O7dWJYcUxFSvkAg9rOCyj6g7G2qfkXiQqKn2XMUtmU+iZIn8aGW
 wvczMZW41GhtuJM618Yewa+v5WJuKUsV4T0n/yarE2IYG+CAJUzdg8yGl8+qLOlChN+nNdeJC7wS3
 VXJDfBYQ==;
Received: from [2a02:8071:a85:f020:665b:3406:d61c:4fe7] (port=39392
 helo=[127.0.0.1])
 by sub5.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.96 #2) id 1wU8td-00B1cm-0q; Mon, 01 Jun 2026 22:06:01 +0200
Message-ID: <409fcda6-feeb-4fba-95bb-085dc4493e46@freenet.de>
Date: Mon, 1 Jun 2026 22:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on
 all SI
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20260525112204.12604-1-timur.kristof@gmail.com>
 <CADnq5_PJNnBeADEJStb9ypvZSxU7SdviJEDf9DW0H+YBf7PT8w@mail.gmail.com>
From: =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?=
 <viktor_jaegerskuepper@freenet.de>
In-Reply-To: <CADnq5_PJNnBeADEJStb9ypvZSxU7SdviJEDf9DW0H+YBf7PT8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 17803443610CD410493EF2O
X-Scan-TS: Mon, 01 Jun 2026 22:06:01 +0200
X-Mailman-Approved-At: Tue, 02 Jun 2026 07:24:17 +0000
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[freenet.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[freenet.de:s=mjaymdexmjqk];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:natalie.vock@gmx.de,m:mario.limonciello@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[viktor_jaegerskuepper@freenet.de,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[freenet.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[freenet.de:-];
	NEURAL_HAM(-0.00)[-0.491];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[viktor_jaegerskuepper@freenet.de,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmx.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,freedesktop.org:url,freenet.de:mid]
X-Rspamd-Queue-Id: 1026F629A08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 16:57, Alex Deucher wrote:
> Applied.  Thanks!
> 
> On Mon, May 25, 2026 at 7:39 AM Timur Kristóf <timur.kristof@gmail.com> wrote:
>>
>> It seems that Pitcairn has the same issues as Tahiti
>> with regards to the TLB size. This commit fixes a
>> VCE1 FW validation timeout on suspend/resume on Pitcairn.
>>
>> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> index 02f85802f579..cd0fd77578d1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> @@ -203,7 +203,7 @@ int amdgpu_gtt_mgr_alloc_entries(struct amdgpu_gtt_mgr *mgr,
>>         int r;
>>
>>         /* Align to TLB L2 cache entry size to work around "V bit HW bug" */
>> -       if (adev->asic_type == CHIP_TAHITI) {
>> +       if (adev->family == AMDGPU_FAMILY_SI) {
>>                 alignment = 32 * 1024 / AMDGPU_GPU_PAGE_SIZE;
>>                 num_pages = ALIGN(num_pages, alignment);
>>         }
>> --
>> 2.54.0
>>
> 


Hi Alex,

I can't find this patch in the amd-staging-drm-next branch or any other
recent branch in your Gitlab repo on freedesktop.org. I hope it didn't
get lost? I think this should land in kernel 7.1 before the release.

Thanks,
Viktor
