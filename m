Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ICcaMs4ZQmrK0AkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:07:58 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126D6D6BD6
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ispras.ru header.s=default header.b="Td/Em6wY";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=ispras.ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4669310E6F5;
	Mon, 29 Jun 2026 07:07:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 525 seconds by postgrey-1.36 at gabe;
 Sat, 27 Jun 2026 10:38:23 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0358310E499;
 Sat, 27 Jun 2026 10:38:23 +0000 (UTC)
Received: from localhost (unknown [10.10.165.10])
 by mail.ispras.ru (Postfix) with ESMTPSA id 60E1D40F9A49;
 Sat, 27 Jun 2026 10:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 60E1D40F9A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1782556174;
 bh=HefoXOaX7iDWeVdJoA+Z44Cqogqv/SbYCDDilQ/lrZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Td/Em6wYzVFSgEpJlmiCF/PlqhNZH96DvffaHrobgmo5aEnGrHjXeb/Lu7trF+LZE
 cejW6hLiRlcFB0/xqxg0WQ5O21pR+tNCxBcZUj4CDkyYwxB/QHfVwVG33reJ16I5M9
 Lp206/2msW9GRs8eaNr/Acgj6p2b/MhStzCLRR6E=
Date: Sat, 27 Jun 2026 13:29:34 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Evgenii Burenchev <evg28bur@yandex.ru>
Cc: stable@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lvc-project@linuxtesting.org,
 superm1@kernel.org, 
 dri-devel@lists.freedesktop.org, mario.limonciello@amd.com, airlied@gmail.com,
 simona@ffwll.ch, 
 ray.wu@amd.com, amd-gfx@lists.freedesktop.org, chen-yu.chen@amd.com, 
 aurabindo.pillai@amd.com, Alvin.Lee2@amd.com, kenneth.feng@amd.com,
 ekurzinger@gmail.com, 
 siqueira@igalia.com, HaoPing.Liu@amd.com, pierre-eric.pelloux-prayer@amd.com, 
 srinivasan.shanmugam@amd.com, sunpeng.li@amd.com, mripard@kernel.org,
 mwen@igalia.com, 
 Dillon.Varone@amd.com, chaitanya.kumar.borah@intel.com, ivan.lipski@amd.com, 
 Tony.Cheng@amd.com, dmitry.baryshkov@oss.qualcomm.com, chiahsuan.chung@amd.com,
 timur.kristof@gmail.com, harry.wentland@amd.com, linux-kernel@vger.kernel.org, 
 alex.hung@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com, 
 christian.koenig@amd.com
Subject: Re: [PATCH v3] drm/amd/display: Fix dangling pointers in state reset
 functions on allocation failure
Message-ID: <20260627131809-033f104c2b15b742e1ba441e-pchelkin@ispras>
References: <20260626191314.29933-1-evg28bur@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626191314.29933-1-evg28bur@yandex.ru>
X-Mailman-Approved-At: Mon, 29 Jun 2026 07:07:55 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[44];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ispras.ru,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ispras.ru:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[yandex.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_NEQ_ENVFROM(0.00)[pchelkin@ispras.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linuxtesting.org,kernel.org,lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,igalia.com,intel.com,oss.qualcomm.com,suse.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[ispras.ru:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ispras:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5126D6D6BD6

On Fri, 26. Jun 22:13, Evgenii Burenchev wrote:
> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
> Fixes: 473683a03495 ("drm/amd/display: Create a file dedicated for CRTC")
> Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_types and amdgpu_dm")
> Signed-off-by: Evgenii Burenchev <evg28bur@yandex.ru>

Having three different Fixes tags implies the big patch could be split up
into three separate patches which do one thing at a time.  They can be
combined in a series for ease of handling.

> @@ -8151,33 +8151,41 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
>  
>  void amdgpu_dm_connector_funcs_reset(struct drm_connector *connector)
>  {
> -	struct dm_connector_state *state =
> +	/* Remember the old state */
> +	struct dm_connector_state *old_state =
>  		to_dm_connector_state(connector->state);
>  
> +	struct dm_connector_state *state;

No empty lines inside local variable declaration block, please.

> +
> +	/* Allocate new state */

Well, all the comments added with the patch - IMO they duplicate what the
code is doing - that doesn't add any real value and just bloats the
codebase.

> +	state = kzalloc_obj(*state);
> +	if (WARN_ON(!state))
> +		return;

It's not common to WARN on memory allocation errors.  If this code is ever
fuzzed with fault-injections enabled, that'd be one of the first issues to
pop up.

I think if the system is in a state when it can't allocate a bunch of
GFP_KERNEL memory, there'd definitely be some noticeable activity in
dmesg.  Some (random) assertion triggered inside amdgpu won't help much -
that will only halt those machines booted with panic_on_warn=1.
