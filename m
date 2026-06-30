Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9y0lKanTQ2q7jgoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 16:33:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA456E5782
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 16:33:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iMYjVUNt;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4855710E1F9;
	Tue, 30 Jun 2026 14:33:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13D510E122;
 Tue, 30 Jun 2026 14:33:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8257941678;
 Tue, 30 Jun 2026 14:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9591F000E9;
 Tue, 30 Jun 2026 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782829989;
 bh=9cuy7lk5rNB9ZhHqRD+Vl3cVGdgfWsb157w8wga2ThU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To;
 b=iMYjVUNtefm4X23CkoLXpK2X/IjrUyzA5uFcK1DYOIfNX60vOQr+djGJBjh9s0WZK
 xWcwGgToDKfvdSJVUtAuF/BsNpXbBHthrNNB/OqwEnBax4MSi64XhKWEjdNhB2HTOl
 mkEX0UIBYcYgS5tE8Q47pERpTu7GRh+JqvhZSLZMJyANNVGOUUd0lBMbwS8APfPKkB
 6USv1YIhzFXPS585M/4aa1YnQrYJC/BbLNzVQNmgR0pgUjwi138Yp7MDKQVAM7plfa
 7EFharRUUu/Km5UQu/mdtfE5LWYA36z6EvDeZ290yYM8YB5F7sbcYJ6spjw0/2njFw
 jzalZJhqGZ8dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 16:33:04 +0200
Message-Id: <DJMGHGBIJTOI.3FTGPA92WVGC6@kernel.org>
Subject: Re: [PATCH v10 0/5] drm/gpusvm: split MM and device state across
 gpusvm/range/pages
Cc: "Honglei Huang" <honghuan@amd.com>, <sima@ffwll.ch>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <aliceryhl@google.com>,
 <Alexander.Deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <Christian.Koenig@amd.com>, <Ray.Huang@amd.com>, <Lingshan.Zhu@amd.com>,
 <Junhua.Shen@amd.com>, <Yiru.Ma@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260630102127.392396-1-honghuan@amd.com>
 <akPSENdX3vz8PvdY@gsse-cloud1.jf.intel.com>
In-Reply-To: <akPSENdX3vz8PvdY@gsse-cloud1.jf.intel.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FA456E5782

On Tue Jun 30, 2026 at 4:26 PM CEST, Matthew Brost wrote:
> If we merge the patches in drm-xe-next and pick them up via a rebase in t=
he
> AMD trees, that works.

IIUC what your are proposing this will create duplicate commits, which shou=
ld be
avoided.

If the series is needed in multiple trees it is better to pick a common bas=
e and
share via a tag that can be merged in all relevant trees.
