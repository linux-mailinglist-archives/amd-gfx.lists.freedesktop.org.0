Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F84748ED1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27003899D4;
	Mon, 17 Jun 2019 19:28:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08177899B0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:02 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i125so6948773qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPuWbYcX/1/uwmfUt3FWKaRlMIWNUQMn3thVZMOUb4o=;
 b=Hk1nMejAuYdkyAefvvnR2uhIAHhFOlxuvZUut++yNjLBSI5qZ0zzH3nlvvnJAVhJS+
 D2a/FjTu5DjfcQ3AiMWJeLsVZgU+dy7/jzqFx8NQKOhZu/GY52DdaOphPO7ntj+n7zgr
 LSAcLvc6FjPUyz0i2R1yvZ4qDF8J9oJXiaX6CK1v5myXSDoq6f7hFoawTZezk8p36Cy9
 khxstgNCAiCmxojSCTO7SXiKFp716ORJ4f2DzBMiNfgjyxmHEQ9QrAwS6gFoivD5H5b6
 k3KURoYCZve6Jln1KLEg9LO0FTNbGpODnMZrQxdMHijA5hbV4gPgzmg01cSQh0kRkeBz
 +z2w==
X-Gm-Message-State: APjAAAVKdJmz8Q14uU2gFEq0lVHh815aij76kzfaFuG8t/e9av2oNDmu
 u7bHEvTXbT9gjxLzQw/+Lv7Tp5kJiSo=
X-Google-Smtp-Source: APXvYqxpMUoHuOh3Kubu7o7BvYUs0jgdgJaz1DSr0Y0uZU13ZBbExZXheJyouAqG0OvWylTr8c9fDw==
X-Received: by 2002:a37:640f:: with SMTP id y15mr21720142qkb.79.1560799680871; 
 Mon, 17 Jun 2019 12:28:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 151/459] drm/amdgpu: fix the issue of checking on message
 mapping
Date: Mon, 17 Jun 2019 14:26:16 -0500
Message-Id: <20190617192704.18038-52-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPuWbYcX/1/uwmfUt3FWKaRlMIWNUQMn3thVZMOUb4o=;
 b=Y9YOg9sUI2lJWF54OQsfJLK5gVATisls4v8u1d5rxWNZWkMddF3qOdtLQ7n2M0AcGU
 gf408MV9fYSXH1OgPY5mRfFCJNX4SiR5FZHYEsdCdP1sBQv62U12QQQbheEQsXYpr1VM
 6mcUFRnu1LGAjOuPS1GDczHpqFjE7kd2+YIMARsjir9A8OOvjGLM8rEprUtwJZsplYMQ
 ET1WNG3ZDG1E78gZJnmh9Q7Su+Q95OFxduwPczcafXOxL41IAO9bTOvQbz4jmzcibaAj
 a0z+8nz1lvHKhUYFGPKDA7J5rkQQqZWVPm8bPF+cskpt0jF/6hkTrR9DQ2j/cEM1H636
 7H/w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoZSBuYXZpMTBfbWVzc2FnZV9t
YXBbaW5kZXhdIHNjb3BlIHNob3VsZCBiZSBpbiBQUFNNQ19NZXNzYWdlX0NvdW50IG5vdCBpbgpT
TVVfTVNHX01BWF9DT1VOVC4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA5ICsrKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMjgzYjY1NWEx
N2RmLi5hOTcwNzJjYzAzOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKQEAgLTEwMSwxMCArMTAxLDE1IEBAIHN0YXRpYyBpbnQgbmF2aTEwX21lc3NhZ2Vf
bWFwW1NNVV9NU0dfTUFYX0NPVU5UXSA9IHsKIAogc3RhdGljIGludCBuYXZpMTBfZ2V0X3NtdV9t
c2dfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbWMsIHVpbnQzMl90IGluZGV4KQogewotCWlm
IChpbmRleCA+IFNNVV9NU0dfTUFYX0NPVU5UIHx8IGluZGV4ID4gUFBTTUNfTWVzc2FnZV9Db3Vu
dCkKKwlpbnQgdmFsOworCWlmIChpbmRleCA+IFNNVV9NU0dfTUFYX0NPVU5UKQogCQlyZXR1cm4g
LUVJTlZBTDsKLQlyZXR1cm4gbmF2aTEwX21lc3NhZ2VfbWFwW2luZGV4XTsKIAorCXZhbCA9IG5h
dmkxMF9tZXNzYWdlX21hcFtpbmRleF07CisJaWYgKHZhbCA+IFBQU01DX01lc3NhZ2VfQ291bnQp
CisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIHZhbDsKIH0KIAogc3RhdGljIGludAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
