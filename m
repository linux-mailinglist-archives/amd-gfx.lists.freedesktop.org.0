Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543AA49016
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2E889F31;
	Mon, 17 Jun 2019 19:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C6189F06
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id a27so6983362qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gj0TPhVAIQnG2Pkmb2LfdirfMMUA2AxkVfL3I8Ln3t0=;
 b=f1c1AdHZDO0zWT3M0THxIE+dcYU0sqMSYPDSnEg9Zk3f1wzva5OcbpsrbBcGN7rXvL
 oP110rVXKlTrLWPOmBG3ti31JFXrlnsA3OhqbidcCELN6SV+M6nfTfnDf6yygLIG4IN5
 Sene5MP/3bVBbon2+K9TgKB27IC9F3JV4Z4Vicqi5SRwoFjLp4ne56jbS7bM+aZmrlKq
 o+x8Svo3W2McohEscXHKSTMA/ptlWI6kEhUU4DF4T5jyP3L6f3PsZc2GMsPhIAxD1olh
 86n8N5tnLSeTYMFC05my62ilSx/WzB7jCrSMIXzOrxo1+5O6fe7LbyCmVOmSWs2geFxG
 qUfw==
X-Gm-Message-State: APjAAAWO7+O3kMBvYPY1S88adniHx8nsEwgPotjp77mUxovNvLH2X+A0
 3zbwn3N0AVRKQprL/fyM6nzF9vz/lOrd6Q==
X-Google-Smtp-Source: APXvYqwlMWqUrWwonpAHOPnCp6r307m1A3qeiyPu6fhh+jtU8vTFHbM+5J+EUohbsL+Ky+xzpnLzWA==
X-Received: by 2002:a05:620a:5b0:: with SMTP id
 q16mr88720958qkq.212.1560800815229; 
 Mon, 17 Jun 2019 12:46:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 358/459] drm/amd/display: skip dsc config for navi10 bring up
Date: Mon, 17 Jun 2019 14:44:59 -0500
Message-Id: <20190617194540.18497-59-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gj0TPhVAIQnG2Pkmb2LfdirfMMUA2AxkVfL3I8Ln3t0=;
 b=CK1JKzZrDJYJv9m1VOATuA1UeIbcusIa0aoBG0JLnoATO0TWp/6OZ+oOQc8IS/0oWw
 7KK4QevpAARHVabClmJh9L0WoOKaFcb7Z9TvgWGXG2UtIf4/ndgq1ADu7WC9yncFCN6K
 GhtnP5m9ethzokqjfNwgM4LiQtNCD+zMKBCRZ/gfpkEIQaAo7pcLSczSQKaDioP+1EjQ
 m4+McB2JFA+h4ip17zIPdlTfKmjxOJ3oHPdZ/JgZATb2iHE37VVdhrD6ZTBKVifvWJBN
 hFaEzICCjABawhTUx+rnHccA+2plXJfE3G6OD1OXajuLesz3ldGwneey7kp+HGaHQgEA
 V8yA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKW3doeV0gd2UgbWVldCBhIGJ1
ZyB3aGVuIHByb2dyYW0gZHNjIHJlZ2lzdGVyIGV2ZW4gZHNjIG1vZGUgaXMgbm90CmVuYWJsZWQu
IGRpc2FibGUgZHNjIGNvbmZpZyBmb3Igbm93LiB3ZSB3aWxsIHJlLXZpc2l0IHRoaXMgaXNzdWUu
CgpTaWduZWQtb2ZmLWJ5OiBoZXJzZW4gd3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jICAgICB8IDkgKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
b3B0Yy5jCmluZGV4IDcyNGI1YTllNDdkMC4uMzRmNWE3ZDY3MWIyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMKQEAgLTE5MSw2ICsx
OTEsMTUgQEAgdm9pZCBvcHRjMl9zZXRfZHNjX2NvbmZpZyhzdHJ1Y3QgdGltaW5nX2dlbmVyYXRv
ciAqb3B0YywKIAkJCQkJdWludDMyX3QgZHNjX3NsaWNlX3dpZHRoKQogewogCXN0cnVjdCBvcHRj
ICpvcHRjMSA9IERDTjEwVEdfRlJPTV9URyhvcHRjKTsKKwl1aW50MzJfdCBkYXRhX2Zvcm1hdCA9
IDA7CisJLyogc2tpcCBpZiBkc2MgbW9kZSBpcyBub3QgY2hhbmdlZCAqLworCWRhdGFfZm9ybWF0
ID0gZG1fcmVhZF9yZWcoQ1RYLCBSRUcoT1BUQ19EQVRBX0ZPUk1BVF9DT05UUk9MKSk7CisKKwlk
YXRhX2Zvcm1hdCA9IGRhdGFfZm9ybWF0ICYgMHgzMDsgLyogYml0NTo0ICovCisJZGF0YV9mb3Jt
YXQgPSBkYXRhX2Zvcm1hdCA+PiA0OworCisJaWYgKGRhdGFfZm9ybWF0ID09IGRzY19tb2RlKQor
CQlyZXR1cm47CiAKIAlSRUdfVVBEQVRFKE9QVENfREFUQV9GT1JNQVRfQ09OVFJPTCwKIAkJT1BU
Q19EU0NfTU9ERSwgZHNjX21vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBjNGZhMGI5ZTcxMzguLmUyYTZl
ODAwMTNmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTY3MCw3ICs2NzAsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRjX2RlYnVnX29wdGlvbnMgZGVidWdfZGVmYXVsdHNfZHJ2ID0gewogCQkubWF4X2Rvd25z
Y2FsZV9zcmNfd2lkdGggPSA1MTIwLC8qdXB0byA1SyovCiAJCS5kaXNhYmxlX3BwbGliX3dtX3Jh
bmdlID0gZmFsc2UsCiAJCS5zY2xfcmVzZXRfbGVuZ3RoMTAgPSB0cnVlLAotCQkuc2FuaXR5X2No
ZWNrcyA9IHRydWUsCisJCS5zYW5pdHlfY2hlY2tzID0gZmFsc2UsCiAJCS5kaXNhYmxlX3RyaV9i
dWYgPSB0cnVlLAogfTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
