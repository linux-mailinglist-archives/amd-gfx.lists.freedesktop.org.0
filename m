Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E798348E0B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0E38958E;
	Mon, 17 Jun 2019 19:18:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67889565
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so12200714qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nydpBvLFB1Ap+nzZSqgMXNH+Fs97jQWuxHMDabnyegs=;
 b=i8/ge5R7q5gtxQAcf/jHNIDBVskssK4zj+8Y5HC8cvBSe4uTVzn/J6krJpX9bDnJlI
 Hv2R4Od+2Vi8n6darCYzQ2Jh9u4rjtRkavG0MU0gcTfppN/wkWDHRHCMq4zJtPYOTsoj
 pfs7ekIZOyhZ3WtU4rL7ekB6uqWK168GFJv+8L9ram13UdPZ+kh1e7ljU96cWNiO8iGx
 60S9MIMMkBd3UirETPswalb5+Hbb0j82dAmOL8FYac89NLy+n6dfEb50j3+XmDC44/pf
 A6Uj7dY2uD63Ip/aWhxkKkDNat9qA/yue3qWS9pmCFhifDPp/s6VZ65eN9CAWAHCdUA+
 88Rg==
X-Gm-Message-State: APjAAAWT2oeDCD/SZy8j5T24DjLsvWUaWc+q1Us7L/54WE/3y7p0ZadC
 yCIMTRerhGOgfC5duiaTzuAtE23lsdA=
X-Google-Smtp-Source: APXvYqyXCjTno4mzjdKKnF8zoiAxS89S/4y+n8DR5iCQHmr7qErEhmn2OVkeNYeE6Er9MloClx/56A==
X-Received: by 2002:aed:21f5:: with SMTP id m50mr12071862qtc.66.1560799093927; 
 Mon, 17 Jun 2019 12:18:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 074/459] drm/amdgpu/psp: add support to load TOC to psp
Date: Mon, 17 Jun 2019 14:10:35 -0500
Message-Id: <20190617191700.17899-63-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nydpBvLFB1Ap+nzZSqgMXNH+Fs97jQWuxHMDabnyegs=;
 b=Wvia0xoPPVLVURIMwDdE3ydTSoNrVKG7we4yvFbzZP60s8o2AKqrSNiUFiGYQzHb+C
 PB8w6TcfZ9iLt08Yo/mLM3rZgaF6y5mBqsIsTefm8ZxTd4KeAWZA19dBaYOf9DnPw8Nq
 xLWmBUFklHTa8urfG8Zxj3HrEV633Z1ZYmoMBuUcU8zug8ftaRhCfDPyxIoshwihY/Ye
 RIhC+FQHe3VSqCV69WKYBIcQmIbSnKcfkIeOozTaWp5a4qGUZ7IvXvMkqGiwH3p1EJXs
 FIvJe22cWoVkIcmPFYGuzte3KAg1p4lezvv1BB4yrfenvIGtdnO4J8uQ7LyisPmnyLZ+
 hSHA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUg
TWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNTMg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMKaW5kZXggNmZjZDJkMjUxYjk4Li4wMzBjMzlmM2JhYzQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKQEAgLTE4MywxMCArMTgzLDQ0IEBAIHN0YXRp
YyB2b2lkIHBzcF9wcmVwX3Rtcl9jbWRfYnVmKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCWNt
ZC0+Y21kLmNtZF9zZXR1cF90bXIuYnVmX3NpemUgPSBzaXplOwogfQogCitzdGF0aWMgdm9pZCBw
c3BfcHJlcF9sb2FkX3RvY19jbWRfYnVmKHN0cnVjdCBwc3BfZ2Z4X2NtZF9yZXNwICpjbWQsCisJ
CQkJICAgICAgdWludDY0X3QgcHJpX2J1Zl9tYywgdWludDMyX3Qgc2l6ZSkKK3sKKwljbWQtPmNt
ZF9pZCA9IEdGWF9DTURfSURfTE9BRF9UT0M7CisJY21kLT5jbWQuY21kX2xvYWRfdG9jLnRvY19w
aHlfYWRkcl9sbyA9IGxvd2VyXzMyX2JpdHMocHJpX2J1Zl9tYyk7CisJY21kLT5jbWQuY21kX2xv
YWRfdG9jLnRvY19waHlfYWRkcl9oaSA9IHVwcGVyXzMyX2JpdHMocHJpX2J1Zl9tYyk7CisJY21k
LT5jbWQuY21kX2xvYWRfdG9jLnRvY19zaXplID0gc2l6ZTsKK30KKworLyogSXNzdWUgTE9BRCBU
T0MgY21kIHRvIFBTUCB0byBwYXJ0IHRvYyBhbmQgY2FsY3VsYXRlIHRtciBzaXplIG5lZWRlZCAq
Lworc3RhdGljIGludCBwc3BfbG9hZF90b2Moc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsCisJCQl1
aW50MzJfdCAqdG1yX3NpemUpCit7CisJaW50IHJldDsKKwlzdHJ1Y3QgcHNwX2dmeF9jbWRfcmVz
cCAqY21kOworCisJY21kID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHBzcF9nZnhfY21kX3Jlc3Ap
LCBHRlBfS0VSTkVMKTsKKwlpZiAoIWNtZCkKKwkJcmV0dXJuIC1FTk9NRU07CisJLyogQ29weSB0
b2MgdG8gcHNwIGZpcm13YXJlIHByaXZhdGUgYnVmZmVyICovCisJbWVtc2V0KHBzcC0+ZndfcHJp
X2J1ZiwgMCwgUFNQXzFfTUVHKTsKKwltZW1jcHkocHNwLT5md19wcmlfYnVmLCBwc3AtPnRvY19z
dGFydF9hZGRyLCBwc3AtPnRvY19iaW5fc2l6ZSk7CisKKwlwc3BfcHJlcF9sb2FkX3RvY19jbWRf
YnVmKGNtZCwgcHNwLT5md19wcmlfbWNfYWRkciwgcHNwLT50b2NfYmluX3NpemUpOworCisJcmV0
ID0gcHNwX2NtZF9zdWJtaXRfYnVmKHBzcCwgTlVMTCwgY21kLAorCQkJCSBwc3AtPmZlbmNlX2J1
Zl9tY19hZGRyKTsKKwlpZiAoIXJldCkKKwkJKnRtcl9zaXplID0gcHNwLT5jbWRfYnVmX21lbS0+
cmVzcC50bXJfc2l6ZTsKKwlrZnJlZShjbWQpOworCXJldHVybiByZXQ7Cit9CisKIC8qIFNldCB1
cCBUcnVzdGVkIE1lbW9yeSBSZWdpb24gKi8KIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKQogewogCWludCByZXQ7CisJaW50IHRtcl9zaXplOwogCiAJLyoK
IAkgKiBBY2NvcmRpbmcgdG8gSFcgZW5naW5lZXIsIHRoZXkgcHJlZmVyIHRoZSBUTVIgYWRkcmVz
cyBiZSAibmF0dXJhbGx5CkBAIC0xOTUsNyArMjI5LDIxIEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9p
bml0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCSAqIE5vdGU6IHRoaXMgbWVtb3J5IG5lZWQg
YmUgcmVzZXJ2ZWQgdGlsbCB0aGUgZHJpdmVyCiAJICogdW5pbml0aWFsaXplcy4KIAkgKi8KLQly
ZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChwc3AtPmFkZXYsIFBTUF9UTVJfU0laRSwgUFNQ
X1RNUl9TSVpFLAorCXRtcl9zaXplID0gUFNQX1RNUl9TSVpFOworCisJLyogRm9yIEFTSUNzIHN1
cHBvcnQgUkxDIGF1dG9sb2FkLCBwc3Agd2lsbCBwYXJzZSB0aGUgdG9jCisJICogYW5kIGNhbGN1
bGF0ZSB0aGUgdG90YWwgc2l6ZSBvZiBUTVIgbmVlZGVkICovCisJaWYgKHBzcC0+dG9jX3N0YXJ0
X2FkZHIgJiYKKwkgICAgcHNwLT50b2NfYmluX3NpemUgJiYKKwkgICAgcHNwLT5md19wcmlfYnVm
KSB7CisJCXJldCA9IHBzcF9sb2FkX3RvYyhwc3AsICZ0bXJfc2l6ZSk7CisJCWlmIChyZXQpIHsK
KwkJCURSTV9FUlJPUigiRmFpbGVkIHRvIGxvYWQgdG9jXG4iKTsKKwkJCXJldHVybiByZXQ7CisJ
CX0KKwl9CisKKwlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChwc3AtPmFkZXYsIHRtcl9z
aXplLCBQU1BfVE1SX1NJWkUsCiAJCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKIAkJ
CQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsK
IApAQCAtMjExLDkgKzI1OSwxMCBAQCBzdGF0aWMgaW50IHBzcF90bXJfbG9hZChzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCkKIAlpZiAoIWNtZCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlwc3BfcHJl
cF90bXJfY21kX2J1Zihwc3AsIGNtZCwgcHNwLT50bXJfbWNfYWRkciwgUFNQX1RNUl9TSVpFKTsK
LQlEUk1fSU5GTygicmVzZXJ2ZSAweCV4IGZyb20gMHglbGx4IGZvciBQU1AgVE1SIFNJWkVcbiIs
Ci0JCQlQU1BfVE1SX1NJWkUsIHBzcC0+dG1yX21jX2FkZHIpOworCXBzcF9wcmVwX3Rtcl9jbWRf
YnVmKHBzcCwgY21kLCBwc3AtPnRtcl9tY19hZGRyLAorCQkJICAgICBhbWRncHVfYm9fc2l6ZShw
c3AtPnRtcl9ibykpOworCURSTV9JTkZPKCJyZXNlcnZlIDB4JWx4IGZyb20gMHglbGx4IGZvciBQ
U1AgVE1SXG4iLAorCQkgYW1kZ3B1X2JvX3NpemUocHNwLT50bXJfYm8pLCBwc3AtPnRtcl9tY19h
ZGRyKTsKIAogCXJldCA9IHBzcF9jbWRfc3VibWl0X2J1Zihwc3AsIE5VTEwsIGNtZCwKIAkJCQkg
cHNwLT5mZW5jZV9idWZfbWNfYWRkcik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
