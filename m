Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C6240DC5
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 21:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755B86E120;
	Mon, 10 Aug 2020 19:11:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242FE6E18F;
 Mon, 10 Aug 2020 19:11:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B44422D6F;
 Mon, 10 Aug 2020 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086667;
 bh=kuKbBbIW1D6iNkwGTnt8x0BsK8vTtVUUYTADUevJW/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PbEq/S7wJgA3pMzkPaGNM1WeQhywUdBaAgOfvDBrv2Sf1Z6fUOtMTjJDrmYlOruoP
 m1WOyfVNgxKrGbdl8+alNNfKLKiAu3Zbk6BuRkNEsaEBJA1OXr89lTUflKyFsEa8yJ
 +XJp+8F7Z61qF5pnnpCYybjfeSeWqdo0NQrQiPBg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 28/60] drm/radeon: disable AGP by default
Date: Mon, 10 Aug 2020 15:09:56 -0400
Message-Id: <20200810191028.3793884-28-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191028.3793884-1-sashal@kernel.org>
References: <20200810191028.3793884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgYmE4MDZmOThmODY4Y2UxMDdhYTljNDUzZmVmNzUxZGU5OTgwZTRhZiBdCgpB
bHdheXMgdXNlIHRoZSBQQ0kgR0FSVCBpbnN0ZWFkLiBXZSBqdXN0IGhhdmUgdG8gbWFueSBjYXNl
cwp3aGVyZSBBR1Agc3RpbGwgY2F1c2VzIHByb2JsZW1zLiBUaGlzIG1lYW5zIGEgcGVyZm9ybWFu
Y2UKcmVncmVzc2lvbiBmb3Igc29tZSBHUFVzLCBidXQgYWxzbyBhIGJ1ZyBmaXggZm9yIHNvbWUg
b3RoZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyB8IDUgLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5k
ZXggMGNmMGIwMGEwNjIzZS4uNmYwZDE5NzEwOTliNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMKQEAgLTE3MSwxMiArMTcxLDcgQEAgaW50IHJhZGVvbl9ub193YjsKIGludCByYWRl
b25fbW9kZXNldCA9IC0xOwogaW50IHJhZGVvbl9keW5jbGtzID0gLTE7CiBpbnQgcmFkZW9uX3I0
eHhfYXRvbSA9IDA7Ci0jaWZkZWYgX19wb3dlcnBjX18KLS8qIERlZmF1bHQgdG8gUENJIG9uIFBv
d2VyUEMgKGZkbyAjOTUwMTcpICovCiBpbnQgcmFkZW9uX2FncG1vZGUgPSAtMTsKLSNlbHNlCi1p
bnQgcmFkZW9uX2FncG1vZGUgPSAwOwotI2VuZGlmCiBpbnQgcmFkZW9uX3ZyYW1fbGltaXQgPSAw
OwogaW50IHJhZGVvbl9nYXJ0X3NpemUgPSAtMTsgLyogYXV0byAqLwogaW50IHJhZGVvbl9iZW5j
aG1hcmtpbmcgPSAwOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngK
