Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CAB49069
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3946E067;
	Mon, 17 Jun 2019 19:50:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95336E05C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:26 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so7028752qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjpCMcYly+7VG8XxgVv1ZqMk78s5yiEDLWNy7OApJPs=;
 b=OPWjc8tED6QULuDkKYks99h4/l9fgI29653ii3PvCekBzQejKQKHUcusuW/bmOgJIh
 B4ASnD7R0DfxAY5EkJnKsxhCp1XHFdcOgs5g2nkofXBrol0Keq/99JuOpGJp5nn34Gmw
 /ZkkjZ2xQWoKsaL6TFfwiTci65hwbmq5TA2zOBiwQk66tq1SWrNhqbph8mmVbdUf7cFm
 79n4y+K+BrE5e1FAmdt0m1GjNbRsFRbVjHbueIPYS+b2rplLLC4gC6m+wrT+960fkxqv
 p3nDBZ5JyVUz2w3T0pExjcSGwFJz+vAJUB0WVMn47Dd3D+R+mdS0+LpEvqsd4t1cNjxI
 hseQ==
X-Gm-Message-State: APjAAAUiHNMGU3KjlKGBPcn9UOj0u87UJYUGU3dBIbNukq7n3V/pvHAe
 YA2blBtT6dpLBK77L0HPwgmLekpbbVXU/g==
X-Google-Smtp-Source: APXvYqzeARNBxYp9pZUhcNYznYHKTRTUZHxM2G25Y/rQ/uol/SgdGm4+iGtNyhybCN/ZdC2ywlq+uw==
X-Received: by 2002:a37:8007:: with SMTP id b7mr70296154qkd.102.1560801025740; 
 Mon, 17 Jun 2019 12:50:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 429/459] drm/amd/display: DCN2 Engine-specifc encoder
 allocation
Date: Mon, 17 Jun 2019 14:49:18 -0500
Message-Id: <20190617194948.18667-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjpCMcYly+7VG8XxgVv1ZqMk78s5yiEDLWNy7OApJPs=;
 b=cJSmyeD5oNmli7fnCl2R+cK/vY/uhK04hgQ0mV2T9ycpKYk71QmilkYDj10x7MeN0U
 E+38TOoYATWJtOHkrLKc30lTXWc1vTrMLWPttmruNLgLmlPYnZ/71Cw1Uxki7w7+XEeD
 PavMnVOlnEtyKRQt7utzAvuBVaIRA/OMNGx7Ut/z4CNskmcs4yWUf3/Hy8oIm66lPye+
 3x/F4kQO2XSA/s3WXRdBgyFtgyb5hhq1ND+D+4TgKFziT++I/TjaLN+hSoZGNFV+Q3Eq
 XwTR3ZhwwW7ZolP/Sz6FNmaeN6r80ggz6SY6gj5hinQrqrSw3KO03QtdA7sswfWjxizu
 CtoQ==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldCkZy
b20gRENFMTEwIG9ud2FyZCwgd2UgaGF2ZSB0aGUgYWJpbGl0eSB0byBhc3NpZ24gRElHIEJFIGFu
ZCBGRQpzZXBhcmF0ZWx5IGZvciBhbnkgZGlzcGxheSBjb25uZWN0b3IgdHlwZTsgYmVmb3JlLCB3
ZSBjb3VsZCBvbmx5IGRvIHRoaXMKZm9yIERQLgoKU2lnbmVkLW9mZi1ieTogV2VzbGV5IENoYWxt
ZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRv
bnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggYWM2NTc5NGM3ZmE2Li44YjQ4NTNkZDRm
ZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jCkBAIC0yNDQ2LDggKzI0NDYsOSBAQCBzdGF0aWMgc3RydWN0IHJlc291
cmNlX2Z1bmNzIGRjbjIwX3Jlc19wb29sX2Z1bmNzID0gewogCS5zZXRfbWNpZl9hcmJfcGFyYW1z
ID0gZGNuMjBfc2V0X21jaWZfYXJiX3BhcmFtcywKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19E
U0NfU1VQUE9SVAogCS5hZGRfZHNjX3RvX3N0cmVhbV9yZXNvdXJjZSA9IGRjbjIwX2FkZF9kc2Nf
dG9fc3RyZWFtX3Jlc291cmNlLAotCS5yZW1vdmVfZHNjX2Zyb21fc3RyZWFtX3Jlc291cmNlID0g
ZGNuMjBfcmVtb3ZlX2RzY19mcm9tX3N0cmVhbV9yZXNvdXJjZQorCS5yZW1vdmVfZHNjX2Zyb21f
c3RyZWFtX3Jlc291cmNlID0gZGNuMjBfcmVtb3ZlX2RzY19mcm9tX3N0cmVhbV9yZXNvdXJjZSwK
ICNlbmRpZgorCS5maW5kX2ZpcnN0X2ZyZWVfbWF0Y2hfc3RyZWFtX2VuY19mb3JfbGluayA9IGRj
ZTExMF9maW5kX2ZpcnN0X2ZyZWVfbWF0Y2hfc3RyZWFtX2VuY19mb3JfbGluawogfTsKIAogYm9v
bCBkY24yMF9kd2JjX2NyZWF0ZShzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LCBzdHJ1Y3QgcmVzb3Vy
Y2VfcG9vbCAqcG9vbCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
