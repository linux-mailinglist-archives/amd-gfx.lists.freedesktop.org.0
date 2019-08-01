Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CF7E437
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4456E7FA;
	Thu,  1 Aug 2019 20:30:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778BD6E7FA
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s145so53113707qke.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMjfMmHyEbTiNZJI+CTmLptj31YjZdcEu84GqDQFY1Q=;
 b=jHMznXKnyG1qxOk3gzJRPqbPdSdLnocjaNJqpUwb9lmEw3GWhfrMvyqpI0wSNiK1Ct
 kd0UZLITISff8BobFzfHsLBILjbCFI2mE+W5DFqNN5PE+T55N2JIzM1u1rJYKdRSC81/
 jK/ZB+12rgoNRI4rlSpnwaQSQT4MKJr4rcc+pAIIpk1sH3y0be8X3Eh+ISV42FRSm0M2
 WxgGLeHxIazVTX6w6gSsY+KjDhmvetcz4P0XT+6wXQwUw+tGyVYuC1NtLwoCczHtYuuN
 tC7/bu3NcvIln2oz1ESDPOB1a8FE4E63+/sWqn5+9trkD7aNCAeo/HOesDZUcRSeK3tq
 3TqA==
X-Gm-Message-State: APjAAAXKRlA6/SDqIypx6q29cSiaZUW0+CSjoFRMBAZqhfmy0rLVTcKb
 d8qqaT7SAGLJGauQ4wbIFklvxjCW
X-Google-Smtp-Source: APXvYqxqdIxQ3ixqH+3MLikpqTuJhl3wI5ig6yYMtD6Cyq/Uno6BfQLku04VtfMgw/E+vZLJvKIp+Q==
X-Received: by 2002:a37:b741:: with SMTP id h62mr88254320qkf.490.1564691432323; 
 Thu, 01 Aug 2019 13:30:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 30/36] drm/amdgpu: add Navi12 VCN firmware support
Date: Thu,  1 Aug 2019 15:29:51 -0500
Message-Id: <20190801202957.29791-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMjfMmHyEbTiNZJI+CTmLptj31YjZdcEu84GqDQFY1Q=;
 b=P6+tSorW2/RH1ery+9+clkapjT9ya8X7mbFaWiBu83nP4UiwdN6+x+utrooRztwwKF
 dghYSOrOpepRtxg2tq/oi4aa6EDN5FscP4yi5jFlayIzt2XsxpxlyhYdtreAFLyB9V4d
 lefpXCksyTX/7O7UpvqvGwFsup5VBTsQDYhYuCmOLqQZihQkVTeuxrZGJ5DkB9IQ2xQp
 7th53CcYBgFz3yCPYzlOAwmiQwZdUcDT6TuKNH+mK3/bt4la4rR1FEgINdaKhCzmKgc9
 1GCJG6vYPcOoabtRPqRScoOlmffXsfzGegDM+Uezat3ZBorej9kcn/SaJuflCykGGjUR
 dJMw==
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
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBOYXZpMTIgdG8g
VkNOIGZhbWlseQoKU2lnbmVkLW9mZi1ieTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNuLmMKaW5kZXggMjFjYThlMGFiOGI2Li5iNzRmMGY2NzlhY2EgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKQEAgLTQ4LDYgKzQ4LDcgQEAK
ICNkZWZpbmUgRklSTVdBUkVfQVJDVFVSVVMgCSJhbWRncHUvYXJjdHVydXNfdmNuLmJpbiIKICNk
ZWZpbmUgRklSTVdBUkVfTkFWSTEwIAkiYW1kZ3B1L25hdmkxMF92Y24uYmluIgogI2RlZmluZSBG
SVJNV0FSRV9OQVZJMTQgCSJhbWRncHUvbmF2aTE0X3Zjbi5iaW4iCisjZGVmaW5lIEZJUk1XQVJF
X05BVkkxMiAJImFtZGdwdS9uYXZpMTJfdmNuLmJpbiIKIAogTU9EVUxFX0ZJUk1XQVJFKEZJUk1X
QVJFX1JBVkVOKTsKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9QSUNBU1NPKTsKQEAgLTU1LDYg
KzU2LDcgQEAgTU9EVUxFX0ZJUk1XQVJFKEZJUk1XQVJFX1JBVkVOMik7CiBNT0RVTEVfRklSTVdB
UkUoRklSTVdBUkVfQVJDVFVSVVMpOwogTU9EVUxFX0ZJUk1XQVJFKEZJUk1XQVJFX05BVkkxMCk7
CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfTkFWSTE0KTsKK01PRFVMRV9GSVJNV0FSRShGSVJN
V0FSRV9OQVZJMTIpOwogCiBzdGF0aWMgdm9pZCBhbWRncHVfdmNuX2lkbGVfd29ya19oYW5kbGVy
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7CiAKQEAgLTg2LDEyICs4OCwxOCBAQCBpbnQgYW1k
Z3B1X3Zjbl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkgICAgKGFkZXYt
PnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpCiAJCQlhZGV2LT52Y24uaW5kaXJl
Y3Rfc3JhbSA9IHRydWU7CiAJCWJyZWFrOwotICAgIGNhc2UgQ0hJUF9OQVZJMTQ6CisJY2FzZSBD
SElQX05BVkkxNDoKIAkJZndfbmFtZSA9IEZJUk1XQVJFX05BVkkxNDsKIAkJaWYgKChhZGV2LT5m
aXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSAmJgogCQkgICAgKGFkZXYt
PnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpCiAJCQlhZGV2LT52Y24uaW5kaXJl
Y3Rfc3JhbSA9IHRydWU7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTI6CisJCWZ3X25hbWUg
PSBGSVJNV0FSRV9OQVZJMTI7CisJCWlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFN
REdQVV9GV19MT0FEX1BTUCkgJiYKKwkJICAgIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQ
T1JUX1ZDTl9EUEcpKQorCQkJYWRldi0+dmNuLmluZGlyZWN0X3NyYW0gPSB0cnVlOworCQlicmVh
azsKIAlkZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
