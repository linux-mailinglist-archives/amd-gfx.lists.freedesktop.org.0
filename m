Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y/T5ApDjVGokggAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1574B54C
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=a8vMJjwc;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96C10E5D1;
	Mon, 13 Jul 2026 13:09:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0BF10E5A7
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 08:28:31 +0000 (UTC)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4gzFtx3BlZz6Bn6;
 Mon, 13 Jul 2026 10:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1783931289;
 bh=7D4uDNKGqj1S37fKW7uPr1KmefaB5RpbZIoAxZ8dCIQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=a8vMJjwcKHHAsY/SdSKkLMsP0YsdtUYvGko+D3zOvKzEKbvYP7BHOILBF0rqRL+7F
 CeNpV3ZNVnTB0naB1J/K5EOR0eYZ4kqedjQhiBM5RYVEvfiyy3J8Nrnav/qwJdu/0Z
 FArpZgGMHHl+9N2SDvrTH3hR0JYeEMFOpd6wEx6yBJw/euL9xYvc5YmWvF/A/QnCVb
 0N30ipPKuIPDkJsdX0ng2jZHyJILMB9MKi8Tmn/mzjkcMH9/mqKsx7jYj8ZZ+r6bS8
 j6avEKyBmdUlSr6o9QlXiy3HdCNsFSfEqzVyymPVFl2cOm/m/daI7YrWRt5JcdY3xU
 wwSiLe/IgiXfw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4gzFtx2Tqfz4xlQ;
 Mon, 13 Jul 2026 10:28:09 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gzFtw64NWz8sZw;
 Mon, 13 Jul 2026 10:28:08 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 45C4C60322;
 Mon, 13 Jul 2026 10:28:08 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c2050464-7f95-4b6a-95db-698c637136df@leemhuis.info>
Date: Mon, 13 Jul 2026 10:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm/ci: Don't disable MCLK DPM on Bonaire 0x6658
 (R7 260X)
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Natalie Vock <natalie.vock@gmx.de>
References: <20260713061443.32561-1-timur.kristof@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260713061443.32561-1-timur.kristof@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178393128856.3557734.5890177465793536379@mxe9fb.netcup.net>
X-NC-CID: in0h5Rm4r7N/fFxrywM7I8XdZBQihv+23QdIwsCcwvict7eHmGY=
X-Mailman-Approved-At: Mon, 13 Jul 2026 13:09:32 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:tursulin@ursulin.net,m:natalie.vock@gmx.de,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,ursulin.net,gmx.de];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,leemhuis.info:from_mime,leemhuis.info:dkim,leemhuis.info:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CB1574B54C

On 7/13/26 08:14, Timur Kristóf wrote:
> The old radeon driver has a documented workaround in ci_dpm.c
> which claims that Bonaire 0x6658 with old memory controller
> firmware is unstable with MCLK DPM, so as a precaution I
> disabled MCLK DPM on this ASIC in amdgpu.
> 
> Note that the old MC firmware is not actually used with
> amdgpu, but in theory it's possible that the VBIOS sets
> up the ASIC with an old MC firmware that is already running
> when amdgpu initializes (in which case amdgpu doesn't
> load its own firmware).
> 
> What I expected to happen is that the GPU would simply use
> its maximum memory clock, and indeed this is what seemed
> to happen according to amdgpu_pm_info which reads the
> current MCLK value from the SMU.
> However, some users reported a huge perf regression

Were those private reports? If not, please consider linking them in the
trailers using Link: or Closes: tags, as explained in the patch
submission guidelines (and mandated by Linus, see the quotes and links
in
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-the-importance-of-pointing-to-bug-reports-using-link-closes-tags
for details).

Ciao, Thorsten

> and upon a closer look it seems that the GPU seems to
> not actually use the highest MCLK value, despite the SMU
> reporting that it does.
> 
> Let's not disable MCLK DPM on Bonaire 0x6658 (R7 260X).
> 
> Keep MCLK DPM disabled on R9 M380 in the 2015 iMac
> because that still hangs if we enable it.
> 
> Fixes: 9851f29cb06c ("drm/amd/pm/ci: Disable MCLK DPM on problematic CI ASICs")
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
> index 1d6e30269d56..4d553be56396 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
> @@ -106,11 +106,8 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
>  		hwmgr->od_enabled = false;
>  		switch (hwmgr->chip_id) {
>  		case CHIP_BONAIRE:
> -			/* R9 M380 in iMac 2015: SMU hangs when enabling MCLK DPM
> -			 * R7 260X cards with old MC ucode: MCLK DPM is unstable
> -			 */
> -			if (adev->pdev->subsystem_vendor == 0x106B ||
> -			    adev->pdev->device == 0x6658) {
> +			/* R9 M380 in iMac 2015: SMU hangs when enabling MCLK DPM */
> +			if (adev->pdev->subsystem_vendor == 0x106B) {
>  				dev_info(adev->dev, "disabling MCLK DPM on quirky ASIC");
>  				adev->pm.pp_feature &= ~PP_MCLK_DPM_MASK;
>  				hwmgr->feature_mask &= ~PP_MCLK_DPM_MASK;

