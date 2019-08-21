Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB598709
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BACC6E3A8;
	Wed, 21 Aug 2019 22:20:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985A66E39C
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:20:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 125so3343351qkl.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rdUAg0dCNSGeyP+AET/9sGPFiIV2Dc9okqYgzSNUrDc=;
 b=eex+j3ghW70JtoXoMMMefqt84KGmfSer7wrwgM53x2/RFtucrpZSrsCvgaG16brtEJ
 soeqipChFrsVKmn1cXycKX6ffk32VNLifJpRXzb6JvYxJAYCeOaAlT+EjZp4m3wgLXXA
 PctAqtIG9MbMVYBIYgTONvmhmyPVFxvVoSBDTar03HK5EOc+VxGqV1YuJ49aTd5iSJ/6
 +jPNlnw0AR7syqGKNDP1AsJ6IowDriyDsaDD24fpIART726JPNWWzB+WB7qx8ADGB0xe
 o0Hrmut2ikr8vsGC6dWImwMROdzCWmVsr1WrlSMw+tTEtMCdT2s7HtvCOJMC77v3QAsu
 ERUQ==
X-Gm-Message-State: APjAAAWITv504Q2FxjnFKgEp5kym990Bo2HOcPPG93FAyJ3OJdKOW2Qy
 cr5ZH9T9CHCAVDneinynzmZ63Bbt
X-Google-Smtp-Source: APXvYqzxlTGxCPC8XuEAGt0GYoBaiR9323sbc5mY9IvOSCvY/HpthoUZYBZFGgZtNiJpMJ/ZnSisAQ==
X-Received: by 2002:a37:a6d8:: with SMTP id
 p207mr30502909qke.387.1566426047525; 
 Wed, 21 Aug 2019 15:20:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w10sm10674525qts.37.2019.08.21.15.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:20:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] XXX: hack: use atpx rather than HG for runpm v2
Date: Wed, 21 Aug 2019 17:20:33 -0500
Message-Id: <20190821222034.13387-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222034.13387-1-alexander.deucher@amd.com>
References: <20190821222034.13387-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rdUAg0dCNSGeyP+AET/9sGPFiIV2Dc9okqYgzSNUrDc=;
 b=CGmos8j8QRmyQL+yskmV353cwzqsUrqAHPeUeYxokl9tx84QWWo4hU40d9A25mDq+m
 McWrE8VftMvCRyNrKEdVMMKc5fzDwEVIDntJiGF7fxLB2NvttvkaSdGZ14toOnE0Ha1b
 VoqDtEo4UrrgpOIWVCn5xeFw2avQGCF4HHzJUEf2M9hq+rwtvdqAH0yrWOu96C90WUZv
 wXgjkLRofqXg9rgasJFU0Ax+9lNKeQTh1VP4/IyjHPwRX8JLtXLrhQrVGTnvBo2uFJVU
 ouxhGwL8xpKESwiCbJNpkasoyR1tOBjGSl3GgwpaDdp67sjTfCFcTlFJGXAAVJnwzTsO
 Q35g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zm9yY2UgcG93ZXIgY29udHJvbCBldmVuIGlmIEFUUFggY2xhaW1zIHRvIG5vdCBzdXBwb3J0IGl0
LgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRweF9oYW5k
bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRweF9oYW5kbGVyLmMK
aW5kZXggYzEzYzUxYWYwYjY4Li4xODE2ZjgxODllODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYXRweF9oYW5kbGVyLmMKQEAgLTIxMCw4ICsyMTAsOCBAQCBz
dGF0aWMgaW50IGFtZGdwdV9hdHB4X3ZhbGlkYXRlKHN0cnVjdCBhbWRncHVfYXRweCAqYXRweCkK
IAkJICogRGlzYWJsZSBsZWdhY3kgUE0gbWV0aG9kcyBvbmx5IHdoZW4gcGNpZSBwb3J0IFBNIGlz
IHVzYWJsZSwKIAkJICogb3RoZXJ3aXNlIHRoZSBkZXZpY2UgbWlnaHQgZmFpbCB0byBwb3dlciBv
ZmYgb3IgcG93ZXIgb24uCiAJCSAqLwotCQlhdHB4LT5mdW5jdGlvbnMucG93ZXJfY250bCA9ICFh
bWRncHVfYXRweF9wcml2LmJyaWRnZV9wbV91c2FibGU7Ci0JCWF0cHgtPmlzX2h5YnJpZCA9IHRy
dWU7CisJCWF0cHgtPmZ1bmN0aW9ucy5wb3dlcl9jbnRsID0gdHJ1ZTsvLyFhbWRncHVfYXRweF9w
cml2LmJyaWRnZV9wbV91c2FibGU7CisvLwkJYXRweC0+aXNfaHlicmlkID0gdHJ1ZTsKIAl9CiAK
IAlhdHB4LT5kZ3B1X3JlcV9wb3dlcl9mb3JfZGlzcGxheXMgPSBmYWxzZTsKLS0gCjIuMTMuNgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
