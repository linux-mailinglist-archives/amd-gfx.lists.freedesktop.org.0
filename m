Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97927E43B
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2660A6E807;
	Thu,  1 Aug 2019 20:30:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42546E7E5
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:36 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d15so53094846qkl.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlhkr8FjijLgXO1JD7lhLG8rgMi9X638Z/CrGXgXR3U=;
 b=KbhKJruZCPlOc4J6rCUT47syBPbIJtXi/vy44vbdRLgsJyL5lBUmvr+mDnQQjSr/mI
 W25PZqNLh5d8F8KOXouW6coHgrJ9YBp2JsQO7g1dAllAnRtv6vDhG/d8EPDvj0vIQCcb
 u1+gEj6olyN3lQW/RuM1EqFjdenWuzPy0CCwQX/rjbbgO6gavwzwavE5pe+G1nPokm6f
 llIHS70Eme4E6ufyP6W6mX7OAKw9576fbf9TMMYooGbLirM7Bfm6HbD2DfEI4knAbiOL
 xP6LLL9L4rJ1uSW1qJerZ7z0szovPOmyoDw3/0/5Q7XaLk0TFi4rWHtHnO2lNltxxdSt
 I2UQ==
X-Gm-Message-State: APjAAAW5OYG2bX27tor2yRPS5YlY5XOm7fg0eV8621GVT95ZNX5viAhj
 rIlWa736ls8TYD7CFuIUEPx6CglW
X-Google-Smtp-Source: APXvYqz9m9f6gbi/St0nai3zzPq2kAs4tgCYvGcWm0UbvbW9HZmH/eC5P57ATn8aApK4l81Ck5d1cA==
X-Received: by 2002:a05:620a:68c:: with SMTP id
 f12mr87394759qkh.197.1564691435692; 
 Thu, 01 Aug 2019 13:30:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 34/36] drm/amdgpu: Add nv12 DC ip block
Date: Thu,  1 Aug 2019 15:29:55 -0500
Message-Id: <20190801202957.29791-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlhkr8FjijLgXO1JD7lhLG8rgMi9X638Z/CrGXgXR3U=;
 b=oPIjrehmM4TI4Z40ZnT90l5EYXQEfx5V8wKyrCRYXjPRv4U2BSrY1Q/9ExHhG0Yo9A
 to1rkX+QLJFgEId2+5SR9ctlEqEqvhL6qwXFywFMmIy/AuCg8fBWD0mCPc79DSRZXK8d
 kOSyY6KEy6B1V5AKP8JAe8VkKwfuf8+2QTgfhciqWWxSIdDG4ZySZwyRrKVkVw1TxlEh
 9GiPLxRARCCrsxcS7/gPne7AuYk28x3cdmydkRhiWaukQjbikVWwltjr8LNGgQd8LoE6
 PvwuOEiRT7mzvwITLL58gYyKd3HNtoTERip2xZGsJGyewU7qkE/fmN1k9AXQ3irCV/H2
 7Uig==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpMb2FkIERDIGFuZCBhbWRncHUgZGlz
cGxheSBtYW5hZ2VyCgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L252LmMgICAgICAgICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CmluZGV4IDQ1MTA1NmZkMWU3MS4uMzFhYmQ4ODg1ZmRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0yNTQ0LDYgKzI1NDQsNyBAQCBib29sIGFtZGdw
dV9kZXZpY2VfYXNpY19oYXNfZGNfc3VwcG9ydChlbnVtIGFtZF9hc2ljX3R5cGUgYXNpY190eXBl
KQogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8wKQogCWNhc2UgQ0hJUF9OQVZJ
MTA6CiAJY2FzZSBDSElQX05BVkkxNDoKKwljYXNlIENISVBfTkFWSTEyOgogI2VuZGlmCiAJCXJl
dHVybiBhbWRncHVfZGMgIT0gMDsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXgg
ODVlNzY4OGRiYWEwLi45NjE0YzY1ZmEyOTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAt
NDMxLDYgKzQzMSw4IEBAIGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9p
cF9ibG9jayk7CiAJCWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2Vf
dmlydHVhbF9pcF9ibG9jayk7CisJCWVsc2UgaWYgKGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBv
cnQoYWRldikpCisJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZG1faXBfYmxv
Y2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3YxMF8wX2lwX2Js
b2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjVfMF9pcF9i
bG9jayk7CiAJCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURf
RElSRUNUICYmCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
