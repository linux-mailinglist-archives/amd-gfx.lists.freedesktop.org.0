Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C298723
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F226EA24;
	Wed, 21 Aug 2019 22:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4266EA1D
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 125so3351192qkl.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+RHNYksR29zBy6ZkPZ8dohCPXBpz5Rc3DFsivVCpfac=;
 b=mUCuGzY2BeIVXiP7hDDuB1Ri2ObtrZqFFaxq8ULamnMeFA3zzfqIPEzBIJmVZirsaj
 EOyE9+91Himc6NooGl8ztYvfJUydic5zPM98CGvp8i2L3mxnmwpliYigq1rYIhx4xuOy
 D3zK8AdBM9rePlb6o46WjBfNGSbVrQRy5wXoD0OJb2D7QWHUX7p/1NPkYits9pumvG5o
 AEljvCeW+N2jMbtbTzKfnVmrwvJbdeEEtbH/j0Vl9creCshBk23lHYFJd2BRoV75DW8h
 xJginH7LfMtkAAG/LR/ybArlchyR6UsXn71iCzICMk4MFpfWcKkmS+vXZcmrpIipcpvK
 Qbfw==
X-Gm-Message-State: APjAAAVXLDUxvsX0Neq2NCgkv6FR+EqKDktqyFfJmCqKqmQLUs3aZjRL
 rVQ7Kad+EUV0bIl1a0v9k2MSbUXu
X-Google-Smtp-Source: APXvYqzny5GBPr/tv48ihf1AaWbJHIB8sGllXLNqt+r5DE+c1ogZpHbb314iSSaevqeuj25+3fFfMA==
X-Received: by 2002:ae9:c30f:: with SMTP id n15mr33778591qkg.147.1566426263891; 
 Wed, 21 Aug 2019 15:24:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/37] drm/amd/powerplay: using valid mapping check for rn
Date: Wed, 21 Aug 2019 17:23:36 -0500
Message-Id: <20190821222359.13578-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+RHNYksR29zBy6ZkPZ8dohCPXBpz5Rc3DFsivVCpfac=;
 b=Kav5QI518Uo/HkNISVCaqruvR18xaJwFS8ThKmSKPdBmC4vkLdb6SoiwdVjISGFl9r
 ZMky3j0AiVC9bwNkZr5uT4FYUilFw5gfDPCINsnonNjvarZ+2UErFS+cfi12tSCZ1Sps
 kFKh9zksrkQykSBedirLSXOlhLU1qYoe2j1D8fauYXhLLBsAci2hH66uu/4uZxekKYaB
 TXW8+J7GLKRT+tNZ9OXntbr+3YbtKPQxaILFfqJ1fzSBITGb9geJwQYqoJyiEjjICOIf
 oqtNDOIe9LT5OIut5Z/vmWtJyEyDXeiwjf2/ctUn7joFA0l62j3tw3GyTQ9PNfH6PNoH
 ddkg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCkNoZWNrIHdoZXRoZXIgdGhlIG1l
c3NhZ2UgbWFwcGluZyBpcyB2YWxpZAoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5s
aXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpSZXZpZXdlZC1i
eTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9zbXVfdjEyXzAuaCB8ICA1ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgICAgfCAxMyArKysrKysrLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oCmluZGV4IDI3OGNkYzJjMGQ0Ny4u
YWNmM2RiMTJmNTlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvc211X3YxMl8wLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3Nt
dV92MTJfMC5oCkBAIC0zMiw2ICszMiwxMSBAQAogI2RlZmluZSBNUDFfU1JBTQkJCTB4MDNjMDAw
MDQKIAogCitzdHJ1Y3Qgc211XzEyXzBfY21uMmFpc2NfbWFwcGluZyB7CisJaW50CXZhbGlkX21h
cHBpbmc7CisJaW50CW1hcF90bzsKK307CisKIHZvaWQgc211X3YxMl8wX3NldF9zbXVfZnVuY3Mo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwppbmRleCBhZjhiYjFjYzVkOWEuLjI1ODAzODNmZjQ5YiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMjYsMTMg
KzI2LDE0IEBACiAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCiAjaW5jbHVkZSAic211X3YxMl8w
X3Bwc21jLmgiCiAjaW5jbHVkZSAic211MTJfZHJpdmVyX2lmLmgiCisjaW5jbHVkZSAic211X3Yx
Ml8wLmgiCiAjaW5jbHVkZSAicmVub2lyX3BwdC5oIgogCiAKICNkZWZpbmUgTVNHX01BUChtc2cs
IGluZGV4KSBcCi0JW1NNVV9NU0dfIyNtc2ddID0gaW5kZXgKKwlbU01VX01TR18jI21zZ10gPSB7
MSwgKGluZGV4KX0KIAotc3RhdGljIGludCByZW5vaXJfbWVzc2FnZV9tYXBbU01VX01TR19NQVhf
Q09VTlRdID0geworc3RhdGljIHN0cnVjdCBzbXVfMTJfMF9jbW4yYWlzY19tYXBwaW5nIHJlbm9p
cl9tZXNzYWdlX21hcFtTTVVfTVNHX01BWF9DT1VOVF0gPSB7CiAJTVNHX01BUChUZXN0TWVzc2Fn
ZSwgICAgICAgICAgICAgICAgICAgIFBQU01DX01TR19UZXN0TWVzc2FnZSksCiAJTVNHX01BUChH
ZXRTbXVWZXJzaW9uLCAgICAgICAgICAgICAgICAgIFBQU01DX01TR19HZXRTbXVWZXJzaW9uKSwK
IAlNU0dfTUFQKEdldERyaXZlcklmVmVyc2lvbiwgICAgICAgICAgICAgUFBTTUNfTVNHX0dldERy
aXZlcklmVmVyc2lvbiksCkBAIC05OCwxNiArOTksMTYgQEAgc3RhdGljIGludCByZW5vaXJfbWVz
c2FnZV9tYXBbU01VX01TR19NQVhfQ09VTlRdID0gewogCiBzdGF0aWMgaW50IHJlbm9pcl9nZXRf
c211X21zZ19pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiB7
Ci0JaW50IHZhbDsKKwlzdHJ1Y3Qgc211XzEyXzBfY21uMmFpc2NfbWFwcGluZyBtYXBwaW5nOwog
CiAJaWYgKGluZGV4ID49IFNNVV9NU0dfTUFYX0NPVU5UKQogCQlyZXR1cm4gLUVJTlZBTDsKIAot
CXZhbCA9IHJlbm9pcl9tZXNzYWdlX21hcFtpbmRleF07Ci0JaWYgKHZhbCA+IFBQU01DX01lc3Nh
Z2VfQ291bnQpCisJbWFwcGluZyA9IHJlbm9pcl9tZXNzYWdlX21hcFtpbmRleF07CisJaWYgKCEo
bWFwcGluZy52YWxpZF9tYXBwaW5nKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlyZXR1cm4gdmFs
OworCXJldHVybiBtYXBwaW5nLm1hcF90bzsKIH0KIAogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
