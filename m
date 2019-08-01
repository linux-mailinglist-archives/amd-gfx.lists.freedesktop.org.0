Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923797E41B
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25D6E7BD;
	Thu,  1 Aug 2019 20:30:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A6D6E7B5
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:09 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so27407518qka.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omMV4Yf3Ai3Sg8DMKBq/0X5J0Rq7UfOHLlYWGvlb6dg=;
 b=jm/T+aefupoYJB99QPdHlw8FpgXPHmyVLC93/4xzEnp0rP+yXse1fHojb48/1cPIyP
 hunwCiPWrjkS2z0pUiRb9Z5HjI0q10tRkah0FXpbdnQir9PQDOqRJBugWgGMexWWwZt2
 dEJPgDtYPQS4NGOzfl4Rm0Hod3g1Kv5qFwC6RenNV5bUIWiWgin/BJCganMyyoAYsUYL
 UT4PeC/63LKXCsMHGj1QOJYeoveQFYl2+FzzNRGPHrk4X7FOEU6DJUWSkxbsla/GB32e
 a+eN5eOIDohVEkJFfe+EFytE2QinA4OMM/8XgPGGuxOzsTrhKM94iTKPOOhL7TSVY6O1
 jPvQ==
X-Gm-Message-State: APjAAAXGf96ippIALk9SuXdFBLkvY+N2tODucyqRJ2Ev9sp6xM89VqBd
 8WaFkfB+0qymqFCjzH/AP4/qffE+
X-Google-Smtp-Source: APXvYqxTLBxIlEfys7Zu1I/e2KUkOdYUXngMqxBfJZhDJpWm10LQxnRD3AXpQSp6LAWW+H6JFBv5Ng==
X-Received: by 2002:a37:7d1:: with SMTP id 200mr85007742qkh.96.1564691408497; 
 Thu, 01 Aug 2019 13:30:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/36] drm/amdgpu: add navi12 asic type
Date: Thu,  1 Aug 2019 15:29:24 -0500
Message-Id: <20190801202957.29791-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omMV4Yf3Ai3Sg8DMKBq/0X5J0Rq7UfOHLlYWGvlb6dg=;
 b=SXpvJajI8iKBowlVFKz/w8ND0eM/Lr36a5ssIrASCh7QiY/A7FxWrQVHIO9NVhG5Sz
 g7qNm8WwUZ8KmDsje2TQoa7miUpiGwk9pkrQjDEmndq0M5tNHpGa+ZyNOUdTFfwxILsW
 R2htR5+fSjQ9pnhLSDouQNP3R0WHJhNTedtOKIoCOXeuZmOB+MiD6xpZqx0fT2UjiqxG
 2x8zwRbhi9ojoX4LJWPi5oA+ZZQZN4tNUnGsmYK3GWRyBtY+bjiHXgnSo9MZFZvvjoim
 LvgKIstDDPRbSsMUjGcHZaXEw8b393EY3b34O+mOoJjQJPT2OxIptWZ4IxHKBfPXZtN5
 XURQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxICsKIGluY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaCAg
ICAgICAgICAgICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZGMwZmM5MWM3
ZTYzLi40NzQ4M2QwM2NjZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKQEAgLTEwMiw2ICsxMDIsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqYW1kZ3B1X2Fz
aWNfbmFtZVtdID0gewogCSJBUkNUVVJVUyIsCiAJIk5BVkkxMCIsCiAJIk5BVkkxNCIsCisJIk5B
VkkxMiIsCiAJIkxBU1QiLAogfTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vYW1kX2FzaWNf
dHlwZS5oIGIvaW5jbHVkZS9kcm0vYW1kX2FzaWNfdHlwZS5oCmluZGV4IDBmNWExMmE5OTk0OC4u
NzM3YTFlMzc0ZjBjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmgKKysr
IGIvaW5jbHVkZS9kcm0vYW1kX2FzaWNfdHlwZS5oCkBAIC01Miw2ICs1Miw3IEBAIGVudW0gYW1k
X2FzaWNfdHlwZSB7CiAJQ0hJUF9BUkNUVVJVUywKIAlDSElQX05BVkkxMCwKIAlDSElQX05BVkkx
NCwKKwlDSElQX05BVkkxMiwKIAlDSElQX0xBU1QsCiB9OwogCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
