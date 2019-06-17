Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823B48F72
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045CE89C88;
	Mon, 17 Jun 2019 19:32:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E389C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:05 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so6944509qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDkWi3rSuB9c3u9WzxTxrPegqDbfsmZEF4egfO1UlxM=;
 b=k1AbxtC+I3EROIJbkNRs7gk/eZFzROGa9J9PYqAbnYkhh9CfTq56vMHkvw2hdn6uM2
 eHHJ4ccx15tnD4SQ1wwSbJqd9JPR3BGpcwHbEHxIdN8mH86JZv7hL7sXx+Qtb4Px6skl
 apQ8zj6pn5b6flUS6edandytr4BNjmP6V0eUjLqc/fYL1Z5xzBdJn/BODtkgf+glQDBU
 /pV03ggByvNf8xcydolhNgO78Iu47Np0zzwan+qj3rsK4ASiNxYfl4/PF/JfIn6WAoY0
 ZdTZTcVzqm3v0LSo2oAB1NMTndbev4WSkEBZy4NQXou5XA9VYnGQffgSNcfRVkNfo/Z1
 /UPg==
X-Gm-Message-State: APjAAAVFahVtNrjMTkAFiva22B2hRyT4gBAevblhOsMVOV0IvEw6jx6c
 HUHIn/on0DbCmeKeUcVtE983PQn+v4k=
X-Google-Smtp-Source: APXvYqzIRgR84d4Y2LrnRzL+93LEBkzRak9aOyJcHprJMIlJulTSLGC5nhxA5UXj0ey8J8ASBESeHw==
X-Received: by 2002:a37:5c8:: with SMTP id 191mr77858030qkf.188.1560799923695; 
 Mon, 17 Jun 2019 12:32:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 255/459] drm/amd/powerplay: fix dpm freq unit error (10KHz ->
 Mhz)
Date: Mon, 17 Jun 2019 14:30:22 -0500
Message-Id: <20190617193106.18231-56-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDkWi3rSuB9c3u9WzxTxrPegqDbfsmZEF4egfO1UlxM=;
 b=Phxr5V/lsWmOmnXECdc46/SqEejKa3APonAj4hqnVm6p7aJ+qCngEWMhYHBjIBMkfK
 ORfz2pL949dsOLAyFsBKeGpfEnJ5jot/12KA4IfldwoJXE1lSYq6GLOc0KWd1mNP5+A6
 ZS8Q4w2jvI/cOSedV5anlxuSu9y4JU/r7RQEeny8rtAQpkPX9dtFCtqubaEXW6GKKDJM
 g5h2UtwEkal5yR0MYl67y4Qw/SZt5DUq86Z7Jpd9gaEh6UwoB1zWxm9bnnYidyi1qTZn
 AHveHJvbF/7PaKXHv6YDg0ry0tfeEZ+PXto9edgCJ2Xrz93XXM0irAOBzT946+oZ8/EQ
 0Q5A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBpbnRlcmZhY2Ugc211
X3YxMV8wX2dldF9jdXJyZW50X2Nsa19mcmVxIHNob3VsZCBiZSByZXR1cm4gMTBLaHogbm90Ck1o
eiB1bml0IHRvIGFkYXB0IHZlZ2EyMCBhbmQgbmF2aTEwIGFzaWMgYXQgdGhlIHNhbWUgdGltZS4K
ClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+CkFja2VkLWJ5
OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTFfMC5jICB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggY2VhNTcwNGUzZjRmLi5kZGQ2ODNmM2NlYmEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTU4MSw2
ICs1ODEsOCBAQCBzdGF0aWMgaW50IG5hdmkxMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAogCQlyZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBjbGtf
dHlwZSwgJmN1cl92YWx1ZSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gc2l6ZTsKKwkJLyogMTBL
SHogLT4gTUh6ICovCisJCWN1cl92YWx1ZSA9IGN1cl92YWx1ZSAvIDEwMDsKIAogCQlzaXplICs9
IHNwcmludGYoYnVmLCAiY3VycmVudCBjbGs6ICV1TWh6XG4iLCBjdXJfdmFsdWUpOwogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDk1N2ZiNjNiOGQ1ZS4u
ODIwM2ViZTUyMjI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YwpAQCAtMTA5OCwxNiArMTA5OCwxNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVu
dF9jbGtfZnJlcShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAogCS8qIGlmIGRvbid0IGhhcyBH
ZXREcG1DbG9ja0ZyZXEgTWVzc2FnZSwgdHJ5IGdldCBjdXJyZW50IGNsb2NrIGJ5IFNtdU1ldHJp
Y3NfdCAqLwogCWlmIChzbXVfbXNnX2dldF9pbmRleChzbXUsIFNNVV9NU0dfR2V0RHBtQ2xvY2tG
cmVxKSA9PSAwKQotCQlyZXR1cm4gc211X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHNt
dSwgY2xrX2lkLCB2YWx1ZSk7Ci0KLQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0o
c211LCBTTVVfTVNHX0dldERwbUNsb2NrRnJlcSwKLQkJCQkJICAoc211X2Nsa19nZXRfaW5kZXgo
c211LCBjbGtfaWQpIDw8IDE2KSk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJcmV0ID0g
IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzbXUsIGNsa19pZCwgJmZyZXEpOwor
CWVsc2UgeworCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNH
X0dldERwbUNsb2NrRnJlcSwKKwkJCQkJCSAgKHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX2lk
KSA8PCAxNikpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKIAotCXJldCA9IHNtdV9yZWFk
X3NtY19hcmcoc211LCAmZnJlcSk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJcmV0ID0g
c211X3JlYWRfc21jX2FyZyhzbXUsICZmcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7
CisJfQogCiAJZnJlcSAqPSAxMDA7CiAJKnZhbHVlID0gZnJlcTsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
