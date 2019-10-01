Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BDC42EF
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 23:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8A6E0A6;
	Tue,  1 Oct 2019 21:48:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E4E6E0A6
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 21:48:38 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p10so12839435qkg.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Oct 2019 14:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XE76RXqD0SPPGSQ/QOkT8E4JTxMzfFl8dLArz3PZdVM=;
 b=LuvvheUjQXYa8On3DvQ9OG/6trPUygAIAzZEIZXoyTNAhxfa+pQjH5kKRY5leq5vzF
 uO1m6KtB5FxmbzKEiHqLy2T+mYvqTMK+4T5gz5tdPu7Uqm1g0jVD7u42E6+pNH0c9K5f
 GoagG2zvhUTWwfx2Tfvuxb4hAdaKYPXKSUZxvVYK/b+UqflfPcUvZssTqnB3hNowOOPl
 B+nuCROLKRwUK/FyMkha74f6Mj078aUCZ9Rf7QmoeSkzcwPHL9T7lAcUBW811cD1pMat
 n8E1YIEcnTW0VgCAj+UCLDA7wOr2Oid76Dt0qijrZDEZkxwLrb6z+XShf/0V0dp/pEs1
 jA7w==
X-Gm-Message-State: APjAAAUTCeSP9eEcCIMj8+0Nn4b/ru/ucFyxCn32RDHswwqE5ojnFRcz
 IFRZZEiZe3Tb2ajyaHUVkCoZMxoT
X-Google-Smtp-Source: APXvYqxvps0lGYupERPsNxDYSKjqHOMYd3Z+6XHJSVSXm6XGhNED8sgCA32QiffR5NqgeVUrt5Y1lA==
X-Received: by 2002:a05:620a:13d9:: with SMTP id
 g25mr361877qkl.230.1569966517243; 
 Tue, 01 Oct 2019 14:48:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id v5sm11842263qtk.66.2019.10.01.14.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 14:48:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: don't increment vram lost if we are in hibernation
Date: Tue,  1 Oct 2019 16:48:29 -0500
Message-Id: <20191001214829.24634-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XE76RXqD0SPPGSQ/QOkT8E4JTxMzfFl8dLArz3PZdVM=;
 b=aIITGr/eApK0UgJMMOGOplDD0iInGLe32fBAgy8bU05jyQUQ9VmZ7yFHAucV1bBC/I
 FLhsqDe3M71KW+/K7N5MkihJM8JRUCEpecmnUVal5oBRjUASg9lei2r+T9Yv6B4A6i4O
 uyGpg9kXBMnfbK6xGDvH+EoDb0nhFmHxpta6Y+TB2grQC2AeBtUvrxR+lPSTPlW6+uRV
 3lJvp9WzkCjNfGbIwRVFrgfr0vMiRY7fDC+IrcxqUyH83bEqS9eif7YXUDlPufLn+oYy
 1BnZesjywxQUSz4FVmraGkbvo511oDIgy4++os7BM3uZ4FixR4bQIIfWpyq51mvOyR/j
 dHMg==
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

V2UgcmVzZXQgdGhlIEdQVSBhcyBwYXJ0IG9mIG91ciBoaWJlcm5hdGlvbiBzZXF1ZW5jZSBzbyB3
ZSBuZWVkCnRvIG1ha2Ugc3VyZSB3ZSBkb24ndCBtYXJrIHZyYW0gYXMgbG9zdCBpbiB0aGF0IGNh
c2UuCgpCdWc6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEx
MTg3OQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyAgICB8IDYgKysrKy0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNiArKysrLS0KIDIgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jCmluZGV4IGIzZTc3NTZmY2M0Yi4uMTdkYzA1NGE0YjZjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMKQEAgLTMxOSwxMCArMzE5LDEyIEBAIHN0YXRpYyBpbnQgbnZfYXNpY19yZXNldChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2
LT5zbXU7CiAKIAlpZiAobnZfYXNpY19yZXNldF9tZXRob2QoYWRldikgPT0gQU1EX1JFU0VUX01F
VEhPRF9CQUNPKSB7Ci0JCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOworCQlpZiAoIWFkZXYt
PmluX3N1c3BlbmQpCisJCQlhbWRncHVfaW5jX3ZyYW1fbG9zdChhZGV2KTsKIAkJcmV0ID0gc211
X2JhY29fcmVzZXQoc211KTsKIAl9IGVsc2UgewotCQlhbWRncHVfaW5jX3ZyYW1fbG9zdChhZGV2
KTsKKwkJaWYgKCFhZGV2LT5pbl9zdXNwZW5kKQorCQkJYW1kZ3B1X2luY192cmFtX2xvc3QoYWRl
dik7CiAJCXJldCA9IG52X2FzaWNfbW9kZTFfcmVzZXQoYWRldik7CiAJfQogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYwppbmRleCBiNTI0MGI1ZGJmN2IuLjg4YTQ5YTY4YzY3ZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC01NjQsMTIgKzU2NCwxNCBAQCBzdGF0aWMgaW50
IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJc3dpdGNo
IChzb2MxNV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSkgewogCQljYXNlIEFNRF9SRVNFVF9NRVRI
T0RfQkFDTzoKLQkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOworCQkJaWYgKCFhZGV2LT5p
bl9zdXNwZW5kKQorCQkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOwogCQkJcmV0dXJuIHNv
YzE1X2FzaWNfYmFjb19yZXNldChhZGV2KTsKIAkJY2FzZSBBTURfUkVTRVRfTUVUSE9EX01PREUy
OgogCQkJcmV0dXJuIHNvYzE1X21vZGUyX3Jlc2V0KGFkZXYpOwogCQlkZWZhdWx0OgotCQkJYW1k
Z3B1X2luY192cmFtX2xvc3QoYWRldik7CisJCQlpZiAoIWFkZXYtPmluX3N1c3BlbmQpCisJCQkJ
YW1kZ3B1X2luY192cmFtX2xvc3QoYWRldik7CiAJCQlyZXR1cm4gc29jMTVfYXNpY19tb2RlMV9y
ZXNldChhZGV2KTsKIAl9CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
