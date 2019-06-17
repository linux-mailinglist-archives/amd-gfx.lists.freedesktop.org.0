Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950B48DC7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60004892B1;
	Mon, 17 Jun 2019 19:17:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FF6892AA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:17 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so12169747qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zw/Yb4YEU65mIDJIKiN97WZGwty4gj1YYODbZ8B5fVI=;
 b=f3Yu5T1I3cwqWAM+rtTKDMoEdjTYWcByq8+hFJrumPAyH7E75ftekMNS38m3ur+K+I
 7yQ+H9JhqO3qNpx4OAEqrtsWlmfXU1gbEcf1iVHyy715hsw2P2q3Dv5m4Ao+A4denxW1
 yNl0VDdpe774yqBJj57X1LriHLZlSkVLt8MKHCkCMQr4iYl5lJmvv+NAq23XaMrY8E9N
 Hqu25MBud/UAEN182euAfbCYNs8yYXKhXKpx/zaRkQH/1mNMkngAMPSHd5HtxeWikkeG
 T5ftejcG3GvnCCuSa4D/Y3aXT6dF281+fZtGx0GyVfPIewUAv1qe6/2cqkBcnN7qLUbZ
 oAMg==
X-Gm-Message-State: APjAAAVCXB7PBYE0HQnvpq+eEbLPGaAfc4x7qv/9R3ocoNozqoo4gW8r
 dX/7Q04F7cBoZ15yjVXyy4ze5CwEHiU=
X-Google-Smtp-Source: APXvYqxXDY5aC4aLnLSmzXs0xunaQCHcRKSGqXMf6lLChklAYauU+yPxMSDnTzb3u+mXf688zSIRnQ==
X-Received: by 2002:a0c:b5c5:: with SMTP id o5mr23153614qvf.6.1560799036456;
 Mon, 17 Jun 2019 12:17:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 014/459] drm/amdgpu: add doorbell assignement for navi10
Date: Mon, 17 Jun 2019 14:09:35 -0500
Message-Id: <20190617191700.17899-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zw/Yb4YEU65mIDJIKiN97WZGwty4gj1YYODbZ8B5fVI=;
 b=QH/3LWY8ZFUbTXV8wsQKijOpHzW9uU8pDrSx3xIWO7bmzQ2LDeq3/qWsKq7XAgCgbb
 /YnZEZrArGd8Sn/YMNRlurgxyBn+XRyhD8ZbgGh0cFsWksoFq1Bglcs9OoqSVOqYEgYK
 y+foVfY350EBun/GNjwvnH0owLukOSInO3xL4Mr4ljwQAQiuV6GXPTgV/61MWT7/AikW
 3XTbdPwh9bFR/OFd6JvtUBY+GzvIHKeN/Uw2hNvZo4q/PoyFG92B3xQy6llFvYuwmkg2
 2fm5GqdLmVdEYRV0fc/Re93fWzJs0AHCHKwK1mCHU86uZrNJr48BMMu4I6iNf4jr28Of
 zbUQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVXBkYXRlIG1hcHBp
bmdzIGZvciBOYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpo
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rvb3JiZWxsLmggfCA0MCArKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG9vcmJlbGwuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kb29yYmVsbC5oCmluZGV4IDY4OTU5YjkyM2Y4
OS4uNzkwMjYzZGNjMDY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZG9vcmJlbGwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZG9vcmJlbGwuaApAQCAtNTEsNiArNTEsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2Rvb3JiZWxsX2luZGV4
IHsKIAl1aW50MzJfdCB1c2VycXVldWVfc3RhcnQ7CiAJdWludDMyX3QgdXNlcnF1ZXVlX2VuZDsK
IAl1aW50MzJfdCBnZnhfcmluZzA7CisJdWludDMyX3QgZ2Z4X3JpbmcxOwogCXVpbnQzMl90IHNk
bWFfZW5naW5lWzhdOwogCXVpbnQzMl90IGloOwogCXVuaW9uIHsKQEAgLTE1Myw2ICsxNTQsNDUg
QEAgdHlwZWRlZiBlbnVtIF9BTURHUFVfVkVHQTIwX0RPT1JCRUxMX0FTU0lHTk1FTlQKIAlBTURH
UFVfVkVHQTIwX0RPT1JCRUxMX0lOVkFMSUQgICAgICAgICAgICAgICAgICAgPSAweEZGRkYKIH0g
QU1ER1BVX1ZFR0EyMF9ET09SQkVMTF9BU1NJR05NRU5UOwogCit0eXBlZGVmIGVudW0gX0FNREdQ
VV9OQVZJMTBfRE9PUkJFTExfQVNTSUdOTUVOVAoreworCS8qIENvbXB1dGUgKyBHRlg6IDB+MjU1
ICovCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9LSVEJCQk9IDB4MDAwLAorCUFNREdQVV9OQVZJ
MTBfRE9PUkJFTExfSElRCQkJPSAweDAwMSwKKwlBTURHUFVfTkFWSTEwX0RPT1JCRUxMX0RJUQkJ
CT0gMHgwMDIsCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9NRUNfUklORzAJCT0gMHgwMDMsCisJ
QU1ER1BVX05BVkkxMF9ET09SQkVMTF9NRUNfUklORzEJCT0gMHgwMDQsCisJQU1ER1BVX05BVkkx
MF9ET09SQkVMTF9NRUNfUklORzIJCT0gMHgwMDUsCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9N
RUNfUklORzMJCT0gMHgwMDYsCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9NRUNfUklORzQJCT0g
MHgwMDcsCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9NRUNfUklORzUJCT0gMHgwMDgsCisJQU1E
R1BVX05BVkkxMF9ET09SQkVMTF9NRUNfUklORzYJCT0gMHgwMDksCisJQU1ER1BVX05BVkkxMF9E
T09SQkVMTF9NRUNfUklORzcJCT0gMHgwMEEsCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9VU0VS
UVVFVUVfU1RBUlQJCT0gMHgwMEIsCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9VU0VSUVVFVUVf
RU5ECQk9IDB4MDhBLAorCUFNREdQVV9OQVZJMTBfRE9PUkJFTExfR0ZYX1JJTkcwCQk9IDB4MDhC
LAorCUFNREdQVV9OQVZJMTBfRE9PUkJFTExfR0ZYX1JJTkcxCQk9IDB4MDhDLAorCS8qIFNETUE6
MjU2fjMzNSovCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9zRE1BX0VOR0lORTAJCT0gMHgxMDAs
CisJQU1ER1BVX05BVkkxMF9ET09SQkVMTF9zRE1BX0VOR0lORTEJCT0gMHgxMEEsCisJLyogSUg6
IDM3Nn4zOTEgKi8KKwlBTURHUFVfTkFWSTEwX0RPT1JCRUxMX0lICQkJPSAweDE3OCwKKwkvKiBN
TVNDSDogMzkyfjQwNworCSAqIG92ZXJsYXAgdGhlIGRvb3JiZWxsIGFzc2lnbm1lbnQgd2l0aCBW
Q04gYXMgdGhleSBhcmUgIG11dHVhbGx5IGV4Y2x1c2l2ZQorCSAqIFZDRSBlbmdpbmUncyBkb29y
YmVsbCBpcyAzMiBiaXQgYW5kIHR3byBWQ0UgcmluZyBzaGFyZSBvbmUgUVdPUkQKKwkgKi8KKwlB
TURHUFVfTkFWSTEwX0RPT1JCRUxMNjRfVkNOMF8xCQkJPSAweDE4OCwgLyogbG93ZXIgMzIgYml0
cyBmb3IgVk5DMCBhbmQgdXBwZXIgMzIgYml0cyBmb3IgVk5DMSAqLworCUFNREdQVV9OQVZJMTBf
RE9PUkJFTEw2NF9WQ04yXzMJCQk9IDB4MTg5LAorCUFNREdQVV9OQVZJMTBfRE9PUkJFTEw2NF9W
Q040XzUJCQk9IDB4MThBLAorCUFNREdQVV9OQVZJMTBfRE9PUkJFTEw2NF9WQ042XzcJCQk9IDB4
MThCLAorCisJQU1ER1BVX05BVkkxMF9ET09SQkVMTDY0X0ZJUlNUX05PTl9DUAkJPSBBTURHUFVf
TkFWSTEwX0RPT1JCRUxMX3NETUFfRU5HSU5FMCwKKwlBTURHUFVfTkFWSTEwX0RPT1JCRUxMNjRf
TEFTVF9OT05fQ1AJCT0gQU1ER1BVX05BVkkxMF9ET09SQkVMTDY0X1ZDTjZfNywKKworCUFNREdQ
VV9OQVZJMTBfRE9PUkJFTExfTUFYX0FTU0lHTk1FTlQJCT0gMHgxOEYsCisJQU1ER1BVX05BVkkx
MF9ET09SQkVMTF9JTlZBTElECQkJPSAweEZGRkYKK30gQU1ER1BVX05BVkkxMF9ET09SQkVMTF9B
U1NJR05NRU5UOworCiAvKgogICogNjRiaXQgZG9vcmJlbGwsIG9mZnNldCBhcmUgaW4gUVdPUkQs
IG9jY3VweSAyS0IgZG9vcmJlbGwgc3BhY2UKICAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
