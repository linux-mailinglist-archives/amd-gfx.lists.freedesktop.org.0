Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E425048EEF
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751C889AB3;
	Mon, 17 Jun 2019 19:28:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B14189A32
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:22 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c11so6938707qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrbobJyJQnjgT0Y5Vdwiil9vd6R3knf/BOz+r7tgzTc=;
 b=A7eS0p7qdBVQf/iGKhwRO2wm8xfY2DuOP3aNU3uD+CSDyzzJwQ4XTQSDtl1DGrqf8a
 yoJoAe7yNrlkH+5eVcdJHGfV9czwUTnGJRyEeKZLTXXYHywIsDqO4AC4TINenoZppefe
 LoBm35z306xrd3SUmxIEg6YWsSCjarAvU9F+5xUx84NDIDWjNNsZE3tqSiCCR8fvqIq+
 GO9LqjPlu9lkwGzYOR1qTm9gKfVG1+QGmXDnjBrfQmjbjYFdLdUSvibU/ARvoq/emsip
 pApUmkJJGFoy95hCp9YaGRy5DfaewySp0vLlpucOuyKLW+96hQL5GyHiLUVuR+nC2GaE
 3cIw==
X-Gm-Message-State: APjAAAVmZToXZCnaf5UtOcyGQ55CsdhOfTdYsDu+F/2FR2FgswHhstnU
 B3y94UKMKggkwrvdmfc4IhCsrW86DQk=
X-Google-Smtp-Source: APXvYqykLIRcsxoE8EjRn9T12XX654bGTrqGaw26ORxoN+7PnN7sV3j9MRSCA1qZY2rK2N36tz7/Jw==
X-Received: by 2002:a05:620a:16b2:: with SMTP id
 s18mr84219162qkj.323.1560799701613; 
 Mon, 17 Jun 2019 12:28:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 174/459] drm/amd/powerplay: introduce smu table id type to
 handle the smu table for each asic
Date: Mon, 17 Jun 2019 14:26:39 -0500
Message-Id: <20190617192704.18038-75-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrbobJyJQnjgT0Y5Vdwiil9vd6R3knf/BOz+r7tgzTc=;
 b=NT39Yq9m5OfuFELFLflA00O11ibaxIq6FBL2oXxcNtXHZrXmLVJ75KRRmXODk7HDf3
 kBGPbj7LuQTmiUl/akSNpPYszUqTG+zmL7NIsxDiAvQtpuRIHzHBow7AQI2QzDJuFCPm
 3PyO/ybQv2Iyo2jl0NP2Z6ptkam8KuWg/Nfre/Zi1e8fd9j38cFX8Iyk7iZd19MAnvF9
 6I7pq5SExJhpKcYBmNae7XKhybq48C2lG78ZIfcbepy9GJP+aR4VV1zJlQ7ngGqcZ5lw
 pPzONB4HhES937x4uUTItTOTLtadkvLeNGQKeEhZbTbrB2x5k7NWAqPMzuDON3A3+yj0
 Z+HQ==
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
 Kevin Wang <kevin1.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBuZXcgc211IHRhYmxlIHR5cGUsIGl0J3MgdG8gaGFuZGxlIHRoZSBkaWZmZXJlbnQgc211IHRh
YmxlCmRlZmluZXMgZm9yIGVhY2ggYXNpYyB3aXRoIHRoZSBzYW1lIHNtdSBpcC4KClNpZ25lZC1v
ZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBLZXZpbiBX
YW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oICAgIHwgMjAgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL3NtdV92MTFfMC5oIHwgIDMgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAgICB8IDI3ICsrKysrKysrKysrKysrKysrCiA0
IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAppbmRleCBmMGIzMTNiYWYwNGQuLjYzMWUyZmMx
ZTA1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3Nt
dS5oCkBAIC0zNjYsNiArMzY2LDIzIEBAIHN0cnVjdCBzbXVfYmlvc19ib290X3VwX3ZhbHVlcwog
CXVpbnQzMl90CQkJcHBfdGFibGVfaWQ7CiB9OwogCitlbnVtIHNtdV90YWJsZV9pZAoreworCVNN
VV9UQUJMRV9QUFRBQkxFID0gMCwKKwlTTVVfVEFCTEVfV0FURVJNQVJLUywKKwlTTVVfVEFCTEVf
QVZGUywKKwlTTVVfVEFCTEVfQVZGU19QU01fREVCVUcsCisJU01VX1RBQkxFX0FWRlNfRlVTRV9P
VkVSUklERSwKKwlTTVVfVEFCTEVfUE1TVEFUVVNMT0csCisJU01VX1RBQkxFX1NNVV9NRVRSSUNT
LAorCVNNVV9UQUJMRV9EUklWRVJfU01VX0NPTkZJRywKKwlTTVVfVEFCTEVfQUNUSVZJVFlfTU9O
SVRPUl9DT0VGRiwKKwlTTVVfVEFCTEVfT1ZFUkRSSVZFLAorCVNNVV9UQUJMRV9JMkNfQ09NTUFO
RFMsCisJU01VX1RBQkxFX1BBQ0UsCisJU01VX1RBQkxFX0NPVU5ULAorfTsKKwogc3RydWN0IHNt
dV90YWJsZV9jb250ZXh0CiB7CiAJdm9pZAkJCQkqcG93ZXJfcGxheV90YWJsZTsKQEAgLTQ5NSw2
ICs1MTIsNyBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7CiAJaW50ICgqZ2V0X3NtdV9tc2dfaW5k
ZXgpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBpbmRleCk7CiAJaW50ICgqZ2V0
X3NtdV9jbGtfaW5kZXgpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBpbmRleCk7
CiAJaW50ICgqZ2V0X3NtdV9mZWF0dXJlX2luZGV4KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
dWludDMyX3QgaW5kZXgpOworCWludCAoKmdldF9zbXVfdGFibGVfaW5kZXgpKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCB1aW50MzJfdCBpbmRleCk7CiAJaW50ICgqcnVuX2FmbGxfYnRjKShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJaW50ICgqZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKmZlYXR1cmVfbWFzaywgdWludDMyX3Qg
bnVtKTsKIAllbnVtIGFtZF9wbV9zdGF0ZV90eXBlICgqZ2V0X2N1cnJlbnRfcG93ZXJfc3RhdGUp
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKQEAgLTc4Myw2ICs4MDEsOCBAQCBzdHJ1Y3Qgc211
X2Z1bmNzCiAJKChzbXUpLT5wcHRfZnVuY3M/ICgoc211KS0+cHB0X2Z1bmNzLT5nZXRfc211X2Ns
a19pbmRleD8gKHNtdSktPnBwdF9mdW5jcy0+Z2V0X3NtdV9jbGtfaW5kZXgoKHNtdSksIChtc2cp
KSA6IC1FSU5WQUwpIDogLUVJTlZBTCkKICNkZWZpbmUgc211X2ZlYXR1cmVfZ2V0X2luZGV4KHNt
dSwgbXNnKSBcCiAJKChzbXUpLT5wcHRfZnVuY3M/ICgoc211KS0+cHB0X2Z1bmNzLT5nZXRfc211
X2ZlYXR1cmVfaW5kZXg/IChzbXUpLT5wcHRfZnVuY3MtPmdldF9zbXVfZmVhdHVyZV9pbmRleCgo
c211KSwgKG1zZykpIDogLUVJTlZBTCkgOiAtRUlOVkFMKQorI2RlZmluZSBzbXVfdGFibGVfZ2V0
X2luZGV4KHNtdSwgdGFiKSBcCisJKChzbXUpLT5wcHRfZnVuY3M/ICgoc211KS0+cHB0X2Z1bmNz
LT5nZXRfc211X3RhYmxlX2luZGV4PyAoc211KS0+cHB0X2Z1bmNzLT5nZXRfc211X3RhYmxlX2lu
ZGV4KChzbXUpLCAodGFiKSkgOiAtRUlOVkFMKSA6IC1FSU5WQUwpCiAjZGVmaW5lIHNtdV9ydW5f
YWZsbF9idGMoc211KSBcCiAJKChzbXUpLT5wcHRfZnVuY3M/ICgoc211KS0+cHB0X2Z1bmNzLT5y
dW5fYWZsbF9idGM/IChzbXUpLT5wcHRfZnVuY3MtPnJ1bl9hZmxsX2J0Yygoc211KSkgOiAwKSA6
IDApCiAjZGVmaW5lIHNtdV9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc211LCBmZWF0dXJlX21h
c2ssIG51bSkgXApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L3NtdV92MTFfMC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFf
MC5oCmluZGV4IDkyODRjMWVkZmU0Mi4uZGNjMWVkZTk3YzA0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCkBAIC00Niw2ICs0Niw5IEBACiAjZGVm
aW5lIEZFQV9NQVAoZmVhKSBcCiAJW1NNVV9GRUFUVVJFXyMjZmVhIyNfQklUXSA9IEZFQVRVUkVf
IyNmZWEjI19CSVQKIAorI2RlZmluZSBUQUJfTUFQKHRhYikgXAorCVtTTVVfVEFCTEVfIyN0YWJd
ID0gVEFCTEVfIyN0YWIKKwogc3RydWN0IHNtdV8xMV8wX21heF9zdXN0YWluYWJsZV9jbG9ja3Mg
ewogCXVpbnQzMl90IGRpc3BsYXlfY2xvY2s7CiAJdWludDMyX3QgcGh5X2Nsb2NrOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGQxYzJkNGU2Nzg3OS4u
N2M3ODI1MWVkOTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCkBAIC0xNTYsNiArMTU2LDIxIEBAIHN0YXRpYyBpbnQgbmF2aTEwX2ZlYXR1cmVfbWFza19t
YXBbU01VX0ZFQVRVUkVfQ09VTlRdID0gewogCUZFQV9NQVAoQVRIVUJfUEcpLAogfTsKIAorc3Rh
dGljIGludCBuYXZpMTBfdGFibGVfbWFwW1NNVV9UQUJMRV9DT1VOVF0gPSB7CisJVEFCX01BUChQ
UFRBQkxFKSwKKwlUQUJfTUFQKFdBVEVSTUFSS1MpLAorCVRBQl9NQVAoQVZGUyksCisJVEFCX01B
UChBVkZTX1BTTV9ERUJVRyksCisJVEFCX01BUChBVkZTX0ZVU0VfT1ZFUlJJREUpLAorCVRBQl9N
QVAoUE1TVEFUVVNMT0cpLAorCVRBQl9NQVAoU01VX01FVFJJQ1MpLAorCVRBQl9NQVAoRFJJVkVS
X1NNVV9DT05GSUcpLAorCVRBQl9NQVAoQUNUSVZJVFlfTU9OSVRPUl9DT0VGRiksCisJVEFCX01B
UChPVkVSRFJJVkUpLAorCVRBQl9NQVAoSTJDX0NPTU1BTkRTKSwKKwlUQUJfTUFQKFBBQ0UpLAor
fTsKKwogc3RhdGljIGludCBuYXZpMTBfZ2V0X3NtdV9tc2dfaW5kZXgoc3RydWN0IHNtdV9jb250
ZXh0ICpzbWMsIHVpbnQzMl90IGluZGV4KQogewogCWludCB2YWw7CkBAIC0xOTUsNiArMjEwLDE5
IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9zbXVfZmVhdHVyZV9pbmRleChzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiAJcmV0dXJuIHZhbDsKIH0KIAorc3RhdGljIGlu
dCBuYXZpMTBfZ2V0X3NtdV90YWJsZV9pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWlu
dDMyX3QgaW5kZXgpCit7CisJaW50IHZhbDsKKwlpZiAoaW5kZXggPj0gU01VX1RBQkxFX0NPVU5U
KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXZhbCA9IG5hdmkxMF90YWJsZV9tYXBbaW5kZXhdOwor
CWlmICh2YWwgPj0gVEFCTEVfQ09VTlQpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIHZh
bDsKK30KKwogI2RlZmluZSBGRUFUVVJFX01BU0soZmVhdHVyZSkgKDFVTCA8PCBmZWF0dXJlKQog
c3RhdGljIGludAogbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKQEAgLTQxMiw2ICs0NDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFi
bGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSBuYXZp
MTBfZ2V0X3NtdV9tc2dfaW5kZXgsCiAJLmdldF9zbXVfY2xrX2luZGV4ID0gbmF2aTEwX2dldF9z
bXVfY2xrX2luZGV4LAogCS5nZXRfc211X2ZlYXR1cmVfaW5kZXggPSBuYXZpMTBfZ2V0X3NtdV9m
ZWF0dXJlX2luZGV4LAorCS5nZXRfc211X3RhYmxlX2luZGV4ID0gbmF2aTEwX2dldF9zbXVfdGFi
bGVfaW5kZXgsCiAJLmdldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayA9IG5hdmkxMF9nZXRfYWxsb3dl
ZF9mZWF0dXJlX21hc2ssCiAJLnNldF9kZWZhdWx0X2RwbV90YWJsZSA9IG5hdmkxMF9zZXRfZGVm
YXVsdF9kcG1fdGFibGUsCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIw
X3BwdC5jCmluZGV4IDcxOGZkNGRlYzUzMS4uN2NhZmJjOTQyYjJhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0xODksNiArMTg5LDMyIEBAIHN0YXRp
YyBpbnQgdmVnYTIwX2ZlYXR1cmVfbWFza19tYXBbU01VX0ZFQVRVUkVfQ09VTlRdID0gewogCUZF
QV9NQVAoWEdNSSksCiB9OwogCitzdGF0aWMgaW50IHZlZ2EyMF90YWJsZV9tYXBbU01VX1RBQkxF
X0NPVU5UXSA9IHsKKwlUQUJfTUFQKFBQVEFCTEUpLAorCVRBQl9NQVAoV0FURVJNQVJLUyksCisJ
VEFCX01BUChBVkZTKSwKKwlUQUJfTUFQKEFWRlNfUFNNX0RFQlVHKSwKKwlUQUJfTUFQKEFWRlNf
RlVTRV9PVkVSUklERSksCisJVEFCX01BUChQTVNUQVRVU0xPRyksCisJVEFCX01BUChTTVVfTUVU
UklDUyksCisJVEFCX01BUChEUklWRVJfU01VX0NPTkZJRyksCisJVEFCX01BUChBQ1RJVklUWV9N
T05JVE9SX0NPRUZGKSwKKwlUQUJfTUFQKE9WRVJEUklWRSksCit9OworCitzdGF0aWMgaW50IHZl
Z2EyMF9nZXRfc211X3RhYmxlX2luZGV4KHN0cnVjdCBzbXVfY29udGV4dCAqc21jLCB1aW50MzJf
dCBpbmRleCkKK3sKKwlpbnQgdmFsOworCWlmIChpbmRleCA+PSBTTVVfVEFCTEVfQ09VTlQpCisJ
CXJldHVybiAtRUlOVkFMOworCisJdmFsID0gdmVnYTIwX3RhYmxlX21hcFtpbmRleF07CisJaWYg
KHZhbCA+PSBUQUJMRV9DT1VOVCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gdmFsOwor
fQorCiBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfc211X2ZlYXR1cmVfaW5kZXgoc3RydWN0IHNtdV9j
b250ZXh0ICpzbWMsIHVpbnQzMl90IGluZGV4KQogewogCWludCB2YWw7CkBAIC0yOTI1LDYgKzI5
NTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmVnYTIwX3BwdF9mdW5j
cyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSB2ZWdhMjBfZ2V0X3NtdV9tc2dfaW5kZXgsCiAJ
LmdldF9zbXVfY2xrX2luZGV4ID0gdmVnYTIwX2dldF9zbXVfY2xrX2luZGV4LAogCS5nZXRfc211
X2ZlYXR1cmVfaW5kZXggPSB2ZWdhMjBfZ2V0X3NtdV9mZWF0dXJlX2luZGV4LAorCS5nZXRfc211
X3RhYmxlX2luZGV4ID0gdmVnYTIwX2dldF9zbXVfdGFibGVfaW5kZXgsCiAJLnJ1bl9hZmxsX2J0
YyA9IHZlZ2EyMF9ydW5fYnRjX2FmbGwsCiAJLmdldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayA9IHZl
Z2EyMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2ssCiAJLmdldF9jdXJyZW50X3Bvd2VyX3N0YXRl
ID0gdmVnYTIwX2dldF9jdXJyZW50X3Bvd2VyX3N0YXRlLAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
