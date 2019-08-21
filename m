Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62769874A
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF166EA3B;
	Wed, 21 Aug 2019 22:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F9D6EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:42 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id m10so3368767qkk.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=us0IucU+FREIoJfQ5E500VoILYNzqr+SGYhXzESkNjY=;
 b=WN2G4CkWThcU1taOREz3uybornZ0OwNIZLXsewklbzjU5AwCyYXmapj9v8z78Pjjw3
 Q9e8hG9Loqw9fesMpMSQpMO+yoMsmg7ZQRE59I/YrcfmJsqbRdDamYSqFDYkMmVlyOJd
 8cICNR1TtYUMj/yw9luBvXenUl6il1rUIgM0uyIa1BiI66tlz8Z+u6COYfYS+Yce7L17
 ONr+w4nsfV6hXGfQ+4aC1u0s6hVoFmHlJBtCQx7PLRx/1g0nAGzNxOVWQSNJ5/E9vnK0
 zFQszqnevpfwB7Q5gIp1bM/PEH1kOcPrsC9TzPTN9C/7zRUF1LBII2X0piX81fR+u+M0
 Czzw==
X-Gm-Message-State: APjAAAVVZkhN8r2aDx0ONyqYDfM3i9y+73v+89AMbEi0aUw9PyOIhF04
 tiaorpelQd0z14z4odT86TdBUlfF
X-Google-Smtp-Source: APXvYqxdaE9XJUUxydfr6FMWxCtvWPEO5nx/8a4aio43V9JGKbDFGs+IsoGe7yNT4KjS2JXV7zhJaw==
X-Received: by 2002:a37:6844:: with SMTP id d65mr33151533qkc.398.1566426281211; 
 Wed, 21 Aug 2019 15:24:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 34/37] drm/amdgpu: update gc/sdma goldensetting for rn
Date: Wed, 21 Aug 2019 17:23:56 -0500
Message-Id: <20190821222359.13578-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=us0IucU+FREIoJfQ5E500VoILYNzqr+SGYhXzESkNjY=;
 b=dUeCR7Q1z+EkAOHCdfWNYzYFsAryb/I2ko1vLJfXdc5P/MNvxAL0X6Ys8XO3vspkhs
 p8+oo74BsdXaSjd1lY/By8zpXZ+MYl+mJysa5t4OHvOB7fnLMmN2w1/UHygC4rhg0/ak
 Gt9HQq3dcvGLf+y0fBjAt7SNXnUgLkS/U99NIeW0icch8rJi6tS60DUE6ZSkIUyDkS9p
 UA/s2rQQywwI62AjxPY0E6O/4eNLqMXWeas8phjd9LJMIx49TXJ9E3DjBKjcXt9BM9Cn
 KaxkWf4Z9A2SdZxyGwqvO3DfHD6p1z8s9lbRZ3g/iwzctM2Dh+JN1bra94/C0EtUL06Z
 jueQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KClRoaXMgcGF0Y2ggdXBkYXRlcyBn
Yy9zZG1hIGdvbGRlbnNldHRpbmcgZm9yIHJlbm9pcgoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1
IDxhYXJvbi5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICB8IDcgKysr
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCA0ICsrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDQ4ZjhkNWFlNjdmMy4uMmM3MDI1YmIxMDUw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTYyMCwxMiArNjIwLDEx
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3Nf
Z2NfOV8xX3J2MltdID0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdv
bGRlbl9zZXR0aW5nc19nY185XzFfcm5bXSA9CiB7Ci0JU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1XRF9VVENMMV9DTlRMLCAweDNmOGZmZmZmLCAweDA4MDAwMDgwKSwKIAlTT0MxNV9S
RUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNCX0hXX0NPTlRST0wsIDB4ZmZmZGYzY2YsIDB4MDAw
MTQxMDQpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ0JfSFdfQ09OVFJPTF8y
LCAweGZmN2ZmZmZmLCAweDBhMDAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAw
LCBtbURCX0RFQlVHMiwgMHhmMDBmZmZmZiwgMHgwMDAwMDQwMCksCi0JU09DMTVfUkVHX0dPTERF
Tl9WQUxVRShHQywgMCwgbW1HQl9BRERSX0NPTkZJRywgMHhmM2U3NzdmZiwgMHgyMjAxMDA0Miks
Ci0JU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HQl9BRERSX0NPTkZJR19SRUFELCAw
eGYzZTc3N2ZmLCAweDIyMDEwMDQyKSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBt
bUdCX0FERFJfQ09ORklHLCAweGYzZTc3N2ZmLCAweDI0MDAwMDQyKSwKKwlTT0MxNV9SRUdfR09M
REVOX1ZBTFVFKEdDLCAwLCBtbUdCX0FERFJfQ09ORklHX1JFQUQsIDB4ZjNlNzc3ZmYsIDB4MjQw
MDAwNDIpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfRU5IQU5DRSwg
MHgzZmZmZmZmZiwgMHgwMDAwMDAwMSksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwg
bW1QQV9TQ19FTkhBTkNFXzEsIDB4ZmZmZmZmZmYsIDB4MDQwNDAwMDApLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfTElORV9TVElQUExFX1NUQVRFLCAweDAwMDBmZjBm
LCAweDAwMDAwMDAwKSwKQEAgLTc4Myw3ICs3ODIsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9p
bml0X2dvbGRlbl9yZWdpc3RlcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXNvYzE1
X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKIAkJCQkJCWdvbGRlbl9zZXR0aW5nc19n
Y185XzFfcm4sCiAJCQkJCQlBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY185XzFfcm4pKTsK
LQkJYnJlYWs7CisJCXJldHVybjsgLyogZm9yIHJlbm9pciwgZG9uJ3QgbmVlZCBjb21tb24gZ29s
ZGVuc2V0dGluZyAqLwogCWRlZmF1bHQ6CiAJCWJyZWFrOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMKaW5kZXggOWZhYjdmZDk4MmI2Li5iM2IyYzIxOTE2MDIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0yNDQsOCArMjQ0LDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19zZG1hX2Fy
Y3RbXSA9CiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRp
bmdzX3NkbWFfNF8zW10gPSB7CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShTRE1BMCwgMCwgbW1T
RE1BMF9DSElDS0VOX0JJVFMsIDB4ZmU5MzFmMDcsIDB4MDI4MzFmMDcpLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RNQTBfQ0xLX0NUUkwsIDB4ZmZmZmZmZmYsIDB4M2Yw
MDAxMDApLAotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RNQTBfR0JfQURE
Ul9DT05GSUcsIDB4MDAxODc3M2YsIDB4MDAwMDMwMDIpLAotCVNPQzE1X1JFR19HT0xERU5fVkFM
VUUoU0RNQTAsIDAsIG1tU0RNQTBfR0JfQUREUl9DT05GSUdfUkVBRCwgMHgwMDE4NzczZiwgMHgw
MDAwMzAwMiksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShTRE1BMCwgMCwgbW1TRE1BMF9HQl9B
RERSX0NPTkZJRywgMHgwMDE4NzczZiwgMHgwMDAwMDAwMiksCisJU09DMTVfUkVHX0dPTERFTl9W
QUxVRShTRE1BMCwgMCwgbW1TRE1BMF9HQl9BRERSX0NPTkZJR19SRUFELCAweDAwMTg3NzNmLCAw
eDAwMDAwMDAyKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKFNETUEwLCAwLCBtbVNETUEwX0dG
WF9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywgMHgwMDQwMzAwMCksCiAJU09DMTVfUkVH
X0dPTERFTl9WQUxVRShTRE1BMCwgMCwgbW1TRE1BMF9QT1dFUl9DTlRMLCAweDAwM2ZmZjA3LCAw
eDQwMDAwMDUxKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKFNETUEwLCAwLCBtbVNETUEwX1JM
QzBfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
