Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D47CB34
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E25F6E2A9;
	Wed, 31 Jul 2019 17:58:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40B26E1B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:42 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id w186so5416329vkd.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=99cf51OlW2vwing66CEfF12GEPqfscQupKfzjPJwXQI=;
 b=seS9jtneqWXxdaCCF8i1JjpcvV0Ol4tEhnQ025+S+aV+7XQ1Zjj2D6DLZTzZb2pdzo
 8r1wTesvMc2A7svbvyF2ZScu9i4PFzo0olHGo3lMSnwH8kvYwrMBFvtDCTTbWf0mguwI
 +D8b4igeLUvDcoDhZa39Y+BVrq+fV6rZEtpxQ+3g3g0hHk5W/6yyE+KMSLZLRvmTe8sR
 5p15GE6qmCLTePzoYBdqutxFymZ/jeq2h5cnpeJ/ISEjOsdBrxtl7CfGHvajDkYayrmj
 NhPq6DHy9rZIX0g8pMH0tttXOowYG4rbzbLKSZGTyxHxF5q6T0y9MM3oAjqeFR9AKj+b
 lDVQ==
X-Gm-Message-State: APjAAAWMraR0pwQfrmUdwBqXH7bFoHktBD0eazz2JOCuSHZ3JNP+ChcX
 dYkcu2E1CbLeqv/LRheQ/csQy182
X-Google-Smtp-Source: APXvYqzrDt6NNGwXv/sSbzXZZ0Ng9QMogfH+2+kKuhlzynEACwZDRoW5G+biUyO+FuXuMX/LCMA5/w==
X-Received: by 2002:a1f:5cd:: with SMTP id 196mr4876288vkf.62.1564595921405;
 Wed, 31 Jul 2019 10:58:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/26] drm/amdgpu: update algorithm of umc uncorrectable error
 counting
Date: Wed, 31 Jul 2019 12:58:05 -0500
Message-Id: <20190731175818.20159-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99cf51OlW2vwing66CEfF12GEPqfscQupKfzjPJwXQI=;
 b=anCfUVOSox9sNec21erbnP45jJo0Jq6Q3+Y7FBCgv13u1J1d0aB38qL6WzgOaFyxO1
 QxvqrarDLDyvAK6gdgoExCEzL3W/wTviDdcIrnDb0lexHnD9+/y+lAtBMlDbjoH2dzFv
 BFEWgV9IWTU1dOIiGWaDiCe1b3W2bMrvefgNvbfczTrgLsSFPZ/dy/4IWQquNuLtBnTN
 F3cEpKtd9Eenw097iPo3JWwwr/CiP0prvrnKfS0xzmZ8Q0eIGFnJPg6JwK4u/0EP/6by
 mebJFbEsxIbPav8Kcer4UGVM+ocOF6gernuqr8uacl8OFiTc3BNPlNW+eVV/gkI9kLNN
 E3ow==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKcmVtb3ZlIHRoZSBjaGVjayBvZiBF
cnJvckNvZGVFeHQKCnYyOiByZWZpbmUgdGhlIGlmIGNvbmRpdGlvbiBmb3IgdWUgY291bnRpbmcK
ClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IERlbm5pcyBMaSA8ZGVubmlzLmxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dW1jX3Y2XzEuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS91bWNfdjZfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwpp
bmRleCA4ZmJkODFkM2NlNzAuLjViMWNjYjgxYjNhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS91bWNfdjZfMS5jCkBAIC0xMTMsMTIgKzExMywxMiBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9x
dWVycnlfdW5jb3JyZWN0YWJsZV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dgogCiAJLyogY2hlY2sgdGhlIE1DVU1DX1NUQVRVUyAqLwogCW1jX3VtY19zdGF0dXMgPSBSUkVH
NjQobWNfdW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOwotCWlmIChSRUdfR0VUX0ZJ
RUxEKG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgVmFsKSA9PSAx
ICYmCi0JCVJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NU
QVRVU1QwLCBFcnJvckNvZGVFeHQpID09IDYgJiYKLQkJKFJFR19HRVRfRklFTEQobWNfdW1jX3N0
YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBVRUNDKSA9PSAxIHx8Ci0JCVJFR19H
RVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBQQ0Mp
ID09IDEgfHwKLQkJUkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNV
TUNfU1RBVFVTVDAsIFVDKSA9PSAxIHx8Ci0JCVJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywg
TUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBUQ0MpID09IDEpKQorCWlmICgoUkVHX0dFVF9G
SUVMRChtY191bWNfc3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAsIFZhbCkgPT0g
MSkgJiYKKwkgICAgKFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01D
VU1DX1NUQVRVU1QwLCBEZWZlcnJlZCkgPT0gMSB8fAorCSAgICBSRUdfR0VUX0ZJRUxEKG1jX3Vt
Y19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgVUVDQykgPT0gMSB8fAorCSAg
ICBSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNU
MCwgUENDKSA9PSAxIHx8CisJICAgIFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VN
Q19VTUMwX01DVU1DX1NUQVRVU1QwLCBVQykgPT0gMSB8fAorCSAgICBSRUdfR0VUX0ZJRUxEKG1j
X3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgVENDKSA9PSAxKSkKIAkJ
KmVycm9yX2NvdW50ICs9IDE7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
