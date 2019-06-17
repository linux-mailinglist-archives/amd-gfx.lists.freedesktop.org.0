Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC03E48F34
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D58389BA1;
	Mon, 17 Jun 2019 19:31:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137289B98
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x2so12273644qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dn8bd9mIpFrHpgbXtQNKGShQUHdbYK0ddCcKzNxN9/w=;
 b=CpOz97FvwnWdcn53kD3Hv/WXlSrlT4YSGo/eE3YDnZeSlxLYSYxrCjqcp3KzNJJfv2
 yek9T4TSs7JBV1oU3KTq1qj0rX4ITPPT5osMCqQQ1C+JwkFgrdPJSLGfOYAgSCJkEXhw
 AQDxTzXUBwZHyNRUlERg+9CHQInRCGFpbKDYmr+pmUBem5XfA4Tc3s1KF7n5PpLIGkPG
 a/ycUYOkt4HA4r1QvF1LhkbwJw27Z5MkyIWrAks+JSoPposuXw8roWAMSp7SxNdNScM/
 Syp98NNjsXs9rV9JEC4/RrR6hHA2odFWv+zF9Rv/zxfaUjCiUMVeFklxAyxQ5uEE+oH9
 OBBQ==
X-Gm-Message-State: APjAAAW9YVR9QvwpDWSCGfcQoKjnFw2CNcD4Bw/IS+IuXG+cu6ItmOgV
 DcQ7Ta3TwGrXg1GFS0C3lE36A4t8oN8=
X-Google-Smtp-Source: APXvYqxVdk3UESDk5dLWzMTvfbuLnJ73FqSo7AhIo+bmhqAMlZrXGeGRU6tuxs7dyB1DVHUwwjjE8w==
X-Received: by 2002:ac8:87d:: with SMTP id x58mr96873617qth.368.1560799882817; 
 Mon, 17 Jun 2019 12:31:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 210/459] drm/amdgpu/mes10.1: implement ucode CPU buffer
 destruction
Date: Mon, 17 Jun 2019 14:29:37 -0500
Message-Id: <20190617193106.18231-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dn8bd9mIpFrHpgbXtQNKGShQUHdbYK0ddCcKzNxN9/w=;
 b=NnuEb4TGReRiyPz+eV5UA+BkVFaDmXziPonMc+QObQotdTjm7fcBdnkdRtUO8+4UDe
 uCcFy+MOZaupRCTaWhzaDkmaCpAwaKwQbXDzsEGX1xWkzgMnz+22WKho2IMVb4phufEg
 ovHwFUQ98cZ0Qc4LH/uJt/mI6PcukBFLeVTli8+1pRqByP33NV8Z+UHFmwmASJvp9RWv
 a2m6vYObveWZcwX+8oY58wLYEO30GSxIZMGhqP2t/2uVUb3WSBtTwtHeIAfXYSktaZ+1
 gaPGbzThnt0H3soex9+GUeyZI9esTNlL5QeZnwqoGMYj1GnaE/zp0R2gYMB0zJVaFZKc
 pzqQ==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IGltcGxlbWVudHMgdGhlIENQ
VSBidWZmZXIgZGVzdHJ1Y3Rpb24gb2YgdWNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8g
PEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMg
fCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbWVzX3YxMF8xLmMKaW5kZXggYzc5OWIwY2ExOTA3Li5lNTM4MTliOTk0NDIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jCkBAIC05Nyw2ICs5NywxMiBA
QCBzdGF0aWMgaW50IG1lc192MTBfMV9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgbWVzX3YxMF8xX2ZyZWVfbWlj
cm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXJlbGVhc2VfZmlybXdhcmUo
YWRldi0+bWVzLmZ3KTsKKwlhZGV2LT5tZXMuZncgPSBOVUxMOworfQorCiBzdGF0aWMgaW50IG1l
c192MTBfMV9zd19pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlyZXR1cm4gMDsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
