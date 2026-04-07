Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBWYAFDL1GmtxgcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Apr 2026 11:16:00 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798AF3ABCEF
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Apr 2026 11:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CE310E33A;
	Tue,  7 Apr 2026 09:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HeYbwdRb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E4A10E33A
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Apr 2026 09:15:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fqgXn4JZyz9t4X;
 Tue,  7 Apr 2026 11:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1775553353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MF86R9VusosSiFyRYaYXIpa4uM/DKY4iQTG+wXexlE=;
 b=HeYbwdRbMCg/yvq6a7E8/jRD2rnnVtoOlOZzfVP7l7WzISmnQlo2dmXuESiXhqdExKNzf4
 rU9/qaChhmoBYFW1vccrQ0pjKXd+m+qh/gyXW5/+Bjfi/zkGjmG0NfeNtSxMI31HIY7qAu
 cArY78ocxSvKSka6CH7vGSrU6mURY+sI0Jz/nYIOAkM8SOm8YBB8N2l5KTCpIQPGRwZJa9
 eYb5Rq2iFEUmaj9sij9SuqrmpusK/c35Jipl7gBOifBE9o6tP3GVDMD0CjTxpRzFYi87px
 SU0Q420L5thMf5PkfhA9a4V3ry9shVhYI5J0uIS5/MrkJm35FhTbYj1EwZgOEA==
Message-ID: <4fce72e9-225d-4628-8a89-0d022a51d766@mailbox.org>
Date: Tue, 7 Apr 2026 11:15:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 17/22] drm/amd/display: Restore "Move
 setup_stream_attribute"
To: Roman.Li@amd.com, amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu <Ray.Wu@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Yihan Zhu <yihan.zhu@amd.com>
References: <20260402183314.1388755-1-Roman.Li@amd.com>
 <20260402183314.1388755-18-Roman.Li@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260402183314.1388755-18-Roman.Li@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: riupm7woyejb5ecaqz61iz59sgaqm5am
X-MBO-RS-ID: 73271795a03d6a8e85e
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Roman.Li@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:aurabindo.pillai@amd.com,m:wayne.lin@amd.com,m:chiahsuan.chung@amd.com,m:jerry.zuo@amd.com,m:daniel.wheeler@amd.com,m:Ray.Wu@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:Chuanyu.Tseng@amd.com,m:Charlene.Liu@amd.com,m:yihan.zhu@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 798AF3ABCEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 20:33, Roman.Li@amd.com wrote:
> From: Charlene Liu <Charlene.Liu@amd.com>
> 
> This partially reverts commit 005452bcce65 ("Revert "drm/amd/display: Move setup_stream_attribute"").
> 
> [Why]
> The original revert was applied to avoid HDMI blank screen regression.
> The root cause has been identified and the setup_stream_attribute call
> can now be moved back to enable_stream where it belongs.

Hold your horses.

The patch in https://gitlab.freedesktop.org/drm/amd/-/work_items/4652#note_3392278 , which is this patch plus adding a link_hwss->setup_stream_attribute call in enable_link_hdmi, still causes the blank screen regression.


P.S. Please don't try applying this change again before it's been confirmed that it no longer causes the regression. I almost missed this patch in my flood of e-mails, and I shouldn't have to watch out for it anyway.

-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
