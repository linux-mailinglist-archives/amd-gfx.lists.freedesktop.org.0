Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B84905E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2516E056;
	Mon, 17 Jun 2019 19:50:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DAE6E053
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:16 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so12262337qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6l6uQFgss9WVl+fxY8IwqAgQ1Y0YWjYf1qJLjD+1H2I=;
 b=V8NOaJPgHxNYxskG9fhMdN0M1b5R2Fj9Pi6R8IDmyHxO6FKihK/LzsGNO85teYaqjs
 gimKgVT1+6zDFjYaoyA9SG3ifEU3zsaIGz9Yl8tDqe1U1hmetlp2ih5nfTzNW93+08SN
 70A1+2/0ooCOaG2Pq0DpfOrhpDVHL2QOlaCO+sbDzP8FLOYb2ACMYPZ4rif/pyLzj6//
 hFvYgttYo6GygnrWnHLaXXlDaGp0YaES76FlM/xj6q+Q+0A0LeiZpS8FYCe11ITZcXx5
 uUhGzIL7Yxyh6HO7gIvQGh927bT68/p3lVLJsUgD198jVeUt12vvPdEME7rITR1HjFXw
 D5aA==
X-Gm-Message-State: APjAAAXS0tqGcdcG27r5nZjqRE3lR/FWYusMoCrnp8Z9imMa8tSyotms
 7qdxxB1bwU4U4RB9qfS2xwduXVmvJdAt2w==
X-Google-Smtp-Source: APXvYqwuL8rkmLiqAMy+jgaN0CYraJrDDuCIY5p8i3+k5hX+C3Ht1OvS0CWnb/tIqV8CN6P79/Ridg==
X-Received: by 2002:a0c:add8:: with SMTP id x24mr23533349qvc.167.1560801015161; 
 Mon, 17 Jun 2019 12:50:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 418/459] drm/amd/display: fix macro_tile_size for tiling
Date: Mon, 17 Jun 2019 14:49:07 -0500
Message-Id: <20190617194948.18667-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6l6uQFgss9WVl+fxY8IwqAgQ1Y0YWjYf1qJLjD+1H2I=;
 b=IUJrMa8cE5eEFcxMCmW6gDfuc+84GLDnqULMYdoFSilwScQG7ZfS7wJ7GVyq956LuW
 34vM/o2ZGfUN1iYBJaCEQHFXnNn5lZ8lJNDlaZeToyaoTwOe1S8lCIdojMwVLQcQKzif
 lR07j4M2qWvizSuI3tOdYqe0M7eFKNl/s8FmnhgW9IMM4iBDQ8UBsvFvedPHcDly9cay
 Mnr+isrRaxw2pkQRN80b4O/DW6cmQf7EMBkL11u8Y1H06zMvllwe6NoQZ+29AWKlUtjj
 jMUS18NpYCLL5dzUsaPTU3WZlokvt6viC5kdxrk9sIexVEHXy9TcFBZfCDkqpcLOWKMV
 17Fw==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkEg
cmVncmVzc2lvbiB3YXMgaW50cm9kdWNlZCB3aGVuIHdlIHNldCBjb3JyZWN0IHRpbGUgc2l6ZQpm
b3IgdGhlIGdmeDkgc3dpenpsZSBtb2RlLiBUaGlzIHJlc3VsdGVkIGluIGluY29ycmVjdAptYWNy
byB0aWxlIHNpemUuCgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5M
YWt0eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0Bh
bWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDFkYWY0MDI5YjU2Ni4uMGJkMGI1Mjc5YzE4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYwpAQCAtMTc1Myw4ICsxNzUzLDYgQEAgaW50IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBl
c19mcm9tX2NvbnRleHQoCiAJCQlzdHJ1Y3QgZGNfcGxhbmVfc3RhdGUgKnBsbiA9IHJlc19jdHgt
PnBpcGVfY3R4W2ldLnBsYW5lX3N0YXRlOwogCQkJc3RydWN0IHNjYWxlcl9kYXRhICpzY2wgPSAm
cmVzX2N0eC0+cGlwZV9jdHhbaV0ucGxhbmVfcmVzLnNjbF9kYXRhOwogCi0JCQlwaXBlc1twaXBl
X2NudF0ucGlwZS5zcmMubWFjcm9fdGlsZV9zaXplID0KLQkJCQkJc3dpenpsZV9tb2RlX3RvX21h
Y3JvX3RpbGVfc2l6ZShwbG4tPnRpbGluZ19pbmZvLmdmeDkuc3dpenpsZSk7CiAJCQlwaXBlc1tw
aXBlX2NudF0ucGlwZS5zcmMuaW1tZWRpYXRlX2ZsaXAgPSBwbG4tPmZsaXBfaW1tZWRpYXRlOwog
CQkJcGlwZXNbcGlwZV9jbnRdLnBpcGUuc3JjLmlzX2hzcGxpdCA9IChyZXNfY3R4LT5waXBlX2N0
eFtpXS5ib3R0b21fcGlwZQogCQkJCQkmJiByZXNfY3R4LT5waXBlX2N0eFtpXS5ib3R0b21fcGlw
ZS0+cGxhbmVfc3RhdGUgPT0gcGxuKQpAQCAtMTgxOCw2ICsxODE2LDggQEAgaW50IGRjbjIwX3Bv
cHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQoCiAJCQlwaXBlc1twaXBlX2NudF0ucGlwZS5z
Y2FsZV90YXBzLnZ0YXBzID0gc2NsLT50YXBzLnZfdGFwczsKIAkJCXBpcGVzW3BpcGVfY250XS5w
aXBlLnNjYWxlX3RhcHMudnRhcHNfYyA9IHNjbC0+dGFwcy52X3RhcHNfYzsKIAorCQkJcGlwZXNb
cGlwZV9jbnRdLnBpcGUuc3JjLm1hY3JvX3RpbGVfc2l6ZSA9CisJCQkJCXN3aXp6bGVfbW9kZV90
b19tYWNyb190aWxlX3NpemUocGxuLT50aWxpbmdfaW5mby5nZng5LnN3aXp6bGUpOwogCQkJc3dp
enpsZV90b19kbWxfcGFyYW1zKHBsbi0+dGlsaW5nX2luZm8uZ2Z4OS5zd2l6emxlLAogCQkJCQkm
cGlwZXNbcGlwZV9jbnRdLnBpcGUuc3JjLnN3X21vZGUpOwogCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
