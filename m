Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B473A0ADF
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FCB89F03;
	Wed, 28 Aug 2019 19:56:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486EB89EF7
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so897151qke.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JA0nSudSaRHm0rY62KkLBBAOJgV6z4l9uD1PicG1mlA=;
 b=N5FCPCJRGYanjK2bkT9RtuprbvpvUJZ3JK3uGziZzl/TwFStnkZVtvP7V4aJKIV/37
 ZXBV/v63EJLoczagP6i+lRY2MuR+lW+19I0Kgy08uFXvm/hcLF7ZkSTjTJJgYCs5HDCw
 7GOFM8E4CTRP7KSlWqHKTt+pl/OwnSYsUhL26p3/KpArO+5Nz9a6z2bYcQPswcKAv4/e
 R4QRVUp8BRlmB75vzeHlEQj86bjqs9pI81RcOKUI3M7ZbTN59Yg6/YZzRw0BRpS4dYwJ
 xlzlBkXmj70ipy1eljPMyziyZNUQox9hnwu80GOdt7I8aZGCYQYwVdxWJ1mEsxyojOTt
 EsQg==
X-Gm-Message-State: APjAAAV7viX5BTgFqrqhwdqF6XbHsua4XffGfZF4v2RMBXwGSGOB4Eud
 n7jTHgiu4Oku7pgp1FB2PIdTphhC
X-Google-Smtp-Source: APXvYqzssxLVsiSBy4PSiH9RYsNoc8fVYfELT5IVL/uq9zI0AYejumKNk1Yt3pZKCxgfB1g0z4uqvQ==
X-Received: by 2002:a37:4f46:: with SMTP id d67mr6135402qkb.367.1567022213212; 
 Wed, 28 Aug 2019 12:56:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 21/23] drm/amd/display: Correct order of RV family clk
 managers for Renoir
Date: Wed, 28 Aug 2019 14:56:20 -0500
Message-Id: <20190828195622.28941-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JA0nSudSaRHm0rY62KkLBBAOJgV6z4l9uD1PicG1mlA=;
 b=nmQZw4PXwF69BNlZqyt8kKTSZ2RSxxeU4B/uw5xnbXGCBImy95gArAodFpTq+SPSnQ
 wFmNyHkIbLOESjhs6WYW/8JqQ2gQXc2T3v4Vcylmbv4o+uWto0gn/dabX9+NheF+BlRv
 xTaWPcm8xJ6ZS2Os8nEOiMWBHF9kdEVbSoc468PM19Te3R9BrG1Hf2jsYr6+/jUHf3IY
 vrF3ZHJG+9VmvPXSXX6J0XtBXkvwQ9ni2w8yYueDJbmy3sPvrW3e4x/V548Mwr6+bT1A
 bmHPxpolQmFpxqLN5FvzazvQvdDjkPja9WheBmsHiTSrZogSrNX25MCIzb5/i30NZg1D
 XMTg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpOZWVkIHRvIGNoZWNrIGZvciByZW5v
aXIgZmlyc3QuCgpTaWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Nsa19tZ3IuYyB8IDEyICsr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9j
bGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdy
LmMKaW5kZXggNjYyNzdhOWE0ZWMyLi44ZGExMjU2YmMxNDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdyLmMKQEAgLTEwOSw2ICsxMDksMTIg
QEAgc3RydWN0IGNsa19tZ3IgKmRjX2Nsa19tZ3JfY3JlYXRlKHN0cnVjdCBkY19jb250ZXh0ICpj
dHgsIHN0cnVjdCBwcF9zbXVfZnVuY3MgKnAKIAogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURf
RENfRENOMV8wKQogCWNhc2UgRkFNSUxZX1JWOgorI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURf
RENfRENOMl8xKQorCQlpZiAoQVNJQ1JFVl9JU19SRU5PSVIoYXNpY19pZC5od19pbnRlcm5hbF9y
ZXYpKSB7CisJCQlybl9jbGtfbWdyX2NvbnN0cnVjdChjdHgsIGNsa19tZ3IsIHBwX3NtdSwgZGNj
Zyk7CisJCQlicmVhazsKKwkJfQorI2VuZGlmCS8qIERDTjJfMSAqLwogCQlpZiAoQVNJQ1JFVl9J
U19SQVZFTjIoYXNpY19pZC5od19pbnRlcm5hbF9yZXYpKSB7CiAJCQlydjJfY2xrX21ncl9jb25z
dHJ1Y3QoY3R4LCBjbGtfbWdyLCBwcF9zbXUpOwogCQkJYnJlYWs7CkBAIC0xMTgsMTIgKzEyNCw2
IEBAIHN0cnVjdCBjbGtfbWdyICpkY19jbGtfbWdyX2NyZWF0ZShzdHJ1Y3QgZGNfY29udGV4dCAq
Y3R4LCBzdHJ1Y3QgcHBfc211X2Z1bmNzICpwCiAJCQlydjFfY2xrX21ncl9jb25zdHJ1Y3QoY3R4
LCBjbGtfbWdyLCBwcF9zbXUpOwogCQkJYnJlYWs7CiAJCX0KLSNpZiBkZWZpbmVkKENPTkZJR19E
Uk1fQU1EX0RDX0RDTjJfMSkKLQkJaWYgKEFTSUNSRVZfSVNfUkVOT0lSKGFzaWNfaWQuaHdfaW50
ZXJuYWxfcmV2KSkgewotCQkJcm5fY2xrX21ncl9jb25zdHJ1Y3QoY3R4LCBjbGtfbWdyLCBwcF9z
bXUsIGRjY2cpOwotCQkJYnJlYWs7Ci0JCX0KLSNlbmRpZgkvKiBEQ04yXzEgKi8KIAkJYnJlYWs7
CiAjZW5kaWYJLyogRmFtaWx5IFJWICovCiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
