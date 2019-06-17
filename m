Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C870E48F93
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7227289CF2;
	Mon, 17 Jun 2019 19:32:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8248189D52
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:34 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7280410qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjDzJzyJr9qCwcskiQ1IfnSLyOBMqfeaXP+FOxt/YXw=;
 b=XubxCJ8gAjzmAqvVjeyMSFP111vbKYYWIsiDCr+Gi2ilfROeiuGf4hCENLIpl+1X17
 yJzJ2oQt9ro4PZZwwp/TcyGeU0Ibaso5zOr85o9kBWE9ZWLBbqFQKUXCeN832dsy25Jl
 f6Z6hYbwQqCKo88lDFuXKvZFgveWeZtzDr9jzg2D7Pg+qr8Yg0GXQcc728DlOr+W2xmr
 KGk8tH/vt264STLNEa33YNiSmMapXkgMsnjSzZGNV8kC4I0pGZrHq1mmrWwKwt5TdHIc
 FpuCIW+numNeho2AXzyu3x1KFjNC8zxemwVIqxdKnZB0MtxsDUDaKrmNgxTEQt6K74nx
 9yMw==
X-Gm-Message-State: APjAAAW27pgNQmwYhERf8oyItnwYJRb3rpHbjoMAUyqPatezAbynDjDE
 zeryJNLVUnw6m3tvBOJUVvs7WgdaYwI=
X-Google-Smtp-Source: APXvYqySfOtksL7hpEMma2800JjsLqRzcPCqJrwy+XjFV+IueqVmhH+pH9xg0wxJ9C2PCG5qImDHsA==
X-Received: by 2002:a0c:89f3:: with SMTP id 48mr23309834qvs.68.1560799953013; 
 Mon, 17 Jun 2019 12:32:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 288/459] drm/amdgpu/VCN2.0 remove unused Macro and declaration
Date: Mon, 17 Jun 2019 14:30:55 -0500
Message-Id: <20190617193106.18231-89-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjDzJzyJr9qCwcskiQ1IfnSLyOBMqfeaXP+FOxt/YXw=;
 b=NWAqFpe/k+Xg8WWtf5VZyIf291nVNIMohQcxJu3ClgeH85+KnG3g3VqBqYnqQdcVK/
 V7c1OfQ0YhhN5W4Oi7SHsJzSfS3/9c4nGsSRi7zK6uEF0ts/8QrunlRX/pVO++sbbNNy
 5rcbdgh61WfJWHAIOBlOkr1ISlBr9HT+e0b4/3rnecX6w3n0yDbiBdvNSm7KQDb5WA5q
 GCqRnhS5kAMYTdLN82LZV0yDkV8Uv/M8/B/kxiYSaLzSBZaSVB7r2mKUedKyCLPe0jDY
 imKa4n4I0AJuf5HTg6RdyrQEbFt0LiKMT86NpI2ZPxBtUTaU3Cgg96OM2m/k/OSw/ys0
 /Dkw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKSnVzdCBmb3IgY2xlYW51cAoKU2lnbmVk
LW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFtZXMgWmh1IDxK
YW1lcy5aaHVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8w
LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCBkY2IxNDg5OTRlZDcuLjU3ODJmNzlkYmUwNCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC00NSw3ICs0NSw2IEBACiAjZGVm
aW5lIG1tVVZEX0xNSV9SQkNfSUJfNjRCSVRfQkFSX0hJR0hfSU5URVJOQUxfT0ZGU0VUIAkweDVh
NgogI2RlZmluZSBtbVVWRF9MTUlfUkJDX0lCXzY0QklUX0JBUl9MT1dfSU5URVJOQUxfT0ZGU0VU
CQkweDVhNwogI2RlZmluZSBtbVVWRF9SQkNfSUJfU0laRV9JTlRFUk5BTF9PRkZTRVQJCQkweDFl
MgotI2RlZmluZSBtbVVWRF9HUENPTV9TWVNfQ01EX0lOVEVSTkFMX09GRlNFVAkJCTB4MWJGCiAK
ICNkZWZpbmUgbW1VVkRfSlJCQ19FWFRFUk5BTF9SRUdfSU5URVJOQUxfT0ZGU0VUIAkJCTB4MWJm
ZmYKICNkZWZpbmUgbW1VVkRfSlBFR19HUENPTV9DTURfSU5URVJOQUxfT0ZGU0VUCQkJCTB4NDAy
OQpAQCAtNjcsNyArNjYsNiBAQAogCiAjZGVmaW5lIEpSQkNfREVDX0VYVEVSTkFMX1JFR19XUklU
RV9BRERSCQkJCTB4MTgwMDAKIAotc3RhdGljIGludCB2Y25fdjJfMF9zdG9wKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKIHN0YXRpYyB2b2lkIHZjbl92Ml8wX3NldF9kZWNfcmluZ19mdW5j
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBzdGF0aWMgdm9pZCB2Y25fdjJfMF9zZXRf
ZW5jX3JpbmdfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogc3RhdGljIHZvaWQg
dmNuX3YyXzBfc2V0X2pwZWdfcmluZ19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
