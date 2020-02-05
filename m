Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE591533C6
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Feb 2020 16:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4278C6E9AE;
	Wed,  5 Feb 2020 15:22:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3626F607
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Feb 2020 15:22:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so2905735wmj.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 05 Feb 2020 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RqfP0dhw8LvN7d6Y/D6u4o6oH77iqbiP7w7kwXe3H9M=;
 b=tsx3vG/CgknSeRcS/cGhQE/ydw4KaJSvuqBLn3JOz5ISHPMya3MA5YNxZ6XizNX8pw
 QevzvcUq9pL8aXSRtfViaHe7j1pxqY+/RnzRrVZPCU3tzckAMffTdvF8iB8Ao969+KoJ
 3PyghV/yNTTKKIdfRzRYfL6crTXBxooGaOo+RYXdE//T1XLGOTPcz5HpWhzDCW9KxLj4
 qkKIK3G+INQU8VkxSAT5OJa42fbAJ6ttXWvwlhYssXvmhPNV9KqRoBXXuIG5w6AggJ5M
 c7XGHo3zxbIIcs3j6a7enn5pHvZRGhRf5hSfAasvpymWrkQ+JoqCTWmmzEW+L2Z649hz
 ++2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RqfP0dhw8LvN7d6Y/D6u4o6oH77iqbiP7w7kwXe3H9M=;
 b=lWO3y0uKgA8inKFAfqnKcNqkOu1LFzAreS2CrSFbqS5bewl02mCa3hEULO5fGMxUjf
 m6SzEpMLELNP3+36UlzRgskvVLvvfcZHZd5Qw0tYCdIrcXfRi0lQurWXaMz68KxKCKcL
 nBBSbpeoLomN4ox7Ge6CUbazbmNY01tiscXn/sFgcO2skjTsYjUz/HiN9jcibTGK2XtF
 mfaIA3nSWFsw5X4g3+/nBTJhW7dB5/aK1Ja0NpOEsg/1BSWcweXK4QBvEYRZQIvvJYyJ
 sSNUBdUqSWIFU94AfEluerBSnqFKvjueTTaWx2gYz37OvUmtqwktiU7tmH5IGpIiCj3L
 Wg9Q==
X-Gm-Message-State: APjAAAUOpBkqA4hyTs3FZqc2O4PoiqcXOMHIiR8ge6GpVhURJ5XlZPlc
 W8O15yB+ryJ+sHKbrAicziWHlAFV
X-Google-Smtp-Source: APXvYqzlYMDYQFZ4o6U3aRTszoKTVb/mBTGDrOMm52iAidiyqHjA9fobF2obYd00i/xnag6mDgmdWQ==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr6120120wmk.46.1580916161512; 
 Wed, 05 Feb 2020 07:22:41 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7118:fd6f:1c5e:860a])
 by smtp.gmail.com with ESMTPSA id p3sm209169wrx.29.2020.02.05.07.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 07:22:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org, felix.kuehling@amd.com, Jonathan.Kim@amd.com
Subject: [PATCH 2/4] drm/amdgpu: use the BAR if possible in
 amdgpu_device_vram_access
Date: Wed,  5 Feb 2020 16:22:36 +0100
Message-Id: <20200205152238.45258-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200205152238.45258-1-christian.koenig@amd.com>
References: <20200205152238.45258-1-christian.koenig@amd.com>
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

VGhpcyBzaG91bGQgc3BlZWQgdXAgZGVidWdnaW5nIFZSQU0gYWNjZXNzIGEgbG90LgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDIxICsrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZDM5NjMwZWRkYTAxLi43
ZDY1YzlhZWRlY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKQEAgLTE4OCw2ICsxODgsMjcgQEAgdm9pZCBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3QgcG9zLAogCXVpbnQzMl90IGhpID0gfjA7
CiAJdWludDY0X3QgbGFzdDsKIAorCisjaWZkZWYgQ09ORklHXzY0QklUCisJbGFzdCA9IG1pbihw
b3MgKyBzaXplLCBhZGV2LT5nbWMudmlzaWJsZV92cmFtX3NpemUpOworCWlmIChsYXN0ID4gcG9z
KSB7CisJCXZvaWQgX19pb21lbSAqYWRkciA9IGFkZXYtPm1tYW4uYXBlcl9iYXNlX2thZGRyICsg
cG9zOworCQlzaXplX3QgY291bnQgPSBsYXN0IC0gcG9zOworCisJCWlmICh3cml0ZSkKKwkJCW1l
bWNweV90b2lvKGFkZHIsIGJ1ZiwgY291bnQpOworCQllbHNlCisJCQltZW1jcHlfZnJvbWlvKGJ1
ZiwgYWRkciwgY291bnQpOworCisJCWlmIChjb3VudCA9PSBzaXplKQorCQkJcmV0dXJuOworCisJ
CXBvcyArPSBjb3VudDsKKwkJYnVmICs9IGNvdW50IC8gNDsKKwkJc2l6ZSAtPSBjb3VudDsKKwl9
CisjZW5kaWYKKwogCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5tbWlvX2lkeF9sb2NrLCBmbGFn
cyk7CiAJZm9yIChsYXN0ID0gcG9zICsgc2l6ZTsgcG9zIDwgbGFzdDsgcG9zICs9IDQpIHsKIAkJ
dWludDMyX3QgdG1wID0gcG9zID4+IDMxOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngK
