Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48752D0134
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00B16E89A;
	Tue,  8 Oct 2019 19:29:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5306E899
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:29:47 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id u22so26917915qtq.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHGG6B+DZpNQB7Vr2W0ajwsUpfXG6NDYlr2vqFX6ypY=;
 b=XAPvA3aky0sg4B7HqDup0P8yZDXtehf1YIw6NWE+C8pSrrbOnlf7LESwtViviXdTiR
 FrwIndRpglvUfWzdTbIkxhdK10AjZ63t8z7Q2vxvnYhtkJq2h96wBqgkqI8S00xbSv4E
 unQcGE9qq12g5t45AVCeDe+nQVClxB+S1YriijemS9uiEbXou3Jx458ayhXPcmq3U1Vj
 WnljVxfGeQISYl06Gdt/VQ5cfwPN7O7CO26yQgflDCxIZQUFrm/SoAQYvDEm046qyDN+
 SjZtKRGokNlGoddHSdyjwdUH++WYp29PhNsUgWueAnmPEx4GjCTB21hpASQDI6tncuOV
 ysLg==
X-Gm-Message-State: APjAAAWXGxcvkItTUqIgxZOTigdjl6yhbm2GdQ6NIcxeGaBZKTb4vMjd
 5oheVhc3N1DdQ6i86RP1a17WZS4p
X-Google-Smtp-Source: APXvYqzXJThKRwpPD4AANz80l/X82N3dWoETRCWrqJyXVFc40tOM+jBZ2Em+Ii1aNXbdq7EcK03YWw==
X-Received: by 2002:aed:316d:: with SMTP id 100mr37218793qtg.20.1570562986727; 
 Tue, 08 Oct 2019 12:29:46 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id z141sm9453272qka.126.2019.10.08.12.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:29:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Date: Tue,  8 Oct 2019 14:29:30 -0500
Message-Id: <20191008192934.5481-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008192934.5481-1-alexander.deucher@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kHGG6B+DZpNQB7Vr2W0ajwsUpfXG6NDYlr2vqFX6ypY=;
 b=dEvewRDketf309WawQL9spOIKXG9FqAwEDZHzpcnxuWFm8rPQiK5BQeybpY4ZxJ1ZZ
 FJttvGkzFb9SSomr+XJi2TaPYpemr+84qYULh/CBSKIQFnRrxDltwWosLPhwnTxcrkVx
 lToDM7GgZjjrsZkohsq+jW8ICPCPMyLdLkAMkCUiaGdpKXP/fD1+fMgrAVW+mY1kBmDc
 in4JyYIthWjS+e9Dzec3MVn9uscyIOg2yHt7qlRLs2dchaEaX7exNXvPkDSN/2imPY07
 PeQXd9g03iDktIRpfARXSf9rPYgxQlgnco7OMh2WiMm14XRE+FYR37x+jnZe3ereSKjK
 u1IQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgbmV3IHZyYW1fcmVz
ZXJ2ZV9ibG9jayBzdHJ1Y3R1cmUgYW5kIGF0b21maXJtd2FyZV9pbnRlcm5hbF9jb25zdGFudHMg
ZW51bWVyYXRpb24KCkNoYW5nZS1JZDogSTZiYTY0MmVjZDdhZDk0MjUwMTYyYWU1YzMyMmVkOGQ4
NWRlOWMzNWEKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaCB8IDE1ICsrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgKaW5kZXggZTg4NTQxZDY3YWEwLi41MTk2Yjk0
MDk3ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdh
cmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgKQEAg
LTQ5OCw2ICs0OTgsNyBAQCBlbnVtIGF0b21iaW9zX2Zpcm13YXJlX2NhcGFiaWxpdHkKICAgQVRP
TV9GSVJNV0FSRV9DQVBfSFdFTVVfRU5BQkxFICA9IDB4MDAwMDAwODAsCiAgIEFUT01fRklSTVdB
UkVfQ0FQX0hXRU1VX1VNQ19DRkcgPSAweDAwMDAwMTAwLAogICBBVE9NX0ZJUk1XQVJFX0NBUF9T
UkFNX0VDQyAgICAgID0gMHgwMDAwMDIwMCwKKyAgQVRPTV9GSVJNV0FSRV9DQVBfRU5BQkxFXzJT
VEFHRV9CSVNUX1RSQUlOSU5HICA9IDB4MDAwMDA0MDAsCiB9OwogCiBlbnVtIGF0b21fY29vbGlu
Z19zb2x1dGlvbl9pZHsKQEAgLTY3MSw2ICs2NzIsMjAgQEAgc3RydWN0IHZyYW1fdXNhZ2VieWZp
cm13YXJlX3YyXzEKICAgdWludDE2X3QgIHVzZWRfYnlfZHJpdmVyX2luX2tiOyAKIH07CiAKKy8q
IFRoaXMgaXMgcGFydCBvZiB2cmFtX3VzYWdlYnlmaXJtd2FyZV92Ml8xICovCitzdHJ1Y3QgdnJh
bV9yZXNlcnZlX2Jsb2NrCit7CisgICAgdWludDMyX3QgIHN0YXJ0X2FkZHJlc3NfaW5fa2I7Cisg
ICAgdWludDE2X3QgIHVzZWRfYnlfZmlybXdhcmVfaW5fa2I7CisgICAgdWludDE2X3QgIHVzZWRf
YnlfZHJpdmVyX2luX2tiOworfTsKKworLyogRGVmaW5pdGlvbnMgZm9yIGNvbnN0YW5jZSAqLwor
ZW51bSBhdG9tZmlybXdhcmVfaW50ZXJuYWxfY29uc3RhbnRzIHsKKyAgICBPTkVfSwk9IDB4NDAw
LAorICAgIE9ORV9NRUcJPSAweDEwMDAwMCwKKyAgICBPTkVfRwk9IDB4NDAwMDAwMDAsCit9Owog
CiAvKiAKICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
