Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218A3556C
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 04:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207B894DE;
	Wed,  5 Jun 2019 02:50:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A013D894DE
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 02:50:19 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u19so3168167ior.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 19:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/OWPMFkfTKRZeUptQ3a/QsDsNtIYMHGwR7s2O8bHNA=;
 b=SHGDzozo3fJ377ZuGvNbXyJtNNgwUMn5G/PG7FrE6dqqbzxf648S7o6o+1lSzT7/b1
 YnEgKmzETW45D+72TxV0CSHzg2Zi615ZzVCHUjwVMwauCP/92mi+62430cCKXa6xork3
 DRfVof6KkJqh5/Fc6N74XLPPAatkViynm7PeEQSHC+BbYeZ0MQEjrFBcaIXEtuQQXf9G
 0TRT+oJGtaeQW+rz5/Ibv558eaLT0RD+G22uz/ZULKLg8Tsia3UUfoBV223oSnSSRmog
 34BHiGOWbvtbrzLQ1LGnrTtjxlqAGPwgvXoI/3DfZEwZt8N4YyY9/2ZpeUCy0B2WWrKU
 0cdg==
X-Gm-Message-State: APjAAAWqjRiqrFpHyEchHo1juwLRZqkj1oZ+BUVCMVwK55SilV155CTU
 WPtqoYsmEfAZoqmz9Wo3+p9OPii2
X-Google-Smtp-Source: APXvYqy2yZotJA4X8o5iFzWcbEeQFpgR/MqDoGd0K3WA7oQZyIbj/XVyjMcCqfq63NQ3fnxyziL63A==
X-Received: by 2002:a5d:9703:: with SMTP id h3mr7988676iol.152.1559703018774; 
 Tue, 04 Jun 2019 19:50:18 -0700 (PDT)
Received: from crimson.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id k10sm6299969ita.33.2019.06.04.19.50.17
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 19:50:17 -0700 (PDT)
From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: bump the DRM version for GDS ENOMEM fixes
Date: Tue,  4 Jun 2019 22:50:15 -0400
Message-Id: <20190605025015.15204-1-maraeo@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/OWPMFkfTKRZeUptQ3a/QsDsNtIYMHGwR7s2O8bHNA=;
 b=ujSdVr+xom/0kjNnQWs0JpfbUj8KAo8RJIlQRtHqSefBqyI2ffybQnqBJ4Ats2R+oe
 35TUVtGw0PKwLzfGZCQpB4WbVEpMi2WT0tW+IFJKmN/JksDXr2pC5k8kmgd+APstxfgH
 Z5AcKxlf+tHbh53VGmEpg5e9QcWCIguqxMp5h71sVEXoQsJZZCPy2wfbnHbR2l7PPaLG
 SbLrRKr9xXY1hXvqH9BOyTzd1ziZouNbLEAcHvNoNuzRraVVUBm5OlOQzPUz7qc2abUh
 saaGzHT6xHLHdzIlCL3q/oiSgHs8s1b7tW3QscvxtPYOOwwK3lx08krntXFQcFoRbeoN
 ynXQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKaW5kZXggMWYzOGQ2ZmMxZmUzLi5mOTQ2MmFkMmEzMTQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTY5LDIzICs2OSwyNCBAQAogICogLSAzLjIzLjAg
LSBBZGQgcXVlcnkgZm9yIFZSQU0gbG9zdCBjb3VudGVyCiAgKiAtIDMuMjQuMCAtIEFkZCBoaWdo
IHByaW9yaXR5IGNvbXB1dGUgc3VwcG9ydCBmb3IgZ2Z4OQogICogLSAzLjI1LjAgLSBBZGQgc3Vw
cG9ydCBmb3Igc2Vuc29yIHF1ZXJ5IGluZm8gKHN0YWJsZSBwc3RhdGUgc2Nsay9tY2xrKS4KICAq
IC0gMy4yNi4wIC0gR0ZYOTogUHJvY2VzcyBBTURHUFVfSUJfRkxBR19UQ19XQl9OT1RfSU5WQUxJ
REFURS4KICAqIC0gMy4yNy4wIC0gQWRkIG5ldyBjaHVuayB0byB0byBBTURHUFVfQ1MgdG8gZW5h
YmxlIEJPX0xJU1QgY3JlYXRpb24uCiAgKiAtIDMuMjguMCAtIEFkZCBBTURHUFVfQ0hVTktfSURf
U0NIRURVTEVEX0RFUEVOREVOQ0lFUwogICogLSAzLjI5LjAgLSBBZGQgQU1ER1BVX0lCX0ZMQUdf
UkVTRVRfR0RTX01BWF9XQVZFX0lECiAgKiAtIDMuMzAuMCAtIEFkZCBBTURHUFVfU0NIRURfT1Bf
Q09OVEVYVF9QUklPUklUWV9PVkVSUklERS4KICAqIC0gMy4zMS4wIC0gQWRkIHN1cHBvcnQgZm9y
IHBlci1mbGlwIHRpbGluZyBhdHRyaWJ1dGUgY2hhbmdlcyB3aXRoIERDCiAgKiAtIDMuMzIuMCAt
IEFkZCBzeW5jb2JqIHRpbWVsaW5lIHN1cHBvcnQgdG8gQU1ER1BVX0NTLgorICogLSAzLjMzLjAg
LSBGaXhlcyBmb3IgR0RTIEVOT01FTSBmYWlsdXJlcyBpbiBBTURHUFVfQ1MuCiAgKi8KICNkZWZp
bmUgS01TX0RSSVZFUl9NQUpPUgkzCi0jZGVmaW5lIEtNU19EUklWRVJfTUlOT1IJMzIKKyNkZWZp
bmUgS01TX0RSSVZFUl9NSU5PUgkzMwogI2RlZmluZSBLTVNfRFJJVkVSX1BBVENITEVWRUwJMAog
CiAjZGVmaW5lIEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9MRU5USAkyNTYKIAogaW50IGFtZGdw
dV92cmFtX2xpbWl0ID0gMDsKIGludCBhbWRncHVfdmlzX3ZyYW1fbGltaXQgPSAwOwogaW50IGFt
ZGdwdV9nYXJ0X3NpemUgPSAtMTsgLyogYXV0byAqLwogaW50IGFtZGdwdV9ndHRfc2l6ZSA9IC0x
OyAvKiBhdXRvICovCiBpbnQgYW1kZ3B1X21vdmVyYXRlID0gLTE7IC8qIGF1dG8gKi8KIGludCBh
bWRncHVfYmVuY2htYXJraW5nID0gMDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
