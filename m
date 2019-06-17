Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514F48F23
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3268689B61;
	Mon, 17 Jun 2019 19:30:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F7F89B60
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:55 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d15so6957183qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDDu9ud2XP2UzZ/HrUQrlsHClb3q1Bup2lAOhQfw/fw=;
 b=afMUiQCDtixgBfAXsgOXnDJyai6weXD9kIvY/BI1qFZjllcDnDQX31c2FtucJGrhWk
 n89zIbYlpRH9kUafA/xXGxYYByx7QV9onuCtmb8ke2N+Nu5IrnExlGK2wB/LKB5gGbXQ
 uU+SCnajm5IIbXIJAdifEwx3md0HnvMtip+cLjtthObJNGKNbG22kgdLj7lFzDxAnQaQ
 QkGRHIgVXPyL0LmKxBilT35VF4G9hXKKt7BxLKiDeWulqNEcxFLQdbO3cCBJrDTQCJoe
 DMupky4wg7+fw4rew2nJm+7UmOqIdLaBxoJKo/SCLSlZP0zcUt7qTR+dfD1CAapOa4WN
 mcng==
X-Gm-Message-State: APjAAAVWQzD0HnKxgQ9Qp5vUN2z+ijHL5fm2KRJNNOJtJVP4akKQmidR
 qo+ry2ouCnAo3l+3F/NHHPzKHifYU1I=
X-Google-Smtp-Source: APXvYqyrd6kNlWhKeNd/9jr+HWlqlcj47Beq9/rSZRrAma46ernMkpVnAj2b04xffOjnTFlHVGTBzA==
X-Received: by 2002:a05:620a:35e:: with SMTP id
 t30mr18044271qkm.1.1560799854406; 
 Mon, 17 Jun 2019 12:30:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 198/459] drm/amdgpu/vcn2: don't access register when power
 gated
Date: Mon, 17 Jun 2019 14:30:41 -0500
Message-Id: <20190617193042.18183-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193042.18183-1-alexander.deucher@amd.com>
References: <20190617193042.18183-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDDu9ud2XP2UzZ/HrUQrlsHClb3q1Bup2lAOhQfw/fw=;
 b=oeHhpVGPOEWNIsWZmROxYcNU6mNiZXCp8THH/4UrrAZxoRyp+rtE1zctsjgOcXckLu
 bE58329AH7kQb5QaExk1TfFuJvAsPfBUzw4bFzKx4COKoWe7r8eyYmIV5yIOp6RhBAFu
 b2Nl6nPkqpXoKMu7/zEERracxReFChtPmNXRrwZzF+zBuDRFVeEBxL+7brMC48Q4NQUT
 bJ0SfT6BZqIoYGfIlt8+rSEIGdCWh8DruIrxEJBG5C3kP3hfvhVIzcUnaYtx5Yyvbh7m
 amuoBfmjOz31fOD7c8zX/Js10i0UTfmhK/cFUrrj1/N5IqFseSZR/Ge7GwrotF6QfEd9
 ipNA==
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
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IHdpbGwgY2F1c2UgYnVzIGhh
bmcgdG8gYWNjZXNzIHJlZ2lzdGVyIFVWRF9TVEFUVVMKd2hlbiBWQ04gaXMgaW4gdGhlIHN0YXRl
IG9mIHBvd2VyIGdhdGVkLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1k
LmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYwppbmRleCA3NjA5ZTYzZTU5YmMuLmQxZTkwMjA5ZDA4OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjJfMC5jCkBAIC0yNzcsNyArMjc3LDggQEAgc3RhdGljIGludCB2Y25fdjJf
MF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAmYWRl
di0+dmNuLnJpbmdfZGVjOwogCWludCBpOwogCi0JaWYgKFJSRUczMl9TT0MxNShWQ04sIDAsIG1t
VVZEX1NUQVRVUykpCisJaWYgKGFkZXYtPnZjbi5jdXJfc3RhdGUgIT0gQU1EX1BHX1NUQVRFX0dB
VEUgJiYKKwkgICAgUlJFRzMyX1NPQzE1KFZDTiwgMCwgbW1VVkRfU1RBVFVTKSkKIAkJdmNuX3Yy
XzBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsIEFNRF9QR19TVEFURV9HQVRFKTsKIAogCXJp
bmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
