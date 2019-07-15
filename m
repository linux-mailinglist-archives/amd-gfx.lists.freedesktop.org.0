Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5BA69E0B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9789E1B;
	Mon, 15 Jul 2019 21:25:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA0C89E0D
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:06 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h18so17247500qtm.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWBW6aNVWzhSPSpwgi4LzpTHjDcrHbxzNCmKg9kGAIw=;
 b=jZJk8/Jwtp5h5KceOqYv8BlcF0xLQbYV4/G2w86v0KgumDTrlvZ6mpYYpvlqsOLMXG
 JDpHIRUR3KS1/7VQ7mtM8lyeC9gwqbaBQjR5cjrBJ4945VbQhAJg3dO/D5ag/hfUon/n
 hY2aqrMxeDN/MSXhN/vL64+ekf+ByflWMzCHdI5ypxwMppM2fxKWc7GjexY3B39nUm4p
 Poj1xuR4RC40Tzgmnic5cpGIB3uls/116n04Txkk/rk08DuO6x5YEP8CHybwFGkHpEyX
 rIIqrndoRJgmv2iz7ABCRvLn7FNCKPqg2+F9JorJaVqnxYPIY5DXBbBFrFevM7VYsWyP
 KAQA==
X-Gm-Message-State: APjAAAV3Mak5zgH+ZHxj8vch5xU2CsJ3nIXP3xE33WEoXDg6px6qBZlG
 4/8B30kMiwJGKJDB7AaZvJjs4RpM
X-Google-Smtp-Source: APXvYqyQJIehNtF4uME7XK6o+KZqAObqUE0SFqxyPxDLHT/9Ruue8kVLhvYh9oEE2H0pZIn996WW2Q==
X-Received: by 2002:ad4:5311:: with SMTP id y17mr20647291qvr.1.1563225905219; 
 Mon, 15 Jul 2019 14:25:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 023/102] drm/amdgpu: set Arcturus fw load type as direct
Date: Mon, 15 Jul 2019 16:23:18 -0500
Message-Id: <20190715212437.31793-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWBW6aNVWzhSPSpwgi4LzpTHjDcrHbxzNCmKg9kGAIw=;
 b=cp7VoMlWR9mbECmpkeZr2xJ+l+8FRHzhk7IfRP2MmVJ8xrzOJ8VSiNQ057lMQJhVIC
 R1U8ZwmO5WdM57IlFOP0UQsiPFTMxDFJCnIN5P4a5Pgzzp0i3dz6bb3g8R/kFCLX0HV7
 1T4Dmj2XS/TRLZCyRdNiS9UnhkViR2xeFEWkhqRhiqQfXKXw+Rc0DgPd+x5GqyJecJyE
 VE3tU4lnhxuZMQD0/KVUBifGBtjOzA3h1pXK4NP1IENIpoEBaD4OsS6WacTSkkrqwnKA
 W1jZpeZbWfejSISCOqaZk3MqtvBIIgF3xq5F/FgAw7tsSbpVJxbgHC0LxBU6CeGGBtLj
 zWQg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Vjb2RlLmMKaW5kZXggMjA0MmI2MDU5MTI3Li4xZWM2OTY4NThkNzggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jCkBAIC0zNTYsNiArMzU2
LDggQEAgYW1kZ3B1X3Vjb2RlX2dldF9sb2FkX3R5cGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIGludCBsb2FkX3R5cGUpCiAJCQlyZXR1cm4gQU1ER1BVX0ZXX0xPQURfRElSRUNUOwogCQll
bHNlCiAJCQlyZXR1cm4gQU1ER1BVX0ZXX0xPQURfUFNQOworCWNhc2UgQ0hJUF9BUkNUVVJVUzoK
KwkJcmV0dXJuIEFNREdQVV9GV19MT0FEX0RJUkVDVDsKIAlkZWZhdWx0OgogCQlEUk1fRVJST1Io
IlVua25vd24gZmlybXdhcmUgbG9hZCB0eXBlXG4iKTsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
