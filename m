Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9D4904E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2206E041;
	Mon, 17 Jun 2019 19:50:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B126E040
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:01 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d15so6997275qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJbVDVwu/nnPkAfN0zoMM86h6fgMoz0/Wl5xNYJQtxk=;
 b=abvZ5d0EzI/MEW9wbFHsp0cnBDS68nKQLriJy5LClxp4XrWk2qv0ZbDTBYM0WVyL86
 XY0+WAbhD956w5743xkGBZuyh13tCqY1TQiOlRpUsVhBSGd8xnQFyzeweJQap3l84ZMW
 hlUwitSg2LbUOvCCrWyUiU6h+gXX7AKzQHweedSHivUM9+ED78+5NitmwrtDSm7hD+mh
 3D3tiaqfwko1a7rrZB3LvOqtNro2gWfDyHIWfsXzmnDCQAGcbd4x1ut/SpKFDMTvdenj
 RyA5mswygXOrowzebo4XCoy2e6wc2PnsKGktbPxh1rWZi21GUrGEDAVbeqjICIgM2QAw
 Nysg==
X-Gm-Message-State: APjAAAXrpjdyagR1ZFdii2Ic4Mkve07rxEsnW+mearb2gb/Ce2CB2i1R
 eO8dNpD5cd8K9Okok8nbK+SR7ObM37yLvw==
X-Google-Smtp-Source: APXvYqwWuJtUo2R16KAt6FgTB4scMqVyHp0IBgYIPOeMy62BZ5/nTRwp4o4onlRxUJPY3i7F0ZMMEg==
X-Received: by 2002:a37:8002:: with SMTP id b2mr92021511qkd.289.1560801000779; 
 Mon, 17 Jun 2019 12:50:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.49.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 405/459] drm/amd/display: Make sure line size is not zero in
 DCN2 line buffer size calculations
Date: Mon, 17 Jun 2019 14:48:54 -0500
Message-Id: <20190617194948.18667-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJbVDVwu/nnPkAfN0zoMM86h6fgMoz0/Wl5xNYJQtxk=;
 b=a6MT5ayRBK9WRIl1F4mi8ksOArNF9Mhjuh4rh4cxVMpu/F/5GYm7MxDvFZJp8MmNoX
 AlxaxLL6b6okQeBCTu61/MjNLzliUXMmUgAnxB9AwLCBHGX3k8WeP7YZ7lq/NiDGrX8M
 +LHbBLMVBfdC7yL+IsueyFH4l2SwvxTKdLn/Aqqz8Wiqv1HA625bFNBwcDTaqcySR8t1
 29iMwsmG6KMnpTi7ejg6sggO2ZbNtVRCW0g3A/TZtvV4n+wjcNO/CreYYWF1JsJceVy3
 K7gldXO+xK8ieWFrDyhzUXcW96BNDiD5G4CLqWMZ3XnovPQKEO+FDQEqG+FQfoTOKwOO
 q7wQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KJ0Rpdmlk
ZSBieSB6ZXJvJyBlcnJvciBoYXBwZW5zIHdoZW4gbGluZSBzaXplIGhhcHBlbnMgdG8gYmUgemVy
by4KCltob3ddClRoZSBjb2RlIHRoYXQgbWFrZXMgc3VyZSBsaW5lIHNpemUgbWluaW11bSB2YWx1
ZSBjYW4gYmUgMSB3YXMgYWxyZWFkeQpwcmVzZW50IGluIERDTjEgcGFydCBvZiB0aGUgZHJpdmVy
LCB0aGlzIGlzIG1lYXJseSBhIHBvcnQgdG8gRENOMi4KClNpZ25lZC1vZmYtYnk6IE5pa29sYSBD
b3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRv
bnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfZHBwLmMgICAgfCAxNyArKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5jCmluZGV4IGI3MDYxOTBlMTZjMS4uOWJjNWRkMjNk
Mjk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfZHBwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2RwcC5jCkBAIC0yNTEsMTQgKzI1MSwyMyBAQCB2b2lkIGRzY2wyX2NhbGNfbGJfbnVtX3BhcnRp
dGlvbnMoCiAJCWludCAqbnVtX3BhcnRfeSwKIAkJaW50ICpudW1fcGFydF9jKQogeworCWludCBt
ZW1vcnlfbGluZV9zaXplX3ksIG1lbW9yeV9saW5lX3NpemVfYywgbWVtb3J5X2xpbmVfc2l6ZV9h
LAorCWxiX21lbW9yeV9zaXplLCBsYl9tZW1vcnlfc2l6ZV9jLCBsYl9tZW1vcnlfc2l6ZV9hLCBu
dW1fcGFydGl0aW9uc19hOworCiAJaW50IGxpbmVfc2l6ZSA9IHNjbF9kYXRhLT52aWV3cG9ydC53
aWR0aCA8IHNjbF9kYXRhLT5yZWNvdXQud2lkdGggPwogCQkJc2NsX2RhdGEtPnZpZXdwb3J0Lndp
ZHRoIDogc2NsX2RhdGEtPnJlY291dC53aWR0aDsKIAlpbnQgbGluZV9zaXplX2MgPSBzY2xfZGF0
YS0+dmlld3BvcnRfYy53aWR0aCA8IHNjbF9kYXRhLT5yZWNvdXQud2lkdGggPwogCQkJc2NsX2Rh
dGEtPnZpZXdwb3J0X2Mud2lkdGggOiBzY2xfZGF0YS0+cmVjb3V0LndpZHRoOwotCWludCBtZW1v
cnlfbGluZV9zaXplX3kgPSAobGluZV9zaXplICsgNSkgLyA2OyAvKiArNSB0byBjZWlsICovCi0J
aW50IG1lbW9yeV9saW5lX3NpemVfYyA9IChsaW5lX3NpemVfYyArIDUpIC8gNjsgLyogKzUgdG8g
Y2VpbCAqLwotCWludCBtZW1vcnlfbGluZV9zaXplX2EgPSAobGluZV9zaXplICsgNSkgLyA2OyAv
KiArNSB0byBjZWlsICovCi0JaW50IGxiX21lbW9yeV9zaXplLCBsYl9tZW1vcnlfc2l6ZV9jLCBs
Yl9tZW1vcnlfc2l6ZV9hLCBudW1fcGFydGl0aW9uc19hOworCisJaWYgKGxpbmVfc2l6ZSA9PSAw
KQorCQlsaW5lX3NpemUgPSAxOworCisJaWYgKGxpbmVfc2l6ZV9jID09IDApCisJCWxpbmVfc2l6
ZV9jID0gMTsKKworCW1lbW9yeV9saW5lX3NpemVfeSA9IChsaW5lX3NpemUgKyA1KSAvIDY7IC8q
ICs1IHRvIGNlaWwgKi8KKwltZW1vcnlfbGluZV9zaXplX2MgPSAobGluZV9zaXplX2MgKyA1KSAv
IDY7IC8qICs1IHRvIGNlaWwgKi8KKwltZW1vcnlfbGluZV9zaXplX2EgPSAobGluZV9zaXplICsg
NSkgLyA2OyAvKiArNSB0byBjZWlsICovCiAKIAlpZiAobGJfY29uZmlnID09IExCX01FTU9SWV9D
T05GSUdfMSkgewogCQlsYl9tZW1vcnlfc2l6ZSA9IDk3MDsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
