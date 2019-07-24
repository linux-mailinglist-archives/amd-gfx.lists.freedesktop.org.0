Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE472712
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E56E442;
	Wed, 24 Jul 2019 05:00:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D196B6E440
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:28 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so32918313qke.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDv7AkSjof5UJIKPF0RBrbfVLkEZAccSJB71G7DItKA=;
 b=Qje7gBA9snI8XqCUl6Df5YytXmyVSjpCoJIp9TYKbWOCdEoY0j2nmbxjCm7Go26fMP
 u1BeFhK/6SDmzQQ0Dup/wlVGpvagmW2Xk6NGnMHesgihHDj6taKlyozmaWsOu7FQMWu0
 NyyrrKBdHczC3YSpaq2Za34BeFgscHy0yrvw/A2kDZ3SbI4V/4yebHbzL9cyBQPW2Oh9
 I/VBZwZIY8JpvE3usXggvaoNWydnnr7fZqG912kYAPe/VAsAHqIURkjaMg1hj8D8aO9I
 T3GfKgNJtMMxlAjTkG6bbiCYxHIfPJc+7QN3QXhhwClz5WwX3H+KbKMUfV97dlGQwCMq
 lQPw==
X-Gm-Message-State: APjAAAWqO4JbLrpIo+6cu6/Ln+Twl0gy7fVKBDtFF+wJ8EIDeXmYydSH
 XzwAUmdxf4KhnjeW0NuUEWkUTC+J
X-Google-Smtp-Source: APXvYqzzHRykP9QBf4RSAxknNU86y0/8y8xYKA7mdOtRNthRSjLk2kRkWOUQ9vDh1XfOMuTJhcTcdw==
X-Received: by 2002:a37:4944:: with SMTP id w65mr51352136qka.111.1563944427738; 
 Tue, 23 Jul 2019 22:00:27 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/9] drm/amdgpu/powerplay/vega10: only use PrepareMp1ForUnload
 for mode1 reset
Date: Wed, 24 Jul 2019 00:00:10 -0500
Message-Id: <20190724050012.31398-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDv7AkSjof5UJIKPF0RBrbfVLkEZAccSJB71G7DItKA=;
 b=ZsarYSYLq7LQlhH3ztobEEy6KprpnlYGqwchaTKQfmysMQIBRI9z9ZG79bhRLmIZ73
 LvWp0v8V6BfFZCCX84wMX3jqhrD3m0hrzJfGK34G1eZnPDq1OxU24wX1LRq7C5qyO8MP
 w1if0lAPMxO693QkzquL3j98+ioC4W2u9eX7nPaoy05LNAuPX4CQrz12d1/ZnOkSnIXa
 SljWiJ379YpOkPYoPwG9pwEjjtBQ/8eW23bO4UTRyWiiKCscMQlQCB382IIiSyyvfCeK
 PDyOTVPERDsFh5VoqeZSbVgGt4IZWViInRjgaYrmDyjRsp7RvEGv0XcJakFkhKVnQHyQ
 FgdQ==
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

SXQncyBub3QgbmVlZGVkIGZvciBCQUNPLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKaW5kZXggYTYwNjZkOTJkZTc4
Li42Y2E5MmM4M2QyZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jCkBAIC00NzMyLDYgKzQ3MzIsNyBAQCBzdGF0aWMgaW50IHZl
Z2ExMF9kaXNhYmxlX2RwbV90YXNrcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogc3RhdGljIGlu
dCB2ZWdhMTBfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdyICpod21ncikKIHsKIAlzdHJ1
Y3QgdmVnYTEwX2h3bWdyICpkYXRhID0gaHdtZ3ItPmJhY2tlbmQ7CisJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBod21nci0+YWRldjsKIAlpbnQgcmVzdWx0OwogCiAJcmVzdWx0ID0gdmVn
YTEwX2Rpc2FibGVfZHBtX3Rhc2tzKGh3bWdyKTsKQEAgLTQ3NDAsMTAgKzQ3NDEsMTMgQEAgc3Rh
dGljIGludCB2ZWdhMTBfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAkJ
CSk7CiAJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwICY9IH4oV2F0ZXJNYXJrc0xvYWRlZCk7CiAK
LQlQUF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPSBzbXVtX3NlbmRfbXNnX3RvX3NtYyhod21n
ciwKLQkJCVBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwKLQkJCSJbUHJlcGFy
ZU1wMUZvclVubG9hZF0gRmFpbGVkISIsCi0JCQlyZXR1cm4gcmVzdWx0KTsKKwlpZiAoYW1kZ3B1
X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYpID09IEFNRF9SRVNFVF9NRVRIT0RfTU9ERTEpIHsKKwkJ
UFBfQVNTRVJUX1dJVEhfQ09ERSgocmVzdWx0ID0KKwkJCQkgICAgIHNtdW1fc2VuZF9tc2dfdG9f
c21jKGh3bWdyLAorCQkJCQkJCSAgUFBTTUNfTVNHX1ByZXBhcmVNcDFGb3JVbmxvYWQpKSA9PSAw
LAorCQkJCSAgICAiW1ByZXBhcmVNcDFGb3JVbmxvYWRdIEZhaWxlZCEiLAorCQkJCSAgICByZXR1
cm4gcmVzdWx0KTsKKwl9CiAKIAlyZXR1cm4gcmVzdWx0OwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
