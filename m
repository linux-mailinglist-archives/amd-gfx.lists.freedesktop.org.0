Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB648FC9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307DC89D79;
	Mon, 17 Jun 2019 19:45:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE64D89D79
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:30 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r6so7018305qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6XrxI2TVHy0k69OTF5V5S/g+URuXO4b+eBHfyoEP4E=;
 b=fVGONInRf/wR5082VDEhIlB4XhE9YK3bQhXCXfW7IBaLgYE/5/s4cwRHiH9IsLXfI4
 KDMdMDfXT6Tw3Ro1DB8QLUOOH7p8UpPe9BVVzEKhtzO/8Mw7FZDcgO2BgKflpenKb65g
 Sl6t0tCqcARn18kn1leH95vptDQHBqwI9y7nHWZw+PL/H+bmJ2eUCTWoKh2dY7x7f2c5
 j21CuvDo3kX3GW/rfocfHZ1iDkps64e/pAE8MCgEGYZWVfiiYKbuMN1ltmQSI8wQ2MEj
 vx3ivNROnYFAsXcA/wYiM97m77ooZyty6zwYaAEbFXzM7wob+TkCxZScRFMcWTDFGn+z
 G85Q==
X-Gm-Message-State: APjAAAW+eIC9WJHtoNMgVocb77e+golzMHUWSlShHCRBri1qGElmZwFS
 4vPB69pAGkamxlrsnpHGb31rX6xyjJk=
X-Google-Smtp-Source: APXvYqxQdAoKes2xT2UHxLJ4m+7nQnAiQRWwXC+erOCFUYfpSWyV0U0iXbCwP7eY8FkSIF49h5h3BA==
X-Received: by 2002:ae9:e842:: with SMTP id a63mr87303296qkg.143.1560800729804; 
 Mon, 17 Jun 2019 12:45:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u63sm1490547qkh.85.2019.06.17.12.45.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 298/459] drm/amd/powerplay: disable fw dstate when gfxoff is
 enabled
Date: Mon, 17 Jun 2019 14:45:19 -0500
Message-Id: <20190617194520.18449-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194520.18449-1-alexander.deucher@amd.com>
References: <20190617194520.18449-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6XrxI2TVHy0k69OTF5V5S/g+URuXO4b+eBHfyoEP4E=;
 b=CUtZVACdzJB+943a1TnEvJlVKwWhZZJ9lvjI/uDT1ZTMUpj+yzxzDvZOWmBb2/bFZH
 HWJmQMo5BJVXwbY50FbQn+3tUwbX5w1ZnlVUb0NcZnXPqm/DUDINS8jxoIOUT1YJboz5
 mFVXDKyhkaglDjE5k8BUA4qqWJX5npgxwVW8yZ3ahaR0wrSb850/mbLXOPgHqRHMmwhu
 O8w9gA7IKEGXKuvGLAllH73504JhUJLtmH98L3dVZqGlmeD+fIPWB+nuJljOEze7/x/l
 J3qlwKKJ1ExFm/mlfX5tKPs2VhF/Od/MwEIrn0WTY3nX/y+iaUkG8TrE8/LtSZY20Igq
 T29A==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClNNVSBGVyBoYXMgYnVnIHRoYXQg
aXQgd291bGQgY2F1c2UgaHVuZyB3aGVuIGJvdGggZncgZHN0YXRlIGFuZApnZnhvZmYgYXJlIGVu
YWJsZWQgYXQgdGhlIHNhbWUgdGltZS4KClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5Y
aWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNSAr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCA0ZGI1ZWNkMzg1
YTQuLmFmMGFiZWQ2MTY5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwpAQCAtMzM2LDkgKzMzNiwxMiBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9t
YXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVf
RldfRFNUQVRFX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FDRENfQklUKTsKIAot
CWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfR0ZYT0ZGX01BU0spCisJaWYgKGFkZXYtPnBt
LnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykgewogCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9t
YXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWF9TU19CSVQpCiAJCQkJfCBGRUFUVVJFX01B
U0soRkVBVFVSRV9HRlhPRkZfQklUKTsKKwkJLyogVE9ETzogcmVtb3ZlIGl0IG9uY2UgZncgZml4
IHRoZSBidWcgKi8KKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayAmPSB+RkVBVFVSRV9NQVNL
KEZFQVRVUkVfRldfRFNUQVRFX0JJVCk7CisJfQogCiAJaWYgKHNtdS0+YWRldi0+cGdfZmxhZ3Mg
JiBBTURfUEdfU1VQUE9SVF9WQ04pCiAJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVB
VFVSRV9NQVNLKEZFQVRVUkVfVkNOX1BHX0JJVCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
