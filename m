Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8869E2C
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2D689F49;
	Mon, 15 Jul 2019 21:25:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48889F49
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:40 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so12871507qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egysHnEj2L5TXVRCUyCAvvdyGAa18O+Pt9PT9OpYVyY=;
 b=OOIlVnRc6HikVQdQADmaXoNUjJWCg8FBA3aLhsBCJi6GdpGVClXHNHSdFXvdVmIyiq
 7rAk2D0Wx3fDS49I/HI8ebirefCVSIRdlR2z8tf4whGvP60u1PuE7b3ZKIkjfyrMXhG0
 /wOTsniPBrwGkgUUHCme6RdsXoAeHDajO6SQvcx3Ko80zHR4p7d1coeJ1dLNoAijHtjl
 U74VB8Pdd2Czm2WCvuRpkvBNxxJfJyZEEM1pnD71a/w0NyWjV2/TFfUjal3tLCeJy+Sk
 7PSIraHOwkowh0UQa5gYR6UPSw979+4UHHS7hmfAsv9okLOFnWyJNziIeRgN5v850gtt
 wEMg==
X-Gm-Message-State: APjAAAUDhe7wHf9KErK9h1Hy7+INbVCfgGi1QggHBT6Nx3/Rj1v0+DDp
 FHAi+urzO8tTj9/fgFyxcvvR4vgj
X-Google-Smtp-Source: APXvYqy9wYjQHPNvZ7+ujdK+dkqpkyF2IsRfzckcaTP7JMuo1xN7f1ilSvQxUhRJ2J5qz/JJLaFb4Q==
X-Received: by 2002:a37:e30b:: with SMTP id y11mr19536226qki.100.1563225939133; 
 Mon, 15 Jul 2019 14:25:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 061/102] drm/amdgpu/VCN2.5: set decode ring functions
Date: Mon, 15 Jul 2019 16:23:56 -0500
Message-Id: <20190715212437.31793-59-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egysHnEj2L5TXVRCUyCAvvdyGAa18O+Pt9PT9OpYVyY=;
 b=QMP1NzbX/tDmVXfrD4MjgGUG6Z6/xdGLtxxt3AZFuuL+O3BEgbt2rkzQyFhsSlQh3k
 W11vEEACcufvFe6sOpicCdg30vCk30omO2I3UWJSlMNuQOYb/PeMmrDvIHHxAYEq6kzU
 yfKDf8qVnqDPdmmld5xQFbESwKcCzTWccNlPFeOJUKlIqVjXZDIQaD98jYdJGE8blWax
 +IsshbfsCDqXG2Op5NT2kd+ip5mFSHVOLFzDuGfiSEmfugKopSZgfcj/+vNZBICw24/p
 t2qws7MHTRtRsHcskR0UyJMmI22C6Npi5FudQ1x8dZHUbNUamQ7687/w/+mOFgxQuFF3
 wYnw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWxzbyByZXVzZSBtb3N0IG9mIHRoZSBW
Q04yLjAgZGVjb2RlIHJpbmcgZnVuY3Rpb25zCgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8u
bGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgNzgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzggaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCmluZGV4IGI2ZTcyZmZmOTRm
NS4uZjE2YTRmNjgyZTI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKQEAg
LTc0Nyw2ICs3NDcsODQgQEAgc3RhdGljIGludCB2Y25fdjJfNV9zdG9wKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCisvKioKKyAqIHZjbl92Ml81X2RlY19yaW5n
X2dldF9ycHRyIC0gZ2V0IHJlYWQgcG9pbnRlcgorICoKKyAqIEByaW5nOiBhbWRncHVfcmluZyBw
b2ludGVyCisgKgorICogUmV0dXJucyB0aGUgY3VycmVudCBoYXJkd2FyZSByZWFkIHBvaW50ZXIK
KyAqLworc3RhdGljIHVpbnQ2NF90IHZjbl92Ml81X2RlY19yaW5nX2dldF9ycHRyKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZykKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmct
PmFkZXY7CisKKwlyZXR1cm4gUlJFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfUkJDX1JCX1JQVFIp
OworfQorCisvKioKKyAqIHZjbl92Ml81X2RlY19yaW5nX2dldF93cHRyIC0gZ2V0IHdyaXRlIHBv
aW50ZXIKKyAqCisgKiBAcmluZzogYW1kZ3B1X3JpbmcgcG9pbnRlcgorICoKKyAqIFJldHVybnMg
dGhlIGN1cnJlbnQgaGFyZHdhcmUgd3JpdGUgcG9pbnRlcgorICovCitzdGF0aWMgdWludDY0X3Qg
dmNuX3YyXzVfZGVjX3JpbmdfZ2V0X3dwdHIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQorewor
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcmluZy0+YWRldjsKKworCXJldHVybiBSUkVH
MzJfU09DMTUoVVZELCAwLCBtbVVWRF9SQkNfUkJfV1BUUik7Cit9CisKKy8qKgorICogdmNuX3Yy
XzVfZGVjX3Jpbmdfc2V0X3dwdHIgLSBzZXQgd3JpdGUgcG9pbnRlcgorICoKKyAqIEByaW5nOiBh
bWRncHVfcmluZyBwb2ludGVyCisgKgorICogQ29tbWl0cyB0aGUgd3JpdGUgcG9pbnRlciB0byB0
aGUgaGFyZHdhcmUKKyAqLworc3RhdGljIHZvaWQgdmNuX3YyXzVfZGVjX3Jpbmdfc2V0X3dwdHIo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gcmluZy0+YWRldjsKKworCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1JCQ19SQl9XUFRS
LCBsb3dlcl8zMl9iaXRzKHJpbmctPndwdHIpKTsKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBh
bWRncHVfcmluZ19mdW5jcyB2Y25fdjJfNV9kZWNfcmluZ192bV9mdW5jcyA9IHsKKwkudHlwZSA9
IEFNREdQVV9SSU5HX1RZUEVfVkNOX0RFQywKKwkuYWxpZ25fbWFzayA9IDB4ZiwKKwkudm1odWIg
PSBBTURHUFVfTU1IVUJfMSwKKwkuZ2V0X3JwdHIgPSB2Y25fdjJfNV9kZWNfcmluZ19nZXRfcnB0
ciwKKwkuZ2V0X3dwdHIgPSB2Y25fdjJfNV9kZWNfcmluZ19nZXRfd3B0ciwKKwkuc2V0X3dwdHIg
PSB2Y25fdjJfNV9kZWNfcmluZ19zZXRfd3B0ciwKKwkuZW1pdF9mcmFtZV9zaXplID0KKwkJU09D
MTVfRkxVU0hfR1BVX1RMQl9OVU1fV1JFRyAqIDYgKworCQlTT0MxNV9GTFVTSF9HUFVfVExCX05V
TV9SRUdfV0FJVCAqIDggKworCQk4ICsgLyogdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF92bV9mbHVz
aCAqLworCQkxNCArIDE0ICsgLyogdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZSB4MiB2bSBm
ZW5jZSAqLworCQk2LAorCS5lbWl0X2liX3NpemUgPSA4LCAvKiB2Y25fdjJfMF9kZWNfcmluZ19l
bWl0X2liICovCisJLmVtaXRfaWIgPSB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2liLAorCS5lbWl0
X2ZlbmNlID0gdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZSwKKwkuZW1pdF92bV9mbHVzaCA9
IHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfdm1fZmx1c2gsCisJLnRlc3RfcmluZyA9IGFtZGdwdV92
Y25fZGVjX3JpbmdfdGVzdF9yaW5nLAorCS50ZXN0X2liID0gYW1kZ3B1X3Zjbl9kZWNfcmluZ190
ZXN0X2liLAorCS5pbnNlcnRfbm9wID0gdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X25vcCwKKwku
aW5zZXJ0X3N0YXJ0ID0gdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X3N0YXJ0LAorCS5pbnNlcnRf
ZW5kID0gdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X2VuZCwKKwkucGFkX2liID0gYW1kZ3B1X3Jp
bmdfZ2VuZXJpY19wYWRfaWIsCisJLmJlZ2luX3VzZSA9IGFtZGdwdV92Y25fcmluZ19iZWdpbl91
c2UsCisJLmVuZF91c2UgPSBhbWRncHVfdmNuX3JpbmdfZW5kX3VzZSwKKwkuZW1pdF93cmVnID0g
dmNuX3YyXzBfZGVjX3JpbmdfZW1pdF93cmVnLAorCS5lbWl0X3JlZ193YWl0ID0gdmNuX3YyXzBf
ZGVjX3JpbmdfZW1pdF9yZWdfd2FpdCwKKwkuZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQgPSBhbWRn
cHVfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdF9oZWxwZXIsCit9OworCitzdGF0aWMgdm9p
ZCB2Y25fdjJfNV9zZXRfZGVjX3JpbmdfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cit7CisJYWRldi0+dmNuLnJpbmdfZGVjLmZ1bmNzID0gJnZjbl92Ml81X2RlY19yaW5nX3ZtX2Z1
bmNzOworCURSTV9JTkZPKCJWQ04gZGVjb2RlIGlzIGVuYWJsZWQgaW4gVk0gbW9kZVxuIik7Cit9
CisKIHN0YXRpYyBib29sIHZjbl92Ml81X2lzX2lkbGUodm9pZCAqaGFuZGxlKQogewogCXN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
