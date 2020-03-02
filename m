Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE4175A45
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 13:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0539F891A4;
	Mon,  2 Mar 2020 12:18:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB4289083
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 12:18:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u9so4576544wml.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 04:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v9mqQdJl+HZQsT4v/qYNlg7FJuGD3cPeq5PhAWxoU6E=;
 b=XFtll0ggOkZYtdNINfugUdQtlMlAaaCIWcXuPJTWaVDyT6FYubQpfvuA2/KmASzVyJ
 ewQyJypi+RDcK6xvafsgg9CS0IxiYuDX5th4BUGjzkT+HHU5hSScOv3X73h6RdQmYP5X
 pkTfZalROcDIK+C3LookOCXak5Pj1/Tle4xSbXnRHGz/MDiKZqnsjgAmxm0aMkI+sKG1
 AQQI6TLCnXKgkkTbbpPrqQkWWMCp9JWU8wNFAjYpSubBMEuUm2/SKOmJThpNd05iVY0S
 hPcZ/nq1tt/WgJkTmWN3CrYbRhsbRMC53HeHIVYx8ZywuP76OjqosSOZETJmsVIp+7Gz
 yhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v9mqQdJl+HZQsT4v/qYNlg7FJuGD3cPeq5PhAWxoU6E=;
 b=Tz7WoQgPEUwCM5Go1WwUr1aFlLmLwKNzOmA/6bMsOVUG9Z/w68AtcCAvRFIlxtZmJS
 uCiNMQmymMInam8qEt3X4m1O/Eq2GqWnZqUrsRUrvqYFnnN3IFVvBsDqRj4mPXixQjuP
 q1zM+57rfDOroAzG4+UOOFLbB87y2Ng84m6EzQX1Ayh0QoBr1JwwqytWQOGs8o4iYZNB
 tXJ9anDByA+25cteHKrgdYd7JF9IlapyPICH+uBPswCd9ndTV9hZopsAy3yEwBlgGYgV
 v5Tfayu7eZ5WgZ+3jepErnVCcySJccypITpbZJdoZOpoaFPWjriww0Oo4vsmUOHS4H80
 D9sg==
X-Gm-Message-State: APjAAAWOcoHLD7z7IEQcR2fq45BXX2OhZzYjoOYBGDDS09CQzPk187Yu
 D7F0k8Ho7hfjnEtp0NHrEE2mKbD9
X-Google-Smtp-Source: APXvYqxSlHcbYSIn2an7DftitDT2nbqQG1jByOCfehq+jCznkGacHvML/9wbFvA31IHo/BOPBN+rWg==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr19479135wmg.146.1583151484224; 
 Mon, 02 Mar 2020 04:18:04 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cef:40a0:b16c:8c99])
 by smtp.gmail.com with ESMTPSA id b186sm15190969wmb.40.2020.03.02.04.18.03
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:18:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: stop evicting encrypted BOs to swap
Date: Mon,  2 Mar 2020 13:17:59 +0100
Message-Id: <20200302121759.13003-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302121759.13003-1-christian.koenig@amd.com>
References: <20200302121759.13003-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3dhcHBpbmcgb3V0IGVuY3J5cHRlZCBCT3MgZG9lc24ndCB3b3JrIGJlY2F1c2UgdGhleSBjYW4n
dCBjaGFuZ2UKdGhlaXIgcGh5c2ljYWwgbG9jYXRpb24gd2l0aG91dCBnb2luZyB0aHJvdWdoIGEg
Ym91bmNlIGNvcHkuCgpBcyBhIHdvcmthcm91bmQgZGlzYWJsZSBldmljdGluZyBlbmNyeXB0ZWQg
Qk9zIHRvIHRoZSBzeXN0ZW0KZG9tYWluIGZvciBub3cuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggMjVk
M2I5M2Y0NDZlLi45NmQ5NzUyM2RhNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMKQEAgLTE1NTIsNiArMTU1Miw5IEBAIHN0YXRpYyBib29sIGFtZGdwdV90dG1fYm9f
ZXZpY3Rpb25fdmFsdWFibGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAogCXN3aXRj
aCAoYm8tPm1lbS5tZW1fdHlwZSkgewogCWNhc2UgVFRNX1BMX1RUOgorCQlpZiAoYW1kZ3B1X2Jv
X2lzX2FtZGdwdV9ibyhibykgJiYKKwkJICAgIGFtZGdwdV9ib19lbmNyeXB0ZWQodHRtX3RvX2Ft
ZGdwdV9ibyhibykpKQorCQkJcmV0dXJuIGZhbHNlOwogCQlyZXR1cm4gdHJ1ZTsKIAogCWNhc2Ug
VFRNX1BMX1ZSQU06Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
