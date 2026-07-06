Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4L3HyipS2p6YAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 15:10:00 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F0711109
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 15:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mandelbit.com header.s=MBO0001 header.b=acYn9BoT;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C2310E97B;
	Mon,  6 Jul 2026 13:09:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jul 2026 12:50:52 UTC
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8577B89FA5
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2026 12:50:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4gv3qn4Zzxz9x7y;
 Mon,  6 Jul 2026 14:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
 s=MBO0001; t=1783341653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3udRbydwVE61lXU936pG6FZ28P5TZrDPN5TpKML3yw=;
 b=acYn9BoTPhyAqnZtzAh0t0CcMotsndj5f3fmsJGN69hGU54/ePBrkAz/1C0P6KursiexkK
 sprzfQXiTfvNMVtfusTE7A/FTfcjZ55eDGWS+/+sOgA3duG+RfoJIrN7RotBXXaGO/EX6L
 WkMm9e15l0BHZvToNRtnO3dHXwzzgSMxTY90Otbd5ZJW2sjN/BxyQ2EW5nneNmh2g02vel
 aT0SG8eiQ7PJgFNAOz+mS+sBUtnEN6UEPaAp+wDVecsLAAiAIFYUsEuqRvjMoDBIWwRdZA
 FW8V6qRUoRxl8RKBlJAL8GyJKz/wgMx9UsAJiv6w5YYq3ml/YMXWDiSGPehNJA==
Message-ID: <4e7f73d5-5407-4ed4-8b91-483b97ad70f0@mandelbit.com>
Date: Mon, 6 Jul 2026 14:40:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 23/24] drm/amd/display: fix compressed buffer config
 routine waiting time
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Roman Li <roman.li@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu <Ray.Wu@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 James Lin <PingLei.Lin@amd.com>, Chenyu Chen <Chen-Yu.Chen@amd.com>
References: <20260604145428.809959-1-aurabindo.pillai@amd.com>
 <20260604145428.809959-24-aurabindo.pillai@amd.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Organization: Mandelbit SRL
In-Reply-To: <20260604145428.809959-24-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Jul 2026 13:09:56 +0000
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mandelbit.com:s=MBO0001];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[mandelbit.com];
	FORGED_RECIPIENTS(0.00)[m:aurabindo.pillai@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:roman.li@amd.com,m:wayne.lin@amd.com,m:chiahsuan.chung@amd.com,m:jerry.zuo@amd.com,m:daniel.wheeler@amd.com,m:Ray.Wu@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:PingLei.Lin@amd.com,m:Chen-Yu.Chen@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antonio@mandelbit.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[antonio@mandelbit.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandelbit.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mandelbit.com:dkim,mandelbit.com:mid,mandelbit.com:from_mime,mandelbit.com:url,mandelbit.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 232F0711109

Hi all,

On 04/06/2026 16:52, Aurabindo Pillai wrote:
> From: Antonio Quartulli <antonio@mandelbit.com>
> 
> Replace the four open-coded REG_WAIT calls with calls to
> dcn31_wait_for_det_apply() so the compressed buffer (compbuf) sizing
> path waits long enough for the DET size update to take effect, and the
> wait timing stays consistent across the driver.
> 
> No functional change beyond the corrected timeout.
> 
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>

Sorry to bother, but I was just wondering if this patch/series got 
dropped or if it's simply in the pipe for more review/merge?

Am I right it should pop-up in https://gitlab.freedesktop.org/drm/kernel 
before going to Linus?

Thanks a lot!
Regards,

-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

