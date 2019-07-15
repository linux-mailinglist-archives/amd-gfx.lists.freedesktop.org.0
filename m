Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37FA69E3B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056BE89FC3;
	Mon, 15 Jul 2019 21:25:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3D89FAD
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:50 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a15so17249685qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUSQtpC0ClK2V3rZGqDk7YIpCZeo/K2AW93musAYQOE=;
 b=LjmaUeOgygpHEcAZxt3MWtPHevY/oxCT8AD4sH4BdqCUyTmxf7A8gAyYgp7vjaCN9C
 nF7CiAE4u/BmGjA3bHQsLQsyCe/AZIbrk/RtSxhhS6frBcLac6yERa5gfgEp5gVcRWwP
 XIBXi9QaPMEMyrYAw7ODv0V8NmhFj6dIpRg74dlCsHXJHeiT1/TC6RnYhckfap7Fm6NZ
 HifEH79G/XPK/Y0JXpFrg2thc/tCjG8V9sBbiDce1FkSnIZN1T2Vw8mOosI52dwXJ6VQ
 Dj2cutLX77c+CLYlOIawi4FczH08LvzJpeLdGK6AZkfSx2tbKungEiUU7FQr2aLcIYqu
 R1og==
X-Gm-Message-State: APjAAAV/jyEms/0x98WUaA7iMvjnvhD6lGloDPUJW9ab8PHC1uKH1SOL
 MJhOQ1VpEN+TbpDeUJpjxNBDy6il
X-Google-Smtp-Source: APXvYqw8tJyfyDvyPIS7BcY1xfvrIzk1PpgSqnNeyEM/b60TUb/Hy30MD3pnvF91/HWTNr2tobkteg==
X-Received: by 2002:a05:6214:3f0:: with SMTP id
 cf16mr20625039qvb.211.1563225949695; 
 Mon, 15 Jul 2019 14:25:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 072/102] drm/amdgpu: set system aperture to cover whole FB
 region in mmhub v9.4
Date: Mon, 15 Jul 2019 16:24:07 -0500
Message-Id: <20190715212437.31793-70-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUSQtpC0ClK2V3rZGqDk7YIpCZeo/K2AW93musAYQOE=;
 b=gR9Chahcs5Plewk10a9KIEbi132uttTxvY4c2I2BKKrLzb1ZERA3D0UTurngpRK4F2
 aMRbTThpoAX/ABcg5U/kIG35lPRcqGMvo/VEZ7uXDoU0o5kRgU9tHl5PCeOQAeAuRRf5
 vfEzRzV1H1hY4peAbBRbtGySSWMndh1XHNzngd7TFBK98EezloXyiXwhfk3Q429rA7Q0
 ODru30/i25ABEU2P9x/5E19lisJTqHs8bT8bY5J5O77vFkVX3DqxxSPlDOGc0JnUB7fk
 qODbTd5zPhotkp5RljkoRFECI83B5f5JP1hKPc4rBgCaiS/zjme2LWDQ7To0J76l67vf
 cYQQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpJbiBYR01JIGNvbmZpZ3VyYXRpb24sIHRoZSBG
QiByZWdpb24gY292ZXJzIHZyYW0gcmVnaW9uIGZyb20gcGVlcgpkZXZpY2UsIGFkanVzdCBzeXN0
ZW0gYXBlcnR1cmUgdG8gY292ZXIgYWxsIG9mIHRoZW0KClNpZ25lZC1vZmYtYnk6IExlIE1hIDxs
ZS5tYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyB8IDUgKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jCmluZGV4IDZiN2NkYWFkYmQ3MC4uYzBlYjhmMGEy
MTgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jCkBAIC0xMTQsMTIg
KzExNCwxMSBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92OV80X2luaXRfc3lzdGVtX2FwZXJ0dXJlX3Jl
Z3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhV
QiwgMCwKIAkJCSAgICBtbVZNU0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1dfQURE
UiwKIAkJCSAgICBodWJpZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVSX09GRlNFVCwKLQkJCSAg
ICBtaW4oYWRldi0+Z21jLnZyYW1fc3RhcnQsIGFkZXYtPmdtYy5hZ3Bfc3RhcnQpCi0JCQkgICAg
Pj4gMTgpOworCQkJICAgIG1pbihhZGV2LT5nbWMuZmJfc3RhcnQsIGFkZXYtPmdtYy5hZ3Bfc3Rh
cnQpID4+IDE4KTsKIAlXUkVHMzJfU09DMTVfT0ZGU0VUKE1NSFVCLCAwLAogCQkJICAgIG1tVk1T
SEFSRURWQzBfTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0hJR0hfQUREUiwKIAkJCSAgICBodWJpZCAq
IE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVSX09GRlNFVCwKLQkJCSAgICBtYXgoYWRldi0+Z21jLnZy
YW1fZW5kLCBhZGV2LT5nbWMuYWdwX2VuZCkgPj4gMTgpOworCQkJICAgIG1heChhZGV2LT5nbWMu
ZmJfZW5kLCBhZGV2LT5nbWMuYWdwX2VuZCkgPj4gMTgpOwogCiAJLyogU2V0IGRlZmF1bHQgcGFn
ZSBhZGRyZXNzLiAqLwogCXZhbHVlID0gYWRldi0+dnJhbV9zY3JhdGNoLmdwdV9hZGRyIC0gYWRl
di0+Z21jLnZyYW1fc3RhcnQgKwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
