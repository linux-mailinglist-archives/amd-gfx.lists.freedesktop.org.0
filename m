Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ob7C2zNCWo9qQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 17 May 2026 16:15:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA65618C1
	for <lists+amd-gfx@lfdr.de>; Sun, 17 May 2026 16:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3938910E265;
	Sun, 17 May 2026 14:15:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Sun, 17 May 2026 14:15:04 UTC
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net
 [83.223.95.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E019B10E265;
 Sun, 17 May 2026 14:15:04 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout1.hostsharing.net (Postfix) with ESMTPS id 7177D35F;
 Sun, 17 May 2026 16:05:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 5462D60163BA; Sun, 17 May 2026 16:05:06 +0200 (CEST)
Date: Sun, 17 May 2026 16:05:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Gilles Risch <gilles.risch@gmail.com>
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/radeon: fix internal display on iMac11, 1
 (RV770/DCE3.1)
Message-ID: <agnLEk44qr-bL9K1@wunner.de>
References: <20260510185426.4264-1-gilles.risch@gmail.com>
 <20260516092420.3579-2-gilles.risch@gmail.com>
 <agiy9II5jkHEgPAq@wunner.de>
 <d5262f65-22b5-4ff3-b905-12bb2a4b587d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5262f65-22b5-4ff3-b905-12bb2a4b587d@gmail.com>
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
X-Rspamd-Queue-Id: B7AA65618C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,wunner.de:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 03:53:51PM +0200, Gilles Risch wrote:
> The test robot mentions that it cannot find ASIC_IS_DCE31(); this is because
> both patches build on one another. Should I submit both patches as a series?

Yes, either that or wait for the first patch to be applied and show up in
the drm-next repo.  Then 0-day should not complain.

Usually people are annoyed if patches are resubmitted in short cadence,
so the polite thing to do is wait for 1 or 2 weeks before respinning
so that people get a chance to provide further comments.

Thanks,

Lukas
