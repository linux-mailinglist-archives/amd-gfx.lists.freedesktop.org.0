Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B769E48
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F5B6E02E;
	Mon, 15 Jul 2019 21:26:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F34E6E027
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:03 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so12872958qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbVs2PzxD/0fECauy5WUIfmUKvNFQSAsCKSCR08NziQ=;
 b=ho6BVSZTfFylSZRRy5dYp0ro/OmKqJiJRTk00XfDGLB/oI+TWwINivHTCA36JxZaWT
 uhTQTYznqZvQMUcabfiSlPJp906Q0IRrejWSmAAUeBHgpcHjunzFOGUcz/1BnKdCHjcc
 WnP8ZBKe3Ysen6if+r0gt/7Lph8GyH7TmdM7QIZccpuOP+Qg5TL3B0MIx8Gt39G8q2OW
 P2ENT72BbOf0sAraNgoChJNrYCuUTlS9pXohCiN8k2FRMciBYucUOcOh4zAKW5QsZeQK
 NYt3TrSSN1eJ9G+eIB/twfNUgnIkMD9vgQYvKnuXwke46/C0TjA37pOPIKgNmrSGTL54
 QKKQ==
X-Gm-Message-State: APjAAAWZdORdtorw6FLtJYppjDn4lIV/ZXmIZN3RjQRu8twRzlEoEeRi
 G+EcDuglaJ1+immVxipPfpF3ruau
X-Google-Smtp-Source: APXvYqxD5PQSM92oahdqWnWmfufcgbnKtTTq5tSlK43+yiPvCJalYKnj/+4mJw2tCamZU55qIRfURQ==
X-Received: by 2002:a37:4ac3:: with SMTP id
 x186mr17906550qka.138.1563225962107; 
 Mon, 15 Jul 2019 14:26:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 084/102] drm/amdgpu: add pci DID for Arcturus GL-XL.
Date: Mon, 15 Jul 2019 16:24:19 -0500
Message-Id: <20190715212437.31793-82-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbVs2PzxD/0fECauy5WUIfmUKvNFQSAsCKSCR08NziQ=;
 b=FMnrWRHOxzoPlhwjJa8n8tFs5Y/fI2UWZ40KJqSsC72v8zMULZUbcYklhLkYpr6InX
 xAboQazMqYtWj8buEwGuj8L0JsJY8DJ92U7n7U547mN0HDBeVo7akicRfA8AAfwdfSPq
 27ef40KgPNAwINxkLDm3HlTXe0L3YiWu6ZJyyIoaJm3xf1sNaLxgkpuqPUdyMFYqQhXU
 ZpoYmuVDld8gVdT5B1iCL2H1z54L4AYgEFilgQYa66BvBoi3y6lqXOInGBPO/wDSy3kd
 bgtykFHCc2+32zvueO7y8fI09dLSJ/h/GFgkuAzFNrvSTSkxHWSo2bSwrj+Vs9vdTmR8
 TsRQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Le Ma <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IEZlaWZl
aSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZSBNYSA8TGUuTWFAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYwppbmRleCAwZTgwYTUwMGFhMjIuLmZjOGY4MmFjMTM4MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtOTk0LDYgKzk5NCwxMCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7CiAJLyogUmF2ZW4g
Ki8KIAl7MHgxMDAyLCAweDE1ZGQsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBf
UkFWRU58QU1EX0lTX0FQVX0sCiAJezB4MTAwMiwgMHgxNWQ4LCBQQ0lfQU5ZX0lELCBQQ0lfQU5Z
X0lELCAwLCAwLCBDSElQX1JBVkVOfEFNRF9JU19BUFV9LAorCS8qIEFyY3R1cnVzICovCisJezB4
MTAwMiwgMHg3MzhDLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX0FSQ1RVUlVT
fSwKKwl7MHgxMDAyLCAweDczODgsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBf
QVJDVFVSVVN9LAorCXsweDEwMDIsIDB4NzM4RSwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgQ0hJUF9BUkNUVVJVU30sCiAJLyogTmF2aTEwICovCiAJezB4MTAwMiwgMHg3MzEwLCBQQ0lf
QU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxMH0sCiAJezB4MTAwMiwgMHg3MzEy
LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxMH0sCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
