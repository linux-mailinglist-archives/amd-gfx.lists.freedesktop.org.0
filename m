Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D319DEC0
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 09:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED463898CE;
	Tue, 27 Aug 2019 07:29:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Tue, 27 Aug 2019 07:01:07 UTC
Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828B289862
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 07:01:07 +0000 (UTC)
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-01.nifty.com
 with ESMTP id x7R6jVBe030014
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 15:45:31 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x7R6iVgg003740;
 Tue, 27 Aug 2019 15:44:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x7R6iVgg003740
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=8F=AB=D3nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd: remove meaningless descending into amd/amdkfd/
Date: Tue, 27 Aug 2019 15:44:25 +0900
Message-Id: <20190827064425.19627-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566888272;
 bh=vtbPJHn0Vac34GPikbOgs/qob9Pq0CHTDp4qvL1XFlo=;
 h=From:To:Cc:Subject:Date:From;
 b=odUrtGTgUKVvn/e47CAlTb7EfjZQ+pO+YtzeQ21jiuv7rQKSg4p5msQlk1IMNcPgU
 X7Z3YVtWNIAgTRZr3gGI+9Ye1UY0kd7yywz3nqNA9IOfNTzW9WggETCWdpHWK0KZiF
 N1utLwn2WDulFNNXxY8rppRAxm1zqNEpa04XTSo493hguwrHStzdldgd8V7O/SrJnM
 OsiqiCa/EtBRU4kDTbtLjmQ8BhX0nbKaLOVJ2LAwoArMxs915oGGg7nfjCV0ebUwYk
 71GQLQPbhyT0MOCfVzczq5qwcFeTsMsnbqRUArVyEAvHYgLaTOGjVcYEK679MmDL6h
 OUPGx+N4rR6HQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2UgY29tbWl0IDA0ZDVlMjc2NTgwMiAoImRybS9hbWRncHU6IE1lcmdlIGFtZGtmZCBpbnRv
IGFtZGdwdSIpLApkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9NYWtlZmlsZSBkb2VzIG5vdCBj
b250YWluIGFueSBzeW50YXggdGhhdAppcyB1bmRlcnN0b29kIGJ5IHRoZSBidWlsZCBzeXN0ZW0u
CgpTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25l
eHQuY29tPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgfCAxIC0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxl
IGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlCmluZGV4IDlmMGQyZWUzNTc5NC4uM2Y5MTk1Yjdh
ZDEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKKysrIGIvZHJpdmVycy9n
cHUvZHJtL01ha2VmaWxlCkBAIC02Miw3ICs2Miw2IEBAIG9iai0kKENPTkZJR19EUk1fVFRNKQkr
PSB0dG0vCiBvYmotJChDT05GSUdfRFJNX1NDSEVEKQkrPSBzY2hlZHVsZXIvCiBvYmotJChDT05G
SUdfRFJNX1RERlgpCSs9IHRkZngvCiBvYmotJChDT05GSUdfRFJNX1IxMjgpCSs9IHIxMjgvCi1v
YmotJChDT05GSUdfSFNBX0FNRCkgKz0gYW1kL2FtZGtmZC8KIG9iai0kKENPTkZJR19EUk1fUkFE
RU9OKSs9IHJhZGVvbi8KIG9iai0kKENPTkZJR19EUk1fQU1ER1BVKSs9IGFtZC9hbWRncHUvCiBv
YmotJChDT05GSUdfRFJNX01HQSkJKz0gbWdhLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
