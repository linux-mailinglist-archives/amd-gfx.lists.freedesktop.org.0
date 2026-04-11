Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAoLJ4zA2mk26AgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Apr 2026 23:43:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43E3E1C7F
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Apr 2026 23:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AF010E23E;
	Sat, 11 Apr 2026 21:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="kTjBpvwH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969B10E23E
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Apr 2026 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1775943815;
 bh=vmpFuUIG85JrzAzHHnfcjONHPOLAxmZrrDlLw5twBxM=;
 b=kTjBpvwHk4ntDYPZ9UlyjrY7qwKh2DpX2f3rbRBMguWHlO0zUZzXABvXVCC63xC7SEVtLVy+D
 AhEfmticCcENGofQIRxppIGIG1AWCDuffoJKZja1mzBU89gKs0uNMlRB9RJnv+8l4ugwBAb5soC
 g90U5NM74ptF01nlSKALLHuBObvN23+0VwV811KEJ4rnKKhVOX4PA+nGTWKAmWWT7CHdZIbqW8X
 9UmgsH8oqTTjhiXtRlepY0l/woRTsDAZ1IoEixawdOsFvpBP4KcgtGgvdlmZsJws5HKC5Uyn70n
 XAiOTqm9pDkko+s0vNit06THzqT67FX41gP8eZmKgOzQ==
X-Forward-Email-ID: 69dac0849feda6061ba31b18
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.7.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sat, 11 Apr 2026 17:43:30 -0400
Message-Id: <DHQNJFNTJ4QC.1A3ZZZLF39N0Z@ubuntu.com>
Cc: <amd-gfx@lists.freedesktop.org>, "Dan Carpenter" <error27@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clear cached EDID pointer after
 drm_edid_free()
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Alex Deucher"
 <alexander.deucher@amd.com>
X-Mailer: aerc 0.20.0
References: <20260411160539.2305517-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260411160539.2305517-1-srinivasan.shanmugam@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,ubuntu.com:dkim,ubuntu.com:email,ubuntu.com:mid]
X-Rspamd-Queue-Id: 2B43E3E1C7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat Apr 11, 2026 at 12:05 PM EDT, Srinivasan Shanmugam wrote:
> The driver stores EDID in amdgpu_connector->edid and uses it as a cache.
>
> amdgpu_connector_get_edid() checks this pointer. If it is not NULL, it
> assumes EDID is already present and does not read it again.
>
> In some detect paths, the driver frees the EDID using drm_edid_free(),
> but does not set the pointer to NULL. Because of this, the pointer still
> looks valid even though the memory is already freed.
>
> Later, when amdgpu_connector_get_edid() is called, it returns early and
> does not read a new EDID. This can lead to using a freed pointer.
>
> Fix this by setting amdgpu_connector->edid =3D NULL after drm_edid_free()=
.
>
> This makes sure the driver reads a fresh EDID and does not use invalid
> memory.
>
> Fixes: 289479173fb5 ("drm/amdgpu/amdgpu_connectors: remove amdgpu_connect=
or_free_edid")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Cc: Joshua Peisach <jpeisach@ubuntu.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---

Thank you so much!

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
