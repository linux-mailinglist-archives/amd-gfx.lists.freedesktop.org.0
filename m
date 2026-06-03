Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIL/CgXpH2oNsQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 10:42:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E6635CD1
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 10:42:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=damsy.net header.s=202408e header.b=2+J2MH+x;
	dkim=pass header.d=damsy.net header.s=202408r header.b=kOiuuDuR;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B3810FA55;
	Wed,  3 Jun 2026 08:42:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD31710FA52
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; r=y; 
 h=From:To:Subject:Date:Message-ID; t=1780476152; bh=o2KHTBlL1U0T8LdLp88AIIg
 yoMx5BvQYKOsDoLlv/BQ=; b=2+J2MH+xk06hPseIPuDCrZDhsM59XOUkhCOPSfNkaG3PUsB80c
 m+BwjijydMk70m9VO1uiXZxjxeiyEa71HQAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
 r=y; 
 h=From:To:Subject:Date:Message-ID; t=1780476152; bh=o2KHTBlL1U0T8LdLp88AIIg
 yoMx5BvQYKOsDoLlv/BQ=; b=kOiuuDuRBFXxKsDhb9jEixCIRrXh4qsuz0Gkzvg0QrJ4SQIpDG
 rL3GxJFPRXaEjvDZTVkctw4NPzJCUriAHHoL0RaUWJwfSRgCL98tEgSzvzrX0T0MyOaGufxfDWn
 GuW7Mm+T6XiHzu8MUFcs8MSKlmAoLSmS/Fa7AiRA5tE6kXrA6p63Cq977WiksHDc+X55TrdiyOE
 Od+/uX6CTlcpxnC47jfh/NBcS4r3sBbUrJh4GVK9ECWM0lY+obwYzTebOP7tszVk22ysA4CvBmV
 n6FZXm/Vt8cQs/bp4idug8Mp+EpmjOFSVJlomW7RnWlJ7yHhjzLNShHu9YGu4KDASRA==;
Message-ID: <8723b557-862d-4916-89d2-4af719855e84@damsy.net>
Date: Wed, 3 Jun 2026 10:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: initialize iter.start in
 amdgpu_devcoredump_format
To: Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20260529015528.524595-1-qiang.yu@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20260529015528.524595-1-qiang.yu@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408e,damsy.net:s=202408r];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:pierre-eric.pelloux-prayer@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[damsy.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 982E6635CD1



Le 29/05/2026 à 03:55, Qiang Yu a écrit :
> From: Qiang Yu <Qiang.Yu@amd.com>
> 
> This fixes read /sys/class/drm/cardN/device/devcoredump/data
> return empty content sometimes.
> 
> amdgpu_devcoredump_format() leaves struct drm_print_iterator's
> .start field uninitialized on the stack before passing it to
> drm_coredump_printer(). __drm_puts_coredump() compares the running
> .offset against .start to decide whether to skip or copy each
> chunk:
> 
> 	if (iterator->offset < iterator->start) {
> 		if (iterator->offset + len <= iterator->start) {
> 			iterator->offset += len;
> 			return;
> 		}
> 		...
> 	}
> 
> Fixes: 4f28b4930f8e ("drm/amdgpu: move devcoredump generation to a worker")
> Signed-off-by: Qiang Yu <Qiang.Yu@amd.com>

Reviewed-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 46043a1479e4..63d7ef78c025 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -219,6 +219,7 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>   	u32 ring_idx, off;
>   
>   	iter.data = buffer;
> +	iter.start = 0;
>   	iter.offset = 0;
>   	iter.remain = count;
>   
