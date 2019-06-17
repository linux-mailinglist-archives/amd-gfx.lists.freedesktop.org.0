Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B467D48EFD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B4A89B20;
	Mon, 17 Jun 2019 19:28:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FD689B00
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j19so12181071qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiopGNfU5Ey1acrKxlZWpasx5meDhfcVU2IYu6e5DyE=;
 b=MI+D9peShXsRz/+3+vfsC67/17zCr7/wolKYkAUZU4m9K2yhR1qiNWlkvatg7vpQRQ
 vA90Zi77J1sWFM2EB+HyuqraqNEcMqlUeLagBnqxlcbw80NgidZLWhEnNhBal7bBZFe+
 yv4OebO83kQW1/sgxP6VvZwyS4WCwoCv/X1DiYOB6ihX4KdfDbpFms7F8Sv0kCLnOSfp
 QTsDqlkqx3vUrAJe88M/j29KFf7grvul4C4VQokc3uWm9arzFwcigzE7s+2Oayp3Fqzp
 aED4q1zXXAdkJQIIVOmnLUX5pX4CnPN12so59YJVS7SET7eBP3fhX2KFWtjtwmyWq1ry
 cyQw==
X-Gm-Message-State: APjAAAWopnio9mn/D0nghPSqRr27TdhROU7lzH5bL23akzNXehBEYRGS
 hgcGWh24laIPvG/SJB0P0mREPGO9Rno=
X-Google-Smtp-Source: APXvYqx4pMmtIigmKW7YgAHbZvfKMP7xcZhUZD+koIrVgYquuBhdE7S/Oz0v083In++RKqW28rfN3w==
X-Received: by 2002:ac8:2e6a:: with SMTP id s39mr92963668qta.201.1560799714637; 
 Mon, 17 Jun 2019 12:28:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 188/459] drm/amdgpu/gfx10: update gfx golden settings
Date: Mon, 17 Jun 2019 14:26:53 -0500
Message-Id: <20190617192704.18038-89-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiopGNfU5Ey1acrKxlZWpasx5meDhfcVU2IYu6e5DyE=;
 b=bbpCPZsTtrVI0SXReU2pwxAWZ6tAu8E5opj/vgOvt/rxjpn4fLBlJfCSB+l8L7VToj
 JEiaMMHCsbUq73dLd97voDnq2c3szA38SWHp0WnSIGJ80lAlgv/lgCgG3cfVzzOf/2pf
 Zf9NYXarii9KosDWh19mbdu/rhgO+EQ64csVFnw+9YMDHCrH9E2kLGR2jKn0BYPWSP1b
 JWnvuP6itvyaqVdc/Ve7TJwNdkFnEtws8qGGFgiakqNm8zyXiZiTqynj5zGnqHVoYQj6
 wxpgNGFbFmBkqSIc7muMKOIC3TGUrWdaOS7dAwDwy5MVFvnB+hUhaBiH4Cyibp6yfQCa
 exww==
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
 tiancyin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCmFkZCBuZXcgcmVnaXN0ZXJzOiBt
bUNHVFRfU1BJX0NMS19DVFJMLCBtbURCX0RFQlVHMyBhbmQKbW1HTDJDX0NHVFRfU0NMS19DVFJM
LgoKUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFRpYW5jaSBZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDBkNWQ4NmE1
ZDYyZi4uNGU3ZjY0ZDkxZDEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YwpAQCAtNjcsNiArNjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4g
Z29sZGVuX3NldHRpbmdzX2djXzEwXzFbXSA9CiB7CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1DQl9IV19DT05UUk9MXzQsIDB4ZmZmZmZmZmYsIDB4MDA0MDAwMTQpLAogCVNPQzE1
X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ0dUVF9DUEZfQ0xLX0NUUkwsIDB4ZmNmZjhmZmYs
IDB4ZjgwMDAxMDApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ0dUVF9TUElf
Q0xLX0NUUkwsIDB4YzAwMDAwMDAsIDB4YzAwMDAxMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFM
VUUoR0MsIDAsIG1tQ0dUVF9TUV9DTEtfQ1RSTCwgMHg2MDAwMGZmMCwgMHg2MDAwMDEwMCksCiAJ
U09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1DR1RUX1NRR19DTEtfQ1RSTCwgMHg0MDAw
MDAwMCwgMHg0MDAwMDEwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1DR1RU
X1ZHVF9DTEtfQ1RSTCwgMHhmZmZmOGZmZiwgMHhmZmZmODEwMCksCkBAIC03Niw2ICs3Nyw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2Nf
MTBfMVtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX1NEX0NOVEwsIDB4
MDAwMDA3ZmYsIDB4MDAwMDA1ZmYpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1t
REJfREVCVUcsIDB4MjAwMDAwMDAsIDB4MjAwMDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFM
VUUoR0MsIDAsIG1tREJfREVCVUcyLCAweGZmZmZmZmZmLCAweDAwMDAwNDIwKSwKKwlTT0MxNV9S
RUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0RFQlVHMywgMHgwMDAwMDIwMCwgMHgwMDAwMDIw
MCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERUJVRzQsIDB4MDc4MDAw
MDAsIDB4MDQ4MDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfREZT
TV9USUxFU19JTl9GTElHSFQsIDB4MDAwMGZmZmYsIDB4MDAwMDAwM2YpLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tREJfTEFTVF9PRl9CVVJTVF9DT05GSUcsIDB4ZmZmZmZmZmYs
IDB4MDM4NjAyMDQpLApAQCAtODYsNiArODgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1
X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzEwXzFbXSA9CiAJU09DMTVfUkVHX0dPTERF
Tl9WQUxVRShHQywgMCwgbW1HTDJfUElQRV9TVEVFUl8xLCAweDc3Nzc3Nzc3LCAweDAyMzEwMjMx
KSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMkFfQUREUl9NQVRDSF9NQVNL
LCAweGZmZmZmZmZmLCAweGZmZmZmZmNmKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAw
LCBtbUdMMkNfQUREUl9NQVRDSF9NQVNLLCAweGZmZmZmZmZmLCAweGZmZmZmZmNmKSwKKwlTT0Mx
NV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMkNfQ0dUVF9TQ0xLX0NUUkwsIDB4MTAwMDAw
MDAsIDB4MTAwMDAxMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0wyQ19D
VFJMMiwgMHhmZmZmZmZmZiwgMHgxNDAyMDAyZiksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1HTDJDX0NUUkwzLCAweGZmZmY5ZmZmLCAweDAwMDAxMTg4KSwKIAlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbVBBX1NDX0VOSEFOQ0UsIDB4M2ZmZmZmZmYsIDB4MDgwMDAw
MDkpLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
