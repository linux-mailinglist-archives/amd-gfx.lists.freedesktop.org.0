Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD36FA0B
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 09:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639458982F;
	Mon, 22 Jul 2019 07:11:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1168 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jul 2019 22:59:22 UTC
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.149.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0F5890EE
 for <amd-gfx@lists.freedesktop.org>; Sun, 21 Jul 2019 22:59:22 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 83554471FD
 for <amd-gfx@lists.freedesktop.org>; Sun, 21 Jul 2019 17:59:21 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id pKnZh4MpJ2qH7pKnZh8ELF; Sun, 21 Jul 2019 17:59:21 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-189.pcs.intercable.net
 ([187.160.61.189]:45688 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hpKnY-000zdY-9q; Sun, 21 Jul 2019 17:59:20 -0500
Date: Sun, 21 Jul 2019 17:59:20 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Philip Cox <Philip.Cox@amd.com>, Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in switch
 statement
Message-ID: <20190721225920.GA18099@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.160.61.189
X-Source-L: No
X-Exim-ID: 1hpKnY-000zdY-9q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-189.pcs.intercable.net (embeddedor)
 [187.160.61.189]:45688
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 19
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:11:55 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50IGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGNvZGUg
ZnJvbSBmYWxsaW5nCnRocm91Z2ggdG8gY2FzZSBLRkRfTVFEX1RZUEVfQ09NUFVURS4KClRoaXMg
YnVnIHdhcyBmb3VuZCB0aGFua3MgdG8gdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaC4KCkZpeGVzOiAxNDMyOGFhNThjZTUgKCJkcm0vYW1ka2ZkOiBB
ZGQgbmF2aTEwIHN1cHBvcnQgdG8gYW1ka2ZkLiAodjMpIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRl
ZG9yLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJf
djEwLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYwppbmRleCA0ZjhhNmZm
YzU3NzUuLjFkOGIxM2FkNDZmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9tcWRfbWFuYWdlcl92MTAuYwpAQCAtNDMwLDYgKzQzMCw3IEBAIHN0cnVjdCBtcWRfbWFu
YWdlciAqbXFkX21hbmFnZXJfaW5pdF92MTAoZW51bSBLRkRfTVFEX1RZUEUgdHlwZSwKIAlzd2l0
Y2ggKHR5cGUpIHsKIAljYXNlIEtGRF9NUURfVFlQRV9DUDoKIAkJcHJfZGVidWcoIiVzQCVpXG4i
LCBfX2Z1bmNfXywgX19MSU5FX18pOworCQlicmVhazsKIAljYXNlIEtGRF9NUURfVFlQRV9DT01Q
VVRFOgogCQlwcl9kZWJ1ZygiJXNAJWlcbiIsIF9fZnVuY19fLCBfX0xJTkVfXyk7CiAJCW1xZC0+
YWxsb2NhdGVfbXFkID0gYWxsb2NhdGVfbXFkOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
