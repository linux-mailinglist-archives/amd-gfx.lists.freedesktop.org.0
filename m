Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C958DF0F
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096CC6E841;
	Wed, 14 Aug 2019 20:41:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611F06E841
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:41:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d23so227845qko.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 13:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vclbIAzdjSzFERN1pqet/Y9FtJfDdVKNLKgqcRdKbLg=;
 b=m4UbBERESFpA1+2naeKgSxg9GRHGdCc/jH0d8lGcRDY4McdbH9yAOWqaUJ2EdSrOZg
 Qxdg6vSkKlULvrxBpujbweAegw2cHoLfWlOtfr7XPWffMxiBzfE1q403OkegaHSWuO4o
 zfNkIopXqILiGft7bT6dhu5IS8Ma5oyGDJArkrcFgwlcgEA3hrnnCeIvhTdKzcKAxDoW
 zdWgT5DRl5oJRBgVz804kxVpeBgAACoYYZoJpXW+krq8pTkkyrsiHPAxcEhao7hnkIh3
 Jcf1xioxmjc4tErYVt/52cwzJnsy3NVyESj72MVKlDD8HBiAo0uxA7OJd7gy0dO4qrFg
 KkyA==
X-Gm-Message-State: APjAAAUXmOuZciS7OiBSAD4+kwGGjqxSt7hQGLJk+5Ntw9MtBl4Pw1tZ
 dwkQWDfPvEti1DKwP5sGr0vQJ4Cj
X-Google-Smtp-Source: APXvYqxbCNlZ0GB2AVBF2/nW2BWaopDSEumErx7KcJcEzPOsL6iDaQ0498VqSgQJR8+Fz68W1HGD7A==
X-Received: by 2002:a37:ae42:: with SMTP id x63mr1091413qke.41.1565815316212; 
 Wed, 14 Aug 2019 13:41:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.46.89])
 by smtp.gmail.com with ESMTPSA id x46sm440471qtx.96.2019.08.14.13.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 13:41:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)
Date: Wed, 14 Aug 2019 15:41:49 -0500
Message-Id: <20190814204149.22226-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vclbIAzdjSzFERN1pqet/Y9FtJfDdVKNLKgqcRdKbLg=;
 b=jjZffk1YRR2jePhnFiCU9jjD7Ff/zLZ84/5mOWTrLAV5urHnD5rabamOWe/eDKA0KK
 jYJ9Z2Zm0Ou/QttSKWcEa68QqHDCC5+c7dtj6beCOvpoiM1ms23FR77YVCEgZZCGjIOT
 wNcrkeLfeLMs8IAndcla9cncacdDfRDf54eu+wHj1ucJYpvyoePNZdI0YKbJ26mYuZUL
 Pr0HEJ2aqpprav+4X+WBQF5z1GP7yqXHIuN+5J2hB1X29GWxXeqLBrZZMfEtSXkOivko
 A1J2xbgUhSRm0gE+hyg5V33u/ATaNn2taO7F5FEc/w9a54KQ2t20RgpWhMCOP/Z9YMDQ
 nNhg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+CgpUaGlzIGZpeGVzIHNjcmVlbiBjb3JydXB0
aW9uL2ZsaWNrZXJpbmcgb24gNzUgSHogZGlzcGxheXMuCgp2MjogbWFrZSBwcmludCBzdGF0ZW1l
bnQgZGVidWcgb25seSAoQWxleCkKCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Au
b3JnL3Nob3dfYnVnLmNnaT9pZD0xMDI2NDYKU2lnbmVkLW9mZi1ieTogQWh6byA8QWh6b0B0dXRh
bm90YS5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3
bWdyLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCmluZGV4IDEw
ZDY2ZTNjN2E5Zi4uYjQ2OGY2MzRmZmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCkBAIC00MDY3LDYgKzQwNjcsMTEgQEAgc3RhdGlj
IGludCBzbXU3X3Byb2dyYW1fZGlzcGxheV9nYXAoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAog
CWRhdGEtPmZyYW1lX3RpbWVfeDIgPSBmcmFtZV90aW1lX2luX3VzICogMiAvIDEwMDsKIAorCWlm
IChkYXRhLT5mcmFtZV90aW1lX3gyIDwgMjgwKSB7CisJCXByX2RlYnVnKCIlczogZW5mb3JjZSBt
aW5pbWFsIFZCSVRpbWVvdXQ6ICVkIC0+IDI4MFxuIiwgX19mdW5jX18sIGRhdGEtPmZyYW1lX3Rp
bWVfeDIpOworCQlkYXRhLT5mcmFtZV90aW1lX3gyID0gMjgwOworCX0KKwogCWRpc3BsYXlfZ2Fw
MiA9IHByZV92YmlfdGltZV9pbl91cyAqIChyZWZfY2xvY2sgLyAxMDApOwogCiAJY2dzX3dyaXRl
X2luZF9yZWdpc3Rlcihod21nci0+ZGV2aWNlLCBDR1NfSU5EX1JFR19fU01DLCBpeENHX0RJU1BM
QVlfR0FQX0NOVEwyLCBkaXNwbGF5X2dhcDIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
