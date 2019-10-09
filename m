Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8FD0FC6
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 15:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFBB6E247;
	Wed,  9 Oct 2019 13:17:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D456E247
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 13:17:24 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q203so2178367qke.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Oct 2019 06:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t4ABxN4Icfw70d8Q0HmxopwHtrRHMJG0boWV4IDSLhU=;
 b=YTSzPz7XqDR7jHXxvkz4ZkNjaDs39qgG/WfNIcdihs2VRZC8E4cf9CKMQwMZssOxi/
 1IDVIe5VfgUneOBLAvLmN6pIMscAjEtOwv0dr/L7ViC2jrwx6bKK3tGYuNChazJtkN48
 PulsL1QnA+hy9DxW3VZTfugeUbPsSnmV8Y204Jh6ySt37k3mG3omTqKzS/PWE49HNVnK
 vd8YM0Lqn1+kzzYtc3vnefSp/A4z94uzVriSY8L7R6WvJ9nWzKhDbH93c1q5tIo2B/6i
 hyJMQ17YErFnpDvhgaUEG4eep2WShfunNHHWQXE3C0EqLxI3CPrBjW/GmtQoJLItjFBk
 tNag==
X-Gm-Message-State: APjAAAVe3x8rPBFffJApwjv9sD81KoYk872zMm/uw1Sk5qaYp95GK4kS
 b863F/ujd+PHlhRhixxl0aQ/Cn6R
X-Google-Smtp-Source: APXvYqzfp9ZgDHltchZQol15MfEs/zi4/1D2a2AO2pHONCqwp7Liwf7lDS8GfPyPqZRd1WFqYW/rnQ==
X-Received: by 2002:ae9:f714:: with SMTP id s20mr3409639qkg.262.1570627042700; 
 Wed, 09 Oct 2019 06:17:22 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id c25sm955348qtv.71.2019.10.09.06.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 06:17:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swSMU/navi: add feature toggles for more things
Date: Wed,  9 Oct 2019 08:17:14 -0500
Message-Id: <20191009131714.24259-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t4ABxN4Icfw70d8Q0HmxopwHtrRHMJG0boWV4IDSLhU=;
 b=beYQ3nht5ltPqRBSis4w8ZUC6KhfSWYy9JHjW/KODqU8w8qqxLmUGSX1YPqEIxaYre
 mtIS+87I30BO0flx4NZKe+ZeXaQIw50gYmAQHIhgtKG4oPSzKSrDco1AFGSVL+8Ulzpc
 5gejNO/xsUzJBG9IvYmAUYxnxci7BBPOV4aMaqk1e98dwk2eBr1BAl7jBOJF39wjLKeG
 +eGp17BXU+EeGW6v1mA4ldx0/c4h+wr+Y1waC3roPu2VD1so3/VwG6FjZYjW9/fgEImA
 TP1wGGzoQ16VuCTHd/er33Ou5zT1X4zfsq9kMgPVny4xab1qPryQvDgg4qRtWDYFHbRN
 EU+w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHRvZ2dsZXMgZm9yIG1vcmUgcG93ZXIgZmVhdHVyZXMuICBIZWxwZnVsIGluIGRlYnVnZ2lu
Zy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAyNCAr
KysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMKaW5kZXggYTU4M2NmODdiNTE0Li44ZTFmM2JlOGJhNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTMyOCwxMSArMzI4LDcgQEAgbmF2aTEwX2dl
dF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAltZW1zZXQo
ZmVhdHVyZV9tYXNrLCAwLCBzaXplb2YodWludDMyX3QpICogbnVtKTsKIAogCSoodWludDY0X3Qg
KilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklU
KQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0dGWENMS19CSVQpCi0JCQkJfCBGRUFU
VVJFX01BU0soRkVBVFVSRV9EUE1fU09DQ0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFU
VVJFX0RQTV9NUDBDTEtfQklUKQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJTktf
QklUKQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYX1VMVl9CSVQpCiAJCQkJfCBGRUFU
VVJFX01BU0soRkVBVFVSRV9SU01VX1NNTl9DR19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVB
VFVSRV9EU19TT0NDTEtfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfUFBUX0JJVCkK
QEAgLTM0Miw4ICszMzgsNiBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRkFOX0NPTlRS
T0xfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfVEhFUk1BTF9CSVQpCiAJCQkJfCBG
RUFUVVJFX01BU0soRkVBVFVSRV9MRURfRElTUExBWV9CSVQpCi0JCQkJfCBGRUFUVVJFX01BU0so
RkVBVFVSRV9EUE1fRENFRkNMS19CSVQpCi0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19H
RlhDTEtfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFNfRENFRkNMS19CSVQpCiAJ
CQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9GV19EU1RBVEVfQklUKQogCQkJCXwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfQkFDT19CSVQpCkBAIC0zNTIsMTEgKzM0NiwyOSBAQCBuYXZpMTBfZ2V0X2Fs
bG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCXwgRkVBVFVS
RV9NQVNLKEZFQVRVUkVfQVBDQ19ERkxMX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X0ZXX0NURl9CSVQpOwogCisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9TT0NDTEtfRFBN
X01BU0spCisJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRV
UkVfRFBNX1NPQ0NMS19CSVQpOworCisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9TQ0xL
X0RQTV9NQVNLKQorCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhG
RUFUVVJFX0RQTV9HRlhDTEtfQklUKTsKKworCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBf
UENJRV9EUE1fTUFTSykKKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01B
U0soRkVBVFVSRV9EUE1fTElOS19CSVQpOworCisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQ
UF9EQ0VGQ0xLX0RQTV9NQVNLKQorCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCk7CisKIAlpZiAoYWRldi0+cG0ucHBfZmVh
dHVyZSAmIFBQX01DTEtfRFBNX01BU0spCiAJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0g
RkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfTUVNX1ZERENJX1NDQUxJTkdfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVf
TUVNX01WRERfU0NBTElOR19CSVQpOwogCisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9V
TFZfTUFTSykKKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVB
VFVSRV9HRlhfVUxWX0JJVCk7CisKKwlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX1NDTEtf
REVFUF9TTEVFUF9NQVNLKQorCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVf
TUFTSyhGRUFUVVJFX0RTX0dGWENMS19CSVQpOworCiAJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUg
JiBQUF9HRlhPRkZfTUFTSykgewogCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9CSVQpOwogCQkvKiBUT0RPOiByZW1vdmUgaXQgb25jZSBm
dyBmaXggdGhlIGJ1ZyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
