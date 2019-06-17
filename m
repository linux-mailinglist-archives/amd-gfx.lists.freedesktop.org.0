Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344949018
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2F89F41;
	Mon, 17 Jun 2019 19:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138AD89F08
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:59 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so12286490qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53jhlCDELX8AYkzdYsy75tfDVpr9U8yNRuGx0/q0KR0=;
 b=CoTbb0AO6JouPbcT7eRSnOz9rb2ILDZLzXvBytah2pkJZEv9Ksz38M2GCiOqpjRWVB
 +tQaZ9Ib136seIYU7TygzJH7Qef9OMeB2NPGSq/JdymOLHo4sgHYfs8hK7v6eCrU46Yn
 mvTe1+56EMGThwWxO56vahcC2cctFZHETDogNtplljj0RJQFvQdLi8oOjBdTNlDXePd5
 rtScopAOCVtZrtJmdSO/W3Mmyu1gISnQEZ4T/eEjCl/ogJqa5+EPMfhLDfxvXFxqirye
 vQ2J0+toewFS1l52xQFVczhQPLuFwVmzw6fy6vRV6YVRTC6P2fMhEu1fZQgitEUZJCP+
 lHmA==
X-Gm-Message-State: APjAAAWS0MIsiYFGEbMFNo6UhfwvgvJuf351dlrUUeyozkzum8IZeO3M
 A3IRJazAoCOZhu66POPStQVCAWTPnuyHpw==
X-Google-Smtp-Source: APXvYqw4wYmBOM3GKWQ8H6sTVpJV/0oqOGEEj+nmQkB05Oggkelu/ZXmTOBCp5xkcWcL/QPQ3vVZOw==
X-Received: by 2002:a0c:d947:: with SMTP id t7mr22807803qvj.127.1560800818086; 
 Mon, 17 Jun 2019 12:46:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 361/459] drm/amd/display: Disconnect DCN2 mpcc when changing tg
Date: Mon, 17 Jun 2019 14:45:02 -0500
Message-Id: <20190617194540.18497-62-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53jhlCDELX8AYkzdYsy75tfDVpr9U8yNRuGx0/q0KR0=;
 b=q3s4WdNFAdXiWV15ZOJbDh4OKnYJ/tghY5dDmEtXfqOhH4S5gUfp/9PWEvqYMmHzuc
 +bzoIDD0Lmf9X+HfGfrw/aMd0SNyVY1H/mniywIjsU0GVwBOJP0pJYMeXZQPLeZwrDUf
 SWQ6M90Af8WtfahFTWxAoHsMzaEhFDqksVEXDXYZK7QmPj35Fk8eGels/PfTS/FD/cIk
 CYVIQqnS0D+mTFLmKwCZnC3w6uqRR1kBHCYnr09dpuVxWXKhLrR80SG/Oq+heFwQ4e4g
 bzI4ZLs7SjnQ1jRSt4p5McmeGIqg7+JI6N8eLYJrlvnTUD8OmpyltesmQWs/q/4IeK37
 pG+w==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpBIHByZXZpb3VzIGZpeCB3YXMgZG9u
ZSBmb3IgRENOMSB0aGF0IG5lZWRlZCB0byBiZSBwb3J0ZWQgdG8gRENOMjoKNjBjNjc3NTM0ZTcz
ICgiZHJtL2FtZC9kaXNwbGF5OiBEaXNjb25uZWN0IG1wY2Mgd2hlbiBjaGFuZ2luZyB0ZyIpCgpT
aWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQWNrZWQtYnk6IEhhd2tp
bmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggZjZlMjVmNzVhMGE5
Li5mMmU1ZTQ5MjgxMTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xMzIzLDkgKzEzMjMsMTAgQEAgc3RhdGljIHZvaWQg
ZGNuMjBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNlKAogCQkJfQogCQl9CiAKLQkJaWYgKCFwaXBlX2N0
eC0+cGxhbmVfc3RhdGUgJiYKLQkJCW9sZF9waXBlX2N0eC0+cGxhbmVfc3RhdGUgJiYKLQkJCW9s
ZF9waXBlX2N0eC0+c3RyZWFtX3Jlcy50ZyA9PSB0ZykgeworCQlpZiAoKCFwaXBlX2N0eC0+cGxh
bmVfc3RhdGUgfHwKKwkJICAgICBwaXBlX2N0eC0+c3RyZWFtX3Jlcy50ZyAhPSBvbGRfcGlwZV9j
dHgtPnN0cmVhbV9yZXMudGcpICYmCisJCSAgICAgb2xkX3BpcGVfY3R4LT5wbGFuZV9zdGF0ZSAm
JgorCQkgICAgIG9sZF9waXBlX2N0eC0+c3RyZWFtX3Jlcy50ZyA9PSB0ZykgewogCiAJCQlkYy0+
aHdzcy5wbGFuZV9hdG9taWNfZGlzY29ubmVjdChkYywgb2xkX3BpcGVfY3R4KTsKIAkJCXJlbW92
ZWRfcGlwZVtpXSA9IHRydWU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
