Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK9ZECndw2lwuQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2026 14:03:37 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7A32564F
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2026 14:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCFD10E8C9;
	Wed, 25 Mar 2026 13:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="W7b9Dzg8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AE310E67A;
 Tue, 24 Mar 2026 15:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1774365913; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FHAKaU6BZH80IYFqEa3eAOZmceU7Hw+oHbexTK3eflxpH++56aFzspdGD7Fc12ynCOXfZQVJd9bcZWjwCFjsDJdXd/qtZatHC1Rud+V5OMP1eY3nO8BK1jkBLSVt4romPtgiJT6VcoNkg3hN76JhnHASYpkhGEYe0kg182x0twQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1774365913;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MWYjgfX6VpVyfxxQYgJCWmWSXFOd4Jy+zVQGptpNyRU=; 
 b=cuBVRg8nYCe9MzDT4bLrQ7fGmsLUudcZXpvvDk38PwW+lH4miAfyy83W0sHiPNHhxgO6MQ+El0w0S3e1iv3+uAqkxGZkh0lz2yrPy8qgzrzBWE6jsNiWUKTyRTfmRyXx+wcA4jAnFLGmgXbVYXgVQo4iLMD91DRQUOLchrS28rI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774365913; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=MWYjgfX6VpVyfxxQYgJCWmWSXFOd4Jy+zVQGptpNyRU=;
 b=W7b9Dzg87cNtQZjUxQcIWP5d1fUlh74bGCuiDBpP7e1E7x+QckPPaaRL/YfpIHEY
 fr0OC1PYoNrmYBhJYsupkxZMdNtmuVq4nvkaiubS40pMBY1AIpRiXLCJinL7o4CivQT
 kYMBx9OBcg7SfRKOcdYRLXUEPo2cn2bjEgZMd/kk=
Received: by mx.zohomail.com with SMTPS id 1774365912399120.92841279798449;
 Tue, 24 Mar 2026 08:25:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
Date: Tue, 24 Mar 2026 16:25:05 +0100
Message-ID: <4265353.aeNJFYEL58@workhorse>
In-Reply-To: <eff61423-a854-44c1-8634-30e2bd61e005@mailbox.org>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <8676926.T7Z3S40VBb@workhorse>
 <eff61423-a854-44c1-8634-30e2bd61e005@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Wed, 25 Mar 2026 13:03:04 +0000
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com,oss.qualcomm.com,mailbox.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 8ED7A32564F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Monday, 23 March 2026 18:27:41 Central European Standard Time Michel D=
=C3=A4nzer wrote:
> On 3/23/26 17:55, Nicolas Frattaroli wrote:
> >
> > "Someone might not understand its purpose" is, in my eyes, not a valid =
reason to
> > not have this property, [...]
> Per my previous posts, that's not my concern.
>=20
>=20
>=20

Then what is your concern? That the link-bpc property does not
consider DSC and dithering? Two things which the max-bpc property
also does not consider?

Please clearly state where your problem with this property is (and
not with how your understanding of the Weston MR uses it) so that
I can make forward progress here. If all you want is a clearer
description of the property in the comment that accompanies it,
then I can do that, and I said I agree with this point. But you
seem to be arguing from a position of not wanting the property to
exist at all, which is not something I can address. Userspace needs
a way to close the feedback loop here, or it won't be able to make
the right content-specific trade-offs.

Kind regards,
Nicolas Frattaroli


