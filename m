Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19F48F43
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EC889BAF;
	Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182589BA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so12254235qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcLa3GSwhLtqWn9MNfUrLu+RNbYDlT2sMW9VMNVE4KE=;
 b=MV+2qvN0D9/YqZjJEWsUWZiRZ58ZFdk6NCzDWnhKqxQwsjf/x4e3pXErAASLkwmKCP
 zl9TVIYxfggnLf33w7NdnLUnMSfnf+iErMQAt6+ulu2IBCSA4QY8UWRCL8uR8eX1xuQg
 BECRqmLVWFlsy6irEsZHvpg4S4NrofQPXx0w6Uk6DW6PPWgvSRymm8Qu5iIm7oRw7Us3
 FoViEuhnAHrTSasTanbMvy1YQKEdSErUYMFHq6g4EiTL04w84uVxxD6a32EZrKvqMqmy
 aXNNtq0WVtjFwEPRRHLCLBUJpbVVQZTd4GBxOULXarl0XDNVZff/Ksl78nEcvPQSznV3
 YtXA==
X-Gm-Message-State: APjAAAXPgGUJ+eRyRXWR5PcHAPItvfI6mizES0kuo4uDPDUQwiWzc7oN
 E8oJJTrfGdqISC4Kl3M/+6H0RQjok9I=
X-Google-Smtp-Source: APXvYqzISd8ELNTW5Tgf0H2APZtQfn7QDhwXhyGYyd/ZOkBBUcWo1y2fa3TQYC+iJE3fXBtL+F63FQ==
X-Received: by 2002:ac8:197a:: with SMTP id g55mr58500994qtk.320.1560799887351; 
 Mon, 17 Jun 2019 12:31:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 215/459] drm/amdgpu/mes10.1: implement mes enablement function
Date: Mon, 17 Jun 2019 14:29:42 -0500
Message-Id: <20190617193106.18231-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcLa3GSwhLtqWn9MNfUrLu+RNbYDlT2sMW9VMNVE4KE=;
 b=T3Xgo7rfJ8cGPTBIttRUOLkhFSfX5A9bEomEORQ+0D9aodhOT8s9kLvfUs6+rVeDqt
 sVSqLtySnvY+lrEHGTdyy4zTnjvno8qw0uWRO8T8i+zOXo5jL8xDTyZmvbI9WdiY2YLD
 OKJarOwqD2kTQuS08ZxVKbGpqc4uI26aAQlOPVzP8+ucT6EsVIEQHi59X5cpj89DxdQU
 jikgmP6lgSigWQkDd+DEh1bhiCpD5k3tDGMAEqKGb6c10H5JfuLCpSJe8BWHsWGEmQfs
 zOKn3w9xKVr7RidderceueQZQNKUQW3Aul8DYmPT02/pEcMgxB/EkWUGIvQMI1ONXnbH
 Eudw==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFmdGVyIE1FUyBmaXJtd2FyZSBn
ZXRzIGxvYWRlZCwgaXQgZW5hYmxlcyBNRVMgZW5naW5lIHN0YXJ0aW5nIGV4ZWN1dGlvbi4KClNp
Z25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBI
YXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9tZXNfdjEwXzEuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bWVzX3YxMF8xLmMKaW5kZXggNWM1ZDI3Y2QxMDI5Li4wNjQ0Y2EwZWYzNTMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jCkBAIC0xODMsNiArMTgzLDM5IEBAIHN0YXRpYyB2
b2lkIG1lc192MTBfMV9mcmVlX3Vjb2RlX2J1ZmZlcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCQkgICAgICAodm9pZCAqKikmYWRldi0+bWVzLnVjb2RlX2Z3X3B0cik7CiB9CiAKK3N0
YXRpYyB2b2lkIG1lc192MTBfMV9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJv
b2wgZW5hYmxlKQoreworCXVpbnQzMl90IGRhdGEgPSAwOworCisJaWYgKGVuYWJsZSkgeworCQlk
YXRhID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19DTlRMKTsKKwkJZGF0YSA9IFJFR19T
RVRfRklFTEQoZGF0YSwgQ1BfTUVTX0NOVEwsIE1FU19QSVBFMF9SRVNFVCwgMSk7CisJCVdSRUcz
Ml9TT0MxNShHQywgMCwgbW1DUF9NRVNfQ05UTCwgZGF0YSk7CisKKwkJLyogc2V0IHVjb2RlIHN0
YXJ0IGFkZHJlc3MgKi8KKwkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19QUkdSTV9DTlRS
X1NUQVJULAorCQkJICAgICAodWludDMyX3QpKGFkZXYtPm1lcy51Y19zdGFydF9hZGRyKSA+PiAy
KTsKKworCQkvKiBjbGVhciBCWVBBU1NfVU5DQUNIRUQgdG8gYXZvaWQgaGFuZ3MgYWZ0ZXIgaW50
ZXJydXB0LiAqLworCQlkYXRhID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19EQ19PUF9D
TlRMKTsKKwkJZGF0YSA9IFJFR19TRVRfRklFTEQoZGF0YSwgQ1BfTUVTX0RDX09QX0NOVEwsCisJ
CQkJICAgICBCWVBBU1NfVU5DQUNIRUQsIDApOworCQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tQ1Bf
TUVTX0RDX09QX0NOVEwsIGRhdGEpOworCisJCS8qIHVuaGFsdCBNRVMgYW5kIGFjdGl2YXRlIHBp
cGUwICovCisJCWRhdGEgPSBSRUdfU0VUX0ZJRUxEKDAsIENQX01FU19DTlRMLCBNRVNfUElQRTBf
QUNUSVZFLCAxKTsKKwkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19DTlRMLCBkYXRhKTsK
Kwl9IGVsc2UgeworCQlkYXRhID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19DTlRMKTsK
KwkJZGF0YSA9IFJFR19TRVRfRklFTEQoZGF0YSwgQ1BfTUVTX0NOVEwsIE1FU19QSVBFMF9BQ1RJ
VkUsIDApOworCQlkYXRhID0gUkVHX1NFVF9GSUVMRChkYXRhLCBDUF9NRVNfQ05UTCwKKwkJCQkg
ICAgIE1FU19JTlZBTElEQVRFX0lDQUNIRSwgMSk7CisJCWRhdGEgPSBSRUdfU0VUX0ZJRUxEKGRh
dGEsIENQX01FU19DTlRMLCBNRVNfUElQRTBfUkVTRVQsIDEpOworCQlkYXRhID0gUkVHX1NFVF9G
SUVMRChkYXRhLCBDUF9NRVNfQ05UTCwgTUVTX0hBTFQsIDEpOworCQlXUkVHMzJfU09DMTUoR0Ms
IDAsIG1tQ1BfTUVTX0NOVEwsIGRhdGEpOworCX0KK30KKwogLyogVGhpcyBmdW5jdGlvbiBpcyBm
b3IgYmFja2Rvb3IgTUVTIGZpcm13YXJlICovCiBzdGF0aWMgaW50IG1lc192MTBfMV9sb2FkX21p
Y3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
