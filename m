Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1848E05
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3171A8954A;
	Mon, 17 Jun 2019 19:18:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD14894C0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:11 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x2so12218384qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ELZgzbZONMefjdRcMqmQdzt9GScl1FqVsWqyq1NF78A=;
 b=jXR0SA5WjxBq7EJAIpsxQJGcmg+XgfAZ4PZxT7z9mn/8IE6Ea36Ap6+SoaRIS+Xjhn
 k28XL/6nMdv3LaSjWf1/uEy1F0wDyCuixIfXpK3DVJrSrGQFFuranSxLrk8m6M+zLzk/
 eqMo4+f4UPOys4N9hBELhoT/mR8sNo1iJrCWO90F8hJGPOrR0S54Ki5RUi2tlLHA3B7M
 UTCN5DAP7u7VZrnBkuTcgHe0Bf1sY7OWPUatUiM5J3y3FdM+lZhNpd/Pzo4oufUhYf6O
 bhX9CLa3v3PgGyJyoghXijLNMofgVU3wZ2zX08hfIgTZznMWQXru3BC0YofCDSiVsQua
 kEhg==
X-Gm-Message-State: APjAAAU3Uji+oBB4m9r51Zg+M3VIceqp8M6A6U56EPzqdbZGE4vWYAk6
 91U9LA6O0KTiDa9EKANTRPPeDVbUpxU=
X-Google-Smtp-Source: APXvYqz/RR1tq5LVePRBwBlQ5wgf4JONATX+Ytcc2RHSruxSZlKn4okal30L/K7flYUA36eoEUK9hw==
X-Received: by 2002:ac8:7349:: with SMTP id q9mr92070490qtp.151.1560799089763; 
 Mon, 17 Jun 2019 12:18:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 069/459] drm/amdgpu: rename rlc autoload to backdoor autoload
Date: Mon, 17 Jun 2019 14:10:30 -0500
Message-Id: <20190617191700.17899-58-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ELZgzbZONMefjdRcMqmQdzt9GScl1FqVsWqyq1NF78A=;
 b=PwT0yQCICNmPUFEVWE7SjTnr7jO2N+bwaomiM0vDOxlkXBiH7gPLVHMKDcZdBlNtzl
 vfitGPFGi1gT/e/iiqs+DB1HtMDn/o60Z5SYXVm8w8p362cO0WdFfPN9Go6Z3Kh8rHxO
 7d9G7udsZZpGJ/eJxOqj4qVtpqGDDam6zM91AdgRXGajnJtvCU61xB6tRnDj2FqKfEP3
 vCzBy/6MvQYopVKH4RI4Zw9c8PgOUU+ujsNEp1GZDLclfnoZf9R/ao5997oM2YIDXqqH
 PCjTH4I+wq5xeOT0JGDAcG2dPs7z7E1eeK7OBkM7o0OSaeF1O/l71mAWQZmDx7qnKJ9q
 YrfQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVGhpcyBpcyB0byBk
aWZmZXJlbnRpYXRlIHJsYyBiYWNrZG9vciBhdXRvbG9hZCBmcm9tIHJsYwpmcm9udGRvb3IgYXV0
b2xvYWQKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IExlIE1hIDxMZS5NYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdWNvZGUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91Y29kZS5oCmluZGV4IGEzMWIxYmQxZjcyMi4uYzdhMGU2ZTEzNDEwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuaApAQCAtMjQ3LDcgKzI0Nyw3IEBAIGVudW0g
YW1kZ3B1X2Zpcm13YXJlX2xvYWRfdHlwZSB7CiAJQU1ER1BVX0ZXX0xPQURfRElSRUNUID0gMCwK
IAlBTURHUFVfRldfTE9BRF9TTVUsCiAJQU1ER1BVX0ZXX0xPQURfUFNQLAotCUFNREdQVV9GV19M
T0FEX1JMQ19BVVRPLAorCUFNREdQVV9GV19MT0FEX1JMQ19CQUNLRE9PUl9BVVRPLAogfTsKIAog
LyogY29uZm9ybSB0byBzbXVfdWNvZGVfeGZlcl9jei5oICovCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
