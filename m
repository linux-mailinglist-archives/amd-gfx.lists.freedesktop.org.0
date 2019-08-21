Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA39874D
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9A26EA3C;
	Wed, 21 Aug 2019 22:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D386EA31
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:37 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u190so3365669qkh.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=393Ig2Ny3VdOqMvRKtHOaSYfeAw9ewAPnOTXS7i1vTY=;
 b=P9fgfDu6Iq09PF5YgK5ARFeIYWqsA07PGIhnjrA0ah0rS/nRMwgZfsz+PaXHzE07ep
 Cfa8UGLU2DhP1B4cswzOdRut4ENmLD4f/9b1rJFzoF47v/nLJcjZ8ffAjimIgrYyAn9H
 uHtkz1Fivklp3LPIGmKffw9ahve1GrndG0qZcQGH3uZK8+njM+RubIdnQ3qliIS8a4/i
 tZRL3gvM+RgYMsT5j7E2Gg18m8uyG3m1w1XmkUdQnfJA9+oHl5qwNFmWbtKYf3AOZe/i
 1t8l9gDjeNK+adySL1MwaV4unBhrCXHR1e/oOYn7ZcJ8OLRc+HoU3ew2d/TvOVY4pAIV
 KaIg==
X-Gm-Message-State: APjAAAXhXLU0UvAGaICbb2GooIOrLksCkQgERP22odmXTRgDmRZRSRdP
 eVwFB9fzrlcer/8pFJCyu4WhflN1
X-Google-Smtp-Source: APXvYqypqefWrRlu7MGWaxwp3h5pOJvRbuDAAnZkxmET6TFBuhA2CypP/h/lBbeIszMcl3pRXSHuQA==
X-Received: by 2002:ae9:f801:: with SMTP id x1mr30401135qkh.242.1566426276013; 
 Wed, 21 Aug 2019 15:24:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 28/37] drm/amdgpu: enable DF clock gating for rn
Date: Wed, 21 Aug 2019 17:23:50 -0500
Message-Id: <20190821222359.13578-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=393Ig2Ny3VdOqMvRKtHOaSYfeAw9ewAPnOTXS7i1vTY=;
 b=PEnYr1wU1Ec5BRAJ1qnlFlvD8DmirHTZKb/crDeIBpZqzmPRBOqkZpvyWuoEuakKAa
 Vxbv7pSLcSttplLO/lAB79qT/akIZukMJBpVfF5Lih022ZdqeXAHeHyRX4ct/kbPI2kL
 AjIo+yLx0L4BlpNz0+Db/1cEIy3Dna+B/00nwImWMlK67k4HD3O0FEc8eMathSZAlGjL
 E5H+4wrRzoDUZDxoSBOomTsZsGt9ISUo2T4lOuNy0vb2bJ8OAm3wlNSYfa8G1+UmrNt1
 he3r2JW69pKBL2ERwTK2BpSwI8JDGd21m8mAOKQa8xfI0OX7GOf1r9m01GCqtVGiiJ9X
 ghGA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgREYgY2xvY2sg
Z2F0aW5nIGR1cmluZyBERiBJUCBlYXJseSBpbml0LgoKU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlh
bmcgPFByaWtlLkxpYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCAwNTUyOTQyZWU3MzIuLjZhYjQ0
NGQ2YmU3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMTcxLDcgKzExNzEs
OCBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJ
CQkgQU1EX0NHX1NVUFBPUlRfVkNOX01HQ0cgfAogCQkJCSBBTURfQ0dfU1VQUE9SVF9JSF9DRyB8
CiAJCQkJIEFNRF9DR19TVVBQT1JUX0FUSFVCX0xTIHwKLQkJCQkgQU1EX0NHX1NVUFBPUlRfQVRI
VUJfTUdDRzsKKwkJCQkgQU1EX0NHX1NVUFBPUlRfQVRIVUJfTUdDRyB8CisJCQkJIEFNRF9DR19T
VVBQT1JUX0RGX01HQ0c7CiAJCWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxf
cmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHg5MTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
