Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2EF2C0C6C
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 14:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0A689FED;
	Mon, 23 Nov 2020 13:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544F989155
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c198so15633328wmd.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aak1C5AROsIvSC+gcDbF5DK1OJsF92xIrCqFvBLF46A=;
 b=zQXLmgbCPdBSYkDzMUUmb9OMYNzAd9s1IP7it3fe9XT/V9GoG2disqTb5wa/JjkWa9
 n/jZa6zxmCNpvPvcyz1r7faJ4gWimYqeWiS8C0RyVvKdGa6FjJU9OjP+8WMK2E3RyS8b
 Yc6Y9LLhLN5636l3WW191hBEQ/rQE68cFW1YNXywf6Zhc0g6ISACxJVVW6TwmToiGTpt
 g7zqnQbHkoKDVbbtUeoiFJP/Vlc+ey0E3AgWuX0QTviMzXHruZDJsUpseTRYgYmOhcYQ
 B8jLRV0eqvVTaCO6XCFInlj0sYY7pgadoxGh27YIK3rJB9D9KPGTFLGwFBm9A/bikrx6
 lLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aak1C5AROsIvSC+gcDbF5DK1OJsF92xIrCqFvBLF46A=;
 b=UbzxxjUhkcEtQ+IX2D0o7Zjh5gIXnU8JhcQvvRz8K4JyBG2NBaQuVTNf+Uemnn3MOB
 3VKPA6DLRA7DSRfxwRUhMBjokIqA8wrcpP9cXQitvEvs55DzhvLElo7wC6qQv5vYPnPR
 Wuw+q+o8ZSNlxuj6R6Zzu3Qb8dbPggzORM42Wdj7rUDJP0guxQo7SatX6MKK+BVSDyde
 Kf7NuorTWT/W/privcb6WcS7CTXE2pK7Era5Ugyp9N+9+88rQMB80wV6Eit3XbkJOeYw
 0S20cj3JEiGiR6Mn780fA7ZDTEIbbUTS8kPHncfrTFXjl+/awpE1YNbKalky/6s+h//Y
 WuMA==
X-Gm-Message-State: AOAM530VMdK5bqAff+yzXr/20p3Za2pVtNXw4/4JI7vCsnZkG3iVb7uy
 jjG1fbCXjHYHKJPphRcABCHIRg==
X-Google-Smtp-Source: ABdhPJxzlhwbPFfCCCY4C6L4cRtqY3gatpejZGdMPL7K/CPJhYf3UqKcqEXab0w9gopVxgJ/0quHOg==
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr11190930wmf.139.1606130367035; 
 Mon, 23 Nov 2020 03:19:27 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/40] drm/amd/amdgpu/amdgpu_ib: Provide docs for
 'amdgpu_ib_schedule()'s 'job' param
Date: Mon, 23 Nov 2020 11:18:42 +0000
Message-Id: <20201123111919.233376-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 13:58:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmM6MTI3OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdqb2InIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9pYl9zY2hl
ZHVsZScKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAi
Q2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3Rz
LmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfaWIuYwppbmRleCBjNjlhZjliODZjYzYwLi4wMjRkMGE1NjNhNjUyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtMTA2LDYgKzEwNiw3IEBAIHZvaWQgYW1kZ3B1
X2liX2ZyZWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfaWIgKmli
LAogICogQHJpbmc6IHJpbmcgaW5kZXggdGhlIElCIGlzIGFzc29jaWF0ZWQgd2l0aAogICogQG51
bV9pYnM6IG51bWJlciBvZiBJQnMgdG8gc2NoZWR1bGUKICAqIEBpYnM6IElCIG9iamVjdHMgdG8g
c2NoZWR1bGUKKyAqIEBqb2I6IGpvYiB0byBzY2hlZHVsZQogICogQGY6IGZlbmNlIGNyZWF0ZWQg
ZHVyaW5nIHRoaXMgc3VibWlzc2lvbgogICoKICAqIFNjaGVkdWxlIGFuIElCIG9uIHRoZSBhc3Nv
Y2lhdGVkIHJpbmcgKGFsbCBhc2ljcykuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAo=
