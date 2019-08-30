Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35469A3E6F
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 21:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D496E3C4;
	Fri, 30 Aug 2019 19:32:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8666E6E377;
 Fri, 30 Aug 2019 16:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DEC3AD4B;
 Fri, 30 Aug 2019 16:16:44 +0000 (UTC)
Date: Fri, 30 Aug 2019 18:16:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/edid: no CEA extension is not an error
Message-ID: <20190830181652.5b58727b@endymion>
In-Reply-To: <20190830181423.4f31a28f@endymion>
References: <20190830181423.4f31a28f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 19:32:17 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Christian =?UTF-8?B?S8O2?=
 =?UTF-8?B?bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgaXMgZmluZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIG5v
dCBpbXBsZW1lbnQKQ0VBIGV4dGVuc2lvbiBpbiB0aGVpciBFRElELiBEbyBub3QgcmV0dXJuIGFu
IGVycm9yIGluIHRoYXQgY2FzZSwKaW5zdGVhZCByZXR1cm4gMCBhcyBpZiB0aGVyZSB3YXMgYSBD
RUEgZXh0ZW5zaW9uIHdpdGggbm8gYXVkaW8gb3IKc3BlYWtlciBibG9jay4KClRoaXMgZml4ZXMg
aGFsZiBvZiBidWcgZmRvIzEwNzgyNToKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTA3ODI1CgpTaWduZWQtb2ZmLWJ5OiBKZWFuIERlbHZhcmUgPGpkZWx2YXJl
QHN1c2UuZGU+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
Q2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgICAgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0tIGxpbnV4LTUuMi5vcmlnL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCTIwMTktMDgtMzAgMTc6NTc6MzguMTk5OTkwOTk1ICswMjAwCisrKyBs
aW51eC01LjIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMJMjAxOS0wOC0zMCAxODowNDozNi44
NDAzMzM4MzQgKzAyMDAKQEAgLTQxMzAsNyArNDEzMCw3IEBAIGludCBkcm1fZWRpZF90b19zYWQo
c3RydWN0IGVkaWQgKmVkaWQsIHMKIAljZWEgPSBkcm1fZmluZF9jZWFfZXh0ZW5zaW9uKGVkaWQp
OwogCWlmICghY2VhKSB7CiAJCURSTV9ERUJVR19LTVMoIlNBRDogbm8gQ0VBIEV4dGVuc2lvbiBm
b3VuZFxuIik7Ci0JCXJldHVybiAtRU5PRU5UOworCQlyZXR1cm4gMDsKIAl9CiAKIAlpZiAoY2Vh
X3JldmlzaW9uKGNlYSkgPCAzKSB7CkBAIC00MTkxLDcgKzQxOTEsNyBAQCBpbnQgZHJtX2VkaWRf
dG9fc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjCiAJY2VhID0gZHJtX2ZpbmRfY2VhX2V4dGVuc2lv
bihlZGlkKTsKIAlpZiAoIWNlYSkgewogCQlEUk1fREVCVUdfS01TKCJTQUQ6IG5vIENFQSBFeHRl
bnNpb24gZm91bmRcbiIpOwotCQlyZXR1cm4gLUVOT0VOVDsKKwkJcmV0dXJuIDA7CiAJfQogCiAJ
aWYgKGNlYV9yZXZpc2lvbihjZWEpIDwgMykgewoKLS0gCkplYW4gRGVsdmFyZQpTVVNFIEwzIFN1
cHBvcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
