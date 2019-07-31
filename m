Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E47CB2D
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8589D8E;
	Wed, 31 Jul 2019 17:58:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8389B97
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:34 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u3so46780365vsh.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxvOamOXFRMtWg6tRwAxOxG83940xOgJ3kNkpwU1MbM=;
 b=Y32DoG7kLJcgc0J2V9WgoT4bNiCz7Djui2QszCN/coonJGxd8pUcFqYg724cFyktY3
 xoBMQSzsYOZqULqJw6s7ecH1SzwZtCT9we/TqnJdHwHnUHX/cRHcXeDKtPkXnRB6HRpV
 okxm2RzqMXS2SkdVQWBNgADXMPHgeEbVNqvpmPbvKbtQP5SXfqYHm/rJvlTXXBvCs1+0
 nLcIC7csDczOZ3AzLxpApYUqLQpcvxFuCvFbZ2fsr2WOydAai+W9Xk8VyOmZ+f404mJT
 pxzjkT535pUoc9e6KG6u39JXu9jaMgpI/eQSCFQS60vF7DEbmRnPJvEjHGxjDmTSG9Jb
 UGrA==
X-Gm-Message-State: APjAAAXytBNqak6VQ1NEc15upuCjk7Z6RFs6xf9nxesqlI/PXvHG3BE6
 wpHQSSKp12zeevZ3poaiwR/GJDt0
X-Google-Smtp-Source: APXvYqxzLtYt2F0swGTFLZBfBdN+v0pQ2MoI6uLFDNVFP1/qWdV3u7HxdUHLjMctwOuaF8e1Rw/jqA==
X-Received: by 2002:a67:6384:: with SMTP id
 x126mr76940226vsb.104.1564595913469; 
 Wed, 31 Jul 2019 10:58:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/26] drm/amdgpu: querry umc error count
Date: Wed, 31 Jul 2019 12:58:00 -0500
Message-Id: <20190731175818.20159-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxvOamOXFRMtWg6tRwAxOxG83940xOgJ3kNkpwU1MbM=;
 b=mZLKKD6RyUWXYsGkiu5OvWUGSFMtDhFN90wex/ln7ecwfMvqU8hN5HG9zRCgVywP1p
 B6MD59HOmPVsZpuPtFfDvZOYtd1NoQwzj9Q9Ph7N/yR4TfsXf3d0Z4Nv+TcTmppbfeZJ
 x4IP/cDpW2h8pz7Sc8OzeEif3DeVxcsU08gM6dbviFMI0qXHuUJ6e3iGPOTwSxhdesnI
 LwBzX89XcxBDrxokKjhmG+V9aaP/sgwD2aM66NvsFPEj7C28C7naUpr5LBXdNiKVJ+Wu
 16ANo9XLaNGrlYuV2NL+HkFNGUjaht+rigwAUKhF2JPF094f6fpV/tuMuvZQuPVr9g5L
 xQoQ==
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
Cc: Dennis Li <dennis.li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKY2hlY2sgdW1jIGVy
cm9yIGNvdW50IGluIGJvdGggcmFzIHF1ZXJyeSBmdW5jdGlvbiBhbmQKcmFzIGludGVycnVwdCBo
YW5kbGVyCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBEZW5uaXMgTGkgPGRlbm5pcy5saUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDExICsrKysrKysrKystCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAgMyArKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAzYmUzMDZiZjE2MDMuLjg0NWU3NWYzNWIxOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtNTg2LDExICs1ODYsMTkg
QEAgaW50IGFtZGdwdV9yYXNfZXJyb3JfcXVlcnkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAJCXN0cnVjdCByYXNfcXVlcnlfaWYgKmluZm8pCiB7CiAJc3RydWN0IHJhc19tYW5hZ2VyICpv
YmogPSBhbWRncHVfcmFzX2ZpbmRfb2JqKGFkZXYsICZpbmZvLT5oZWFkKTsKKwlzdHJ1Y3QgcmFz
X2Vycl9kYXRhIGVycl9kYXRhID0gezAsIDB9OwogCiAJaWYgKCFvYmopCiAJCXJldHVybiAtRUlO
VkFMOwotCS8qIFRPRE8gbWlnaHQgcmVhZCB0aGUgcmVnaXN0ZXIgdG8gcmVhZCB0aGUgY291bnQg
Ki8KIAorCXN3aXRjaCAoaW5mby0+aGVhZC5ibG9jaykgeworCWNhc2UgQU1ER1BVX1JBU19CTE9D
S19fVU1DOgorCQlpZiAoYWRldi0+dW1jX2Z1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCisJ
CQlhZGV2LT51bWNfZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCAmZXJyX2RhdGEp
OworCQlicmVhazsKKwlkZWZhdWx0OgorCQlicmVhazsKKwl9CiAJaW5mby0+dWVfY291bnQgPSBv
YmotPmVycl9kYXRhLnVlX2NvdW50OwogCWluZm8tPmNlX2NvdW50ID0gb2JqLT5lcnJfZGF0YS5j
ZV9jb3VudDsKIApAQCAtOTg0LDYgKzk5Miw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfaW50
ZXJydXB0X2hhbmRsZXIoc3RydWN0IHJhc19tYW5hZ2VyICpvYmopCiAJc3RydWN0IHJhc19paF9k
YXRhICpkYXRhID0gJm9iai0+aWhfZGF0YTsKIAlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5IGVudHJ5
OwogCWludCByZXQ7CisJc3RydWN0IHJhc19lcnJfZGF0YSBlcnJfZGF0YSA9IHswLCAwfTsKIAog
CXdoaWxlIChkYXRhLT5ycHRyICE9IGRhdGEtPndwdHIpIHsKIAkJcm1iKCk7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA0MTE2ODQxZWIwZTMuLjI3NDhiZDExMGZhYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC0yNDEsNyArMjQxLDEwIEBA
IHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2ludGVycnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIHN0YXRpYyBpbnQgZ21jX3Y5XzBfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkp
CiB7CisJc3RydWN0IHJhc19lcnJfZGF0YSBlcnJfZGF0YSA9IHswLCAwfTsKIAlrZ2Qya2ZkX3Nl
dF9zcmFtX2VjY19mbGFnKGFkZXYtPmtmZC5kZXYpOworCWlmIChhZGV2LT51bWNfZnVuY3MtPnF1
ZXJ5X3Jhc19lcnJvcl9jb3VudCkKKwkJYWRldi0+dW1jX2Z1bmNzLT5xdWVyeV9yYXNfZXJyb3Jf
Y291bnQoYWRldiwgJmVycl9kYXRhKTsKIAlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCAwKTsK
IAlyZXR1cm4gQU1ER1BVX1JBU19VRTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
