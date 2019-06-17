Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0EC4906B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F8589D64;
	Mon, 17 Jun 2019 19:50:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE906E062
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id a27so6990694qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NM/wo6XsYWbm5+M1uBYrDAWDg/eYoOS6FPGf7cGbcz8=;
 b=QZ+OfGV07GlsbUb/ghI5IUAyYJjN6CZ7aLRfLjgg2gj0bUrrsjo+8VhWVmPgCWsY+0
 waH+c1TZh5Genp3sSnEsF4GKDV3SL7v58++ck3g7/m1iJkY2AuI6raIsYh1dDLRpOlo7
 9Y2b5yrFw0vLNK1R7TWM/MbIjeCxMKSQn2NogZhAv4n2Kp3MgrfD8abVj7F+KfJZh5Aj
 vEPYkC/uC5XK3op0CBGzSe5Z87+SeNwmLNXfDMMiA41/cODtd+83ChxWxF0m7qTlBfhV
 Avd8k4HlhQF4VdBN54byWI6M0HSFnK7r9Wadlyo78B4q6ItE1wG9w629TaUIPZSEp+bh
 J3vw==
X-Gm-Message-State: APjAAAUQCa5IDO3VqIfp62ojkmkFom0JcO9dJajcPNGtMpQt0L7HOw/Y
 F7ty9uEFcbI91w2i2g5gENAeWF0+fJudQg==
X-Google-Smtp-Source: APXvYqzRU1Ik/ofjWq40ebSs1RCWyayHOx3QGrFqetcuDSQNbS4U3WfDB4m34yXeyMuW3CaWMzKXbw==
X-Received: by 2002:a37:c45:: with SMTP id 66mr72917674qkm.31.1560801031481;
 Mon, 17 Jun 2019 12:50:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 435/459] drm/amd/display: Drive-by fixes for display_mode_vba
Date: Mon, 17 Jun 2019 14:49:24 -0500
Message-Id: <20190617194948.18667-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NM/wo6XsYWbm5+M1uBYrDAWDg/eYoOS6FPGf7cGbcz8=;
 b=t1n8LYVciMFWEyFUhVa1kQp6asZTEwF3WYVuIndyregSe/4RS26Pfxn+cl+r+Ngo9i
 37G0qjN5DL/nrIxXRcAhhzIgFy7TsCSqrfoN8/t8XgK0VuNa/vd4hWsiLDcm0p/JvFUL
 rApniZaHQVaWjtqtFZuC4MF5Yzm2HbpUtsXRIAVz3pxJNVMwBMwn8JvckURuChCjoA02
 Kq3EoSTl0czTrE/mC2GuswaeJ3QFB/TmSWKloLRIQ8qjrDISDRB2FLdbJiiDkFTh4M5D
 hRuy3WJzYdJ0QU+LLhOtvHWdsyCfBSWJ56gqTRYxUv7cF+h91NkJeOjlwS/6bMGE88cr
 KeXw==
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKRml4ZXMgZm9yIHRo
ZSBmb2xsb3dpbmc6Ci0gSW5jb3JyZWN0IHBvaW50ZXIgdHlwZSAodW5zaWduZWQgaW50IGluc3Rl
YWQgb2YgZG91YmxlKQotIEluY29ycmVjdCBEU0MgbnVtYmVyIG9mIHNsaWNlcyBzZXR0aW5nCgpT
aWduZWQtb2ZmLWJ5OiBJbHlhIEJha291bGluIDxJbHlhLkJha291bGluQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpB
Y2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuYyB8IDMgLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaCB8IDQgKystLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuYwpp
bmRleCA0ZGY4ODVkMTdlNjkuLmEyMTYwOGNkNjdlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmMKQEAgLTU2NCw3ICs1
NjQsNiBAQCBzdGF0aWMgdm9pZCBmZXRjaF9waXBlX3BhcmFtcyhzdHJ1Y3QgZGlzcGxheV9tb2Rl
X2xpYiAqbW9kZV9saWIpCiAJCWlmIChzcmMtPmlzX2hzcGxpdCkgewogCQkJZm9yIChrID0gaiAr
IDE7IGsgPCBtb2RlX2xpYi0+dmJhLmNhY2hlX251bV9waXBlczsgKytrKSB7CiAJCQkJZGlzcGxh
eV9waXBlX3NvdXJjZV9wYXJhbXNfc3QgKnNyY19rID0gJnBpcGVzW2tdLnBpcGUuc3JjOwotCQkJ
CWRpc3BsYXlfb3V0cHV0X3BhcmFtc19zdCAqZG91dF9rID0gJnBpcGVzW2tdLmRvdXQ7CiAKIAkJ
CQlpZiAoc3JjX2stPmlzX2hzcGxpdCAmJiAhdmlzaXRlZFtrXQogCQkJCQkJJiYgc3JjLT5oc3Bs
aXRfZ3JwID09IHNyY19rLT5oc3BsaXRfZ3JwKSB7CkBAIC01NzksOCArNTc4LDYgQEAgc3RhdGlj
IHZvaWQgZmV0Y2hfcGlwZV9wYXJhbXMoc3RydWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGli
KQogCQkJCQkJbW9kZV9saWItPnZiYS5WaWV3cG9ydEhlaWdodFttb2RlX2xpYi0+dmJhLk51bWJl
ck9mQWN0aXZlUGxhbmVzXSArPQogCQkJCQkJCQlzcmNfay0+dmlld3BvcnRfaGVpZ2h0OwogCi0J
CQkJCW1vZGVfbGliLT52YmEuTnVtYmVyT2ZEU0NTbGljZXNbbW9kZV9saWItPnZiYS5OdW1iZXJP
ZkFjdGl2ZVBsYW5lc10gKz0KLQkJCQkJCQlkb3V0X2stPmRzY19zbGljZXM7CiAJCQkJCXZpc2l0
ZWRba10gPSB0cnVlOwogCQkJCX0KIAkJCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmgKaW5kZXggNzUwMjgwMDcwOTVjLi5m
YWYzM2U3N2U4ZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bWwvZGlzcGxheV9tb2RlX3ZiYS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oCkBAIC00NTUsNyArNDU1LDcgQEAgc3RydWN0IHZiYV92
YXJzX3N0IHsKIAlkb3VibGUgVG90YWxOdW1iZXJPZkFjdGl2ZU9URzsKIAlkb3VibGUgRkVDT3Zl
cmhlYWQ7CiAJZG91YmxlIEVmZmVjdGl2ZUZFQ092ZXJoZWFkOwotCXVuc2lnbmVkIGludCBPdXRi
cHA7CisJZG91YmxlIE91dGJwcDsKIAl1bnNpZ25lZCBpbnQgT3V0YnBwRFNDOwogCWRvdWJsZSBU
b3RhbERTQ1VuaXRzUmVxdWlyZWQ7CiAJZG91YmxlIGJwcDsKQEAgLTUzOCw3ICs1MzgsNyBAQCBz
dHJ1Y3QgdmJhX3ZhcnNfc3QgewogCWJvb2wgUmVxdWlyZXNEU0NbRENfX1ZPTFRBR0VfU1RBVEVT
ICsgMV1bRENfX05VTV9EUFBfX01BWF07CiAJdW5zaWduZWQgaW50IE51bWJlck9mRFNDU2xpY2Vb
RENfX1ZPTFRBR0VfU1RBVEVTICsgMV1bRENfX05VTV9EUFBfX01BWF07CiAJZG91YmxlIFJlcXVp
cmVzRkVDW0RDX19WT0xUQUdFX1NUQVRFUyArIDFdW0RDX19OVU1fRFBQX19NQVhdOwotCXVuc2ln
bmVkIGludCBPdXRwdXRCcHBQZXJTdGF0ZVtEQ19fVk9MVEFHRV9TVEFURVMgKyAxXVtEQ19fTlVN
X0RQUF9fTUFYXTsKKwlkb3VibGUgT3V0cHV0QnBwUGVyU3RhdGVbRENfX1ZPTFRBR0VfU1RBVEVT
ICsgMV1bRENfX05VTV9EUFBfX01BWF07CiAJZG91YmxlIERTQ0RlbGF5UGVyU3RhdGVbRENfX1ZP
TFRBR0VfU1RBVEVTICsgMV1bRENfX05VTV9EUFBfX01BWF07CiAJYm9vbCBWaWV3cG9ydFNpemVT
dXBwb3J0W0RDX19WT0xUQUdFX1NUQVRFUyArIDFdOwogCXVuc2lnbmVkIGludCBSZWFkMjU2Qmxv
Y2tIZWlnaHRZW0RDX19OVU1fRFBQX19NQVhdOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
