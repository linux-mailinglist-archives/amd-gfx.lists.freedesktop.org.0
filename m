Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FCC48DFB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C2892AC;
	Mon, 17 Jun 2019 19:18:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BAC894A7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:02 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p15so12196823qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0ZMRk/9sUC6goDPeVztCEd/a1lQaWKls7w6c01W7Aw=;
 b=GPjAA/Q2tXDYhzNtK+Mn1xcbAONJ2CX0eQS4jjfF26ZnRpgP7n0K/G1dJRhbenl6nn
 VoPD19HetD43oBvxbVuzkBOGW3UoAkl2RO3VaZCMeF57ee98aZEkOtjrMVCO3L118Pvc
 85GDbGiQsLcVm+n6DdzyhHND3SIECS9SwXq9/4KlEfqG1GlnvG9MpEOs5mQD3Xzo7vEC
 JLenBxi+dJmc7HWJf6lHiZAimoITJtPpZFnuip9isZl/vDv/xRTXRxr1zuJib63zdtuk
 TtS3NLt4TKeTa+9CqeV12LOAeIbvaky6t+PIFaXjLLc6qnFxVhOvMDldHSzavjbgN+nQ
 5frw==
X-Gm-Message-State: APjAAAWIcReqoVqC2CM1hMYo3Zm3hw+63Cm5xsFQC14Ojv+gEKgg6Gv3
 OLGCzgOjS5vmBTIBAhuXZ+cOpkepupU=
X-Google-Smtp-Source: APXvYqyaH6ZvJ3p9bccmbKqq7OVexLWElwU0GCIjfCUSvHIh1JeaZlpz0K7ODKTDW4i5npJEWxFIUQ==
X-Received: by 2002:ac8:929:: with SMTP id t38mr7003446qth.287.1560799081598; 
 Mon, 17 Jun 2019 12:18:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 060/459] drm/amd/display: move dcn v1_0 irq source header to
 ivsrcid/dcn/
Date: Mon, 17 Jun 2019 14:10:21 -0500
Message-Id: <20190617191700.17899-49-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0ZMRk/9sUC6goDPeVztCEd/a1lQaWKls7w6c01W7Aw=;
 b=GO0djPX6oTg3gtTqrPb6Hlsc5X7bZlr/V449krWy3W1MdLX9zwxNrnqaN2ZFvo7XVF
 hKpHhTm2ziAlVQgLIXSfF85PB3wHhZEmUq/WPE49nmtIcGPbL4rJmfYSw4WaL+baMEqX
 bN0ungPNVnTyMgN2+gvpUILymCCxY8F4nppaaH/68h4QHtVxKlgrHLLJXJVkNZ0OnT4j
 tjt1g182W0kz5ucvskJkUxvwuIakYdIjxrOzcBnDwWeNDchucxAWZOgyQEIiZvqlcIGh
 cIqbEkRxsh3/uBwX0M4xCkA4PokkmeKDc2Ot0/iQfMGiIVo1E++PvjDI6kkkVjBSpIx5
 fmFA==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFj
ayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMTAvaXJxX3NlcnZpY2VfZGNuMTAuYyAgICB8IDIg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNyY2lkL3sgPT4gZGNufS9pcnFzcmNz
X2Rjbl8xXzAuaCB8IDAKIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNyY2lkL3sgPT4g
ZGNufS9pcnFzcmNzX2Rjbl8xXzAuaCAoMTAwJSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAwMjNlODNkN2QwMGUuLjhhODI1
NDFlZDVjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCkBAIC02NSw3ICs2NSw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+
CiAKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMCkKLSNpbmNsdWRlICJpdnNy
Y2lkL2lycXNyY3NfZGNuXzFfMC5oIgorI2luY2x1ZGUgIml2c3JjaWQvZGNuL2lycXNyY3NfZGNu
XzFfMC5oIgogCiAjaW5jbHVkZSAiZGNuL2Rjbl8xXzBfb2Zmc2V0LmgiCiAjaW5jbHVkZSAiZGNu
L2Rjbl8xXzBfc2hfbWFzay5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2lycS9kY24xMC9pcnFfc2VydmljZV9kY24xMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2lycS9kY24xMC9pcnFfc2VydmljZV9kY24xMC5jCmluZGV4IDEwYWM2ZGVm
ZjVmZi4uZDE3OWU0ZDhjNDg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvaXJxL2RjbjEwL2lycV9zZXJ2aWNlX2RjbjEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2lycS9kY24xMC9pcnFfc2VydmljZV9kY24xMC5jCkBAIC0zNiw3ICsz
Niw3IEBACiAKICNpbmNsdWRlICJpcnFfc2VydmljZV9kY24xMC5oIgogCi0jaW5jbHVkZSAiaXZz
cmNpZC9pcnFzcmNzX2Rjbl8xXzAuaCIKKyNpbmNsdWRlICJpdnNyY2lkL2Rjbi9pcnFzcmNzX2Rj
bl8xXzAuaCIKIAogZW51bSBkY19pcnFfc291cmNlIHRvX2RhbF9pcnFfc291cmNlX2RjbjEwKAog
CQlzdHJ1Y3QgaXJxX3NlcnZpY2UgKmlycV9zZXJ2aWNlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2l2c3JjaWQvaXJxc3Jjc19kY25fMV8wLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvaXZzcmNpZC9kY24vaXJxc3Jjc19kY25fMV8wLmgKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNy
Y2lkL2lycXNyY3NfZGNuXzFfMC5oCnJlbmFtZSB0byBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvaXZzcmNpZC9kY24vaXJxc3Jjc19kY25fMV8wLmgKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
