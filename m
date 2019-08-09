Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687DF87EA0
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35616EE4B;
	Fri,  9 Aug 2019 15:53:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4E6EE43
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:25 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y26so96273636qto.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bhcLZA8DA7ScbGyy7N9+iW50+yar78Ha/1ayvVvkOxA=;
 b=aSaeppwn5woaE7TvMZvDjZl2Rr3563Vleye/67Dv767ydwJ1hczZ9TGYJsteRpygQx
 bGR8obNZMdO97BcffrGLcbIjE8DhJyl+hNJgqCkOnoqFN9mLrlyEVhP/Iat3lx86JanG
 oDay1y3gbrisM/eJPQEkjAJYtuJvXxjEDMxD2ZKqd3FvMtD9cmvf3PoI095SeydFCU3u
 wPRY7QGvaUIkAm7zNkfaQKnjp3yAKBvyCx69GtuvabYkm7P/PRskEjpf1aMNgeOzBuRw
 HHB07sxs/H6zYgH7mMr5fUleuuEPihbRHviH3ZVvNaGXbvV7HXxTPLuM/SnqP4NjcyU0
 oVhA==
X-Gm-Message-State: APjAAAXyzRZWZR+jxFvH15W+h1A7Y//TatHCmzbLuknCscKMTK5v46eG
 YSgp+aVdmlKu6FWJDjna0O7Om+8s
X-Google-Smtp-Source: APXvYqxNm8Me8cFt9ldaIFaW6bnNbC6mSAajv06GErfNsdTs1KhLdQ9qXxa+MnIL6O3xjgmNiv5aeA==
X-Received: by 2002:a0c:db93:: with SMTP id m19mr11049997qvk.96.1565366004067; 
 Fri, 09 Aug 2019 08:53:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/27] drm/amdgpu: add gfx golden settings for renoir (v2)
Date: Fri,  9 Aug 2019 10:52:51 -0500
Message-Id: <20190809155302.4733-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bhcLZA8DA7ScbGyy7N9+iW50+yar78Ha/1ayvVvkOxA=;
 b=L9fvwkcBvzXvEDxaD2EmIhr0Z4DXPPk8SDWjDg1CaHSfmeJUrPDTUTMiHU4zdAeo5j
 UMaTBW49ThdDV1qbl0D/dY//rFbvFue54HnGxJdn65udKZHpzxWjroTzIw+vEdHk+Rfg
 o2R0yKliXoZ0+S6bgKMi08hQrT679eKcCZDwmGWRPYZI4WHZm0TD8pVsvIHtGrPKWdwV
 2AOLVgM4HxMO/N4cTxNhsy7Hy+3/63u+y5C4qmGtzsLoo16waLweTJHw67BMSLbhCDWa
 2+X3xljPATyOX3YupgcGSzrMYy4ZFgy3XFXrO2lIdzK+60UC3wW5YYopfb9ObvLG0SoZ
 aehA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyBnZngg
Z29sZGVuIHNldHRpbmdzIGZvciByZW5vaXIgcmVhbCBhc2ljLgoKdjI6IHVwZGF0ZSBzZXR0aW5n
cyAoQWxleCkKClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggZTdkYjY0MjY0MzAwLi5jYWJhOWYwMzhiMzgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMzIsNiArMzIsNyBAQAog
CiAjaW5jbHVkZSAiZ2MvZ2NfOV8wX29mZnNldC5oIgogI2luY2x1ZGUgImdjL2djXzlfMF9zaF9t
YXNrLmgiCisKICNpbmNsdWRlICJ2ZWdhMTBfZW51bS5oIgogI2luY2x1ZGUgImhkcC9oZHBfNF8w
X29mZnNldC5oIgogCkBAIC01Niw2ICs1Nyw5IEBACiAjZGVmaW5lIFBXUl9NSVNDX0NOVExfU1RB
VFVTX19QV1JfR0ZYX1JMQ19DR1BHX0VOX01BU0sJCTB4MDAwMDAwMDFMCiAjZGVmaW5lIFBXUl9N
SVNDX0NOVExfU1RBVFVTX19QV1JfR0ZYT0ZGX1NUQVRVU19NQVNLCQkweDAwMDAwMDA2TAogCisj
ZGVmaW5lIG1tR0NFQV9QUk9CRV9NQVAgICAgICAgICAgICAgICAgICAgICAgICAweDA3MGMKKyNk
ZWZpbmUgbW1HQ0VBX1BST0JFX01BUF9CQVNFX0lEWCAgICAgICAgICAgICAgIDAKKwogTU9EVUxF
X0ZJUk1XQVJFKCJhbWRncHUvdmVnYTEwX2NlLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRn
cHUvdmVnYTEwX3BmcC5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3ZlZ2ExMF9tZS5i
aW4iKTsKQEAgLTYxNCw2ICs2MTgsMjMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdf
Z29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY185XzFfcnYyW10gPQogCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoR0MsIDAsIG1tV0RfVVRDTDFfQ05UTCwgMHgzZjhmZmZmZiwgMHgwODAwMDA4MCksCiB9
OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdz
X2djXzlfMV9ybltdID0KK3sKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVdEX1VU
Q0wxX0NOVEwsIDB4M2Y4ZmZmZmYsIDB4MDgwMDAwODApLAorCVNPQzE1X1JFR19HT0xERU5fVkFM
VUUoR0MsIDAsIG1tQ0JfSFdfQ09OVFJPTCwgMHhmZmZkZjNjZiwgMHgwMDAxNDEwNCksCisJU09D
MTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1DQl9IV19DT05UUk9MXzIsIDB4ZmY3ZmZmZmYs
IDB4MGEwMDAwMDApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfREVCVUcy
LCAweGYwMGZmZmZmLCAweDAwMDAwNDAwKSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAw
LCBtbUdCX0FERFJfQ09ORklHLCAweGYzZTc3N2ZmLCAweDIyMDEwMDQyKSwKKwlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbUdCX0FERFJfQ09ORklHX1JFQUQsIDB4ZjNlNzc3ZmYsIDB4
MjIwMTAwNDIpLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfRU5IQU5D
RSwgMHgzZmZmZmZmZiwgMHgwMDAwMDAwMSksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywg
MCwgbW1QQV9TQ19FTkhBTkNFXzEsIDB4ZmZmZmZmZmYsIDB4MDQwNDAwMDApLAorCVNPQzE1X1JF
R19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfTElORV9TVElQUExFX1NUQVRFLCAweDAwMDBm
ZjBmLCAweDAwMDAwMDAwKSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVRBX0NO
VExfQVVYLCAweGZmZmZmZWVmLCAweDAxMGIwMDAwKSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbVRDUF9DSEFOX1NURUVSX0hJLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwKSwKKwlT
T0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVRDUF9DSEFOX1NURUVSX0xPLCAweGZmZmZm
ZmZmLCAweDAwMDAzMTIwKSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdDRUFf
UFJPQkVfTUFQLCAweGZmZmZmZmZmLCAweDAwMDBjY2NjKSwKK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfOV94X2NvbW1vbltdID0K
IHsKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX1NEX0NOVEwsIDB4ZmZmZmZm
ZmYsIDB4MDAwMDAxZmYpLApAQCAtNzU4LDYgKzc3OSwxMSBAQCBzdGF0aWMgdm9pZCBnZnhfdjlf
MF9pbml0X2dvbGRlbl9yZWdpc3RlcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJ
CQkJZ29sZGVuX3NldHRpbmdzX2djXzlfMV9ydjEsCiAJCQkJCQkJQVJSQVlfU0laRShnb2xkZW5f
c2V0dGluZ3NfZ2NfOV8xX3J2MSkpOwogCQlicmVhazsKKwkgY2FzZSBDSElQX1JFTk9JUjoKKwkJ
c29jMTVfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5jZShhZGV2LAorCQkJCQkJZ29sZGVuX3NldHRp
bmdzX2djXzlfMV9ybiwKKwkJCQkJCUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzlfMV9y
bikpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
