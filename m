Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE648EE3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6596A89A88;
	Mon, 17 Jun 2019 19:28:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8501C89A72
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x47so12180058qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOiwzIpj0S9CdUZDoMbFvJK4FI1CRzrg+GjIlXYg7Gw=;
 b=unPbG00mKLUEQL+0f9Eie5ZXiTOW7iLqGlE3KBxTGQKmtR6vLED3dN26SMCqcxHzvU
 PiOESLwOr9LjBH4Wm/xekKQpH3AcKbk9e9iCMFN5kDsjPL0jP9ODkXm0UG7S1cPnvLbc
 GQnXO1HFfeoqeHJsPYhXGH+FPR42qfDF1rPknj/jvuJSrkd78FDqwKvkIM9rEIgd0Zop
 W9zcq/zTWfbMaR6zWSMQd7M6xDpEtD/SmiEfbc5puER0IAUVb+BlAkU4eanVclG7OZpQ
 NKUt254yTkcGd21akVOrxRGD3Hu1GU9Qnb6vG0FhQoG0NxnPJcETC/+cjXEHZp3aAI/2
 K/cQ==
X-Gm-Message-State: APjAAAVCDhU/ZfPJ4nlk93jrf3CS684fVALu3jBLUZAPald/iNYsOQDd
 YBl8T5c2mo+hKW4dCVPN+Bb7YK88X94=
X-Google-Smtp-Source: APXvYqxb3/NLpgfqsKz9wTy2BZpfg1Wcz6ZlSorSiUbRptVCKaVlviIskNRctRJ/cLHwta0kpp1m2w==
X-Received: by 2002:a0c:c711:: with SMTP id w17mr22443089qvi.97.1560799698564; 
 Mon, 17 Jun 2019 12:28:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 171/459] drm/amdgpu: enable sw smu driver for navi10 by default
Date: Mon, 17 Jun 2019 14:26:36 -0500
Message-Id: <20190617192704.18038-72-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOiwzIpj0S9CdUZDoMbFvJK4FI1CRzrg+GjIlXYg7Gw=;
 b=PQ8xacsEBnkIL/VzNLzwnKkJYxSJ2eW8HIVkcmGqelLiAxq/ja3HMcIF96Z5k2Hjfb
 apu6r/gTKPVhxbK96wnEXynAKDUhMkHGZmXqp1KtH1HHYWxjarv40LWFlpNq9ZTqz8jn
 G3Rov1iGY9NYZJLDN/FASg4iiN/Nu96AQMmn74bfciX2mDcN5w2BIFNV9yysm6qnnVpL
 sxZCvhLhE0xziGFymoigsSR+fhnvd4wf4kqiLOkphKTXAbu0LBTK36X5cXfI9zyWve9m
 AbMzRrcvOGiYvGy29afWwwKiwf7m7bWpRFQLIw7/+q2s8kSGDPZHSUQJIxHXbnpGuzRE
 Kvaw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKTmF2aTEwIHdpbGwg
dXNlIHN3IHNtdSBkcml2ZXIgZm9yIGR5bmFtaWMgcG93ZXIgbWFuYWdtZW50LAp3aGlsZSB2ZWdh
MjAgY291bGQgYWxzbyB1c2Ugc3cgc211IGRyaXZlciB3aGVuIGFtZGdwdV9kcG0gaXMKc2V0IHRv
IDIKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8ICA0ICsrKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDExICsrKysrLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggYTlkMWNlYjExZTVkLi5k
MDE2OGUwM2Q4NWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAg
LTI1MSw3ICsyNTEsOSBAQCBtb2R1bGVfcGFyYW1fc3RyaW5nKGxvY2t1cF90aW1lb3V0LCBhbWRn
cHVfbG9ja3VwX3RpbWVvdXQsIHNpemVvZihhbWRncHVfbG9ja3VwXwogCiAvKioKICAqIERPQzog
ZHBtIChpbnQpCi0gKiBPdmVycmlkZSBmb3IgZHluYW1pYyBwb3dlciBtYW5hZ2VtZW50IHNldHRp
bmcgKDEgPSBlbmFibGUsIDAgPSBkaXNhYmxlKS4gVGhlIGRlZmF1bHQgaXMgLTEgKGF1dG8pLgor
ICogT3ZlcnJpZGUgZm9yIGR5bmFtaWMgcG93ZXIgbWFuYWdlbWVudCBzZXR0aW5nCisgKiAoMCA9
IGRpc2FibGUsIDEgPSBlbmFibGUsIDIgPSBlbmFibGUgc3cgc211IGRyaXZlciBmb3IgdmVnYTIw
KQorICogVGhlIGRlZmF1bHQgaXMgLTEgKGF1dG8pLgogICovCiBNT0RVTEVfUEFSTV9ERVNDKGRw
bSwgIkRQTSBzdXBwb3J0ICgxID0gZW5hYmxlLCAwID0gZGlzYWJsZSwgLTEgPSBhdXRvKSIpOwog
bW9kdWxlX3BhcmFtX25hbWVkKGRwbSwgYW1kZ3B1X2RwbSwgaW50LCAwNDQ0KTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCA2M2RmNTllNzMzNWQuLjg3
ODIyZjQzNDM1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
YwpAQCAtMTY4LDEzICsxNjgsMTIgQEAgaW50IHNtdV91cGRhdGVfdGFibGVfd2l0aF9hcmcoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90IHRhYmxlX2lkLCB1aW50MTYKIAogYm9vbCBp
c19zdXBwb3J0X3N3X3NtdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQlpZiAoYW1k
Z3B1X2RwbSAhPSAxKQotCQlyZXR1cm4gZmFsc2U7Ci0KLQlpZiAoYWRldi0+YXNpY190eXBlID49
IENISVBfVkVHQTIwICYmIGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1JBVkVOKQorCWlmIChhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApCisJCXJldHVybiAoYW1kZ3B1X2RwbSA9PSAyKSA/
IHRydWU6IGZhbHNlOworCWVsc2UgaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkK
IAkJcmV0dXJuIHRydWU7Ci0KLQlyZXR1cm4gZmFsc2U7CisJZWxzZQorCQlyZXR1cm4gZmFsc2U7
CiB9CiAKIGludCBzbXVfc3lzX2dldF9wcF90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
dm9pZCAqKnRhYmxlKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
