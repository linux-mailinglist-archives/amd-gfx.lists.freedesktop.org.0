Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EBF48F30
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2B89B99;
	Mon, 17 Jun 2019 19:31:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34C89B8E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so12256051qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wz5I4HOAjMgC++lk7D9W9cgh7018IVFDhgN4hx5+V28=;
 b=p2NhHEmaLm9CbdhUKOB5jo7CMB3/htOdQ8KNZMllwcMTNdAZom49neTu7AxEakXDtK
 gJSpPnnGL3zb6Wp3/VMHH5EyUtDNVWBGjBk0i3/1AhXnHNLSENXPcPRL0nZ/e02OLcI0
 pj45D5lMv27AsuRiN3PPSNFuWhPURQnMAek4Z3ZiMbCujYpAUXVsIY7evCzz4THbpmfD
 ASuuxI8KEvk/BrbWo7lZeuSK+L3vNE5pfqNQ2VKiOPemh81Kg/SrCWqkolT/TV0xJuCe
 3uonrBpm5urkYCwoYA9pDGXaXyS35tkg1+xpTCk6M+dml2WB1Iqy7D5h3dIoZA5ipTNu
 9rOw==
X-Gm-Message-State: APjAAAWQmH4MHpzsT57ll4c0ZkMAoLRQKk68Q00cE1HZVrccs98pNqA9
 YTwBWKwt2mHPIDfYNj994OMd/adLybw=
X-Google-Smtp-Source: APXvYqwFZhIM7sr7M0j2eiPrE8on4aBNQ/1cCG47abjEiyNqMiWoLStN4NP+I029gqYYwQK040KYhA==
X-Received: by 2002:a0c:9332:: with SMTP id d47mr22943167qvd.222.1560799880392; 
 Mon, 17 Jun 2019 12:31:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 207/459] drm/amdgpu/ucode: add mes firmware file support
Date: Mon, 17 Jun 2019 14:29:34 -0500
Message-Id: <20190617193106.18231-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wz5I4HOAjMgC++lk7D9W9cgh7018IVFDhgN4hx5+V28=;
 b=doIlmzLRgdDocdl784K8r+nUFIEXohOkSzPOxSGrBh6/I0hy/dTo+31DJmK1J+mYhV
 jCb7s1L1Gvn+GkfQlyopJcLnfiuzx2QyYAsKOSwA/ZZ6a3U9/3q7Pe1QJnpPv3lBmjnQ
 OoM2L6mt0H1SzFxwxFzfyyw5/8AewhcHmhVQxc2JW7kvj4lwBOmyNlZRKbi8ckps6gnc
 W85iy651TsWTUGyxk6umoQGJIjJucpuWJ1gVgbdDDA02qci+uowl9roaUm8LLMCnA8iw
 nHNyE3FmLWbbT2v7VwAPCLkxnwCfsO7CIE6/E6X/3G07Dp3iknE5YAzrpEOVtsqg+zon
 f4aw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClRoZSBuZXdseSBhZGRlZCBmaXJt
d2FyZSBzdHJ1Y3QgaXMgZm9yIG1lcyBmaXJtd2FyZSBmaWxlLgoKU2lnbmVkLW9mZi1ieTogSmFj
ayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91Y29kZS5oIHwgMTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKaW5kZXgg
YWFlZDhmZTk0ZWUzLi4zNzgxMGUwNzMwNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91Y29kZS5oCkBAIC0xMDQsNiArMTA0LDIxIEBAIHN0cnVjdCBnZnhfZmlybXdhcmVf
aGVhZGVyX3YxXzAgewogCXVpbnQzMl90IGp0X3NpemU7ICAvKiBzaXplIG9mIGp0ICovCiB9Owog
CisvKiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25fbWlub3I9MCAqLworc3RydWN0IG1lc19maXJt
d2FyZV9oZWFkZXJfdjFfMCB7CisJc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgaGVhZGVy
OworCXVpbnQzMl90IG1lc191Y29kZV92ZXJzaW9uOworCXVpbnQzMl90IG1lc191Y29kZV9zaXpl
X2J5dGVzOworCXVpbnQzMl90IG1lc191Y29kZV9vZmZzZXRfYnl0ZXM7CisJdWludDMyX3QgbWVz
X3Vjb2RlX2RhdGFfdmVyc2lvbjsKKwl1aW50MzJfdCBtZXNfdWNvZGVfZGF0YV9zaXplX2J5dGVz
OworCXVpbnQzMl90IG1lc191Y29kZV9kYXRhX29mZnNldF9ieXRlczsKKwl1aW50MzJfdCBtZXNf
dWNfc3RhcnRfYWRkcl9sbzsKKwl1aW50MzJfdCBtZXNfdWNfc3RhcnRfYWRkcl9oaTsKKwl1aW50
MzJfdCBtZXNfZGF0YV9zdGFydF9hZGRyX2xvOworCXVpbnQzMl90IG1lc19kYXRhX3N0YXJ0X2Fk
ZHJfaGk7Cit9OworCiAvKiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25fbWlub3I9MCAqLwogc3Ry
dWN0IHJsY19maXJtd2FyZV9oZWFkZXJfdjFfMCB7CiAJc3RydWN0IGNvbW1vbl9maXJtd2FyZV9o
ZWFkZXIgaGVhZGVyOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
