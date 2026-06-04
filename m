Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CPxCMWEjIWpO/gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:04:01 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF463D7DE
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xry111.site header.s=default header.b=QiqWUw5t;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=xry111.site
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1552B113CFD;
	Thu,  4 Jun 2026 07:04:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE291125EF
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 03:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1780544812;
 bh=12HlY34QlVQh1oPArLYtr7ypk50voH4GrvSqd+mmPT4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QiqWUw5tOHQCIzfTDwmLKQQgCs/NnRGqdUGizlO4to2DcPh6jh5dycF1fLnFVCLol
 kQWkhe46bphkYyhszkgqNQvYpAVVBFOcCA72Ej5dgG2r4UAC+GnhHZ+fXJQ7CXA8RT
 JkUI65Lsb0xZfIYlRXaRKtj7GO5inPr/VZTAGvjM=
Received: from [127.0.0.1]
 (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com
 [IPv6:2607:8700:5500:e873::1001])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 48B0565982;
 Wed,  3 Jun 2026 23:46:51 -0400 (EDT)
Message-ID: <6fff98f69549a9069321a727f2333d3e4aa5e84f.camel@xry111.site>
Subject: Re: [PATCH v7.0.y v2 0/8] drm/amd: Backport FPU Guard Move from DML
 to DC
From: Xi Ruoyao <xry111@xry111.site>
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Date: Thu, 04 Jun 2026 11:46:49 +0800
In-Reply-To: <20260603210831.item005@kernel.org>
References: <20260603153920.249671-1-xry111@xry111.site>
 <20260603210831.item005@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jun 2026 07:03:56 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[xry111.site,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[xry111.site:s=default];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:sashal@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[xry111.site:+];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97AF463D7DE

On Wed, 2026-06-03 at 20:05 -0400, Sasha Levin wrote:
> > [PATCH v7.0.y v2 0/8] drm/amd: Backport FPU Guard Move from DML to
> > DC
> > Rebased onto 7.0.11.
>=20
> Thanks for the series. Unfortunately it doesn't apply to the current
> 7.0.y tree: patch 3/8 creates dcn42 resource files that don't exist in
> this tree, and patch 5/8 depends on dml21_wrapper_fpu.c, which is not
> created in 7.0.y either.

dml21_wrapper_fpu.c is created by 4/8 (upstream commit
4bb2f0721ed8a2a70f864b9358bd6cd4d92199b3) which moves out the logic
requiring FPU from dml21_wrapper.c to that new file, so the remaining
code can safely use DC_FPU_{START,END}.

The dcn42 files should be removed.  I'll recheck if the series contains
anything related to dcn42 and remove them in v3.

--=20
Xi Ruoyao <xry111@xry111.site>
