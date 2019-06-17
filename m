Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FA48FD3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2F89CDB;
	Mon, 17 Jun 2019 19:45:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57BC89CD3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:55 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so5889162qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWVQf6+Lem3GpgOvCrmYEwYrRYiDeU7vZDMQcuH73CU=;
 b=tJ7VTrt9MCtU3Oedv5UOFzTZjivtK25nZ8uT+8lbV6Djj+0kLJLdHqTQs5XGftPHNs
 75Let0Isu1uhLo9GzE/IKYsQgxNA8nywU/IFrUdflR0LIvu89E/8mkpqW9fRYVqyVnTz
 D1Hdly4pZmcg+HvTh1gqkX3RdqKKzO0fDw48rbJZcH11bIjAz+wmRMWuTaHITa2vkYha
 HSs3DnYXz6PHj92aMz5j/sPXqPCxgQnwyGukBFl18UakLo8rZOtjWcWq8GoUi9yavWsy
 30unnV8scR7UlzpIR3nyNlvC149L3Pfuuvi188+p+5gGzwC72GwU8LMEXVDAJx77AXh/
 WV7w==
X-Gm-Message-State: APjAAAV79EIEEa07z4axhPirP46FYLjcqIjOmcEJEmyvLV1O/eMzqzBf
 1AXs7Icg+eVbK/LrLTLlGHSbgao+F9c=
X-Google-Smtp-Source: APXvYqz2TUXdCmPa6ZV/oHDrSc+aGQ69xLKdSIOJfZLzdbcPBNtqk8qbw2ly/QHPajJIgOKCup/D9Q==
X-Received: by 2002:a0c:acb5:: with SMTP id m50mr23078010qvc.82.1560800754808; 
 Mon, 17 Jun 2019 12:45:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 304/459] drm/amd/powerplay: add ppt interface version log
Date: Mon, 17 Jun 2019 14:44:05 -0500
Message-Id: <20190617194540.18497-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWVQf6+Lem3GpgOvCrmYEwYrRYiDeU7vZDMQcuH73CU=;
 b=l3+acvvePGHvF4pjtyjD3oO+dqXwIhJpqwqFtX44DLvuMHGD8BhkeGaIojlJZYIWiH
 mGVU5A/xKsNz+lpd7tInmGvasoUTzvJOMuJsldUkxXK0fl2gPIneanPNK9UWlg711Cvl
 kJtuShSXPpbICiYSxuNRjVhmJRDuur/JiyQKjuOtmaSgLI11X65J5wP707i3G/+aabtb
 lv3P4WhXM64thAcTWQ8VOwmtox6yc3qTXQyBzyFNXymz1QnJTM4Wzt03f4yjkfeXEq11
 sEFqdD7u2PVS7BlzdQqcqUKHiE9rJpFpfnL4Bz0vWIpHev1rHy+LdJzlGJXdVe3Gl6Cx
 nwiQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, tiancyin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IHRpYW5j
eWluIDx0aWFuY2kueWluQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMKaW5kZXggM2YxMTc2NDIwYjBlLi45MzcxNGVlOWYzMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0yNTcsOCArMjU3LDEwIEBAIHN0YXRpYyBpbnQg
c211X3YxMV8wX2NoZWNrX2Z3X3ZlcnNpb24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJc211
X21pbm9yID0gKHNtdV92ZXJzaW9uID4+IDgpICYgMHhmZjsKIAlzbXVfZGVidWcgPSAoc211X3Zl
cnNpb24gPj4gMCkgJiAweGZmOwogCi0JcHJfaW5mbygiU01VIERyaXZlciBJRiBWZXJzaW9uID0g
MHglMDh4LCBTTVUgRlcgVmVyc2lvbiA9IDB4JTA4eCAoJWQuJWQuJWQpXG4iLAotCQlpZl92ZXJz
aW9uLCBzbXVfdmVyc2lvbiwgc211X21ham9yLCBzbXVfbWlub3IsIHNtdV9kZWJ1Zyk7CisJcHJf
aW5mbygiU01VIERyaXZlciBJRiBWZXJzaW9uID0gMHglMDh4LCBTTVUgRlcgSUYgVmVyc2lvbiA9
IDB4JTA4eCwiCisJCSIgU01VIEZXIFZlcnNpb24gPSAweCUwOHggKCVkLiVkLiVkKVxuIiwKKwkJ
aWZfdmVyc2lvbiwgc211LT5zbWNfaWZfdmVyc2lvbiwKKwkJc211X3ZlcnNpb24sIHNtdV9tYWpv
ciwgc211X21pbm9yLCBzbXVfZGVidWcpOwogCiAJaWYgKGlmX3ZlcnNpb24gIT0gc211LT5zbWNf
aWZfdmVyc2lvbikgewogCQlwcl9lcnIoIlNNVSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hl
ZFxuIik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
