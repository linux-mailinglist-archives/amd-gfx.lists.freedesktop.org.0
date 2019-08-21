Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B398738
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70846EA29;
	Wed, 21 Aug 2019 22:24:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27DA6EA22
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:25 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id v38so5154480qtb.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4pRS6uR/UnKkMWiYnaaVnL/aphdhvq9rlOZxs9zAL0=;
 b=AHW6dbZijZRcM84bGTknaA1oSio1EhoXAHoK/0sgkOqQLzsnjXQp2Jw8wx4r2R2mJV
 +6wqNGhuAsfoLaQqq0o/o1keQoWEe4CfIh/tqMDmMETvAzxbKT6BMqlM1g89sAMfC6XT
 fBi59D/bG13Dskbw7ZKa9SLAaQZtJWS8jlyMxgKJduZv1BsYZAgdOJdxGZRPNuJfY47p
 KFFfORgekMDnkYhCDW2pT23NSlNPag3UvCygJ5/LY/0ad1RCSUmBEXMOLUAxnubhc5Tu
 TVsHgm+m0vWRpMdwADrAeOBBVH0oknEA+qi3o7g1PBvEJ151zpzeZaoFz/43tNA5Iip/
 g0Yg==
X-Gm-Message-State: APjAAAX9nzaeb4wYNE6rT0/PJrSOYXzhOKcLmJLboNlFlisbmp/EO0Ti
 p3RG7P0JLYnhJQ/NsUTVqW6u1XSC
X-Google-Smtp-Source: APXvYqzRZBlKYY9cFBx33qJ+oQ6G4M5ddlxt1i/FiHlSyFR4UE0WpuyyhzqbH1vctkCSozjqwmhkzg==
X-Received: by 2002:ac8:5547:: with SMTP id o7mr34172816qtr.297.1566426264853; 
 Wed, 21 Aug 2019 15:24:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/37] drm/amd/powerplay: add smu tables for rn
Date: Wed, 21 Aug 2019 17:23:37 -0500
Message-Id: <20190821222359.13578-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4pRS6uR/UnKkMWiYnaaVnL/aphdhvq9rlOZxs9zAL0=;
 b=dftHjUAd4UEAmVz+lDczXlq7m/DWsKxdZ+H5Izifzvjn1G2EME4I/7RHlQcmaOf30L
 LJ1iStyMnwWSRk4Fu34KBE1SpHCchF8MoUEytOnRk8CT/VJ/5wqfMfpu1QlgXMhmZWsU
 OmTz6jNJFNw77CU86CKFPJ2Pl81u7GbnJ1W9ATQnDaGtBH07asLTZzR6wH/j6VsvqluT
 2qxYvSq5sku5xwfHuzDq8pmZ7MCtXQVQYPW4OUtHYGsTlwfo65NRcuNF3K96hIuAFQMy
 bR2UzRODtdSbzbUacKh0bGqDxzZz5LNcCkUfn1stnJaXsTQTuUzE7vhvUTQWWp9Zkl4P
 hjUA==
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

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmFkZCBhbmQgbWFwIHNtdSB0YWJs
ZXMgZm9yIHJlbm9pcgoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4g
V2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL2FtZGdwdV9zbXUuaCAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9yZW5vaXJfcHB0LmMgICAgfCAyNyArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL2FtZGdwdV9zbXUuaAppbmRleCA3YjM1MmM1YTQ1MWUuLjRkMTU2ZTVhYjJlOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC0yMzEs
NiArMjMxLDggQEAgZW51bSBzbXVfdGFibGVfaWQKIHsKIAlTTVVfVEFCTEVfUFBUQUJMRSA9IDAs
CiAJU01VX1RBQkxFX1dBVEVSTUFSS1MsCisJU01VX1RBQkxFX0NVU1RPTV9EUE0sCisJU01VX1RB
QkxFX0RQTUNMT0NLUywKIAlTTVVfVEFCTEVfQVZGUywKIAlTTVVfVEFCTEVfQVZGU19QU01fREVC
VUcsCiAJU01VX1RBQkxFX0FWRlNfRlVTRV9PVkVSUklERSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwppbmRleCAyNTgwMzgzZmY0OWIuLjdjM2RjMTUwZWFhMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMzMsNiAr
MzMsMTIgQEAKICNkZWZpbmUgTVNHX01BUChtc2csIGluZGV4KSBcCiAJW1NNVV9NU0dfIyNtc2dd
ID0gezEsIChpbmRleCl9CiAKKyNkZWZpbmUgVEFCX01BUF9WQUxJRCh0YWIpIFwKKwlbU01VX1RB
QkxFXyMjdGFiXSA9IHsxLCBUQUJMRV8jI3RhYn0KKworI2RlZmluZSBUQUJfTUFQX0lOVkFMSUQo
dGFiKSBcCisJW1NNVV9UQUJMRV8jI3RhYl0gPSB7MCwgVEFCTEVfIyN0YWJ9CisKIHN0YXRpYyBz
dHJ1Y3Qgc211XzEyXzBfY21uMmFpc2NfbWFwcGluZyByZW5vaXJfbWVzc2FnZV9tYXBbU01VX01T
R19NQVhfQ09VTlRdID0gewogCU1TR19NQVAoVGVzdE1lc3NhZ2UsICAgICAgICAgICAgICAgICAg
ICBQUFNNQ19NU0dfVGVzdE1lc3NhZ2UpLAogCU1TR19NQVAoR2V0U211VmVyc2lvbiwgICAgICAg
ICAgICAgICAgICBQUFNNQ19NU0dfR2V0U211VmVyc2lvbiksCkBAIC05Nyw2ICsxMDMsMTMgQEAg
c3RhdGljIHN0cnVjdCBzbXVfMTJfMF9jbW4yYWlzY19tYXBwaW5nIHJlbm9pcl9tZXNzYWdlX21h
cFtTTVVfTVNHX01BWF9DT1VOVF0gPQogCU1TR19NQVAoU2V0SGFyZE1pbkZjbGtCeUZyZXEsICAg
ICAgICAgICBQUFNNQ19NU0dfU2V0SGFyZE1pbkZjbGtCeUZyZXEpLAogfTsKIAorc3RhdGljIHN0
cnVjdCBzbXVfMTJfMF9jbW4yYWlzY19tYXBwaW5nIHJlbm9pcl90YWJsZV9tYXBbU01VX1RBQkxF
X0NPVU5UXSA9IHsKKwlUQUJfTUFQX1ZBTElEKFdBVEVSTUFSS1MpLAorCVRBQl9NQVBfSU5WQUxJ
RChDVVNUT01fRFBNKSwKKwlUQUJfTUFQX1ZBTElEKERQTUNMT0NLUyksCisJVEFCX01BUF9WQUxJ
RChTTVVfTUVUUklDUyksCit9OworCiBzdGF0aWMgaW50IHJlbm9pcl9nZXRfc211X21zZ19pbmRl
eChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiB7CiAJc3RydWN0IHNt
dV8xMl8wX2NtbjJhaXNjX21hcHBpbmcgbWFwcGluZzsKQEAgLTExMSw5ICsxMjQsMjMgQEAgc3Rh
dGljIGludCByZW5vaXJfZ2V0X3NtdV9tc2dfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbWMs
IHVpbnQzMl90IGluZGV4KQogCXJldHVybiBtYXBwaW5nLm1hcF90bzsKIH0KIAorc3RhdGljIGlu
dCByZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWlu
dDMyX3QgaW5kZXgpCit7CisJc3RydWN0IHNtdV8xMl8wX2NtbjJhaXNjX21hcHBpbmcgbWFwcGlu
ZzsKKworCWlmIChpbmRleCA+PSBTTVVfVEFCTEVfQ09VTlQpCisJCXJldHVybiAtRUlOVkFMOwor
CisJbWFwcGluZyA9IHJlbm9pcl90YWJsZV9tYXBbaW5kZXhdOworCWlmICghKG1hcHBpbmcudmFs
aWRfbWFwcGluZykpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIG1hcHBpbmcubWFwX3Rv
OworfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5j
cyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV9tc2dfaW5kZXgsCisJ
LmdldF9zbXVfdGFibGVfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleCwKIAkuc2V0
X3Bvd2VyX3N0YXRlID0gTlVMTCwKIH07CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
