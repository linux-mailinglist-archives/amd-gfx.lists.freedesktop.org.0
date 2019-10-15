Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB84D6FBB
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 08:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55B6E5F9;
	Tue, 15 Oct 2019 06:50:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB836E5F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 06:50:08 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 23so11533630pgk.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 23:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xiq6jLbD0+35G0DY8EaYcS7Nnu3e3mLP0sgBg0XAIhs=;
 b=hxdAzhOVW9tJyetqxx8FUVWnw1dwLS6UzkQoZpLPw6D8jU8a8PqJcf4O2dKC+xtD8X
 vnvaVJD3n3zCLCYaEtryQ2A+4kDxpqFmMCb7qEgdW+1uM2LF9h5z3O4wOo+bTxfcsR1I
 YN5CCh4ELiIB7xMw/jvTr7dUceq2YEPAbKXiaVWEpJaGmeB7XFSABFnibxb1nFS/cLQg
 Ok67e8i/munE4iaJc8s93m06KlSBQiLb3A8X70lTFD8DNJX7IUhKZVAf4g1LL47UH/it
 EQlCOYJpXGQCEElFIFXnyBLcojRTgraURi23PBvwa1sR3dZFzEq0MUA4pDvbVrf5frqB
 aJAQ==
X-Gm-Message-State: APjAAAUU1T5ohgfIrB6pe3ZVEBW/g2MHH1scG6oT6YKRk64PpIdgTTV9
 AzVozQZlKLoZ53Iw2e6IIk/Erw==
X-Google-Smtp-Source: APXvYqzRrMVGLQpba2qQhGa7Ey5T5nhT45Un9VIAWLIXIxx3v0/JZLu8d3raOaC0HE/aRD/Jj+SbQg==
X-Received: by 2002:a63:d415:: with SMTP id a21mr35501921pgh.299.1571122207810; 
 Mon, 14 Oct 2019 23:50:07 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.gmail.com with ESMTPSA id 22sm21449010pfj.139.2019.10.14.23.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 23:50:06 -0700 (PDT)
From: Daniel Drake <drake@endlessm.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com
Subject: [PATCH] drm/amdgpu: always reset asic when going into suspend
Date: Tue, 15 Oct 2019 14:50:02 +0800
Message-Id: <20191015065002.18701-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xiq6jLbD0+35G0DY8EaYcS7Nnu3e3mLP0sgBg0XAIhs=;
 b=ZrqJeS0vcbpdH2dp3MgZZuskws8WCmRzd0wxkkW4B+0UdcvCEQtIzrRvDHWagnuxKn
 5AcSuCAMZazSLB5lgh81Vi8G7ZltdjDmICKVchBpgYJUrlDykGSmRemzCHayWyhFNbpa
 Ku7qrY5v3blW5+xCPz7yD8meDe0SlPVPnOJbG1I/NfZ3l//t7ZRFqA1qVLhOLvybilED
 d4sl0zIAbUFVtKKtxRAU+Q4LBNEw4rTHk9w/Q0OOEYPlnLw7yNRYT+ZhKu+kkYEMi8t+
 V5E9WVVh+KDJ5+G1C1TuFHOtWcEeXTToRV1tVVcxkpCauJy3HW5nNztJbabrsn6xXdR5
 l6iA==
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gQXN1cyBVWDQzNERBIChSeXplbjcgMzcwMFUpLCB1cG9uIHJlc3VtZSBmcm9tIHMyaWRsZSwg
dGhlIHNjcmVlbgp0dXJucyBvbiBhZ2FpbiBhbmQgc2hvd3MgdGhlIHByZS1zdXNwZW5kIGltYWdl
LCBidXQgdGhlIGRpc3BsYXkgcmVtYWlucwpmcm96ZW4gZnJvbSB0aGF0IHBvaW50IG9ud2FyZHMu
CgpUaGUga2VybmVsIGxvZ3Mgc2hvdyBlcnJvcnM6CgogW2RybV0gcHNwIGNvbW1hbmQgZmFpbGVk
IGFuZCByZXNwb25zZSBzdGF0dXMgaXMgKDB4NykKIFtkcm1dIEZlbmNlIGZhbGxiYWNrIHRpbWVy
IGV4cGlyZWQgb24gcmluZyBzZG1hMAogW2RybV0gRmVuY2UgZmFsbGJhY2sgdGltZXIgZXhwaXJl
ZCBvbiByaW5nIGdmeAogYW1kZ3B1IDAwMDA6MDM6MDAuMDogW2RybTphbWRncHVfaWJfcmluZ190
ZXN0c10gKkVSUk9SKiBJQiB0ZXN0IGZhaWxlZCBvbiBnZnggKC0yMikuCiBbZHJtOnByb2Nlc3Nf
b25lX3dvcmtdICpFUlJPUiogaWIgcmluZyB0ZXN0IGZhaWxlZCAoLTIyKS4KClRoaXMgY2FuIGFs
c28gYmUgcmVwcm9kdWNlZCB3aXRoIHBtX3Rlc3Q6CiAjIGVjaG8gZGV2aWNlcyA+IC9zeXMvcG93
ZXIvcG1fdGVzdAogIyBlY2hvIGZyZWV6ZSA+IC9zeXMvcG93ZXIvbWVtCgpUaGUgc2FtZSByZXBy
b2R1Y2VyIGNhdXNlcyB0aGUgc2FtZSBwcm9ibGVtIG9uIEFzdXMgWDUxMkRLIChSeXplbjUgMzUw
MFUpCmV2ZW4gdGhvdWdoIHRoYXQgbW9kZWwgaXMgbm9ybWFsbHkgYWJsZSB0byBzdXNwZW5kIGFu
ZCByZXN1bWUgT0sgdmlhIFMzLgoKRXhwZXJpbWVudGluZywgSSBvYnNlcnZlZCB0aGF0IHRoaXMg
ZXJyb3IgY29uZGl0aW9uIGNhbiBiZSBpbnZva2VkIG9uCmFueSBhbWRncHUgcHJvZHVjdCBieSBl
eGVjdXRpbmcgaW4gc3VjY2Vzc2lvbjoKCiAgYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYs
IHRydWUsIHRydWUpOwogIGFtZGdwdV9kZXZpY2VfcmVzdW1lKGRybV9kZXYsIHRydWUsIHRydWUp
OwoKaS5lLiBpdCBhcHBlYXJzIHRoYXQgdGhlIHJlc3VtZSByb3V0aW5lIGlzIHVuYWJsZSB0byBn
ZXQgdGhlIGRldmljZSBvdXQKb2Ygc3VzcGVuZGVkIHN0YXRlLCBleGNlcHQgZm9yIHRoZSBTMyBz
dXNwZW5kIGNhc2Ugd2hlcmUgaXQgcHJlc3VtYWJseSBoYXMKYSBiaXQgb2YgZXh0cmEgaGVscCBm
cm9tIHRoZSBmaXJtd2FyZSBvciBoYXJkd2FyZS4KCkhvd2V2ZXIsIEkgYWxzbyBvYnNlcnZlZCB0
aGF0IHRoZSBydW50aW1lIHN1c3BlbmQvcmVzdW1lIHJvdXRpbmVzIHdvcmsKT0sgd2hlbiB0ZXN0
ZWQgbGlrZSB0aGlzLCB3aGljaCBsZWFkIG1lIHRvIHRoZSBrZXkgZGlmZmVyZW5jZSBpbiB0aGVz
ZQp0d28gY2FzZXM6IHRoZSBBU0lDIHJlc2V0LCB3aGljaCBvbmx5IGhhcHBlbnMgaW4gdGhlIHJ1
bnRpbWUgc3VzcGVuZCBwYXRoLgoKU2luY2UgaXQgdGFrZXMgbGVzcyB0aGFuIDFtcywgd2Ugc2hv
dWxkIGRvIHRoZSBBU0lDIHJlc2V0IGluIGFsbApzdXNwZW5kIHBhdGhzLCBmaXhpbmcgcmVzdW1l
IGZyb20gczJpZGxlIG9uIHRoZXNlIHByb2R1Y3RzLgoKTGluazogaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExODExClNpZ25lZC1vZmYtYnk6IERhbmllbCBE
cmFrZSA8ZHJha2VAZW5kbGVzc20uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwppbmRleCA1YTE5MzlkYmQ0ZTMuLjdmNDg3MGU5NzRmYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzA4MiwxNSArMzA4MiwxNiBA
QCBpbnQgYW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wg
c3VzcGVuZCwgYm9vbCBmYmNvbikKIAkgKi8KIAlhbWRncHVfYm9fZXZpY3RfdnJhbShhZGV2KTsK
IAorCWFtZGdwdV9hc2ljX3Jlc2V0KGFkZXYpOworCXIgPSBhbWRncHVfYXNpY19yZXNldChhZGV2
KTsKKwlpZiAocikKKwkJRFJNX0VSUk9SKCJhbWRncHUgYXNpYyByZXNldCBmYWlsZWRcbiIpOwor
CiAJcGNpX3NhdmVfc3RhdGUoZGV2LT5wZGV2KTsKIAlpZiAoc3VzcGVuZCkgewogCQkvKiBTaHV0
IGRvd24gdGhlIGRldmljZSAqLwogCQlwY2lfZGlzYWJsZV9kZXZpY2UoZGV2LT5wZGV2KTsKIAkJ
cGNpX3NldF9wb3dlcl9zdGF0ZShkZXYtPnBkZXYsIFBDSV9EM2hvdCk7Ci0JfSBlbHNlIHsKLQkJ
ciA9IGFtZGdwdV9hc2ljX3Jlc2V0KGFkZXYpOwotCQlpZiAocikKLQkJCURSTV9FUlJPUigiYW1k
Z3B1IGFzaWMgcmVzZXQgZmFpbGVkXG4iKTsKIAl9CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
