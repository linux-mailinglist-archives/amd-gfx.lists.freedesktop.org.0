Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2157E42B
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BBE6E7DF;
	Thu,  1 Aug 2019 20:30:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940AB6E7D8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:22 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g18so53100121qkl.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lcnZPGEK0SVLHjC+TiEsBN2eGBqt2puGOtug1qnOIbA=;
 b=Cp1lttO3yRForP50og8LLFnN6Pz2gn4l6E3KBY1z250CjX/UIOTm82+7QYgbzD3W/k
 T49pdKoeJ9TiSR+BY30oa4Py3yM5d3i2XMt8VZMRHkamK9tkjRjUiaSwxIQo6kKLT2fz
 jkUYO9aiGH+iLBazBntjwYw1K7JRrDuPSXDDV1d6qWY4ae7AkRiWehMrHz5GgEOOApOr
 wCUI3L/Zia0DcwBhGdgNSChIcaMjVojIg1IX7Jxj/3XWQhWNFkEcgqFSv/lfx/zRjuuK
 lQou6HiEcjEkxbsJZ+981SC2TqRk2mK1elFSw+ATGRc0lVGpK7NGurjvhmt/3fLesCm7
 qhAA==
X-Gm-Message-State: APjAAAU8wXQql7EEzQPjxEnx5PCeKi6pFaM0+mXiV5uProJopIvTGcHs
 LyzNMl2hRAf+JCQPgz1VOuksFqIc
X-Google-Smtp-Source: APXvYqyNma41d9NhBXPxWQX/khHTkahpJ635dpOonJmzlBV4oXxdIGwjg0Dlt6dfy/e7ZSSNdgYvnQ==
X-Received: by 2002:a37:454e:: with SMTP id s75mr227243qka.183.1564691421530; 
 Thu, 01 Aug 2019 13:30:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/36] drm/amdgpu: add ip blocks for navi12
Date: Thu,  1 Aug 2019 15:29:39 -0500
Message-Id: <20190801202957.29791-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lcnZPGEK0SVLHjC+TiEsBN2eGBqt2puGOtug1qnOIbA=;
 b=YNxCXSgDMZirE1XvSTUSS7fz2m9MCDMfWuV1p9R39P4iVr34KwMn2Q1BtC5HyC/GOT
 aCYcxzesrE7C5feR95QPjmVBS72aK6n5dXyFqs7kQ9o2+h23GmiG4w6HUy+KnQgvjpDE
 u4pGtjRg/DkYyikAMfGSigD8iWR/fDEX7ph/NUDBRqOawPqLQ5im5z/F6MpNtiZbO9Q4
 XUuklcGE2o43BSb+RV/nCqEcWT+Gc7eVEV4Ly7MtSGFUyRPYeeDOdH+5BZbuGnewoTJh
 0KocPTY4EobNbpv7Z1WXXnV9xDoA1ZgJq+34nU1xCz3hf1f5IVTFrfu5B+6qxBNTeKZ0
 EEYA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9udi5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXggMzUyODQ3YWNmZWFlLi43Yzc0NTQxYzRlODIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtNDIxLDYgKzQyMSwxMyBAQCBpbnQgbnZfc2V0X2lw
X2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJaWYgKGFkZXYtPmVuYWJsZV9t
ZXMpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmbWVzX3YxMF8xX2lwX2Js
b2NrKTsKIAkJYnJlYWs7CisJY2FzZSBDSElQX05BVkkxMjoKKwkJYW1kZ3B1X2RldmljZV9pcF9i
bG9ja19hZGQoYWRldiwgJm52X2NvbW1vbl9pcF9ibG9jayk7CisJCWFtZGdwdV9kZXZpY2VfaXBf
YmxvY2tfYWRkKGFkZXYsICZnbWNfdjEwXzBfaXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lw
X2Jsb2NrX2FkZChhZGV2LCAmbmF2aTEwX2loX2lwX2Jsb2NrKTsKKwkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJmdmeF92MTBfMF9pcF9ibG9jayk7CisJCWFtZGdwdV9kZXZpY2Vf
aXBfYmxvY2tfYWRkKGFkZXYsICZzZG1hX3Y1XzBfaXBfYmxvY2spOworCQlicmVhazsKIAlkZWZh
dWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
